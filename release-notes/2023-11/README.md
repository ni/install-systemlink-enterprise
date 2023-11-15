# SystemLink Enterprise release 2023-11 Release Notes

The 2023-11 release for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- Work Orders
    - The Work Order's expose a new privilege for scheduling test plans.
    - The Work Order service and UI is not included in the SystemLink Helm chart and associated privileges can be ignored.

## Helm Chart Breaking Changes

- `sl-jupyterhub`
    - Notebooks now support Python 3.11 in the JupyterHub development environment.

- `nbexecservice`
    - Notebooks now support Python 3.11 in notebooks executed by Routines.

- `testmonitorservice 0.16.37`
    - The update includes a new database schema migration to support future features. This migration adds a new column to the `results` table. The migration is expected to complete without downtime. Downgrading to prior versions of the TestMonitor service after updating to this version is not supported.
    - The migration requires permission for `ALTER TABLE`, which is an elevated privileges beyond the minimal set required by the service's normal operation. To use `ALTER TABLE` the PostgreSQL user must be the owner of the table or be a member of the role that owns the table. If your PostgreSQL user does not have the required permissions the updated pods job will fail to start. See below for new options to facilitate this requirement.

### Setting up an Elevated PostgreSQL User for Migration

- The database migrations is performed by a Kubernetes job that runs prior to TestMonitor pod deployment.
- The `testmonitorservice` Helm chart includes a new options to specify the PostgreSQL user for migration separately from the user for the service's normal operation. This allows the higher privileged user to be used during application updates exclusively.
- New secrets must be defined in Helm for this PostgreSQL user
    - `testmonitorservice.secrets.database.migrationConnectionString` and `testmonitorservice.secrets.database.migrationConnectionPassword`.
    - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-11/getting-started/templates/systemlink-secrets.yaml#L434)
- These secretes and a new connection string must be referenced in your values file.
    - `testmonitorservice.database.connectionString.migrationConnectionStringKey`, `testmonitorservice.database.connectionInfo.migrationUser`, and `testmonitorservice.database.connectionInfo.migrationPasswordKey` in the values file
    - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-11/getting-started/templates/systemlink-values.yaml#L287).

## RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
| ---------------- | ----------------------------------- | ---------------------------------- |
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | current                            |

Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed instructions on how to safely upgrade the version of the RabbitMQ dependency.

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2023-11](https://github.com/ni/install-systemlink-enterprise/tree/2023-11/release-notes/2023-11/closed-bugs-sle-2023-11.xlsx)

## Software Bill of Materials and Notices

[SBOM](link to SBOM)

[Notices](link to SBOM)

## Versions

**Top Level Helm Chart:** `systemlink 0.19.63`

**Admin Helm Chart:** `systemlink-admin 0.19.5`

### NI Containers

assetservice:0.5.53

assetui:0.4.79

comments:0.3.21

dashboardsui:0.7.52

dataframeservice:0.15.34

dremio-ee:24.1.2

executionsui:0.7.37

filesui:0.8.51

grafana-auth-proxy:20230404.4

grafana-plugins:3.9.1

grafana-rbac-integrator:0.7.25

helium-dataservices:0.6.22

helium-fileingestionservices:0.10.13

helium-salt-master:1.4.13

helium-serviceregistry:0.7.9

helium-taghistoriandataretention:0.2.15

helium-taghistorianservices:0.2.15

helium-userservices:0.7.15

helium-webappservices:0.6.7

helium-webserver:0.14.20

jupyter-notebook-userpod:2.0.9

jupyterui:0.7.41

landingpageui:0.7.44

license:0.7.30

licensesui:0.4.45

nbexec-execution-helpers:0.8.7

nbexec-notebook-runner:0.8.11

nbexecservice:0.8.33

nbparsingservice:0.7.11

ni-grafana:v9.5.12-61b4dd6cfd-ni

notification:0.7.19

repository:0.3.23

routineeventtrigger:0.8.12

routineexecutor:0.8.8

routinescheduletrigger:0.8.9

routineservice:0.9.10

routinesui:0.8.56

securityui:0.7.51

session-manager-service:0.8.18

sl-configurable-http-proxy:2.0.0

sl-k8s-hub:2.0.3

smtp:0.7.13

sysmgmtevent:0.8.18

systemsmanagementservice:0.7.22

systemsui:0.8.95

tagsui:0.3.46

testinsightsui:0.7.104

testmonitorservice:0.16.37

userdata:0.7.16

userservice-setup:0.8.4

### 3rd Party Containers

alpine:3.18.4

argoproj/argocli:v3.4.11-linux-amd64

argoproj/argoexec:v3.4.11-linux-amd64

argoproj/workflow-controller:v3.4.11-linux-amd64

bitnami/kubectl:1.28.2-debian-11-r16

bitnami/minio:2023.11.1-debian-11-r0

bitnami/mongodb:5.0.22-debian-11-r0

bitnami/rabbitmq:3.12.8-debian-11-r0

bitnami/redis-cluster:7.2.2-debian-11-r0

busybox:stable@sha256:023917ec6a886d0e8e15f28fb543515a5fcd8d938edb091e8147db4efed388ee

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.1.0

kiwigrid/k8s-sidecar:1.25.2

kube-scheduler:v1.26.9

pause:3.9

swaggerapi/swagger-ui:v5.9.1

zookeeper:3.8.1-temurin
