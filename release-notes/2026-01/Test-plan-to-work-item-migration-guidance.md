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
   in the new API schemas. Refer to the Work Item and Work Item Template API
   documentation for updated schema details.

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

