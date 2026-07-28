# Work order to work item migration guidance

## Overview

Work orders are migrated as **work items of type `workorder`**. This migration
runs automatically during the service upgrade and introduces breaking changes
that require updates to existing workflows, custom roles, and external
integrations.

## External API clients

Any external clients, such as Python automation scripts, that consume Work Order
API endpoints are impacted by this change and must be updated to use the new
Work Item APIs.

1. Identify all places where Work Order API endpoints are used.
1. Use the following table to find the equivalent Work Item endpoint for each
   Work Order API call, and update the request schema for any renamed fields.

| Aspect                        | Work order API                            | Work item API                                                                |
| ----------------------------- | ----------------------------------------- | ---------------------------------------------------------------------------- |
| Create                        | `POST /niworkorder/v1/workorders`         | `POST /niworkitem/v1/workitems` with `"type": "workorder"`                   |
| Query                         | `POST /niworkorder/v1/query-workorders`   | `POST /niworkitem/v1/query-workitems` with type filter `type == "workorder"` |
| Get                           | `GET /niworkorder/v1/workorders/{id}`     | `GET /niworkitem/v1/workitems/{id}`                                          |
| Update                        | `POST /niworkorder/v1/update-workorders`  | `POST /niworkitem/v1/update-workitems`                                       |
| Delete                        | `POST /niworkorder/v1/delete-workorders`  | `POST /niworkitem/v1/delete-workitems`                                       |
| Summary                       | `GET /niworkorder/v1/workorders-summary`  | `GET /niworkitem/v1/workitems-summary?type=workorder`                        |
| **ID field**                  | Legacy work order ID for migrated records | New work item public ID                                                      |
| **`earliestStartDate` field** | Flat field                                | `timeline.earliestStartDateTime` (nested)                                    |
| **`dueDate` field**           | Flat field                                | `timeline.dueDateTime` (nested)                                              |

### Identify migrated work orders in the Work Item API

Migrated work orders include a `legacyWorkOrderId` field in the work item
response. Use this field to correlate records in external systems that still
hold the original work order ID.

```json
{
  "id": "2031",
  "type": "workorder",
  "legacyWorkOrderId": "1000",
  ...
}
```

## Parent ID behavior change

Before migration, the `parentId` field on work items always referenced a work
order ID (from the old `workorders` collection). After migration, `parentId`
references a **work item ID** of type `workorder`. This is the new public ID
assigned during migration.

- Clients that **set `parentId`** when creating or updating work items via the
  Work Item API must now provide the new work item public ID, not the old work
  order ID.
- Clients that **filter by `parentId`** using old work order IDs will receive no
  results from Work Item API queries after migration.

> **Note:**
>
> - This is a breaking change for external clients using the Work Item API
>   (`/niworkitem/v1/*`) with `parentId` and its filter.
> - The deprecated Test Plan API handles `workOrderId` automatically. The above
>   applies only to clients using `/niworkitem/v1/*` with `parentId` directly.

### Resolve a legacy work order ID to a new work item ID

Query the Work Item API and filter by `legacyWorkOrderId`. Use the returned `id`
in subsequent API calls.

```
POST /niworkitem/v1/query-workitems
{
  "filter": "legacyWorkOrderId == \"<old-work-order-id>\""
}
```

## Custom roles

### Remap privileges

Work order privileges are replaced with work item privileges. Built-in system
roles are updated automatically. Custom roles created with Work Order privileges
are not updated automatically and must be updated manually to use Work Item
privileges.

**To update a custom role:**

