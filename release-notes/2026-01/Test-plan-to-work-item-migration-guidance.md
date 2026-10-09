# Test plan to work item migration guide

## Overview

The Work Order Service has been migrated to the Work Item Service. This
migration introduces breaking changes that require updates to existing
workflows, custom roles, and external integrations.

## Work item and work item template endpoints

Any external clients, such as Python automation scripts, that consume Test Plan
API endpoints exposed by the Work Order Service are impacted by this change and
must be updated to use the new Work Item and Work Item Template APIs.

1. Identify all places where Test Plan and Test Plan Template API endpoints are
   used.
1. Update API calls to use the equivalent Work Item and Work Item Template
   endpoints.
   1. For example, `/niworkorder/v1/testplans` should be replaced with
      `/niworkitem/v1/workitems`.
1. Some existing fields have been modified, and new fields have been introduced
   in the new API schemas. Refer to the
   [field mapping tables](#field-mapping-reference) for details and update
   request/response handling as needed.

> **Note:** All existing test plan and test plan template data has already
> been migrated to the work item and work item template collections in the
> database. No data migration action is required from customers. Only the
> client-side API request and response schemas need to be updated to match
> the new Work Item and Work Item Template APIs.

### Field mapping reference

The tables below list fields that have changed between the Test Plan/Test
Plan Template and Work Item/Work Item Template schemas. The same field
mappings also apply when using the `filter` and `projection` properties in
`query-workitems` and `query-workitem-templates` requests. Any
field not listed keeps the same name and shape.

#### Work item fields (formerly test plan fields)

| Test plan field | Work item field | Change | Notes |
| --- | --- | --- | --- |
| *(none)* | `type` | **New** | Required. Set to `testplan` to create/query work items to behave like test plans. |
| `workOrderId` | `parentId` | **Renamed** | The parent work item must be of type `workorder`. |
| `workOrderName` *(`GetTestPlanResponse` only)* | *(none)* | **Removed** | Look up the parent work item by `parentId` to get its name. |
| *(none)* | `requestedBy` | **New** | ID of the user who requested the work item. |
| `estimatedDurationInSeconds` (create/update) | `timeline.estimatedDurationInSeconds` | **Restructured** | Estimated duration set at creation/update time. |
| *(none)* | `timeline.earliestStartDateTime` | **New** | Earliest date/time the work item can start. |
| *(none)* | `timeline.dueDateTime` | **New** | Date/time by which the work item is due to close. |
| *(none)* | `resources.assets` | **New** | Asset reservations (`selections` and `filter`) were not available on test plans. |
| `dutId` | `resources.duts.selections[].id` | **Restructured** | See [Resources restructuring](#resources-restructuring). |
| `dutSerialNumber` | *(none)* | **Removed** | No longer accepted or returned. Identify the DUT using `resources.duts.selections[].id`. |
| `dutFilter` | `resources.duts.filter` | **Restructured** | |
| `fixtureIds` | `resources.fixtures.selections[].id` | **Restructured** | Now an array of selection objects instead of an array of strings. |
| `systemId` | `resources.systems.selections[].id` | **Restructured** | Only one system selection is supported. |
| `systemFilter` | `resources.systems.filter` | **Restructured** | |
| *(none)* | `resources.*.selections[].targetLocationId`, `.targetSystemId`, `.targetParentId` | **New** | Optional move metadata on a resource selection. See [Resources restructuring](#resources-restructuring) for which fields apply to each resource type. |
| `plannedStartDateTime` | `schedule.plannedStartDateTime` | **Restructured** | Set/returned via `schedule-workitems`, same as `schedule-testplans`. |
| `estimatedEndDateTime` | `schedule.plannedEndDateTime` | **Renamed + restructured** | Set/returned via `schedule-workitems`. |
| `estimatedDurationInSeconds` (schedule) | `schedule.plannedDurationInSeconds` | **Renamed + restructured** | Planned duration set at scheduling time. |
| `workflow` *(deprecated)* | *(none)* | **Removed** | Already deprecated on test plans. Use `workflowSnapshot` instead. |

##### Resources restructuring

The flat `systemId`, `dutId`, `fixtureIds`, `systemFilter`, and `dutFilter`
fields on test plans are now grouped under a single `resources` object on
work items, with one entry per resource type (`systems`, `assets`, `duts`,
`fixtures`). Each entry has a `selections` array (instead of a single ID or
array of ID strings) and its own `filter` string.

Each selection in `resources.duts`, `resources.assets`, and
`resources.fixtures` also accepts optional `targetLocationId`,
`targetSystemId`, and `targetParentId` fields, which are not applicable for
test plans. These parameters let you specify where the reserved resource has to
be moved as part of the transport order work item. `resources.systems`
selections only accept `targetLocationId`, since a system can't be moved to
another system or connected to a parent asset.

> **Note:** This restructuring applies to work items only. Work item
> templates keep their filter fields restructured the same way (see
> [Work item template fields](#work-item-template-fields-formerly-test-plan-template-fields)
> below), but have no `selections`, since templates don't reference
> specific resource IDs.

#### Work item template fields (formerly test plan template fields)

| Test plan template field | Work item template field | Change | Notes |
| --- | --- | --- | --- |
| *(none)* | `type` | **New** | Required. Set to `testplan` for templates that create work items of type `testplan`. |
| `estimatedDurationInSeconds` | `timeline.estimatedDurationInSeconds` | **Restructured** | |
| `systemFilter` | `resources.systems.filter` | **Restructured** | |
| `dutFilter` | `resources.duts.filter` | **Restructured** | |
| *(none)* | `resources.assets.filter` | **New** | |
| *(none)* | `resources.fixtures.filter` | **New** | |

#### Example: Test Plan vs. Work Item

**Before migration — create (`POST /niworkorder/v1/testplans`):**.

```text
{
  "testPlans": [
    {
      "name": "Battery Cycle Test",
      "state": "NEW",
      "templateId": "1000",
      "description": "Validate battery pack cycle life under thermal stress.",
      "assignedTo": "ea9cd47e-23fc-4d71-b47e-e38b7a930e43",
      "partNumber": "156502A-11L",
      "testProgram": "BatteryCycleTest.py",
      "workOrderId": "2000",
      "dutId": "d783c96e-b349-40cb-8479-834cf99a859",
      "dutSerialNumber": "01BB877A",
      "dutFilter": "modelName = \"cRIO-9045\"",
      "systemFilter": "properties.data[\"Lab\"] = \"Battery Pack Lab\"",
      "estimatedDurationInSeconds": 172800,
      "workspace": "846e294a-a007-47ac-9fc2-fac07eab240e",
      "workflowId": "1000"
    }
  ]
}
```

To set the planned schedule, follow up with a call to
`POST /niworkorder/v1/schedule-testplans`, using the `id` returned from the
create call:

```text
{
  "testPlans": [
    {
      "id": "3000",
      "dutId": "d783c96e-b349-40cb-8479-834cf99a859",
      "dutSerialNumber": "01BB877A",
      "systemId": "20FRS0MQ00--SN-R90N9L4N--MAC-54-EE-75-CE-B7-FE",
      "fixtureIds": ["c8f7cba9-6299-4312-bb18-aa5c55265031"],
      "plannedStartDateTime": "2026-01-20T15:00:00Z",
      "estimatedEndDateTime": "2026-01-22T15:00:00Z",
      "estimatedDurationInSeconds": 172800
    }
  ]
}
```

**After migration — create (`POST /niworkitem/v1/workitems`):**

```text
{
  "workItems": [
    {
      "name": "Battery Cycle Test",
      "type": "testplan", // Required field for work items.
      "state": "NEW",
      "templateId": "1000",
      "description": "Validate battery pack cycle life under thermal stress.",
      "assignedTo": "ea9cd47e-23fc-4d71-b47e-e38b7a930e43",
      "partNumber": "156502A-11L",
      "testProgram": "BatteryCycleTest.py",
      "parentId": "2000",
      "resources": {
        "duts": {
          "selections": [
            {
              "id": "d783c96e-b349-40cb-8479-834cf99a859"
            }
          ],
          "filter": "modelName = \"cRIO-9045\""
        },
        "systems": {
          "filter": "properties.data[\"Lab\"] = \"Battery Pack Lab\""
        }
      },
      "timeline": {
        "estimatedDurationInSeconds": 172800
      },
      "workspace": "846e294a-a007-47ac-9fc2-fac07eab240e",
      "workflowId": "1000"
    }
  ]
}
```

To set the planned schedule, follow up with a call to
`POST /niworkitem/v1/schedule-workitems`, using the `id` returned from the
create call:

```text
{
  "workItems": [
    {
      "id": "3000",
      "schedule": {
        "plannedStartDateTime": "2026-01-20T15:00:00Z",
        "plannedEndDateTime": "2026-01-22T15:00:00Z",
        "plannedDurationInSeconds": 172800
      },
      "resources": {
        "duts": {
          "selections": [
            {
              "id": "d783c96e-b349-40cb-8479-834cf99a859"
            }
          ]
        },
        "fixtures": {
          "selections": [
            {
              "id": "c8f7cba9-6299-4312-bb18-aa5c55265031"
            }
          ]
        },
        "systems": {
          "selections": [
            {
              "id": "20FRS0MQ00--SN-R90N9L4N--MAC-54-EE-75-CE-B7-FE"
            }
          ]
        }
      }
    }
  ]
}
```

## Custom roles migration

### Remapping privileges

Any custom roles created with Test Plan privileges must be manually updated to
use the new Work Item and Work Item Template privileges using the following
steps:

1. Navigate to **Access Control** > **Roles**.
1. For each custom role that previously had Test Plan privileges:
   1. Click the role to edit.
   1. Review the **Privileges** tab in the Role Editor.
   1. Select **Work Items** from the `Applications and services` dropdown.
   1. Map the existing Test Plan privileges to the corresponding Work Item
      privileges using the below
      [privilege mapping table](#privilege-mapping-table).
   1. Click **Update**.
1. Verify that users assigned to the updated custom roles can access Work Items
   as expected.

### Privilege mapping table

| Previous Test Plan Privilege             | New Work Item Privilege                   |
| ---------------------------------------- | ----------------------------------------- |
| Access test plans web application        | Access work items web application         |
| List and view test plans                 | List and view work items                  |
| Create test plans                        | Create work items                         |
| Modify test plans                        | Modify work items                         |
| Delete test plans                        | Delete work items                         |
| Schedule test plans                      | Schedule work items                       |
| Execute test actions                     | Execute work item actions                 |
| Execute "Submit" test actions            | Execute "Submit" work item actions        |
| Execute "Schedule" test actions          | Execute "Schedule" work item actions      |
| Execute "Deploy" test actions            | Execute "Deploy" work item actions        |
| Execute "Generate" test actions          | Execute "Generate" work item actions      |
| Execute "ExecuteTest" test actions       | Execute "ExecuteTest" work item actions   |
| Execute "ApprovalTier1" test actions     | Execute "ApprovalTier1" work item actions |
| Execute "ApprovalTier2" test actions     | Execute "ApprovalTier2" work item actions |
| Execute "ApprovalTier3" test actions     | Execute "ApprovalTier3" work item actions |
| Execute "Close" test actions             | Execute "Close" work item actions         |
| Override workflow actions on a test plan | Override workflow actions on a work item  |
| Automate test plans                      | Automate work items                       |
| Manage test plan templates               | Manage work item templates                |

## Dynamic form fields (DFF) linked resources migration

Any DFF configuration that includes linked resource fields pointing to Test Plan
or Test Plan Template endpoints must be updated as part of the Test Plan to Work
Item migration.

1. Identify all existing DFFs that reference the following legacy endpoints:
   1. `/niworkorder/v1/query-testplans`
   1. `/niworkorder/v1/query-testplan-templates`
1. Update the linked resource URLs in the DFF configurations to use the
   corresponding Work Item and Work Item Template endpoints:
   1. `/niworkitem/v1/query-workitems`
   1. `/niworkitem/v1/query-workitem-templates`
1. Review and update the filter fields and response-mapping fields to account
   for new or renamed fields introduced in the Work Item and Work Item Template
   schemas. Refer to the Work Item and Work Item Template API documentation for
   the updated schema details.

Example DFF linked resource URL update:

**Before migration:**

```text
{
  "configurations": [...],
  "groups": [...],
  "fields": [
    {
       ...,
       "requestConfiguration": {
          "endpoint": {
             "url": "/niworkorder/v1/query-testplans",
             "body": {
                "filter": "workOrderId == \"1000\" && systemId == \"MySystemId\""
             },
             "detailBody": {
                "filterTemplate": "<id IN <ids>>"
             }
          },
          "pageUrlTemplate": "/labmanagement/testplans/testplan/<id>",
          "customFilterConfiguration": {
             "key": "filter",
             "expression": "&& (name.toLower().Contains(\"<input>\".toLower()))"
          },
          "responseMapping": {
             "dataKey": "testPlans",
             "displayNameTemplate": "<name>",
             "uniqueIdentifier": "id"
          }
       }
    }
  ]
}
```

**After migration:**

```text
{
  "configurations": [...],
  "groups": [...],
  "fields": [
    {
       ...,
       "requestConfiguration": {
          "endpoint": {
             "url": "/niworkitem/v1/query-workitems",
             "body": {
                "filter": "parentId == \"1000\" && resources.systems.selections.Any(s => s.id == \"MySystemId\")"
             },
             "detailBody": {
                "filterTemplate": "<id IN <ids>>"
             }
          },
          "pageUrlTemplate": "/labmanagement/workitems/workitem/<id>",
          "customFilterConfiguration": {
             "key": "filter",
             "expression": "&& (name.toLower().Contains(\"<input>\".toLower()))"
          },
          "responseMapping": {
             "dataKey": "workItems",
             "displayNameTemplate": "<name>",
             "uniqueIdentifier": "id"
          }
       }
    }
  ]
}
```

## Saved views

Previously saved views from the Test Plan and Work Item pages are dropped as
part of the migration and will not be retained. Users must recreate their saved
views.

## Test results

1. Existing test results are associated with Test Plans using the custom
   property `testPlanId`. This property remains supported in the Work Items UI
   for backward compatibility.
1. For all new uploads, the test results client should use the `workItemId`
   property. For example:

   ```text
   testResult.properties['workItemId'] = '12345'
   ```

## Files

1. Existing files are associated with Test Plans using the custom property
   `testPlanId`. This property remains supported in the Work Items UI for
   backward compatibility.
1. For all new uploads, the files client should use the `workItemId` property.
   For example:

   ```text
   file.properties['workItemId'] = '12345'
   ```

## Notebooks

1. Existing Test Plan related notebooks are published under the following
   interfaces and remain supported in the Work Items UI for backward
   compatibility:
   1. `Test Plan Automations`
   1. `Test Plan Operations`
   1. `Test Plan Scheduler`
1. New notebooks should be uploaded using the following Work Item interfaces:
   1. `Work Item Automations`
   1. `Work Item Operations`
   1. `Work Item Scheduler`
