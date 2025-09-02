<!-- This file should be renamed to README.md and placed in the directory for the release. -->

# SystemLink Enterprise 2025-09 Release Notes

The 2025-09 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## Upgrading from the 2025-08 to the 2025-09

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

**Top Level Helm Chart:** `systemlink 0.41.50`

**Admin Helm Chart:** `systemlink-admin 0.41.11`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.3.28`

### NI Containers

```text
alarmservice-routine-executor:0.16.57
alarmservice:0.16.57
alarmsui:0.26.43
assetservice:0.27.52
assetui:0.26.57
comments:0.25.9
dashboardsui:0.29.48
dataframeservice-nessie:1.21.39
dataframeservice:1.21.39
dremio-ee:25.2.17
dynamicformfields:0.10.32
executionsui:0.29.44
feedservice:0.18.23
feedsui:0.17.54
fileingestioncdc:0.2.46
filesui:0.30.46
grafana-auth-proxy:0.21.7
grafana-plugins:4.5.0
grafana-rbac-integrator:0.29.37
helium-dataservices-mongomigration:0.28.25
helium-dataservices:0.28.25
helium-fileingestionservices:1.19.46
helium-salt-master:1.26.11
helium-serviceregistry:0.34.7
helium-taghistoriandataretention:0.24.11
helium-taghistorianmongomigration:0.24.11
helium-taghistorianservices:0.24.11
helium-userservices:0.34.8
helium-webappservices:0.32.18
helium-webserver:0.41.22
jupyter-notebook-userpod:2.20.12
jupyterui:0.29.37
labmanagementui:0.20.71
landingpageui:0.29.35
nbexec-execution-helpers:0.30.20
nbexec-notebook-runner:0.30.14
nbexecservice:0.30.47
nbparsingservice:0.29.28
ni-grafana:v11.6.4-223ae4310e-ni
notification:0.29.23
repository:0.25.20
routineeventtrigger:0.30.23
routineexecutor:0.30.19
routinescheduletrigger:0.30.23
routineservice-v2:0.31.38
routineservice:0.31.38
routinesui:0.30.40
securityui:0.29.37
session-manager-service:0.35.17
sl-configurable-http-proxy:2.20.7
sl-k8s-hub:2.20.9
smtp:0.29.27
specificationmanagement:0.20.22
systemsmanagementservice:0.29.25
systemsstateservice:0.19.20
systemsstatesui:0.18.40
systemsui:0.30.74
tageventprocessor:0.28.25
tagsui:0.25.36
testinsightsui:0.29.67
testmonitorservice:0.38.25
userdata:0.29.23
userservice-setup:0.35.18
webapphostui:0.28.39
workorder:0.20.41
```

### 3rd Party Containers

```text
alpine:3.22.1
argoproj/argocli:v3.6.10-linux-amd64
argoproj/argoexec:v3.6.10-linux-amd64
argoproj/workflow-controller:v3.6.10-linux-amd64
bitnami/kubectl:1.34.0
bitnami/mongodb:5.0.24@sha256:e56a75744316419cd150400ccd8d985c6b0762f03c7a3b015f233524d043731f
bitnami/rabbitmq:4.1.3-debian-12-r1
bitnami/redis-cluster:8.2.1-debian-12-r0
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:1.30.10
pause:3.10
swaggerapi/swagger-ui:v5.28.0
zookeeper:3.9.3
```
