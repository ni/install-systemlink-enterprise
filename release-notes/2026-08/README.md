# SystemLink Enterprise 2026-08 Release Notes

The 2026-08 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## Upgrading from SystemLink Enterprise 2026-07 to 2026-08

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

- Behavior change or new feature description

- Behavior change or new feature description

## Helm Chart Breaking Changes

- `webserver:0.53.19`
  - SystemLink no longer uses the `webserver.secrets.encryptionKey` Helm configuration value. This update is not a breaking change. Your existing configurations shall continue to work, but you can remove the unnecessary Helm value.
- `labmanagementui:0.31.51`
  - You can no longer use work items or a work order UI to assign a work item to the built-in Admin User account. You also cannot use this method to have the Admin User account own a work item. This update should be unnoticeable. If you configure a work item in this way, that work item may appear as invalid in the UI.

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

**Top Level Helm Chart:** `systemlink 0.52.72`

**Admin Helm Chart:** `systemlink-admin 0.52.13`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.14.15`

### NI Containers

```text
alarmservice-routine-executor:0.27.82
alarmservice:0.27.82
alarmsui:0.37.64
assetservice:0.38.135
assetservicecdc:0.6.73
assetui:0.37.78
comments:0.36.76
dashboardsui:0.40.64
dataframeservice-nessie:1.32.55
dataframeservice:1.32.55
dynamicformfields:0.21.53
executionsui:0.40.64
feedservice:0.29.38
feedsui:0.28.73
fileingestioncdc:0.13.52
filesui:0.41.71
grafana-auth-proxy:0.39.8
grafana-plugins:5.0.2
grafana-rbac-integrator:0.39.22
helium-dataservices-mongomigration:0.39.24
helium-dataservices:0.39.24
helium-fileingestionservices:1.30.36
helium-salt-master:1.37.15
helium-serviceregistry:0.46.23
helium-taghistoriandataretention:0.35.13
helium-taghistorianmongomigration:0.35.13
helium-taghistorianservices:0.35.13
helium-userservices:0.46.25
helium-webappservices:0.44.24
helium-webserver:0.53.53
jupyter-notebook-userpod:2.31.14
jupyterui:0.40.61
labmanagementui:0.31.83
landingpageui:0.40.64
locationmanagementui:0.10.67
locationservice:0.11.34
nbexec-execution-helpers:0.41.50
nbexec-notebook-runner:0.41.57
nbexecservice:0.41.108
nbparsingservice:0.40.21
ni-grafana:v12.3.1-6b8a586a158-ni
notification:0.40.37
repository:0.36.31
routineeventtrigger:0.41.57
routineexecutor:0.41.67
routinescheduletrigger:0.41.27
routineservice-v2:0.42.49
routineservice:0.42.49
routinesui:0.41.77
securityui:0.40.68
session-manager-service:0.47.32
sl-configurable-http-proxy:2.31.6
sl-k8s-hub:2.31.9
smtp:0.40.30
specificationmanagement:0.31.27
systemscdc:0.4.51
systemsmanagementservice:0.40.68
systemsstateservice:0.30.36
systemsstatesui:0.29.70
systemsui:0.41.107
tageventprocessor:0.39.24
tagsui:0.36.70
testinsightsui:0.40.103
testmonitorservice:0.49.88
userdata:0.40.32
userservice-setup:0.47.13
webapphostui:0.39.67
workitem:0.8.71
```

### 3rd Party Containers

```text
alpine:3.24.1
alpine/curl:8.21.0
apache/flink-kubernetes-operator:1.15.0
bitnami-secure/containers/debian-12/argo-workflow-cli:4.0.8-debian-12-r0
bitnami-secure/containers/debian-12/argo-workflow-controller:4.0.8-debian-12-r0
bitnami-secure/containers/debian-12/argo-workflow-exec:4.0.8-debian-12-r0
bitnami-secure/containers/debian-12/elasticsearch:9.5.0-debian-12-r0
bitnami-secure/containers/debian-12/kibana:9.5.0-debian-12-r0
bitnami-secure/containers/debian-12/kubectl:1.36.3
bitnami-secure/containers/debian-12/rabbitmq:4.2.6-debian-12-r0
bitnami-secure/containers/debian-12/redis-cluster:8.6.5-debian-12-r0@sha256:1722193bab9ccced97df635b781b78893a30ce65392c6529c0944491738beec6
dremio/busybox:1.37.0-r61-hardened
dremio/dremio-enterprise:26.1.10
dremio/zookeeper-iamguarded:3.9.5-hardened
jupyterhub/k8s-image-awaiter:4.3.3
kiwigrid/k8s-sidecar:2.10.1
pause:3.10.1
swaggerapi/swagger-ui:v5.32.13
```
