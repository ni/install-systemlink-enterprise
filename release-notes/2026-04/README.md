# SystemLink Enterprise 2026-04 Release Notes

The 2026-04 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## Upgrading from SystemLink Enterprise 2026-03 to 2026-04

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

- Behavior change or new feature description

- Behavior change or new feature description

## Helm Chart Breaking Changes

- Chart Name and version
  - Description of breaking change.

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

**Top Level Helm Chart:** `systemlink 0.48.69`

**Admin Helm Chart:** `systemlink-admin 0.48.12`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.10.29`

### NI Containers

```text
alarmservice-routine-executor:0.23.115
alarmservice:0.23.115
alarmsui:0.33.66
assetservice:0.34.232
assetservicecdc:0.2.250
assetui:0.33.97
comments:0.32.81
dashboardsui:0.36.74
dataframeservice-nessie:1.28.86
dataframeservice:1.28.86
dremio-ee:25.2.25
dynamicformfields:0.17.59
executionsui:0.36.69
feedservice:0.25.54
feedsui:0.24.67
fileingestioncdc:0.9.73
filesui:0.37.82
grafana-auth-proxy:0.35.11
grafana-plugins:4.144.1
grafana-rbac-integrator:0.35.84
helium-dataservices-mongomigration:0.35.37
helium-dataservices:0.35.37
helium-fileingestionservices:1.26.58
helium-salt-master:1.33.27
helium-serviceregistry:0.41.37
helium-taghistoriandataretention:0.31.24
helium-taghistorianmongomigration:0.31.24
helium-taghistorianservices:0.31.24
helium-userservices:0.41.35
helium-webappservices:0.39.44
helium-webserver:0.48.47-18966136
jupyter-notebook-userpod:2.27.11
jupyterui:0.36.56
labmanagementui:0.27.111
landingpageui:0.36.60
locationmanagementui:0.6.63
locationservice:0.7.58
nbexec-execution-helpers:0.37.56
nbexec-notebook-runner:0.37.65
nbexecservice:0.37.93
nbparsingservice:0.36.25
ni-grafana:v11.6.4-729684112f3-ni
notification:0.36.58
repository:0.32.51
routineeventtrigger:0.37.46
routineexecutor:0.37.84
routinescheduletrigger:0.37.45
routineservice-v2:0.38.51
routineservice:0.38.51
routinesui:0.37.113
securityui:0.36.69
session-manager-service:0.42.48
sl-configurable-http-proxy:2.27.9
sl-k8s-hub:2.27.11
smtp:0.36.43
specificationmanagement:0.27.43
systemscdc:0.0.331
systemsmanagementservice:0.36.221
systemsstateservice:0.26.42
systemsstatesui:0.25.70
systemsui:0.37.134
tageventprocessor:0.35.37
tagsui:0.32.70
testinsightsui:0.36.81
testmonitorservice:0.45.84
userdata:0.36.48
userservice-setup:0.42.25
webapphostui:0.35.68
workitem:0.4.79-18963706
```

### 3rd Party Containers

```text
alpine/curl:8.17.0
alpine:3.23.3
alpine:3.23.4
apache/flink-kubernetes-operator:1.14.0
argoproj/argocli:v3.7.8-linux-amd64
argoproj/argoexec:v3.7.8-linux-amd64
argoproj/workflow-controller:v3.7.8-linux-amd64
bitnami-secure/containers/debian-12/elasticsearch:9.3.3-debian-12-r0
bitnami-secure/containers/debian-12/kibana:9.3.3-debian-12-r0
bitnami-secure/containers/debian-12/kubectl:1.35.4
bitnami-secure/containers/debian-12/rabbitmq:4.2.5-debian-12-r1
bitnami-secure/containers/debian-12/redis-cluster:8.6.2-debian-12-r0
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:2.6.0
pause:3.10
swaggerapi/swagger-ui:v5.32.4
zookeeper:3.9.5@sha256:0598e33ed585128313125f9c36cce6c164f0f21224e4bb75ca5c30b34655a13e
```
