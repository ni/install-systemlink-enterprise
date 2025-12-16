# SystemLink Enterprise release 2025-12 Release Notes

The 2025-12 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## New Features and Behavior changes

- Register assets and systems using QR codes with mobile devices. For more
  information, refer to
  [Adding Dynamic QR Codes to a Dashboard](https://ni.com/docs/en-US/bundle/systemlink-enterprise/page/add-dynamic-qr.html).
- Create and edit specifications from SystemLink. For more information, refer to
  [Creating and Editing Product Specifications through SystemLink](https://ni.com/docs/en-US/bundle/systemlink-enterprise/page/create-and-edit-spec-for-product.html).
- Specify a Location for your Systems.
- `dataframeservice:1.24.*`
  - Upgraded the MongoDB driver from v2.30.0 to v3.5.0 and the MongoDB LINQ
    provider from V2 to V3.
  - LINQ V3.X no longer supports accessing fields by numeric indices (e.g.,
    `name[0] == @0`).
  - Use operators such as `Contains` or `Any` instead (e.g.,
    `name.Contains(@0)`).
- `notification:0.32.*`
  - Default values for `throttlingRateLimit` and `throttlingIntervalInSeconds`
    have been reduced to prevent sending large volumes of emails.
  - For higher throughput (e.g., automation scenarios), consider:
    - Increasing these values.
    - Scaling the number of notification service replicas.
    - Using different API keys per request.
- `helium-userservices:0.37.*`
  - The _Systems Maintainer_ and _Data Maintainer_ roles roles no longer include
    `notification:Create` and `notification:Apply`. This restricts the number of
    users that can send arbitrary emails through the notification service.
  - To grant notification privileges:
    - Create custom roles as needed
    - Assign notification tasks to automated processes (e.g., notebooks or
      routines)
    - Where possible, restrict clients to `notification:Apply` and use
      pre-created templates and address groups
- Comment and alarm routine notification functionality remains unchanged.
  Managed Systems still use the _Automated agent_ role, which is also unchanged.

## Helm Chart Breaking Changes

No breaking changes were introduced in this release.

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

[SystemLink Enterprise 2025-12 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2025-12/release-notes/2025-12/closed-bugs-sle-2025-12.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2025-12/release-notes/2025-12/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2025-12/release-notes/2025-12/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.44.55`

**Admin Helm Chart:** `systemlink-admin 0.44.10`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.6.8`

### NI Containers

```text
alarmservice:0.19.66
alarmservice-routine-executor:0.19.66
alarmsui:0.29.46
assetservice:0.30.54
assetui:0.29.85
comments:0.28.33
dashboardsui:0.32.49
dataframeservice:1.24.44
dataframeservice-nessie:1.24.44
dremio-ee:25.2.19
dynamicformfields:0.13.39
executionsui:0.32.48
feedservice:0.21.32
feedsui:0.20.63
fileingestioncdc:0.5.37
filesui:0.33.61
grafana-auth-proxy:0.32.81
grafana-plugins:4.82.1
grafana-rbac-integrator:0.32.88
helium-dataservices:0.31.14
helium-dataservices-mongomigration:0.31.14
helium-fileingestionservices:1.22.36
helium-salt-master:1.29.13
helium-serviceregistry:0.37.5
helium-taghistoriandataretention:0.27.10
helium-taghistorianmongomigration:0.27.10
helium-taghistorianservices:0.27.10
helium-userservices:0.37.10
helium-webappservices:0.35.27
helium-webserver:0.44.27
jupyter-notebook-userpod:2.23.12
jupyterui:0.32.49
labmanagementui:0.23.35
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
routineexecutor:0.33.51
routinescheduletrigger:0.33.27
routineservice:0.34.35
routineservice-v2:0.34.35
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
testinsightsui:0.32.70
testmonitorservice:0.41.39
userdata:0.32.33
userservice-setup:0.38.13
webapphostui:0.31.54
workorder:0.23.60
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
bitnami-secure/containers/debian-12/rabbitmq:4.2.1-debian-12-r1
bitnami-secure/containers/debian-12/redis-cluster:8.2.3-debian-12-r0
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:2.1.2
pause:3.10
swaggerapi/swagger-ui:v5.30.2
zookeeper:3.9.4@sha256:b87f5ea0cdc73d71c74875277ca2e862f7abb3c0bfa365bd818db71eef870917
```
