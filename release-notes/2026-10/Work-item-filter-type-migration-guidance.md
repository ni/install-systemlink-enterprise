# Work item filter type migration guidance

## Overview

Work items and work item templates reserve resources such as assets, DUTs,
fixtures, and systems. Each resource type has filter criteria that determine
which resources are eligible. Filters can now use either LINQ or Lucene query
syntax. The new `resources.filterType` field identifies the syntax used by those
filters so applications can evaluate them correctly.

## External API clients

Any external clients that use resource filters when creating, updating, or
querying work items or work item templates are impacted by this change and
must be updated to use `resources.filterType`.

1. Identify all external clients that create or update work items or work
   item templates with resource filters, and update them to set
   `resources.filterType` to match the filter syntax used. Set
   `resources.filterType` to `LINQ` for existing filters. To use Lucene
   syntax instead, set `resources.filterType` to `LUCENE`, or omit the
   field — new work items and templates default to `LUCENE`.
1. Identify all external clients that read `resources.filter` from work item
   or work item template responses, and update them to also read
   `resources.filterType` so they evaluate the filter using the correct
   syntax.

> **Note:** All existing work items and work item templates that have a
> `resources` object are migrated to set `resources.filterType` to `LINQ`
> automatically during the upgrade. No data migration action is required;
> only client-side requests that create or update a work item or work item
> template need to be updated.
>
> When updating an existing work item or template, an omitted
> `resources.filterType` keeps the stored value. If you change a filter's
> syntax, update the filter string and set `resources.filterType` to match in
> the same request; changing only one of the two results in a mismatch. The API
> does not validate that a filter string matches its declared `filterType`, and
> it does not convert filters between LINQ and Lucene.
>
> The deprecated Test Plan APIs accept only `systemFilter` and `dutFilter` and
> do not expose `resources.filterType`; the service always considers it as
> `LINQ`. Clients that use only the Test Plan APIs (`/niworkorder/v1/testplans`
> and related endpoints) can continue writing these filters in LINQ syntax; no
> changes are required.

### Example: Setting resources.filterType

The example below shows the `resources` portion of a work item or work item
template request. Other request fields are omitted for clarity.

**Before migration:**

Existing work items and templates do not include a `resources.filterType`
field.

```json
{
  "resources": {
    "assets": {
      "filter": "AssetType == \"GENERIC\" && ModelName == \"NI PXIe-6368\""
    },
    "duts": {
      "filter": "AssetType == \"DEVICE_UNDER_TEST\" && SerialNumber == \"01BB877A\""
    },
    "fixtures": {
      "filter": "AssetType == \"FIXTURE\" && CalibrationStatus == \"OK\""
    },
    "systems": {
      "filter": "alias == \"Battery Pack System\" && connected.data.state == \"CONNECTED\""
    }
  }
}
```

**After migration:**

Existing work items and templates have `resources.filterType` set to `LINQ`,
and their filter strings are unchanged.

```json
{
  "resources": {
    "assets": {
      "filter": "AssetType == \"GENERIC\" && ModelName == \"NI PXIe-6368\""
    },
    "duts": {
      "filter": "AssetType == \"DEVICE_UNDER_TEST\" && SerialNumber == \"01BB877A\""
    },
    "fixtures": {
      "filter": "AssetType == \"FIXTURE\" && CalibrationStatus == \"OK\""
    },
    "systems": {
      "filter": "alias == \"Battery Pack System\" && connected.data.state == \"CONNECTED\""
    },
    "filterType": "LINQ"
  }
}
```

**Switching to Lucene resource filters:**

To use Lucene syntax instead of LINQ, replace the filter strings with Lucene
query syntax and set `resources.filterType` to `LUCENE`. Verify that the field
names and syntax are supported for each resource type.

```json
{
  "resources": {
    "assets": {
      "filter": "AssetType:\"GENERIC\" AND ModelName:\"NI PXIe-6368\""
    },
    "duts": {
      "filter": "AssetType:\"DEVICE_UNDER_TEST\" AND SerialNumber:\"01BB877A\""
    },
    "fixtures": {
      "filter": "AssetType:\"FIXTURE\" AND CalibrationStatus:\"OK\""
    },
    "systems": {
      "filter": "alias:\"Battery Pack System\" AND connected:CONNECTED"
    },
    "filterType": "LUCENE"
  }
}
```