1. Go to **Access Control** > **Roles**.
1. For each custom role that previously had Work Order privileges:
   1. Click the role to edit.
   1. Select the **Privileges** tab in the Role Editor.
   1. Select **Work Items** from the **Applications and services** dropdown.
   1. Select the **Work Order** checkbox in the privilege specificity section.
   1. Map the existing Work Order privileges to the corresponding Work Item
      privileges using the following
      [privilege mapping table](#privilege-mapping-table).
   1. Click **Update**.
1. Verify that users assigned to the updated custom roles can access work orders
   as expected.

### Privilege mapping table

| Work Orders privilege (old) | Work Items privilege (new) |
| --------------------------- | -------------------------- |
| Create work orders          | Create work items          |
| List and view work orders   | List and view work items   |
| Modify work orders          | Modify work items          |
| Delete work orders          | Delete work items          |

> **Note:** The **Access work orders web application** privilege is unchanged
> and does not require remapping.

## Dynamic form fields

### Configurations

DFF configurations scoped to work orders are automatically migrated:

- **Resource type** is updated from `workorder:workorder` to
  `workitem:workitem`.
- A `type == "workorder"` condition is injected into the display rule.
- Field references in `displayRule` and `rules[].expression` are updated:

| Old field name      | New field name                   |
| ------------------- | -------------------------------- |
| `earliestStartDate` | `timeline.earliestStartDateTime` |
| `dueDate`           | `timeline.dueDateTime`           |

New DFF configurations for work orders must use resource type
`workitem:workitem` with a `type == "workorder"` display rule condition.

### Linked resources

Any external client that uses DFF linked resource fields configured to query the
Work Orders API (`/niworkorder/v1/query-workorders`) must update those
configurations manually. These configurations are not migrated automatically.

Identify each linked resource field that uses a Work Order API endpoint and
update it to the equivalent Work Item API endpoint. The key changes are the
endpoint URL, the `filter` in the request body (which must include
`type == "workorder"`), and the response `dataKey`.

**Before migration:**

```json
{
  "endpoint": {
    "url": "/niworkorder/v1/query-workorders",
    "method": "POST",
    "body": {
      "take": 1000,
      "orderBy": "UPDATED_AT",
      "descending": true,
      "filter": "state == \"New\" && dueDate > \"2023-01-01T20:50:46Z\""
    },
    "detailBody": {
      "filterTemplate": "<id IN <ids>>",
      "batchSize": 1000
    }
  },
  "responseMapping": {
    "dataKey": "workOrders",
    "uniqueIdentifier": "id",
    "displayNameTemplate": "<name>"
  },
  "pageUrlTemplate": "/labmanagement/workorders/workorder/<id>",
  "customFilterConfiguration": {
    "key": "filter",
    "expression": "&& (name.toLower().Contains(\"<input>\".toLower()))"
  }
}
```

**After migration:**

```json
{
  "endpoint": {
    "url": "/niworkitem/v1/query-workitems",
    "method": "POST",
    "body": {
      "take": 1000,
      "orderBy": "UPDATED_AT",
      "descending": true,
      "filter": "type == \"workorder\" && state == \"New\" && timeline.dueDateTime > \"2023-01-01T20:50:46Z\""
    },
    "detailBody": {
      "filterTemplate": "<id IN <ids>>",
      "batchSize": 1000
    }
  },
  "responseMapping": {
    "dataKey": "workItems",
    "uniqueIdentifier": "id",
    "displayNameTemplate": "<name>"
  },
  "pageUrlTemplate": "/labmanagement/workorders/workorder/<id>",
  "customFilterConfiguration": {
    "key": "filter",
    "expression": "&& (name.toLower().Contains(\"<input>\".toLower()))"
  }
}
```

### Table properties

DFF table properties for work orders are **not migrated**. If your deployment
has DFF table properties configured for work orders, they must be recreated
manually after the upgrade:

1. Resolve the new work item `resourceId` for each work order using
   [Resolve a legacy work order ID to a new work item ID](#resolve-a-legacy-work-order-id-to-a-new-work-item-id).
1. Update each table property by setting `resourceType` to `workitem:workitem`
   and `resourceId` to the new work item ID:

```json
{
  "tables": [
    {
      "resourceType": "workitem:workitem",
      "resourceId": "<new-work-item-id>",
      ...
    }
  ]
}
```

## Saved views

Saved views from the Work Orders page are dropped during migration and are not
retained. Saved views must be recreated after the upgrade.

## Test results

- Existing test results are associated with work orders using the custom
  property `workOrderId`. This property remains supported in the Work Orders UI
  for backward compatibility.
- For new test results, both the `workItemId` and `workOrderId` properties are
  supported:

  ```text
  testResult.properties['workItemId'] = '12345'
  testResult.properties['workOrderId'] = '12345'
  ```

## Files

- Existing files are associated with work orders using the custom property
  `workOrderId`. This property remains supported in the Work Orders UI for
  backward compatibility.
- For new uploads, both the `workItemId` and `workOrderId` properties are
  supported:

  ```text
  file.properties['workItemId'] = '12345'
  file.properties['workOrderId'] = '12345'
  ```

## Comments

- Pre-migration work order comments are accessible without any action. The Work
  Orders page retrieves comments from both the pre-migration resource type
  (`workorder:workorder`) and the post-migration resource type
  (`workitem:workitem`) and displays them as a single unified list.
- For new comments, the resource type `workitem:workitem` must be used.

## Routines

Routines that trigger on work order changes use the `Work item changed` event
with type `workorder` filter.

If any existing routines filter by `parentId` or reference work order IDs
directly using old work order IDs, update them to use the new work item IDs. For
more information, see
[Resolve a legacy work order ID to a new work item ID](#resolve-a-legacy-work-order-id-to-a-new-work-item-id).
