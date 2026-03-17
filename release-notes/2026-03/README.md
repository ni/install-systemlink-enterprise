# SystemLink Enterprise 2026-03 Release Notes

The 2026-03 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## Upgrading from SystemLink Enterprise 2026-02 to 2026-03

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

**Top Level Helm Chart:** `systemlink 0.47.49`

**Admin Helm Chart:** `systemlink-admin 0.47.19`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.9.26`

### NI Containers

```text
alarmservice-routine-executor:0.22.86
alarmservice:0.22.86
alarmsui:0.32.63
assetservice:0.33.74
assetservicecdc:0.1.94
assetui:0.32.109
comments:0.31.55
dashboardsui:0.35.69
dataframeservice-nessie:1.27.58
dataframeservice:1.27.58
dremio-ee:25.2.23
dynamicformfields:0.16.45
executionsui:0.35.68
feedservice:0.24.47
feedsui:0.23.72
fileingestioncdc:0.8.69
filesui:0.36.74
grafana-auth-proxy:0.35.9
grafana-plugins:4.137.0
grafana-rbac-integrator:0.35.49
helium-dataservices-mongomigration:0.34.32
helium-dataservices:0.34.32
helium-fileingestionservices:1.25.58
helium-salt-master:1.32.19
helium-serviceregistry:0.40.13
helium-taghistoriandataretention:0.30.25
helium-taghistorianmongomigration:0.30.25
helium-taghistorianservices:0.30.25
helium-userservices:0.40.19
helium-webappservices:0.38.39
helium-webserver:0.47.30
jupyter-notebook-userpod:2.26.13
jupyterui:0.35.58
labmanagementui:0.26.95
landingpageui:0.35.62
locationmanagementui:0.5.66
locationservice:0.6.47
nbexec-execution-helpers:0.36.28
nbexec-notebook-runner:0.36.32
nbexecservice:0.36.72
nbparsingservice:0.35.23
ni-grafana:v11.6.4-729684112f3-ni
notification:0.35.45
repository:0.31.49
routineeventtrigger:0.36.43
routineexecutor:0.36.77
routinescheduletrigger:0.36.41
routineservice-v2:0.37.48
routineservice:0.37.48
routinesui:0.36.104
securityui:0.35.49
session-manager-service:0.41.39
sl-configurable-http-proxy:2.26.8
sl-k8s-hub:2.26.18
smtp:0.35.44
specificationmanagement:0.26.42
systemsmanagementservice:0.35.61
systemsstateservice:0.25.35
systemsstatesui:0.24.71
systemsui:0.36.137
tageventprocessor:0.34.32
tagsui:0.31.66
testinsightsui:0.35.90
testmonitorservice:0.44.76
userdata:0.35.38
userservice-setup:0.41.19
webapphostui:0.34.65
workitem:0.3.85
```

### 3rd Party Containers

```text
alpine/curl:8.17.0
alpine:3.23.3
apache/flink-kubernetes-operator:1.14.0
argoproj/argocli:v3.7.8-linux-amd64
argoproj/argoexec:v3.7.8-linux-amd64
argoproj/workflow-controller:v3.7.8-linux-amd64
bitnami-secure/containers/debian-12/elasticsearch:9.3.1-debian-12-r1
bitnami-secure/containers/debian-12/kibana:9.3.1-debian-12-r1
bitnami-secure/containers/debian-12/kubectl:1.35.2
bitnami-secure/containers/debian-12/rabbitmq:4.2.4-debian-12-r1
bitnami-secure/containers/debian-12/redis-cluster:8.6.1-debian-12-r0
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:2.5.0
pause:3.10
swaggerapi/swagger-ui:v5.32.0
zookeeper:3.9.4@sha256:dfa9ba46d14bd52bcb3c1dac3ba91f179cf4cebf7ee576e1c2df09c68fc1d30d
```
