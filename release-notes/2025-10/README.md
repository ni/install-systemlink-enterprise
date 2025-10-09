# SystemLink Enterprise release 2025-10 Release Notes

The 2025-10 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## Upgrading from the release 2025-09 to the release 2025-10

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
| 4.1.x            | 0.37.84                             | current                            |

## Bugs Fixed

<!-- This section should link to the excel document that list customer facing bugs, fixed in the current release. The URL for the release (tag) should be used. -->

[link to closed bugs](link to closed bugs)

## Software Bill of Materials and Notices

<!-- This section should link to the directories containing notices and SBOM. The URL for the release (tag) should be used. -->

[SBOM](link to SBOM)

[Notices](link to SBOM)

## Versions

**Top Level Helm Chart:** `systemlink 0.42.84`

**Admin Helm Chart:** `systemlink-admin 0.42.12`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.4.10`

### NI Containers

```text
alarmservice-routine-executor:0.17.107
alarmservice:0.17.107
alarmsui:0.27.61
assetservice:0.28.75
assetui:0.27.99
comments:0.26.15
dashboardsui:0.30.56
dataframeservice-nessie:1.22.84
dataframeservice:1.22.84
dremio-ee:25.2.18
dynamicformfields:0.11.66
executionsui:0.30.38
feedservice:0.19.58
feedsui:0.18.79
fileingestioncdc:0.3.45
filesui:0.31.58
grafana-auth-proxy:0.21.7
grafana-plugins:4.16.0
grafana-rbac-integrator:0.30.59
helium-dataservices-mongomigration:0.29.35
helium-dataservices:0.29.35
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
locationservice:0.1.104
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
routineservice-v2:0.32.66
routineservice:0.32.66
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
tageventprocessor:0.29.35
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
bitnami-secure/containers/debian-12/kubectl:1.34.1
bitnami-secure/containers/debian-12/rabbitmq:4.1.4-debian-12-r1
bitnami-secure/containers/debian-12/redis-cluster:8.2.2-debian-12-r0
bitnami/mongodb:5.0.24@sha256:e56a75744316419cd150400ccd8d985c6b0762f03c7a3b015f233524d043731f
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:1.30.10
pause:3.10
swaggerapi/swagger-ui:v5.29.3
zookeeper:3.9.4@sha256:2408ba6f6eb91a4dbf65548428b90f9e5e9cf9d77e5f280a4bf80270d465a80f
```
