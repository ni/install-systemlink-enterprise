# SystemLink Enterprise 2026-01 Release Notes

The 2026-01 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## New Features and Behavior changes

- Use Dremio to store and index tabular data. For more information, refer to
  [Configuring Dremio](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/configuring-dremio.html).
- Use the Data Frames data source in dashboards to filter data tables using
  result properties and data table properties. For more information, refer to
  Using the
  [Data Frames Data Source in a Dashboard](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/data-frames-data-source.html).
- Create variables that use data table columns to dynamically view dashboard
  data. For more information, refer to
  [Using Data Tables as Dashboard Variables](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/using-data-tables-as-dashboard-variables.html).
- Use the Resource Changed Routine interface with notebooks to create a routine
  that executes on a SystemLink resource. For more information, refer to
  [Publishing a Jupyter Notebook](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/publishing-a-jupyter-notebook.html).
- `dataframeservice 1.25.x`
  - On system start, the DataFrame service (DFS) creates a new index file. DFS
    is not healthy until the index is created. The amount of time that DFS takes
    to create the new index depends on the number of data tables in the system.
  - If Kubernetes restarts the pods due to a lack of readiness, the MongoDB
    server continues creating the index. Restarted pods will wait for the index
    to be fully created. With 5 million tables and a dedicated M50 Atlas cluster
    for DFS, the pods may restart several times before index creation completes.
- `workitem 0.1.x`
  - SystemLink has replaced the existing _Test Plan_ and _Test Plan Templates_
    privileges with new _Work Item_ and _Work Item Template_ privileges. The _Work
    Item_ and _Work Item Template_ APIs use these privileges to support multiple
    lab activities beyond test execution.
  - The _Test Plan_ and _Test Plan Template_ APIs are deprecated. These APIs
    will continue to function using the new privileges.
  - All built-in roles use the new privileges. This includes the **Data
    Maintainer**, **Systems Maintainer**, **Collaborator**, and **Automated Agent** roles. You
    must manually update any custom roles created with _Test Plan_ and _Test Plan
    Template_ privileges to use the new _Work Item_ and _Work Item Template_
    privileges.
  - For more information, refer to Test-plan-to-work-item-migration-guidance.
- `comments 0.29.x`
  - During the Test Plan to Work Item migration, any existing comments with the
    `workorder:testplan` resource type are changed to the `workitem:workitem`
    resource type. All existing Test Plan comments are automatically migrated
    during the upgrade.
  - After a brief interval, the comments will be visible in the SystemLink web application. All comments require this interval to allow the migration to the
    new resource type. Services will continue to operate without the downtime.
- `dynamicformfields 0.14.x`
  - During the Test Plan to Work Item migration, any existing Dynamic Form
    Fields (DFFs) with the `workorder:testplan` resource type are changed to the
    `workitem:workitem` resource type.
  - To create DFFs that apply only to a specific work item type, create a new
    DFF with the `workitem:workitem` resource type. You can also use display
    rules to filter by work item type. For example, type = `testplan`.
  - **Note:** The DFF service is backward compatible with the
    `workorder:testplan` resource type.

## Helm Chart Breaking Changes

- The `global.mongodb.install: true` configuration is no longer
  supported. SystemLink Enterprise now requires an external MongoDB instance
  configured via `global.secrets.mongodb.connection_string`.
  - If you are already using the default `mongodb.install: false`, no action is
    required.
  - If you are using `mongodb.install: true`, you must deploy an external
    MongoDB replicaset and set `global.secrets.mongodb.connection_string` to
    connect to it.
  - After migrating to an external MongoDB replicaset, you can remove all `mongodb.*`
    configuration values (keep `secrets.mongodb.*` configurations).
- `dataframeservice 1.25.x`
  - SystemLink has enabled rate limiting for query, read, and export endpoints.
    Ensure that your clients can properly handle all `429` responses. Rate limits
    prevent services from overloading. If necessary, you can increase the limit
    for an endpoint in the Helm chart configuration file.
  - Data table metadata queries from SystemLink user interfaces and from
    SystemLink dashboards are now subject to a Helm-configurable timeout. This
    timeout has a default duration of 10 seconds. You can configure the timeout
    value through the `dataframeservice.interactiveMetadataQueryTimeout` Helm
    value.
