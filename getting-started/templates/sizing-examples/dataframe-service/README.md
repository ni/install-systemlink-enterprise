# DataFrame Service Sizing Examples

Size the DataFrame Service (DFS) using the YAML resource templates contained in
this folder.

Use the guidance provided by these templates as a starting point for your
sizing. Many factors can affect the resources required by the DFS. You must tune
the DFS to fit your system.

Apply the templates in this directory on top of the default configuration
present in the [`systemlink-values`](../../systemlink-values.yaml) YAML file. Do
not include the values in the [`pilot-sizing`](../../pilot-sizing.yaml) YAML
file when deploying the DFS.

These files are not a valid stand-alone configuration. Do not directly deploy
these files to a SystemLink environment. For more configuration information,
refer to the
[`data-management-sizing-example`](../data-management-sizing-example.yaml) YAML
file.

## Instructions

1. Determine the scale identifier for your use case through the
   [Scale Profile table](#scale-profiles). If your intended usage does not
   cleanly map to a single row, use the largest row.
2. Based on your scale identifier, use the guidance in the matching row of the
   [Sizing table](#sizing-table) to configure your deployment.

## Scale Profiles

| Scale identifier | Peak concurrent writers | Peak tables ingested per hour | Table shape mix                             | Peak query concurrency | Total tables ingested per year |
| ---------------- | ----------------------- | ----------------------------- | ------------------------------------------- | ---------------------- | ------------------------------ |
| DFS1             | 10                      | 10                            | See [DFS1 Table Shapes](#dfs1-table-shapes) | 5                      | 10,000                         |
| DFS3             | 100                     | 800                           | See [DFS3 Table Shapes](#dfs3-table-shapes) | 20                     | 1,000,000                      |

### DFS1 Table Shapes

| Rows      | Columns | Share |
| --------- | ------- | ----- |
| 100,000   | 25      | 80%   |
| 1,000,000 | 25      | 20%   |

### DFS3 Table Shapes

| Rows        | Columns | Share |
| ----------- | ------- | ----- |
| 100,000     | 100     | 20%   |
| 1,000,000   | 100     | 60%   |
| 500,000,000 | 100     | 20%   |

### Assumptions

When using the DFS, the scale profiles and sizing guidance make certain
assumptions. For best results, your system should satisfy the following
expectations:

- The writers use the binary ingestion API to write to data tables. The writers
  use batches that are as large as possible for the target table. Each request
  contains up to 25,000,000 points.
- _Peak tables ingested per hour_ matches the mix in _table shape mix_. For
  example, the assumption is that DFS1 ingests 8 tables with 100,000 rows per
  hour and ingests 2 tables with 1,000,000 rows per hour.
- The peak query concurrency corresponds to the peak number of running,
  decimated query requests (`nidataframe/v1/tables{id}/query-decimated-data`).
  The assumption is that the tables targeted by the queries match the mix in
  _Table shape mix_. For example, 4 concurrent queries target tables that are
  100,000 rows wide.
- The table metadata query concurrency (`nidataframe/v1/query-tables`) matches
  the _peak query concurrency_.

## Sizing Table

The following table provides guidance on how to configure DFS to a given level
of scale. This table also specifies the AWS node types. If your system runs on
Azure or on-premises hardware, approximate the specs of the AWS nodes as closely
as possible. Network and storage bandwidth are very important for scaling. Data
table metadata queries that cannot be satisfied by an index will require larger
MongoDB instances. See
[https://www.ni.com/r/dfs-db-query-performance](https://www.ni.com/r/dfs-db-query-performance)
for information on improving metadata query performance.

| Scale identifier | Number of nodes                              | Node type                                         | Storage per node (GiB)                            | Dedicated MongoDB instance recommended? | Recommended database resources                                                                                               | Anticipated average data storage growth per hour | YAML resource template                   |
| ---------------- | -------------------------------------------- | ------------------------------------------------- | ------------------------------------------------- | --------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------ | ---------------------------------------- |
| DFS1             | 1 (general node pool), 4 (Dremio node pool)  | `m6a.2xlarge` (general), `m5ad.4xlarge` (Dremio)` | 0 (general node pool), 356 GiB (Dremio node pool) | Yes                                     | Atlas M30 or equivalent                                                                                                      | 46.8 MiB (S3), 14.01 KiB (MongoDB)               | [`dfs1-values.yaml`](./dfs1-values.yaml) |
| DFS3             | 5 (general node pool), 15 (Dremio node pool) | `m6a.2xlarge` (general), `m5ad.8xlarge` (Dremio)` | 0 (general node pool), 500 GiB (Dremio node pool) | Yes                                     | If using Atlas: M40 primary/secondary replicas and 2 M50 analytics nodes<br>If not using Atlas: replicaset equivalent to M60 | 315.6 GiB (S3) 5.47 MiB (MongoDB)                | [`dfs3-values.yaml`](./dfs3-values.yaml) |
