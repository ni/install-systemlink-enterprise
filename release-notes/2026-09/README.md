# SystemLink Enterprise 2026-09 Release Notes

The 2026-09 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## Upgrading from SystemLink Enterprise 2026-08 to 2026-09

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

**Top Level Helm Chart:** `systemlink 0.53.57`

**Admin Helm Chart:** `systemlink-admin 0.53.11`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.15.19`

### NI Containers

```text
alarmservice-routine-executor:0.28.67
alarmservice:0.28.67
alarmsui:0.38.54
assetservice:0.39.93
assetservicecdc:0.7.45
assetui:0.38.56
comments:0.37.60
dashboardsui:0.41.47
dataframeservice-nessie:1.33.43
dataframeservice:1.33.43
dynamicformfields:0.22.29
executionsui:0.41.51
feedservice:0.30.30
feedsui:0.29.54
fileingestioncdc:0.14.29
filesui:0.42.59
grafana-auth-proxy:0.40.7
grafana-plugins:5.2.0
grafana-rbac-integrator:0.40.12
helium-dataservices-mongomigration:0.40.19
helium-dataservices:0.40.19
helium-fileingestionservices:1.31.9
helium-salt-master:1.38.6
helium-serviceregistry:0.47.12
helium-taghistoriandataretention:0.36.10
helium-taghistorianmongomigration:0.36.10
helium-taghistorianservices:0.36.10
helium-userservices:0.47.8
helium-webappservices:0.45.20
helium-webserver:0.54.32
jupyter-notebook-userpod:2.32.8
jupyterui:0.41.46
labmanagementui:0.32.57-21654883
landingpageui:0.41.53
locationmanagementui:0.11.51
locationservice:0.12.25
nbexec-execution-helpers:0.42.42
nbexec-notebook-runner:0.42.46
nbexecservice:0.42.95
nbparsingservice:0.41.16
ni-grafana:v12.3.1-6b8a586a158-ni
notification:0.41.27
repository:0.37.28
routineeventtrigger:0.42.54
routineexecutor:0.42.67
routinescheduletrigger:0.42.25
routineservice-v2:0.43.37
routineservice:0.43.37
routinesui:0.42.52
securityui:0.41.57
session-manager-service:0.48.21
sl-configurable-http-proxy:2.32.2
sl-k8s-hub:2.32.1
smtp:0.41.26
specificationmanagement:0.32.29
systemscdc:0.5.23
systemsmanagementservice:0.41.59
systemsstateservice:0.31.30
systemsstatesui:0.30.50
systemsui:0.42.84
tageventprocessor:0.40.19
tagsui:0.37.48
tdmreader:0.2.40
testinsightsui:0.41.90
testmonitorservice:0.50.79
userdata:0.41.25
userservice-setup:0.48.9
webapphostui:0.40.51
workitem:0.9.64
```

### 3rd Party Containers

```text
alpine:3.24.1
bitnami-secure/containers/debian-12/argo-workflow-cli:4.1.2-debian-12-r1
bitnami-secure/containers/debian-12/argo-workflow-controller:4.1.2-debian-12-r1
bitnami-secure/containers/debian-12/argo-workflow-exec:4.1.2-debian-12-r2
bitnami-secure/containers/debian-12/kubectl:1.37.0
bitnami-secure/containers/debian-12/rabbitmq:4.2.6-debian-12-r0
bitnami-secure/containers/debian-12/redis-cluster:8.10.1-debian-12-r0
dremio/busybox:1.37.0-r61-hardened
dremio/dremio-enterprise:26.1.11
dremio/zookeeper-iamguarded:3.9.5-hardened
jupyterhub/k8s-image-awaiter:4.3.3
kiwigrid/k8s-sidecar:2.11.2
pause:3.10.1
swaggerapi/swagger-ui:v5.32.15
```
