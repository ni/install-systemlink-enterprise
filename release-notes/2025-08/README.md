# SystemLink Enterprise 2025-08 Release Notes

The 2025-08 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## New Features and Behavior changes

- Support for Server-Side Encryption through the Key Management Service (AWS
  SSE-KMS). For more information, refer to
  [Configuring File Storage](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/configuring-file-storage.html).
- `dataframeservice:1.20.72`
  - The DataFrame Service now limits the amount of property metadata that tables
    and columns can contain. You can configure this limit through the
    `dataframeservice.ingestion.maxPropertyMetadataLength` Helm values.
  - This limit sets the maximum total character count for all property metadata
    keys and values across a table and its columns.
  - The default limit is 500000 characters. If the summed property metadata
    length of a table and its columns exceeds this value, the service returns a
    `HTTP 400 PropertyMetadataTooLarge` error.
  - This change mitigates database and query performance degradation.
  - This change mitigates the likelihood of exceeding the 16 MB document size
    limit of the service database.
  - This limit is in addition to limits to the number of properties an
    individual table or column may have.
- `testmonitorservice:0.37.42`
  - Introduced new `testmonitor.queryRequestTimeoutInSeconds` Helm value. Use
    this value to set the timeout limit for query requests.
  - Introduced new `testmonitor.statementTimeoutInSeconds` Helm value. Use this
    value to defer a query retry when a request exceeds the timeout limit.

## Helm Chart Breaking Changes

- `dataframeservice:1.20.72`, `helium-fileingestionservices:1.18.19`,
  `feedservice:0.17.41`, `nbexecservice:0.29.62`
  - This update removes the `storage.s3.service` value from the Helm
    configuration. Use the `storage.s3.host` value to configure the S3
    connection for these services.
  - Deployments fail if the Helm chart detects the old value and will direct the
    user to set the `host` value instead.
- `fileingestioncdc:0.1.3`
  - This update removes the
    `fileingestioncdc.highAvailability.storage.s3.service` value from the Helm
    configuration.
  - Use the `fileingestioncdc.highAvailability.storage.s3.host` value to
    configure the S3 connection for the service.
  - Deployments fail if the Helm chart detects the old value and will direct the
    user to set the `host` value instead.

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the
[RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor
versions when updating RabbitMQ, you may not be able to upgrade directly between
versions of SystemLink Enterprise. The table below shows the version of the
RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to
[Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html)
for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
| ---------------- | ----------------------------------- | ---------------------------------- |
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | 0.29.56                            |
| 4.0.x            | 0.30.74                             | 0.36.63                            |
| 4.1.x            | 0.37.84                             | current                            |

## Bugs Fixed

[SystemLink Enterprise 2025-08 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2025-08/release-notes/2025-08/closed-bugs-sle-2025-08.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2025-08/release-notes/2025-08/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2025-08/release-notes/2025-08/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.40.67`

**Admin Helm Chart:** `systemlink-admin 0.40.11`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.2.13`

### NI Containers

```text
alarmservice-routine-executor:0.15.65
alarmservice:0.15.65
alarmsui:0.25.51
assetservice:0.26.49
assetui:0.25.67
comments:0.24.21
dashboardsui:0.28.46
dataframeservice-nessie:1.20.72
dataframeservice:1.20.72
dremio-ee:25.2.15
dynamicformfields:0.9.49
executionsui:0.28.49
feedservice:0.17.41
feedsui:0.16.45
fileingestioncdc:0.1.3
filesui:0.29.52
grafana-auth-proxy:0.21.7
grafana-plugins:4.2.1
grafana-rbac-integrator:0.28.38-15169355
helium-dataservices-mongomigration:0.27.40
helium-dataservices:0.27.40
helium-fileingestionservices:1.18.19
helium-salt-master:1.25.12
helium-serviceregistry:0.33.17
helium-taghistoriandataretention:0.23.16
helium-taghistorianmongomigration:0.23.16
helium-taghistorianservices:0.23.16
helium-userservices:0.33.13
helium-webappservices:0.31.16
helium-webserver:0.40.22
jupyter-notebook-userpod:2.19.12
jupyterui:0.28.40
labmanagementui:0.19.102
landingpageui:0.28.38
nbexec-execution-helpers:0.29.14
nbexec-notebook-runner:0.29.17
nbexecservice:0.29.62
nbparsingservice:0.28.13
ni-grafana:v11.6.4-223ae4310e-ni
notification:0.28.35
repository:0.24.30
routineeventtrigger:0.29.32-15132619
routineexecutor:0.29.30
routinescheduletrigger:0.29.31
routineservice-v2:0.30.41
routineservice:0.30.41
routinesui:0.29.47
securityui:0.28.45
session-manager-service:0.34.22
sl-configurable-http-proxy:2.19.14
sl-k8s-elasticsearch:1.0.3
sl-k8s-hub:2.19.4
sl-k8s-kibana:1.0.5
smtp:0.28.32
specificationmanagement:0.19.31
systemsmanagementservice:0.28.29
systemsstateservice:0.18.33
systemsstatesui:0.17.64
systemsui:0.29.92
tageventprocessor:0.27.40
tagsui:0.24.46
testinsightsui:0.28.85
testmonitorservice:0.37.42
userdata:0.28.23
userservice-setup:0.34.8
webapphostui:0.27.49
workorder:0.19.42
```

### 3rd Party Containers

```text
alpine:3.22.1
alpine/curl:8.14.1
apache/flink-kubernetes-operator:1.12.1
argoproj/argocli:v3.6.10-linux-amd64
argoproj/argoexec:v3.6.10-linux-amd64
argoproj/workflow-controller:v3.6.10-linux-amd64
bitnami/kubectl:1.33.3
bitnami/mongodb:5.0.24@sha256:e56a75744316419cd150400ccd8d985c6b0762f03c7a3b015f233524d043731f
bitnami/rabbitmq:4.1.3-debian-12-r0
bitnami/redis-cluster:8.0.3-debian-12-r1
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:1.30.7
pause:3.10
swaggerapi/swagger-ui:v5.27.1
zookeeper:3.9.3
```
