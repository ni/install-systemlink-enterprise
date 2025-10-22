# SystemLink Enterprise release 2025-10 Release Notes

The 2025-10 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## New Features and Behavior changes

- `assetservice:0.28.*`
  - Introduced the **Move assets between locations** privilege. The asset
    location movement API uses this privilege instead of **Modify assets**.
  - Physical locations are migrated to the new Location service. For each assets
    physical location string, a location is created with the same
    name in the respective asset's workspace. Each asset references the
    corresponding location ID instead of the location string.
    - If multiple assets share the same workspace and have the same physical
      location name, a single corresponding location is created.
    - If multiple assets are in different workspaces and have the same physical
      location name, different corresponding locations are created, matching the
      workspaces.
    - The Location service enforces a 500 character limit for location names.
      Location names longer than 500 characters are trimmed during migration.
    - The Location service prohibits the `/` character in location names, since
      it is used by the path property. If this character is found during
      migration, it is replaced with the `\` character.
- `locationservice:0.1.*`
  - Added new chart for the Location service. This requires additional
    MongoDB credentials to be provided.
    - [View this secret configuration](https://github.com/ni/install-systemlink-enterprise/blob/2025-10/getting-started/templates/systemlink-secrets.yaml#L190)
  - Added new privileges for the Location service: **List and view locations**,
    **Create locations**, **Modify locations**, and **Delete locations**.
  - The **List and view locations** privilege is required to view the physical
    location name of each asset in the Assets UI.
- `dataframeservice:1.22.*`
  - Enabled Cross Origin Requests for the query tables route
    `/nidataframe/v1/query-tables`.
  - The DataFrame service now enforces a 16 MB limit on parquet data file
    footers. Previously, if the footer was too large, data table append requests
    would succeed with an HTTP `204` response, but the data would not become
    available for query. With this change, the append request returns an HTTP
    `413` error, and logs describe the issue and information about the rejected
    request.
- `dynamicformfields:0.11.*`
  - Dynamic Form Field can define rules for a _view_, _group_, or _field_ to
    control these properties of a Dynamic Form Field object.
- Dashboards
  - CORS requests are now allowed from dashboards.

## Helm Chart Breaking Changes

- `userservices:0.35.*`
  - User Services no longer start if the
    `userservices.secrets.continuationTokenEncryptionKey` Helm value is
    incorrectly formatted.
  - Previously, if the key was invalid, the service would start and report
    errors only when a request to `POST /niuser/v1/users/query` required the
    service to generate a continuation token.
  - If User Services refuses to start after upgrading, review pod logs for
    `Invalid continuation token encryption key. The key must be a 32-byte value which is base64 encoded`.
- `dataframeservice:1.22.*`
  - A new Helm value, `dataframeservice.ingestion.arrow.maxRecordBatchSize`,
    determines how much memory the service may use when handling an append data
    request in the Apache Arrow format.
  - Existing applications appending data in the JSON format are not affected.
    However, as applications are updated to use Arrow, you must ensure the
    `maxRecordBatchSize` limit is set correctly based on the
    `dataframeservice.resources.limits.memory` and
    `dataframeservice.rateLimits.ingestion.requestsLimit`.
  - If the DataFrame Service is configured with default resources, no change is
    required.
    [pilot-sizing.yaml](https://github.com/ni/install-systemlink-enterprise/blob/2025-10/getting-started/templates/pilot-sizing.yaml) has
    been updated to accommodate this change.
- `workorder:0.21.125`
  - This update removes the unneeded `workorder-apikey` whitelisted API key.

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
| 4.1.x            | 0.37.84                             | current                            |

## Bugs Fixed

[SystemLink Enterprise 2025-10 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2025-10/release-notes/2025-10/closed-bugs-sle-2025-10.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2025-10/release-notes/2025-10/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2025-10/release-notes/2025-10/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.42.91`

**Admin Helm Chart:** `systemlink-admin 0.42.12`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.4.10`

### NI Containers

```text
alarmservice:0.17.107
alarmservice-routine-executor:0.17.107
alarmsui:0.27.61
assetservice:0.28.75
assetui:0.27.99
comments:0.26.15
dashboardsui:0.30.56
dataframeservice:1.22.84
dataframeservice-nessie:1.22.84
dremio-ee:25.2.18
dynamicformfields:0.11.66
executionsui:0.30.38
feedservice:0.19.58
feedsui:0.18.79
fileingestioncdc:0.3.45
filesui:0.31.58
grafana-auth-proxy:0.31.28
grafana-plugins:4.21.3
grafana-rbac-integrator:0.30.61
helium-dataservices:0.29.36
helium-dataservices-mongomigration:0.29.36
helium-fileingestionservices:1.20.40
helium-salt-master:1.27.21
helium-serviceregistry:0.35.25
helium-taghistoriandataretention:0.25.25
helium-taghistorianmongomigration:0.25.25
helium-taghistorianservices:0.25.25
helium-userservices:0.35.21
helium-webappservices:0.33.40
helium-webserver:0.42.36
jupyter-notebook-userpod:2.21.16
jupyterui:0.30.46
labmanagementui:0.21.88
landingpageui:0.30.50
locationmanagementui:0.0.306
locationservice:0.1.105
nbexec-execution-helpers:0.31.33
nbexec-notebook-runner:0.31.28
nbexecservice:0.31.83
nbparsingservice:0.30.21
ni-grafana:v11.6.4-f892567bfa-ni
notification:0.30.59
repository:0.26.39
routineeventtrigger:0.31.42
routineexecutor:0.31.56
routinescheduletrigger:0.31.51
routineservice:0.32.66
routineservice-v2:0.32.66
routinesui:0.31.68
securityui:0.30.52-16008682
session-manager-service:0.36.44
sl-configurable-http-proxy:2.21.7
sl-k8s-elasticsearch:1.0.5
sl-k8s-hub:2.21.12
sl-k8s-kibana:1.0.8
smtp:0.30.62
specificationmanagement:0.21.56
systemsmanagementservice:0.30.46
systemsstateservice:0.20.37
systemsstatesui:0.19.77
systemsui:0.31.123
tageventprocessor:0.29.36
tagsui:0.26.47
testinsightsui:0.30.122
testmonitorservice:0.39.55
userdata:0.30.44
userservice-setup:0.36.21
webapphostui:0.29.55
workorder:0.21.125
```

### 3rd Party Containers

```text
alpine/curl:8.14.1
alpine:3.22.1
apache/flink-kubernetes-operator:1.12.1
argoproj/argocli:v3.6.10-linux-amd64
argoproj/argoexec:v3.6.10-linux-amd64
argoproj/workflow-controller:v3.6.10-linux-amd64
bitnami/mongodb:5.0.24@sha256:e56a75744316419cd150400ccd8d985c6b0762f03c7a3b015f233524d043731f
bitnami-secure/containers/debian-12/kubectl:1.34.1
bitnami-secure/containers/debian-12/rabbitmq:4.1.4-debian-12-r1
bitnami-secure/containers/debian-12/redis-cluster:8.2.2-debian-12-r0
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:1.30.10
pause:3.10
swaggerapi/swagger-ui:v5.29.3
zookeeper:3.9.4@sha256:2408ba6f6eb91a4dbf65548428b90f9e5e9cf9d77e5f280a4bf80270d465a80f
```
