# SystemLink Enterprise 2026-07 Release Notes

The 2026-07 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## New Features and Behavior changes

- `dataframeservice:1.31.x`
  - SystemLink now limits individual values append to a data table to 32,000 bytes. Data requests that exceed this limit, according to UTF-8 representations, now return a 400 Bad Request error message. Previously, such requests succeeded but also caused background processing errors in the pod logs. Data appended in the request, and all future requests to that table, did not become available for query. This limit is configurable through the `dataframeservice.ingestion.maxRowDataStringValueSize` Helm value. However, increasing the limit reverts to the previous behavior.
- `systemlink:0.51.x`
  - Users can call `/api/config` to view SystemLink deployment. When you host the UI at `test.lifecyclesolutions.ni.com, test.lifecyclesolutions.ni.com/api/config`, SystemLink returns a JSON object with an `appDisplayVersionKey` value set to a date string. For example, the JSON object might contain the value `2026-07`.
  - SystemLink has added a new `About UI` section that displays release the version and links to the new features wiki page.
- `assetservicecdc:0.5.x, fileingestioncdc:0.12.x, systemscdc:0.3.x`
  - SystemLink previously ignored the `authSource` value from the MongoDB connection strings and instead assumed an `admin` value. CDC apps now follow the MongoDB convention: [https://www.mongodb.com/docs/manual/reference/connection-string-options/#mongodb-urioption-urioption.authSource](https://www.mongodb.com/docs/manual/reference/connection-string-options/#mongodb-urioption-urioption.authSource).
- `workitem:0.7.x`
  - SystemLink migrated work orders as work items with `type: "workorder"`. The `deprecated _Work Order_ APIs` remain functional for backward compatibility. This migration introduces breaking changes. You must update your existing workflows, custom roles with `_Work Order_` privileges, and external integrations. For more information, refer to [Work order to work item migration guidance](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/work-order-to-work-item-migration-guidance.html).
- `dynamicformfields:0.20.x`
  - As part of the Work Order to Work Item migration, any existing DFFs with the `workorder:workorder` resource type automatically migrate to the `workitem:workitem` resource type. SystemLink injects a `type == "workorder"` condition into the display rule.
  - Display rule field references undergo the following updates: `earliestStartDate` → `timeline.earliestStartDateTime` and `dueDate` → `timeline.dueDateTime`.
  - To create DFFs that apply only to work orders, use the resource type `workitem:workitem` with a `type == "workorder"` display rule condition.

## Helm Chart Breaking Changes

- `userservices:0.45.x`
  - SystemLink disables calls to POST /niauth/v1/policies. Specifically, SystemLink disables calls that create a policy from a template with the "workspace" field set to "*". A bug in the input validation code permitted administrators to assign roles that applied in any workspace. This unintended behavior extended to existing and future workspaces. Attempts to create a policy with this method returns an HTTP 400 error message. You must manually delete any existing policies with this behavior.
- `workitem:0.7.x`
  - SystemLink migrates all work orders to work items. The migration job runs during the Helm upgrade. This job causes a brief downtime. This downtime is proportional to the number of existing work orders and child work items.
- `systemlink:0.51.x`
  - The top-level SystemLink Helm values file has moved the condition that controls the deployment of `workitem` and `labmanagementui` services. The condition is no longer under `workitem.enabled` but is now under `global.featureFlags.workitem`. If you set `workitem.enabled: false` to disable those services, you must change the override to `global.featureFlags.workitem: false`.
  - SystemLink has introduced a new cross-cutting `global.featureFlags.workOrderApis` feature flag to centrally control the availability of all deprecated `_Work Order_ APIs`.
    - Setting the feature flag to `false` during a Helm upgrade has the following effects across the entire deployment:
      - Removes the deprecated ‘_Work Order_ Swagger’ entries from the Swagger UI API list.
      - No longer provisions the Grafana data sources for Work Orders and Test Plans. Any custom Grafana dashboards that depend on these data sources will no longer function as you might expect.
      - No longer provisions the following out-of-the-box Grafana dashboards:
        - Work Orders Overview
        - Test Plans Overview
      - Returns `403 Forbidden` requests for the deprecated ‘_Work Order_’ API endpoints.
    - To disable all Work Order API surfaces, pass the following bash command during the SystemLink upgrade:
    ```bash
    --set global.featureFlags.workOrderApis=false
    ```
    - This feature flag is new. You do not need to have migrated previously. The default of this flag is `true`, meaning that the Work Order surface remains active.

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

<!-- This section should link to the excel document that list customer facing bugs, fixed in the current release. The URL for the release (tag) should be used. -->

[link to closed bugs](link to closed bugs)

## Software Bill of Materials and Notices

<!-- This section should link to the directories containing notices and SBOM. The URL for the release (tag) should be used. -->

[SBOM](link to SBOM)

[Notices](link to SBOM)

## Versions

**Top Level Helm Chart:** `systemlink 0.51.79`

**Admin Helm Chart:** `systemlink-admin 0.51.7`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.13.18`

### NI Containers

```text
    alarmservice-routine-executor:0.26.104
    alarmservice:0.26.104
    alarmsui:0.36.80-20514973
    assetservice:0.37.141
    assetservicecdc:0.5.87
    assetui:0.36.81
    comments:0.35.101
    dashboardsui:0.39.74
    dataframeservice-nessie:1.31.66
    dataframeservice:1.31.66
    dynamicformfields:0.20.69
    executionsui:0.39.71
    feedservice:0.28.46
    feedsui:0.27.73
    fileingestioncdc:0.12.47
    filesui:0.40.84
    grafana-auth-proxy:0.38.19
    grafana-plugins:5.0.2
    grafana-rbac-integrator:0.38.19
    helium-dataservices-mongomigration:0.38.32
    helium-dataservices:0.38.32
    helium-fileingestionservices:1.29.41
    helium-salt-master:1.36.14
    helium-serviceregistry:0.45.33
    helium-taghistoriandataretention:0.34.24
    helium-taghistorianmongomigration:0.34.24
    helium-taghistorianservices:0.34.24
    helium-userservices:0.45.31
    helium-webappservices:0.43.34
    helium-webserver:0.52.48
    jupyter-notebook-userpod:2.30.15
    jupyterui:0.39.68
    labmanagementui:0.30.110
    landingpageui:0.39.65
    locationmanagementui:0.9.73
    locationservice:0.10.44
    nbexec-execution-helpers:0.40.47
    nbexec-notebook-runner:0.40.60
    nbexecservice:0.40.111
    nbparsingservice:0.39.10
    ni-grafana:v12.3.1-f2f3122781c-ni
    notification:0.39.44
    repository:0.35.45
    routineeventtrigger:0.40.52
    routineexecutor:0.40.99
    routinescheduletrigger:0.40.33
    routineservice-v2:0.41.51
    routineservice:0.41.51
    routinesui:0.40.83
    securityui:0.39.76
    session-manager-service:0.46.41
    sl-configurable-http-proxy:2.30.9
    sl-k8s-hub:2.30.13
    smtp:0.39.40
    specificationmanagement:0.30.37
    systemscdc:0.3.52
    systemsmanagementservice:0.39.88
    systemsstateservice:0.29.41
    systemsstatesui:0.28.77
    systemsui:0.40.108
    tageventprocessor:0.38.32
    tagsui:0.35.82
    testinsightsui:0.39.77
    testmonitorservice:0.48.102
    userdata:0.39.33
    userservice-setup:0.46.11
    webapphostui:0.38.76
    workitem:0.7.111
```

### 3rd Party Containers

```text
    alpine/curl:8.21.0
    alpine:3.24.0
    alpine:3.24.1
    apache/flink-kubernetes-operator:1.15.0
    bitnami-secure/containers/debian-12/argo-workflow-cli:4.0.7-debian-12-r1
    bitnami-secure/containers/debian-12/argo-workflow-controller:4.0.7-debian-12-r1
    bitnami-secure/containers/debian-12/argo-workflow-exec:4.0.7-debian-12-r1
    bitnami-secure/containers/debian-12/elasticsearch:9.4.3-debian-12-r0
    bitnami-secure/containers/debian-12/kibana:9.4.3-debian-12-r0
    bitnami-secure/containers/debian-12/kubectl:1.36.2
    bitnami-secure/containers/debian-12/rabbitmq:4.2.6-debian-12-r0
    bitnami-secure/containers/debian-12/redis-cluster:8.6.3-debian-12-r3@sha256:602088783bbcd2e792a19f8246a43f334dddfc239b7686c59c5759e4ead411f5
    busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
    dremio/dremio-enterprise:26.1.8
    jupyterhub/k8s-image-awaiter:4.3.3
    kiwigrid/k8s-sidecar:2.8.1
    pause:3.10.1
    swaggerapi/swagger-ui:v5.32.8
    zookeeper:3.9.5@sha256:4c6f15fbd5491a3e01b0108c046891125553329a4956848ba3014cedff5386ee
```
