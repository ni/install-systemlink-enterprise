# SystemLink Enterprise release year-release-month Release Notes

The 2025-07 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## Upgrading from the release year-release-month to the release year-release-month

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

## Helm Chart Breaking Changes

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

<!-- This section should link to the excel document that list customer facing bugs, fixed in the current release. The URL for the release (tag) should be used. -->

[link to closed bugs](link to closed bugs)

## Software Bill of Materials and Notices

<!-- This section should link to the directories containing notices and SBOM. The URL for the release (tag) should be used. -->

[SBOM](link to SBOM)

[Notices](link to SBOM)

## Versions

**Top Level Helm Chart:** `systemlink 0.39.94`

**Admin Helm Chart:** `systemlink-admin 0.39.15`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.1.11`

### NI Containers

```text
alarmservice-routine-executor:0.14.99
alarmservice:0.14.99
alarmsui:0.24.65
assetservice:0.25.91
assetui:0.24.95
comments:0.23.41
dashboardsui:0.27.69
dataframeservice-nessie:1.19.83
dataframeservice:1.19.83
dremio-ee:25.2.14
dynamicformfields:0.8.62
executionsui:0.27.65
feedservice:0.16.56
feedsui:0.15.70
fileingestioncdc:0.0.113_14669381
filesui:0.28.76
grafana-auth-proxy:0.21.7
grafana-plugins:3.144.1
grafana-rbac-integrator:0.27.97
helium-dataservices-mongomigration:0.26.46
helium-dataservices:0.26.46
helium-fileingestionservices:1.17.39
helium-salt-master:1.24.14
helium-serviceregistry:0.31.19
helium-taghistoriandataretention:0.22.33
helium-taghistorianmongomigration:0.22.33
helium-taghistorianservices:0.22.33
helium-userservices:0.31.19
helium-webappservices:0.29.34
helium-webserver:0.38.23
jupyter-notebook-userpod:2.18.10
jupyterui:0.27.60
labmanagementui:0.18.140
landingpageui:0.27.59
nbexec-execution-helpers:0.28.28
nbexec-notebook-runner:0.28.14
nbexecservice:0.28.85
nbparsingservice:0.27.29
ni-grafana:v10.2.3-ca8100c6aa-ni
notification:0.27.54
repository:0.23.45
routineeventtrigger:0.28.53
routineexecutor:0.28.52
routinescheduletrigger:0.28.53
routineservice-v2:0.29.63
routineservice:0.29.63
routinesui:0.28.58
securityui:0.27.54
session-manager-service:0.32.43
sl-configurable-http-proxy:2.18.8
sl-k8s-elasticsearch:1.0.3
sl-k8s-hub:2.18.9
sl-k8s-kibana:1.0.5
smtp:0.27.63
specificationmanagement:0.18.43
systemsmanagementservice:0.27.48
systemsstateservice:0.17.47
systemsstatesui:0.16.70_14672719
systemsui:0.28.99_14677077
tageventprocessor:0.26.46
tagsui:0.23.66
testinsightsui:0.27.97
testmonitorservice:0.36.50
userdata:0.27.44
userservice-setup:0.32.5
webapphostui:0.26.65
workorder:0.18.86
```

### 3rd Party Containers

```text
alpine:3.22.0
alpine/curl:8.14.1
apache/flink-kubernetes-operator:1.12.0
argoproj/argocli:v3.6.10-linux-amd64
argoproj/argoexec:v3.6.10-linux-amd64
argoproj/workflow-controller:v3.6.10-linux-amd64
bitnami/kubectl:1.33.1
bitnami/mongodb:5.0.24@sha256:e56a75744316419cd150400ccd8d985c6b0762f03c7a3b015f233524d043731f
bitnami/os-shell:12-debian-12-r47
bitnami/rabbitmq:4.1.1-debian-12-r2
bitnami/redis-cluster:8.0.2-debian-12-r2
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:1.30.6
pause:3.10
swaggerapi/swagger-ui:v5.24.2
zookeeper:3.9.3
```
