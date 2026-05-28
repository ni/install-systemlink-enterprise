# SystemLink Enterprise 2026-05 Release Notes

The 2026-05 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## New Features and Behavior changes

Explore the May 2026 SystemLink Enterprise release, including a new work item type and an upgrade for Dremio 26.

- Create a Transport Order to schedule and reserve assets and DUTs for movement between locations. For more information, refer to [Managing Work Orders and Work Items](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/managing-work-orders-and-test-plans.html).
- Upgraded SystemLink to Dremio 26. For more information, refer to the [Release Notes](https://www.ni.com/r/slegithubrn) and the [SystemLink Enterprise IT Administrators Manual](http://www.ni.com/r/sle-it-admin).

## Helm Chart Breaking Changes

- `dataframeservice:1.29.x`
  - The dremio-helm Helm chart dependency replaces the sldremio dependency. This new dependency uses the alias of `sldremio`.
  - You can configure the Dremio pod resources through the following values:
    - `dataframeservice.sldremio.coordinator.resources` (with requests and limits)
    - `dataframeservice.sldremio.executor.resources`
    - `dataframeservice.sldremio.executor.engineOverride.iceberg.resources`
    - `dataframeservice.sldremio.zookeeper.resources`
  - You must specify memory values using whole numbers and the measurement units of Mi, Gi, or Ti. These new values must replace the following older values:
    - `dataframeservice.sldremio.coordinator.cpu`
    - `dataframeservice.sldremio.coordinator.memory`
    - `executor.cpu`
    - `executor.memory`
    - `executor.engineOverride.iceberg.cpu`
    - `executor.engineOverride.iceberg.memory`
    - `zookeeper.cpu`
    - `zookeeper.memory`
  - Older memory values use units of M (1,000,000 bytes). As such, SystemLink Helm charts no longer read the following values:
    - `dataframeservice.sldremio.executor.engineOverride.iceberg.heapMemoryOverride`
    - `directMemoryOverride`
  - The default volume size for an Iceberg executor is now 20 Gi instead of 256 Gi. NI recommends using this smaller value even for large deployments. You can locate the main Iceberg executor value at `dataframeservice.sldremio.executor.engineOverride.iceberg.volumeSize`.
  - Dremio Kubernetes resource names no longer use a release name or `dfs` as a prefix. For example, instead of a pod using the name `systemlink-dfs-dremio-master-0`, that same pod now uses `dremio-master-0`. This change also applies to persistent volume claims. After upgrading SystemLink, NI recommends deleting any old Dremio persistent volume claims and volumes with `dfs-dremio` in the name.
  - The Dremio Docker image is now in downloads.artifacts.ni.com/ni-docker/dremio/dremio-enterprise.
  - The following Helm values have changed:
    - The `dataframeservice.sldremio.dremio.image` value replaces the `dataframeservice.sldremio.image` value.
    - The `dataframeservice.sldremio.busyBox.image` value replaces the `dataframeservice.sldremio.initImage` value.
  - The dremio-helm chart enforces schema validation for several Helm values under `dataframeservice.sldremio`. This validation includes ensuring the configuration of the distributed storage.

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

[SystemLink Enterprise 2026-05 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2026-05/release-notes/2026-05/closed-bugs-sle-2026-05.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2026-05/release-notes/2026-05/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2026-05/release-notes/2026-05/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.49.51`

**Admin Helm Chart:** `systemlink-admin 0.49.16`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.11.21`

### NI Containers

```text
alarmservice:0.24.52
alarmservice-routine-executor:0.24.52
alarmsui:0.34.33
assetservice:0.35.119
assetservicecdc:0.3.97
assetui:0.34.30
comments:0.33.47
dashboardsui:0.37.30
dataframeservice:1.29.50
dataframeservice-nessie:1.29.50
dynamicformfields:0.18.36
executionsui:0.37.32
feedservice:0.26.30
feedsui:0.25.27
fileingestioncdc:0.10.37
filesui:0.38.41
grafana-auth-proxy:0.36.4
grafana-plugins:4.149.1
grafana-rbac-integrator:0.36.21
helium-dataservices:0.36.14
helium-dataservices-mongomigration:0.36.14
helium-fileingestionservices:1.27.39
helium-salt-master:1.34.10
helium-serviceregistry:0.43.8
helium-taghistoriandataretention:0.32.12
helium-taghistorianmongomigration:0.32.12
helium-taghistorianservices:0.32.12
helium-userservices:0.43.11
helium-webappservices:0.41.14
helium-webserver:0.50.19
jupyter-notebook-userpod:2.27.11
jupyterui:0.37.30
labmanagementui:0.28.78
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
routineservice:0.39.36
routineservice-v2:0.39.36
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
systemsui:0.38.73
tageventprocessor:0.36.14
tagsui:0.33.28
testinsightsui:0.37.44
testmonitorservice:0.46.47
userdata:0.37.26
userservice-setup:0.44.9
webapphostui:0.36.34
workitem:0.5.50
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
