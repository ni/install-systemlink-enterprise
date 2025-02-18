# SystemLink Enterprise 2025-02 Release Notes

The 2025-02 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## Upgrading from the 2025-01 to the 2025-02

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

- `dataframeservice:1.14.61`
  - The service now limits the length of strings that appear in table and column "properties" dictionaries. The limit for property keys is 256 characters. The limit for values is 1000 characters.
  - DataFrame Service creates an index called "SupportsAppend_1" in MongoDB. Starting with version 0.8, the DataFrame Service automatically dropped the "SupportsAppend_1" index. Starting with version 1.14.52, the DataFrame Service no longer drop the"SupportsAppend_1" index. When upgrading directly from version 0.8 or earlier to version 1.14.52 or later, we recommend that you drop the "SupportsAppend_1" index from the "tables" collection of the "nidataframe" database manually.
  - Dremio was upgraded to 25.2.2. The update includes fixes for critical vulnerabilities and added functionality for data table compaction. You must reset Dremio for this upgrade. Refer to Resetting Dremio, [https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/resetting-dremio.html](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/resetting-dremio.html) in the SystemLink Enterprise User Manual. Resetting Dremio does not result in loss of data.
  - Data table compaction is enabled by default. Data table compaction uses Iceberg and introduces a new replica set of pods associated with the DataFrame Service "dataframeservice-nessie-*". The replica set of pods affects the resource footprint of Dremio, The default total executor sizing increases from ~60 CPU/~500GB memory to ~80 CPU/~350GB memory. Refer to the following PRfor exact numbers: [https://ni.visualstudio.com/DevCentral/_git/Skyline/commit/c1055fea5d38c33c7c4c513e0295e7f5e6a1bc95?refName=refs%2Fheads%2Fmaster](https://ni.visualstudio.com/DevCentral/_git/Skyline/commit/c1055fea5d38c33c7c4c513e0295e7f5e6a1bc95?refName=refs%2Fheads%2Fmaster)
    - [DataFrame Service: Update pilot config for the compaction feature #232](https://github.com/ni/install-systemlink-enterprise/pull/232/files)

## Helm Chart Breaking Changes

- `dataframeservice:1.14.61`
  - New required secret `dataframeservice.secrets.nessie.bearerToken`
    - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2025-02/getting-started/templates/systemlink-values.yaml#L735)
    - [View this secret configuration](https://github.com/ni/install-systemlink-enterprise/blob/2025-02/getting-started/templates/systemlink-secrets.yaml#L252)
  - Dremio was upgraded and it will be necessary to be reset after the upgrade.
    - Follow the instructions in [Resetting Dremio](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/resetting-dremio.html)

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
| 3.13.x           | 0.25.x                              | current                            |

## Bugs Fixed

- [closed-bugs-sle-2025-02](https://github.com/ni/install-systemlink-enterprise/tree/2025-02/release-notes/2025-02/closed-bugs-sle-2025-02.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2025-02/release-notes/2025-02/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2025-02/release-notes/2025-02/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.34.45`

**Admin Helm Chart:** `systemlink-admin 0.34.5`

### NI Containers

```text
alarmservice:0.9.53

assetservice:0.20.23

assetui:0.19.70

comments:0.18.13

dashboardsui:0.22.47

dataframeservice-nessie:1.14.61

dataframeservice:1.14.61

dremio-ee:25.2.2

dynamicformfields:0.3.18

executionsui:0.22.54

feedservice:0.11.30

feedsui:0.10.51

filesui:0.23.65

grafana-auth-proxy:0.21.7

grafana-plugins:3.46.2

grafana-rbac-integrator:0.22.24

helium-dataservices-mongomigration:0.21.17

helium-dataservices:0.21.17

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

nbexecservice:0.23.42

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
