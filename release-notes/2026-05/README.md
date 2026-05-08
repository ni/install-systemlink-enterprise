# SystemLink Enterprise 2026-05 Release Notes

The 2026-05 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## Upgrading from SystemLink Enterprise 2026-04 to 2026-05

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

- Behavior change or new feature description

- Behavior change or new feature description

## Helm Chart Breaking Changes

- `dataframeservice:1.29.4`
  - The sldremio Helm chart dependency has been replaced with dremio-helm.
    Dremio pod resources are now configured via
    `dataframeservice.sldremio.coordinator.resources`,
    `dataframeservice.sldremio.executor.resources`,
    `dataframeservice.sldremio.engineOverride.iceberg.resources`, and
    `dataframeservice.sldremio.zookeeper.resources`. Memory values must be
    specified in whole numbers with units of Mi, Gi, or Ti. These values replace
    the old `dataframeservice.sldremio.coordinator.cpu`,
    `dataframeservice.sldremio.coordinator.memory`, `executor.cpu`,
    `executor.memory`, `executor.engineOverride.iceberg.cpu`,
    `executor.engineOverride.iceberg.memory`, `zookeeper.cpu`, and
    `zookeeper.memory` values. The
    `dataframeservice.sldremio.executor.engineOverride.iceberg.heapMemoryOverride`
    and `directMemoryOverride` values are no longer read.
  - The default Iceberg executor volume size
    (`dataframeservice.sldremio.executor.engineOverride.iceberg.volumeSize`) has
    changed from 256Gi to 20Gi.
  - Dremio Kubernetes resource names no longer include the release name or `dfs`
    prefix. After upgrading, delete old PVCs and volumes containing `dfs-dremio`
    in the name.
  - The Dremio Docker image has changed from
    `downloads.artifacts.ni.com/ni-docker/ni/systemlink-dremio-ee` to
    `downloads.artifacts.ni.com/ni-docker/dremio/dremio-enterprise`. The
    `dataframeservice.sldremio.image` Helm value has been renamed
    `dataframeservice.sldremio.dremio.image`, and
    `dataframeservice.sldremio.initImage` has been renamed
    `dataframeservice.sldremio.busyBox.image`.
  - The dremio-helm chart enforces schema validation for several Helm values
    under `dataframeservice.sldremio`, such as ensuring distributed storage is
    configured.

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

**Top Level Helm Chart:** `systemlink 0.49.39`

**Admin Helm Chart:** `systemlink-admin 0.49.16`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.11.21`

### NI Containers

```text
alarmservice-routine-executor:0.24.52
alarmservice:0.24.52
alarmsui:0.34.33
assetservice:0.35.119
assetservicecdc:0.3.97
assetui:0.34.29
comments:0.33.47
dashboardsui:0.37.30
dataframeservice-nessie:1.29.50
dataframeservice:1.29.50
dynamicformfields:0.18.36
executionsui:0.37.32
feedservice:0.26.30
feedsui:0.25.27
fileingestioncdc:0.10.36
filesui:0.38.40
grafana-auth-proxy:0.36.3
grafana-plugins:4.149.1
grafana-rbac-integrator:0.36.21
helium-dataservices-mongomigration:0.36.14
helium-dataservices:0.36.14
helium-fileingestionservices:1.27.39
helium-salt-master:1.34.10
helium-serviceregistry:0.43.7
helium-taghistoriandataretention:0.32.12
helium-taghistorianmongomigration:0.32.12
helium-taghistorianservices:0.32.12
helium-userservices:0.43.10
helium-webappservices:0.41.14
helium-webserver:0.50.19
jupyter-notebook-userpod:2.27.11
jupyterui:0.37.30
labmanagementui:0.28.77
landingpageui:0.37.33
locationmanagementui:0.7.33
locationservice:0.8.33
nbexec-execution-helpers:0.38.60
nbexec-notebook-runner:0.38.78
nbexecservice:0.38.70
nbparsingservice:0.37.20
ni-grafana:v11.6.4-729684112f3-ni
notification:0.37.35
repository:0.33.29
routineeventtrigger:0.38.35
routineexecutor:0.38.48
routinescheduletrigger:0.38.23
routineservice-v2:0.39.36
routineservice:0.39.36
routinesui:0.38.48
securityui:0.37.32
session-manager-service:0.44.16
sl-configurable-http-proxy:2.28.3
sl-k8s-hub:2.28.2
smtp:0.37.21
specificationmanagement:0.28.21
systemscdc:0.1.12
systemsmanagementservice:0.37.62
systemsstateservice:0.27.21
systemsstatesui:0.26.29
systemsui:0.38.72
tageventprocessor:0.36.14
tagsui:0.33.28
testinsightsui:0.37.43
testmonitorservice:0.46.47
userdata:0.37.26
userservice-setup:0.44.9
webapphostui:0.36.34
workitem:0.5.49
```

### 3rd Party Containers

```text
alpine/curl:8.17.0
alpine:3.23.4
apache/flink-kubernetes-operator:1.14.0
argoproj/argocli:v3.7.8-linux-amd64
argoproj/argoexec:v3.7.8-linux-amd64
argoproj/workflow-controller:v3.7.8-linux-amd64
bitnami-secure/containers/debian-12/elasticsearch:9.3.4-debian-12-r0
bitnami-secure/containers/debian-12/kibana:9.3.4-debian-12-r0
bitnami-secure/containers/debian-12/kubectl:1.36.0
bitnami-secure/containers/debian-12/rabbitmq:4.2.6-debian-12-r0
bitnami-secure/containers/debian-12/redis-cluster:8.6.3-debian-12-r0
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
dremio/dremio-enterprise:26.1.7
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:2.7.1
pause:3.10
swaggerapi/swagger-ui:v5.32.5
zookeeper:3.9.5@sha256:0598e33ed585128313125f9c36cce6c164f0f21224e4bb75ca5c30b34655a13e
```