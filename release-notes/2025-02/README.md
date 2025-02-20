# SystemLink Enterprise 2025-02 Release Notes

The 2025-02 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## New Features and Behavior changes

- Enhanced the performance of queries against continuously written data tables.
- Preview your .pdf files.
- Filter the list of work orders you see based on their status or their metadata
  and save custom views. Navigate to **Operations** » **Work Orders** and click
  the summary tiles at the top of the page.
- Learn about the
  [performance metrics](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/performance-metrics-web-app-service.html)
  for the Web Application Service.
- Use Google Cloud Storage (GCS) to store your files.
- The Data Frame Service now limits the length of strings for table and column
  properties.
  - The limit for property keys is 256 characters.
  - The limit for values is 1000 characters.

## Upgrading from the 2025-01 to the 2025-02

- Dremio upgraded to 25.2.2. The update includes bug fixes, security updates,
  and added functionality for data table compaction.
  - You must reset Dremio for this upgrade. Refer to Resetting Dremio,
    [https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/resetting-dremio.html](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/resetting-dremio.html)
    in the SystemLink Enterprise User Manual. Resetting Dremio does not result
    in loss of data.
- Manual removal of the Data Frame Service `SupportsAppend_1` index may be
  required.
  - From `dataframeservice:0.8.x` (SLE 2023-05) through
    `dataframeservice:1.14.x` (SLE 2025-02) the `SupportsAppend_1` index in
    MongoDB was automatically dropped.
  - If upgrading directly from `dataframeservice:0.8.x` or earlier to
    `dataframeservice:1.14.x` or later you should manually drop the
    `SupportsAppend_1` index.
- Data table compaction uses Iceberg and introduces new
  `dataframeservice-nessie-\*` pods.
  - 81 total CPU cores allocated for executors and Iceberg by default. This is
    ~20 core _increase_ from previous defaults.
  - 352GB total memory allocated for executors and Iceberg by default. This a
    ~150GB _decrease_ from previous defaults.
- The resource configuration for Data Frame Service for pilots has been modified
  to support compaction.
  - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2025-02/getting-started/templates/pilot-sizing.yaml#L123)

## Helm Chart Breaking Changes

- `dataframeservice:1.14.61`
  - A new required secret `dataframeservice.secrets.nessie.bearerToken` must be
    provided.
  - [View this secret configuration](https://github.com/ni/install-systemlink-enterprise/blob/2025-02/getting-started/templates/systemlink-secrets.yaml#L248).

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

- [closed-bugs-sle-2025-02](https://github.com/ni/install-systemlink-enterprise/tree/2025-02/release-notes/2025-02/closed-bugs-sle-2025-02.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2025-02/release-notes/2025-02/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2025-02/release-notes/2025-02/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.34.50`

**Admin Helm Chart:** `systemlink-admin 0.34.5`

### NI Containers

```text
alarmservice:0.9.53

assetservice:0.20.23

assetui:0.19.71

comments:0.18.13

dashboardsui:0.22.47

dataframeservice:1.14.61

dataframeservice-nessie:1.14.61

dremio-ee:25.2.2

dynamicformfields:0.3.18

executionsui:0.22.54

feedservice:0.11.31

feedsui:0.10.51

filesui:0.23.65

grafana-auth-proxy:0.21.7

grafana-plugins:3.46.2

grafana-rbac-integrator:0.22.24

helium-dataservices:0.21.17

helium-dataservices-mongomigration:0.21.17

helium-fileingestionservices:1.12.7

helium-salt-master:1.19.3

helium-serviceregistry:0.25.14

helium-taghistoriandataretention:0.17.10

helium-taghistorianmongomigration:0.17.10

helium-taghistorianservices:0.17.10

helium-userservices:0.25.9

helium-webappservices:0.23.24

helium-webserver:0.32.18

jupyter-notebook-userpod:2.13.4

jupyterui:0.22.36

labmanagementui:0.13.87

landingpageui:0.22.44

nbexec-execution-helpers:0.23.4

nbexec-notebook-runner:0.23.7

nbexecservice:0.23.43

nbparsingservice:0.22.6

ni-grafana:v10.2.3-779719c237-ni

notification:0.22.20

repository:0.18.21

routineeventtrigger:0.23.13

routineexecutor:0.23.8

routinescheduletrigger:0.23.22

routineservice:0.24.27

routinesui:0.23.54

securityui:0.22.36

session-manager-service:0.26.19

sl-configurable-http-proxy:2.13.6

sl-k8s-hub:2.13.3

smtp:0.22.21

specificationmanagement:0.13.14

sysmgmtevent:0.23.1_12696826

systemsmanagementservice:0.22.22_12738540

systemsstateservice:0.12.28

systemsstatesui:0.11.59

systemsui:0.23.92

tagsui:0.18.48

testinsightsui:0.22.97

testmonitorservice:0.31.23

userdata:0.22.19

userservice-setup:0.26.3

webapphostui:0.21.52

workorder:0.13.23
```

### 3rd Party Containers

```text
alpine:3.20.3

argoproj/argocli:v3.6.2-linux-amd64

argoproj/argoexec:v3.6.2-linux-amd64

argoproj/workflow-controller:v3.6.2-linux-amd64

bitnami/kubectl:1.29.1-debian-11-r16

bitnami/kubectl:1.30.7

bitnami/mongodb:5.0.24-debian-11-r20

bitnami/rabbitmq:4.0.5-debian-12-r2

bitnami/redis-cluster:7.4.2-debian-12-r0

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.3.8

kiwigrid/k8s-sidecar:1.29.0

pause:3.9

swaggerapi/swagger-ui:v5.18.3

zookeeper:3.9.3
```
