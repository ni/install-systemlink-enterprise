# SystemLink Enterprise 2025-06 Release Notes

The 2025-06 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## New Features and Behavior Changes

- Use Jupyter Notebook to schedule automatically test plans.
- Use Jupyter Notebook to automate operations on test plans.
- View fixture details from the Scheduling Assistant page.
- When either installing software or applying a system state, you can enable the
  Automatically Restart option. SystemLink now remembers this selection when the
  action is next taken again.
- `helium-userservices:0.30.9_14182770`
  - Whitelisted operations now implement rate limiting in the User Service and
    Auth Service. This rate limit is not directly user configurable. to accept
    additional traffic and reduce the likelihood of throttling, Increase the
    number of replicas for `userservices.`
- `sysmgmtevent`
  - This chart has been removed from SystemLink Enterprise because the
    functionality was replaced by RabbitMQ. You can manually delete the
    `nisysmgmtevent` MongoDB collection.

## Helm Chart Breaking Changes

- `dataframeservice:1.18.56`
  - Default value of `storage.s3.bucket` was changed from `nidataframe` to
    `systemlink-dataframe`.
  - For an example of this configuration, refer to
    [`systemlink-values.yaml`](https://github.com/ni/install-systemlink-enterprise/blob/main/getting-started/templates/systemlink-values.yaml#L716).

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the
[RabbitMQ](https://www.rabbitmq.com/) message bus. Because you cannot skip minor
versions when updating RabbitMQ, you may not be able to upgrade directly between
versions of SystemLink Enterprise. The following table displays the version of
the RabbitMQ dependency for each released version of SystemLink Enterprise. For
detailed update instructions, refer to
[Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html).

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
| ---------------- | ----------------------------------- | ---------------------------------- |
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | 0.29.56                            |
| 4.0.x            | 0.30.74                             | current                            |

## Bugs Fixed

[SystemLink Enterprise 2025-06 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2025-06/release-notes/2025-06/closed-bugs-sle-2025-06.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2025-06/release-notes/2025-06/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2025-06/release-notes/2025-06/notices)

## Versions

**Top Level Helm Chart:** `0.38.59`

**Admin Helm Chart:** `0.38.6`

### NI Containers

```text
alarmservice-routine-executor:0.13.55
alarmservice:0.13.55
alarmsui:0.23.37
assetservice:0.24.49
assetui:0.23.58
comments:0.22.31
dashboardsui:0.26.34
dataframeservice-nessie:1.18.56
dataframeservice:1.18.56
dremio-ee:25.2.12
dynamicformfields:0.7.36
executionsui:0.26.30
feedservice:0.15.31
feedsui:0.14.36
filesui:0.27.54
grafana-auth-proxy:0.21.7
grafana-plugins:3.93.1
grafana-rbac-integrator:0.26.39
helium-dataservices-mongomigration:0.25.17
helium-dataservices:0.25.17
helium-fileingestionservices:1.16.17
helium-salt-master:1.23.21_14191912
helium-serviceregistry:0.30.10
helium-taghistoriandataretention:0.21.12
helium-taghistorianmongomigration:0.21.12
helium-taghistorianservices:0.21.12
helium-userservices:0.30.9_14182770
helium-webappservices:0.28.19
helium-webserver:0.37.15
jupyter-notebook-userpod:2.17.6
jupyterui:0.26.32
labmanagementui:0.17.97
landingpageui:0.26.30
nbexec-execution-helpers:0.27.9
nbexec-notebook-runner:0.27.11
nbexecservice:0.27.48
nbparsingservice:0.26.13
ni-grafana:v10.2.3-ca8100c6aa-ni
notification:0.26.31
repository:0.22.25
routineeventtrigger:0.27.27
routineexecutor:0.27.20
routinescheduletrigger:0.27.25
routineservice-v2:0.28.27
routineservice:0.28.27
routinesui:0.27.37
securityui:0.26.24
session-manager-service:0.31.23
sl-configurable-http-proxy:2.17.9
sl-k8s-hub:2.17.9
smtp:0.26.28
specificationmanagement:0.17.27
systemsmanagementservice:0.26.28
systemsstateservice:0.16.23
systemsstatesui:0.15.43
systemsui:0.27.68
tageventprocessor:0.25.17
tagsui:0.22.33
testinsightsui:0.26.55
testmonitorservice:0.35.31
userdata:0.26.26
userservice-setup:0.31.9
webapphostui:0.25.28
workorder:0.17.53
```

### 3rd Party Containers

```text
alpine:3.21.3
argoproj/argocli:v3.6.7-linux-amd64
argoproj/argoexec:v3.6.7-linux-amd64
argoproj/workflow-controller:v3.6.7-linux-amd64
bitnami/kubectl:1.33.1
bitnami/mongodb:5.0.24@sha256:e56a75744316419cd150400ccd8d985c6b0762f03c7a3b015f233524d043731f
bitnami/rabbitmq:4.1.0-debian-12-r1
bitnami/redis-cluster:8.0.2-debian-12-r1
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:1.30.3
pause:3.10
swaggerapi/swagger-ui:v5.22.0
zookeeper:3.9.3
```
