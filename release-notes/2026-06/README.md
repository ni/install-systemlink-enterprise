# SystemLink Enterprise 2026-06 Release Notes

The 2026-06 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## New Features and Behavior changes

- Systems
  - New breaking change for the manage-systems-keys route. Due to performance and security considerations, this route now caps requests at 1,000 keys.
  - Performing an action, such as deleting a key, on an approved key from a different workspace now verifies the user privileges in the current workspace of the key. The action can only proceed if the user has ‘delete’ permissions in that workspace.

## Helm Chart Breaking Changes

- jupyterhub/k8s-image-awaiter:4.3.3
  - The base image for running notebooks now uses Python 3.13. NI recommends reviewing your notebooks for compatibility with this new version of Python.
  - The VERIFY_X509_STRICT change in Python 3.13 enforces stricter certificate validation. This change also rejects root CAs that lack a keyUsage extension. There is a toggle for enforcement of this requirement. The toggle is a temporary addition that NI plans to remove in a future release. NI recommends regenerating any non‑compliant root CAs as soon as possible.
  - After regenerating a CA, validate that CA by switching the toggle off through the following Helm value: `sl-jupyterhub.jupyterhub.singleuser.extraEnv.DISABLE_VERIFY_X509_STRICT = false`.
- nbexecservice:0.39.81
  - The base image for running notebooks now uses Python 3.13. NI recommends reviewing your notebooks for compatibility with this new version of Python.
  - The VERIFY_X509_STRICT change in Python 3.13 enforces stricter certificate validation. This change also rejects root CAs that lack a keyUsage extension. There is a toggle for enforcement of this requirement. The toggle is a temporary addition that NI plans to remove in a future release. NI recommends regenerating any non‑compliant root CAs as soon as possible.
  - After regenerating a CA, validate that CA by switching the toggle off through the following Helm value: `nbexecservice.argo.workflow.disableVerifyX509Strict = false`.

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

[SystemLink Enterprise 2026-06 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2026-06/release-notes/2026-06/closed-bugs-sle-2026-06.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2026-06/release-notes/2026-06/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2026-06/release-notes/2026-06/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.50.87`

**Admin Helm Chart:** `systemlink-admin 0.50.16`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.12.25`

### NI Containers

```text
alarmservice:0.25.69
alarmservice-routine-executor:0.25.69
alarmsui:0.35.54
assetservice:0.36.115
assetservicecdc:0.4.67
assetui:0.35.73
comments:0.34.65
dashboardsui:0.38.58
dataframeservice:1.30.53
dataframeservice-nessie:1.30.53
dynamicformfields:0.19.38
executionsui:0.38.54
feedservice:0.27.34
feedsui:0.26.54
fileingestioncdc:0.11.60
filesui:0.39.69
grafana-auth-proxy:0.37.20
grafana-plugins:5.0.1
grafana-rbac-integrator:0.37.24
helium-dataservices:0.37.31
helium-dataservices-mongomigration:0.37.31
helium-fileingestionservices:1.28.44
helium-salt-master:1.35.10
helium-serviceregistry:0.44.26
helium-taghistoriandataretention:0.33.17
helium-taghistorianmongomigration:0.33.17
helium-taghistorianservices:0.33.17
helium-userservices:0.44.34
helium-webappservices:0.42.25
helium-webserver:0.51.36
jupyter-notebook-userpod:2.29.19
jupyterui:0.38.54
labmanagementui:0.29.100
landingpageui:0.38.51
locationmanagementui:0.8.65-19819327
locationservice:0.9.30
nbexec-execution-helpers:0.39.46
nbexec-notebook-runner:0.39.65
nbexecservice:0.39.81
nbparsingservice:0.38.10
ni-grafana:v12.3.1-ee02ef3d103-ni
notification:0.38.31
repository:0.34.29
routineeventtrigger:0.39.40
routineexecutor:0.39.66
routinescheduletrigger:0.39.26
routineservice:0.40.40
routineservice-v2:0.40.40
routinesui:0.39.80
securityui:0.38.52
session-manager-service:0.45.25
sl-configurable-http-proxy:2.29.7
sl-k8s-hub:2.29.12
smtp:0.38.23
specificationmanagement:0.29.23
systemscdc:0.2.42
systemsmanagementservice:0.38.59
systemsstateservice:0.28.29-19802755
systemsstatesui:0.27.59
systemsui:0.39.95
tageventprocessor:0.37.31
tagsui:0.34.63
testinsightsui:0.38.57
testmonitorservice:0.47.55
userdata:0.38.31
userservice-setup:0.45.13
webapphostui:0.37.53
workitem:0.6.72
```

### 3rd Party Containers

```text
alpine/curl:8.19.0
alpine:3.23.4
apache/flink-kubernetes-operator:1.15.0
bitnami-secure/containers/debian-12/argo-workflow-cli:4.0.5-debian-12-r2
bitnami-secure/containers/debian-12/argo-workflow-controller:4.0.5-debian-12-r2
bitnami-secure/containers/debian-12/argo-workflow-exec:4.0.5-debian-12-r5
bitnami-secure/containers/debian-12/elasticsearch:9.4.1-debian-12-r6
bitnami-secure/containers/debian-12/kibana:9.4.2-debian-12-r0
bitnami-secure/containers/debian-12/kubectl:1.36.1
bitnami-secure/containers/debian-12/rabbitmq:4.2.6-debian-12-r0
bitnami-secure/containers/debian-12/redis-cluster:8.6.3-debian-12-r3
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
dremio/dremio-enterprise:26.1.8
jupyterhub/k8s-image-awaiter:4.3.3
kiwigrid/k8s-sidecar:2.7.3
pause:3.10.1
swaggerapi/swagger-ui:v5.32.6
zookeeper:3.9.5@sha256:e12cace7b5fcfaadf17d6532e83fd8fe71fdf40ab73f22370ccc314bcf7a38b4
```
