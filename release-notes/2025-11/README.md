# SystemLink Enterprise 2025-11 Release Notes

The 2025-11 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## Upgrading from the 2025-10 to the 2025-11

## New Features and Behavior changes

- Grafana Addons
  - Failure Pareto Analysis dashboard provided out of the box.

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

[SystemLink Enterprise 2025-11 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2025-11/release-notes/2025-11/closed-bugs-sle-2025-11.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2025-11/release-notes/2025-11/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2025-11/release-notes/2025-11/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.43.92`

**Admin Helm Chart:** `systemlink-admin 0.43.7`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.5.17`

### NI Containers

```text
alarmservice:0.18.59
alarmservice-routine-executor:0.18.59
alarmsui:0.28.54
assetservice:0.29.44
assetui:0.28.63
comments:0.27.20
dashboardsui:0.31.48
dataframeservice:1.23.63
dataframeservice-nessie:1.23.63
dremio-ee:25.2.19
dynamicformfields:0.12.44-16313630
executionsui:0.31.54
feedservice:0.20.33
feedsui:0.19.62
fileingestioncdc:0.4.34
filesui:0.32.51
grafana-auth-proxy:0.31.61
grafana-plugins:4.39.0
grafana-rbac-integrator:0.31.70
helium-dataservices:0.30.31
helium-dataservices-mongomigration:0.30.31
helium-fileingestionservices:1.21.31
helium-salt-master:1.28.20
helium-serviceregistry:0.36.18
helium-taghistoriandataretention:0.26.22
helium-taghistorianmongomigration:0.26.22
helium-taghistorianservices:0.26.22
helium-userservices:0.36.19
helium-webappservices:0.34.30
helium-webserver:0.43.42
jupyter-notebook-userpod:2.22.15
jupyterui:0.31.39
labmanagementui:0.22.60
landingpageui:0.31.45
locationmanagementui:0.1.57
locationservice:0.2.18
nbexec-execution-helpers:0.32.29
nbexec-notebook-runner:0.32.35
nbexecservice:0.32.53
nbparsingservice:0.31.24
ni-grafana:v11.6.4-f892567bfa-ni
notification:0.31.36
repository:0.27.32
routineeventtrigger:0.32.29
routineexecutor:0.32.39
routinescheduletrigger:0.32.32
routineservice:0.33.38
routineservice-v2:0.33.38
routinesui:0.32.56
securityui:0.31.36
session-manager-service:0.37.30
sl-configurable-http-proxy:2.22.9
sl-k8s-hub:2.22.14
smtp:0.31.32
specificationmanagement:0.22.28
systemsmanagementservice:0.31.26
systemsstateservice:0.21.26
systemsstatesui:0.20.61
systemsui:0.32.93
tageventprocessor:0.30.31
tagsui:0.27.51
testinsightsui:0.31.87
testmonitorservice:0.40.39
userdata:0.31.31
userservice-setup:0.37.16
webapphostui:0.30.50
workorder:0.22.66
```

### 3rd Party Containers

```text
alpine/curl:8.14.1
alpine:3.22.2
apache/flink-kubernetes-operator:1.13.0
argoproj/argocli:v3.6.10-linux-amd64
argoproj/argoexec:v3.6.10-linux-amd64
argoproj/workflow-controller:v3.6.10-linux-amd64
bitnami/mongodb:5.0.24@sha256:e56a75744316419cd150400ccd8d985c6b0762f03c7a3b015f233524d043731f
bitnami-secure/containers/debian-12/elasticsearch:9.2.0-debian-12-r0
bitnami-secure/containers/debian-12/kibana:9.2.0-debian-12-r0
bitnami-secure/containers/debian-12/kubectl:1.34.1
bitnami-secure/containers/debian-12/mongodb:7.0.25-debian-12-r0@sha256:757bb5db4e687ff8561cc8e5db9468c9f2d12116c26df7eab2a56bb75cc9f89e
bitnami-secure/containers/debian-12/rabbitmq:4.1.5-debian-12-r0
bitnami-secure/containers/debian-12/redis-cluster:8.2.2-debian-12-r0
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:2.0.3
pause:3.10
swaggerapi/swagger-ui:v5.30.0
zookeeper:3.9.4@sha256:2408ba6f6eb91a4dbf65548428b90f9e5e9cf9d77e5f280a4bf80270d465a80f
```
