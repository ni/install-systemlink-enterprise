# SystemLink Enterprise 2026-01 Release Notes

The 2026-01 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## New Features and Behavior changes

- Behavior change or new feature description

- Behavior change or new feature description

## Helm Chart Breaking Changes

- `global.mongodb.install: true` no longer supported. Services must connect to a seperately deployed mongodb instance by configuring `global.secrets.mongodb.connection_string`.
  - If your configuration is already set to the default value of `mongodb.install: false`, no further action is required.
  - Any services using `mongodb.install: true` will need to connect to an external MongoDB by setting `global.secrets.mongodb.connection_string`.
  - You may remove the `mongodb.*` configurations (do not remove `secrets.mongo.*`). 

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

[SystemLink Enterprise 2025-12 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2026-01/release-notes/2026-01/closed-bugs-sle-2026-01.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2026-01/release-notes/2026-01/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2026-01/release-notes/2026-01/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.45.111`

**Admin Helm Chart:** `systemlink-admin 0.45.5`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.7.20`

### NI Containers

```text
alarmservice-routine-executor:0.20.123
alarmservice:0.20.123
alarmsui:0.30.71
assetservice:0.31.121
assetui:0.30.130
comments:0.29.69
dashboardsui:0.33.73
dataframeservice-nessie:1.25.80
dataframeservice:1.25.80
dremio-ee:25.2.21
dynamicformfields:0.14.74
executionsui:0.33.70
feedservice:0.22.57
feedsui:0.21.77
fileingestioncdc:0.6.84
filesui:0.34.72
grafana-auth-proxy:0.33.78
grafana-plugins:4.113.0
grafana-rbac-integrator:0.33.106
helium-dataservices-mongomigration:0.32.48
helium-dataservices:0.32.48
helium-fileingestionservices:1.23.64
helium-salt-master:1.30.31
helium-serviceregistry:0.38.40
helium-taghistoriandataretention:0.28.43
helium-taghistorianmongomigration:0.28.43
helium-taghistorianservices:0.28.43
helium-userservices:0.38.36
helium-webappservices:0.36.55
helium-webserver:0.45.46
jupyter-notebook-userpod:2.24.27
jupyterui:0.33.57
labmanagementui:0.24.105
landingpageui:0.33.62
locationmanagementui:0.3.66
locationservice:0.4.45
nbexec-execution-helpers:0.34.50
nbexec-notebook-runner:0.34.55
nbexecservice:0.34.100
nbparsingservice:0.33.25
ni-grafana:v11.6.4-f892567bfa-ni
notification:0.33.60
repository:0.29.55
routineeventtrigger:0.34.52
routineexecutor:0.34.115
routinescheduletrigger:0.34.59
routineservice-v2:0.35.74
routineservice:0.35.74
routinesui:0.34.99
securityui:0.33.61
session-manager-service:0.39.57
sl-configurable-http-proxy:2.24.10
sl-k8s-hub:2.24.23
smtp:0.33.58
specificationmanagement:0.24.56
systemsmanagementservice:0.33.43
systemsstateservice:0.23.40-17345325
systemsstatesui:0.22.69
systemsui:0.34.129
tageventprocessor:0.32.48
tagsui:0.29.63
testinsightsui:0.33.114
testmonitorservice:0.42.85
userdata:0.33.61
userservice-setup:0.39.30
webapphostui:0.32.67
workitem:0.1.119
```

### 3rd Party Containers

```text
alpine:3.23.2
argoproj/argocli:v3.6.10-linux-amd64
argoproj/argoexec:v3.6.10-linux-amd64
argoproj/workflow-controller:v3.6.10-linux-amd64
bitnami-secure/containers/debian-12/kubectl:1.35.0
bitnami-secure/containers/debian-12/rabbitmq:4.2.2-debian-12-r1
bitnami-secure/containers/debian-12/redis-cluster:8.4.0-debian-12-r3
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:2.3.0
pause:3.10
swaggerapi/swagger-ui:v5.31.0
zookeeper:3.9.4@sha256:b87f5ea0cdc73d71c74875277ca2e862f7abb3c0bfa365bd818db71eef870917
```
