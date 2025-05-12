# SystemLink Enterprise 2025-04 Release Notes

The 2025-04 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## New Features and Behavior changes

- Manage alarm instances by navigating to **Overview** » **Alarms**.
- Added support for virtual systems. Use a virtual system to manually or
  programmatically manage any data and assets associated with that virtual
  system.
- Schedule a test plan to a fixture under a system. A lab might refer to a
  fixture as a slot, a socket, or a channel.
- Preview common plain text file formats.
- Save statistical insights from the analysis of parametric data in a data
  space.
- Retry and run new notebook executions from the Executions page.
- Filter files by file ID.
- Configure file properties to display in the File Details page.
- Added support for results and steps in the Test Monitor Python library.
- Dynamic form fields support tables.
- DataFrame Service
  - Attempting to create a data table with more than 2500 columns returns a
    `400 Bad Request` error. This update does not affect existing data tables.
    This limit can be configured by setting the Helm value
    `dataframeservice.ingestion.maxColumnCount`.

## Helm Chart Breaking Changes

- Reduced the default value for `autoscaling.maxReplicas` from 10 to 4 across
  all UI containers. This better reflects the scaling requirements of these
  containers and prevents a badly configured container from consuming too many
  resources. Affected containers include:
  - `alarmsui`
  - `assetui`
  - `dashboardui`
  - `executionsui`
  - `feedsui`
  - `filesui`
  - `jupyterui`
  - `labmanagementui`
  - `landingpageui`
  - `routinesui`
  - `systemstatesui`
  - `systemsui`
  - `tagsui`
  - `testinsightsui`
  - `webapphostui`
- `dataframeservice:1.16.43`
  - S3 settings are now under `storage`. The previous S3 settings under
    `dataframeservice` will continue to work, but are now deprecated. It is
    recommended to edit the configurations files.
    - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2025-04/getting-started/templates/systemlink-values.yaml#L699)
  - Added a limit for the number of columns a data table may have, which
    defaults to 2500. You can change this limit by setting the
    `dataframeservice.ingestion.maxColumnCount` Helm value. As part of this
    change, the default value of `dataframeservice.sldremio.extraStartParams`
    has changed to set
    `dremio.debug.sysopt.store.plugin.max_metadata_leaf_columns` and
    `dremio.debug.sysopt.store.plugin.max_leaf_columns_scanned` to 6400. There
    is no adverse effect to leaving the values in `extraStartParams` at the
    previous value of 2600 if the default `maxColumnCount` of 2500 is used.
    Increasing the max column count beyond 2595 requires that you increase the
    `extraStartParam` value.
- `nbexecservice:0.25.43`
  - S3 settings are now under `storage`. The previous S3 settings under
    `nbexecservice` will continue to work, but are now deprecated. It is
    recommended to edit the configurations files.
    - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2025-04/getting-started/templates/systemlink-values.yaml#L1048)
- `fileingestion:1.14.25`
  - S3 settings are now under `storage`. The previous S3 settings under
    `fileingestion` will continue to work, but are now deprecated. It is
    recommended to edit the configurations files.
    - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2025-04/getting-started/templates/systemlink-values.yaml#L920)
- `tags:0.23.25`
  - Tag paths and string values now have a limit of 1024 characters. This new
    limit does not affect existing tags. However, creating or updating tags
    paths or string values greater than 1024 characters will result in
    validation errors. You can configure this limit by setting the Helm values
    `tags.tagLimits.pathLength` and `tags.tagLimits.stringValueLength.`
  - This update includes a new required whitelisted API key secret. This secret
    is used to retrieve routine information for executing Tag Alarm routines.
  - [View this secret configuration](https://github.com/ni/install-systemlink-enterprise/blob/2025-04/getting-started/templates/systemlink-secrets.yaml#L170)

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

- [SystemLink Enterprise 2025-04 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2025-04/release-notes/2025-04/closed-bugs-sle-2025-04.xlsx)

## Software Bill of Materials and Notices

- [SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2025-04/release-notes/2025-04/sbom)
- [Notices](https://github.com/ni/install-systemlink-enterprise/tree/2025-04/release-notes/2025-04/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.36.63`

**Admin Helm Chart:** `systemlink-admin 0.36.8`

### NI Containers

```text
alarmservice:0.11.50

alarmsui:0.21.38

assetservice:0.22.48

assetui:0.21.70

comments:0.20.16

dashboardsui:0.24.37

dataframeservice-nessie:1.16.43

dataframeservice:1.16.43

dremio-ee:25.2.2

dynamicformfields:0.5.45

executionsui:0.24.45

feedservice:0.13.41

feedsui:0.12.40

filesui:0.25.36

grafana-auth-proxy:0.21.7

grafana-plugins:3.48.1

grafana-rbac-integrator:0.24.16

helium-dataservices-mongomigration:0.23.25

helium-dataservices:0.23.25

helium-fileingestionservices:1.14.25

helium-salt-master:1.21.11

helium-serviceregistry:0.28.7

helium-taghistoriandataretention:0.19.14

helium-taghistorianmongomigration:0.19.14

helium-taghistorianservices:0.19.14

helium-userservices:0.28.9

helium-webappservices:0.26.26

helium-webserver:0.35.9

jupyter-notebook-userpod:2.15.7

jupyterui:0.24.33

labmanagementui:0.15.97

landingpageui:0.24.35

nbexec-execution-helpers:0.25.21

nbexec-notebook-runner:0.25.15

nbexecservice:0.25.45

nbparsingservice:0.24.17

ni-grafana:v10.2.3-ca8100c6aa-ni

notification:0.24.22

repository:0.20.10

routineeventtrigger:0.25.15

routineexecutor:0.25.15

routinescheduletrigger:0.25.15

routineservice:0.26.28

routinesui:0.25.60

securityui:0.24.33

session-manager-service:0.29.7

sl-configurable-http-proxy:2.15.5

sl-k8s-hub:2.15.7

smtp:0.24.18

specificationmanagement:0.15.9

sysmgmtevent:0.25.8

systemsmanagementservice:0.24.13

systemsstateservice:0.14.11

systemsstatesui:0.13.44

systemsui:0.25.80


tageventprocessor:0.23.25

tagsui:0.20.38

testinsightsui:0.24.81

testmonitorservice:0.33.17

userdata:0.24.5

userservice-setup:0.29.9

webapphostui:0.23.37

workorder:0.15.22
```

### 3rd Party Containers

```text
alpine:3.21.3

argoproj/argocli:v3.6.4-linux-amd64

argoproj/argoexec:v3.6.4-linux-amd64

argoproj/workflow-controller:v3.6.4-linux-amd64

bitnami/kubectl:1.32.3

bitnami/mongodb:5.0.24@sha256:e56a75744316419cd150400ccd8d985c6b0762f03c7a3b015f233524d043731f

bitnami/rabbitmq:4.0.8-debian-12-r0

bitnami/redis-cluster:7.4.2-debian-12-r6

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:4.1.0

kiwigrid/k8s-sidecar:1.30.3

pause:3.10

swaggerapi/swagger-ui:v5.20.7

zookeeper:3.9.3
```