- `workitem 0.1.x`
  - The Work Order service is now a part of the Work Item service. This migrated
    service supports multiple work item types.
  - In the configuration files, the `workorder` Helm chart has been renamed to
    `workitem`. All Helm values previously under the `workorder.*` file have
    been moved to the `workitem.*` file. Additionally, the
    `workordereventprocessor` API key has been replaced with the
    `workitemeventprocessor` API key.
  - During the upgrade, your system will execute the migration. As a
    result, your system may experience a brief downtime period. The length of
    this period is dependent on the number of existing test plans and templates
    on your system.

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the
[RabbitMQ](https://www.rabbitmq.com/) message bus. Because you cannot skip minor
versions when updating RabbitMQ, you may not be able to upgrade directly between
versions of SystemLink Enterprise.

The following table displays the version of the RabbitMQ dependency for each
released version of SystemLink Enterprise. For more detailed update
instructions, refer to
[Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html).

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
| ---------------- | ----------------------------------- | ---------------------------------- |
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | 0.29.56                            |
| 4.0.x            | 0.30.74                             | 0.36.63                            |
| 4.1.x            | 0.37.84                             | 0.43.92                            |
| 4.2.x            | 0.44.55                             | current                            |

## Bugs Fixed

[SystemLink Enterprise 2026-01 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2026-01/release-notes/2026-01/closed-bugs-sle-2026-01.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2026-01/release-notes/2026-01/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2026-01/release-notes/2026-01/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.45.114`

**Admin Helm Chart:** `systemlink-admin 0.45.5`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.7.20`

### NI Containers

```text
alarmservice-routine-executor:0.20.123
alarmservice:0.20.123
alarmsui:0.30.71
assetservice:0.31.121
assetui:0.30.130
comments:0.29.69
dashboardsui:0.33.73
dataframeservice-nessie:1.25.80
dataframeservice:1.25.80
dremio-ee:25.2.21
dynamicformfields:0.14.74
executionsui:0.33.70
feedservice:0.22.57
feedsui:0.21.77
fileingestioncdc:0.6.84
filesui:0.34.72
grafana-auth-proxy:0.33.78
grafana-plugins:4.113.0
grafana-rbac-integrator:0.33.106
helium-dataservices-mongomigration:0.32.49
helium-dataservices:0.32.49
helium-fileingestionservices:1.23.64
helium-salt-master:1.30.31
helium-serviceregistry:0.38.40
helium-taghistoriandataretention:0.28.43
helium-taghistorianmongomigration:0.28.43
helium-taghistorianservices:0.28.43
helium-userservices:0.38.36
helium-webappservices:0.36.55
helium-webserver:0.45.46
jupyter-notebook-userpod:2.24.27
jupyterui:0.33.57
labmanagementui:0.24.105
landingpageui:0.33.62
locationmanagementui:0.3.66
locationservice:0.4.45
nbexec-execution-helpers:0.34.50
nbexec-notebook-runner:0.34.55
nbexecservice:0.34.100
nbparsingservice:0.33.25
ni-grafana:v11.6.4-f892567bfa-ni
notification:0.33.60
repository:0.29.55
routineeventtrigger:0.34.52
routineexecutor:0.34.116
routinescheduletrigger:0.34.59
routineservice-v2:0.35.74
routineservice:0.35.74
routinesui:0.34.99
securityui:0.33.61
session-manager-service:0.39.57
sl-configurable-http-proxy:2.24.10
sl-k8s-hub:2.24.23
smtp:0.33.58
specificationmanagement:0.24.57
systemsmanagementservice:0.33.43
systemsstateservice:0.23.40-17345325
systemsstatesui:0.22.69
systemsui:0.34.129
tageventprocessor:0.32.49
tagsui:0.29.63
testinsightsui:0.33.114
testmonitorservice:0.42.85
userdata:0.33.61
userservice-setup:0.39.30
webapphostui:0.32.67
workitem:0.1.119
```

### 3rd Party Containers

```text
alpine/curl:8.17.0
alpine:3.23.2
apache/flink-kubernetes-operator:1.13.0
argoproj/argocli:v3.6.10-linux-amd64
argoproj/argoexec:v3.6.10-linux-amd64
argoproj/workflow-controller:v3.6.10-linux-amd64
bitnami-secure/containers/debian-12/elasticsearch:9.2.4-debian-12-r0
bitnami-secure/containers/debian-12/kibana:9.2.4-debian-12-r0
bitnami-secure/containers/debian-12/kubectl:1.35.0
bitnami-secure/containers/debian-12/rabbitmq:4.2.2-debian-12-r1
bitnami-secure/containers/debian-12/redis-cluster:8.4.0-debian-12-r3
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:2.3.0
pause:3.10
swaggerapi/swagger-ui:v5.31.0
zookeeper:3.9.4@sha256:b87f5ea0cdc73d71c74875277ca2e862f7abb3c0bfa365bd818db71eef870917
```
