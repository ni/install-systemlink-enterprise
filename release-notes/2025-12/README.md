# SystemLink Enterprise release 2025-12 Release Notes

The 2025-12 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## Upgrading from the release year-release-month to the release year-release-month

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

- Behavior change or new feature description

- Behavior change or new feature description

## Helm Chart Breaking Changes

- dataframeservice
  - MongoDB.Driver has been upgraded from v2.30.0 to v3.5.0 and the MongoDB LINQ
    provider was upgraded from V2 to V3. Accessing fields with numeric indices
    is not supported in MongoDB Driver LINQ V3.X, so queries like "name[0] ==
    @0" (checking if the first character of a table name is equal to some
    constant) will no longer succeed. Queries can still use operators like
    Contains and Any instead, i.e. "name.Contains(@0)).

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

**Top Level Helm Chart:** `systemlink 0.44.46`

**Admin Helm Chart:** `systemlink-admin 0.44.10`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.6.8`

### NI Containers

```text
alarmservice-routine-executor:0.19.66
alarmservice:0.19.66
alarmsui:0.29.46
assetservice:0.30.52
assetui:0.29.85
comments:0.28.33
dashboardsui:0.32.49
dataframeservice-nessie:1.24.43
dataframeservice:1.24.43
dremio-ee:25.2.19
dynamicformfields:0.13.39
executionsui:0.32.48
feedservice:0.21.32
feedsui:0.20.63
fileingestioncdc:0.5.37
filesui:0.33.60
grafana-auth-proxy:0.32.81
grafana-plugins:4.82.1
grafana-rbac-integrator:0.32.88
helium-dataservices-mongomigration:0.31.14
helium-dataservices:0.31.14
helium-fileingestionservices:1.22.36
helium-salt-master:1.29.12
helium-serviceregistry:0.37.5
helium-taghistoriandataretention:0.27.10
helium-taghistorianmongomigration:0.27.10
helium-taghistorianservices:0.27.10
helium-userservices:0.37.10
helium-webappservices:0.35.27
helium-webserver:0.44.27
jupyter-notebook-userpod:2.23.12
jupyterui:0.32.49
labmanagementui:0.23.33
landingpageui:0.32.55
locationmanagementui:0.2.64
locationservice:0.3.35
nbexec-execution-helpers:0.33.28
nbexec-notebook-runner:0.33.27
nbexecservice:0.33.57
nbparsingservice:0.32.25
ni-grafana:v11.6.4-f892567bfa-ni
notification:0.32.33
repository:0.28.26
routineeventtrigger:0.33.27
routineexecutor:0.33.50
routinescheduletrigger:0.33.27
routineservice-v2:0.34.35
routineservice:0.34.35
routinesui:0.33.41
securityui:0.32.55
session-manager-service:0.38.32
sl-configurable-http-proxy:2.23.5
sl-k8s-hub:2.23.9
smtp:0.32.31
specificationmanagement:0.23.34
systemsmanagementservice:0.32.21
systemsstateservice:0.22.30
systemsstatesui:0.21.67
systemsui:0.33.109
tageventprocessor:0.31.14
tagsui:0.28.53
testinsightsui:0.32.69
testmonitorservice:0.41.39
userdata:0.32.33
userservice-setup:0.38.13
webapphostui:0.31.54
workorder:0.23.60
```

### 3rd Party Containers

```text
alpine:3.22.2
argoproj/argocli:v3.6.10-linux-amd64
argoproj/argoexec:v3.6.10-linux-amd64
argoproj/workflow-controller:v3.6.10-linux-amd64
bitnami-secure/containers/debian-12/kubectl:1.34.1
bitnami-secure/containers/debian-12/mongodb:7.0.25-debian-12-r0@sha256:757bb5db4e687ff8561cc8e5db9468c9f2d12116c26df7eab2a56bb75cc9f89e
bitnami-secure/containers/debian-12/rabbitmq:4.2.1-debian-12-r1
bitnami-secure/containers/debian-12/redis-cluster:8.2.3-debian-12-r0
bitnami/mongodb:5.0.24@sha256:e56a75744316419cd150400ccd8d985c6b0762f03c7a3b015f233524d043731f
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:2.1.2
pause:3.10
swaggerapi/swagger-ui:v5.30.2
zookeeper:3.9.4@sha256:b87f5ea0cdc73d71c74875277ca2e862f7abb3c0bfa365bd818db71eef870917
```
