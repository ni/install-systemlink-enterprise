# SystemLink Enterprise 2025-05 Release Notes

The 2025-05 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## New Features and Behavior changes

- Use routines to create tag threshold alarms and to send email notifications.
- View the details of a test plan fixture while scheduling a test plan. For more
  information, refer to
  [Viewing Scheduled Test Plans](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/viewing-scheduled-test-plans.html).
- `dataframeservice:1.17.62`
  - The filter for the query-tables API is now limited to 20,000 characters.
    Filters that contain a large number of chained operators such as `or` may
    receive a `400 Bad Request` response with an error message indicating the
    filter is too complex.
- `alarmservice:0.12.64`
  - New secret required for `alarmservice-apikey`. Refer to
    [Required Secrets](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/required-secrets.html).
  - New secret required for `alarmserviceroutineexecutor-apikey`. Refer to
    [Required Secrets](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/required-secrets.html).
  - The Alarm service now uses RabbitMQ credentials secret. Refer to
    [Required Secrets](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/required-secrets.html).

## Helm Chart Breaking Changes

- `dataframeservice:1.17.62`
  - The DataFrame Service Helm values under `ingestion.s3StreamPool` have been
    replaced with the values under `ingestion.streamPool`. Setting the old
    values will result in an error in Helm.
  - To migrate to the new values:
    1. Set the `ingestion.streamPool.maximumPooledStreams` value to the old
       `ingestion.s3StreamPool.maximumPooledStreams` value.
    1. Set the `ingestion.streamPool.bufferSize` value to the product of the old
       `ingestion.s3StreamPool.blocksPerBuffer` and
       `ingestion.s3StreamPool.blockSize` values. For example, the old default
       values were `blocksPerBuffer=3` and `blockSize=5MiB`, so the new default
       value is `bufferSize=15MiB`.

## Upgrade Considerations

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
| 4.0.x            | 0.30.74                             | current                            |

## Bugs Fixed

[SystemLink Enterprise 2025-05 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2025-05/release-notes/2025-05/closed-bugs-sle-2025-05.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2025-05/release-notes/2025-05/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2025-05/release-notes/2025-05/notices)

## Versions

**Top Level Helm Chart:** `0.37.84`

**Admin Helm Chart:** `0.37.3`

### NI Containers

```text
alarmservice-routine-executor:0.12.64
alarmservice:0.12.64
alarmsui:0.22.32
assetservice:0.23.56
assetui:0.22.66
comments:0.21.22
dashboardsui:0.25.39
dataframeservice-nessie:1.17.62
dataframeservice:1.17.62
dremio-ee:25.2.8
dynamicformfields:0.6.34
executionsui:0.25.40
feedservice:0.14.39
feedsui:0.13.43
filesui:0.26.18
grafana-auth-proxy:0.21.7
grafana-plugins:3.56.1
grafana-rbac-integrator:0.25.22
helium-dataservices-mongomigration:0.24.23
helium-dataservices:0.24.23
helium-fileingestionservices:1.15.12
helium-salt-master:1.22.18
helium-serviceregistry:0.29.15
helium-taghistoriandataretention:0.20.20
helium-taghistorianmongomigration:0.20.20
helium-taghistorianservices:0.20.20
helium-userservices:0.29.17
helium-webappservices:0.27.27
helium-webserver:0.36.22
jupyter-notebook-userpod:2.16.7
jupyterui:0.25.32
labmanagementui:0.16.83
landingpageui:0.25.37
nbexec-execution-helpers:0.26.33
nbexec-notebook-runner:0.26.30
nbexecservice:0.26.72
nbparsingservice:0.25.23
ni-grafana:v10.2.3-ca8100c6aa-ni
notification:0.25.28
repository:0.21.18
routineeventtrigger:0.26.18
routineexecutor:0.26.19
routinescheduletrigger:0.26.20
routineservice-v2:0.27.31
routineservice:0.27.31
routinesui:0.26.58
securityui:0.25.33
session-manager-service:0.30.16
sl-configurable-http-proxy:2.16.3
sl-k8s-hub:2.16.7
smtp:0.25.26
specificationmanagement:0.16.19
sysmgmtevent:0.26.15
systemsmanagementservice:0.25.20
systemsstateservice:0.15.12
systemsstatesui:0.14.52
systemsui:0.26.78
tageventprocessor:0.24.23
tagsui:0.21.32
testinsightsui:0.25.42
testmonitorservice:0.34.26
userdata:0.25.18
userservice-setup:0.30.11
webapphostui:0.24.37
workorder:0.16.24
```

### 3rd Party Containers

```text
alpine:3.21.3
argoproj/argocli:v3.6.4-linux-amd64
argoproj/argoexec:v3.6.4-linux-amd64
argoproj/workflow-controller:v3.6.4-linux-amd64
bitnami/kubectl:1.33.0
bitnami/mongodb:5.0.24@sha256:e56a75744316419cd150400ccd8d985c6b0762f03c7a3b015f233524d043731f
bitnami/rabbitmq:4.1.0-debian-12-r0
bitnami/redis-cluster:7.4.3-debian-12-r0
busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:1.30.3
pause:3.10
swaggerapi/swagger-ui:v5.21.0
zookeeper:3.9.3
```
