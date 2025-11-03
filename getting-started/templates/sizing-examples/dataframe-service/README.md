# DataFrame Service sizing examples

This folder contains guidance on how to size the DataFrame Service (DFS) for a
given level of scale.

The templates and guidance provided here should be considered a starting point.
Many factors may affect the resources required by the DataFrame Service, and
it's expected that tuning will be necessary.

The YAML resource templates in this directory are intended to be applied on top
of the default configuration specified in
[data-management-sizing-example.yaml](../data-management-sizing-example.yaml).
They are not intended to be used directly for deployment to a SystemLink
environment. These files are not a valid configuration by themselves.

## Instructions

1. Use the [scale profile](#scale-profiles) table to determine which scale
   identifier matches your intended usage. If intended usage doesn't cleanly map
   to a single row, favor the largest row.
2. Based on your scale identifier, use the guidance in the matching row of the
   [sizing table](#sizing-table) to configure your deployment.

## Scale profiles

The following table describes the levels of scale for which sizing guidance is
available:

| Scale identifier | Peak concurrent writers | Peak tables ingested per hour | Table shape mix                                                        | Peak query concurrency | Total number of tables |
| ---------------- | ----------------------- | ----------------------------- | ---------------------------------------------------------------------- | ---------------------- | ---------------------- |
| DFS1             | 10                      | 10                            | 100,000 rows and 25 columns - 80%, 1,000,000 rows and 25 columns - 20% | 5                      | 10k                    |

### Assumptions

- Writers are writing data to data tables using the binary ingestion API with
  batches that are as large as possible for the target table, with each request
  containing up to 25 million points.
- Peak tables ingested per hour matches the mix in _Table shape mix_. For
  example, for DFS1, it's assumed that 8 tables with 100,000 rows are ingested
  per hour, and 2 tables with 1,000,000 rows are ingested per hour.
- Peak query concurrency corresponds to the peak number of decimated query
  requests (`nidataframe/v1/tables/{id}/query-decimate-data`) that are running.
  The tables targeted by the queries is assumed to match the mix in _Table shape
  mix_. For example, 4 concurrent queries are targeting tables that are 100,000
  rows wide.
- Table metadata query concurrency (`/nidataframe/v1/query-tables`) matches
  _Peak query concurrency_.

## Sizing table

The following table provides guidance on how to configure the DataFrame Service
for a given level of scale:

| Scale identifier | Number of nodes                             | Node type                                         | Storage per node (GB)                            | Dedicated MongoDB instance recommended? | Recommended database resources | Anticipated average data storage growth per hour | YAML resource template                 |
| ---------------- | ------------------------------------------- | ------------------------------------------------- | ------------------------------------------------ | --------------------------------------- | ------------------------------ | ------------------------------------------------ | -------------------------------------- |
| DFS1             | 1 (general node pool), 4 (Dremio node pool) | `m6a.2xlarge` (general), `m5ad.4xlarge` (Dremio)` | 0 (general node pool), 356 GB (Dremio node pool) | Yes                                     | Atlas M30 or equivalent        | 0.4 GiB (S3), 0.19 GiB (MongoDB)                 | [dfs1-values.yaml](./dfs1-values.yaml) |
