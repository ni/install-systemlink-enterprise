# SystemLink Enterprise release 2024-01 Release Notes

The 2024-01 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- TestMonitorService Breaking API Changes
    - Implement support for keywords and properties in Steps APIs. Bumped API Versions.

## Helm Chart Breaking Changes

- `systemlink`
    - The license service and the license UI have been removed from the product.
    - Settings related to "license:" in the Helm configuration are no longer required and can be removed from existing configurations.
    - End users should delete persistent volume claims datadir-{release}-license-mongodb-0,  datadir-{release}-license-mongodb-1, and datadir-{release}-license-mongodb-2 if they exist.

- `TestMonitorService`
    - The update includes a new database schema migration to support future features. This migration adds a new columns (keywords and properties) to the `steps` table. It is expected to complete without downtime. Downgrades to prior versions after updating to this version is not supported.
    - The migration requires permission to ALTER TABLE, which is an elevated privileges beyond the minimal set needed by the service. To ALTER TABLE the PostgreSQL user must be the owner of the table, or be a member of the role that owns the table. If your PostgreSQL user does not have the required permissions the updated pods will fail to start. See below for new options to facilitate this requirement:
        - TestMonitorService Breaking API Changes: Implement support for keywords and properties in Steps APIs. Bumped API Versions.
    - Database migrations are now managed by a Kubernetes Job that runs prior to deploy of the TestMonitor pods. This will allow rolling updates to TestMonitor to be peformed more consistently.

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
|------------------|-------------------------------------|------------------------------------|
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | current                            |

Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed instructions on how to safely upgrade the version of the RabbitMQ dependency.

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2024-01](https://github.com/ni/install-systemlink-enterprise/tree/2024-01/release-notes/2024-01/closed-bugs-sle-2024-01.xlsx)

## Software Bill of Materials and Notices

- [SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2024-01/release-notes/2024-01/sbom)
- [Notices](https://github.com/ni/install-systemlink-enterprise/tree/2024-01/release-notes/2024-01/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.21.51`

**Admin Helm Chart:** `systemlink-admin 0.21.4`

### NI Containers

assetservice:0.7.54

assetui:0.6.47

comments:0.5.17

dashboardsui:0.9.31

dataframeservice:1.1.43

dremio-ee:24.1.2

executionsui:0.9.28

filesui:0.10.43

grafana-auth-proxy:20230404.4

grafana-plugins:3.9.2

grafana-rbac-integrator:0.9.10

helium-dataservices:0.8.12

helium-fileingestionservices:0.12.11

helium-salt-master:1.6.9

helium-serviceregistry:0.9.16

helium-taghistoriandataretention:0.4.8

helium-taghistorianservices:0.4.8

helium-userservices:0.9.14

helium-webappservices:0.8.5

helium-webserver:0.16.14

jupyter-notebook-userpod:2.1.22

jupyterui:0.9.36

landingpageui:0.9.37

nbexec-execution-helpers:0.10.1

nbexec-notebook-runner:0.10.14

nbexecservice:0.10.14

nbparsingservice:0.9.15

ni-grafana:v9.5.12-61b4dd6cfd-ni

notification:0.9.16

repository:0.5.16

routineeventtrigger:0.10.12

routineexecutor:0.10.9

routinescheduletrigger:0.10.10

routineservice:0.11.9

routinesui:0.10.32

securityui:0.9.39

session-manager-service:0.10.11

sl-configurable-http-proxy:2.1.7

sl-k8s-hub:2.1.16

smtp:0.9.14

sysmgmtevent:0.10.14

systemsmanagementservice:0.9.22

systemsui:0.10.71

tagsui:0.5.28

testinsightsui:0.9.71

testmonitorservice:0.18.16

userdata:0.9.13

userservice-setup:0.10.2

### 3rd Party Containers

alpine:3.19.0

argoproj/argocli:v3.4.11-linux-amd64

argoproj/argoexec:v3.4.11-linux-amd64

argoproj/workflow-controller:v3.4.11-linux-amd64

bitnami/kubectl:1.28.2-debian-11-r16

bitnami/minio:2023.12.23-debian-11-r3

bitnami/mongodb:5.0.23-debian-11-r5

bitnami/rabbitmq:3.12.12-debian-11-r0

bitnami/redis-cluster:7.2.3-debian-11-r2

busybox:stable@sha256:023917ec6a886d0e8e15f28fb543515a5fcd8d938edb091e8147db4efed388ee

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.1.0

kiwigrid/k8s-sidecar:1.25.3

kube-scheduler:v1.26.9

pause:3.9

swaggerapi/swagger-ui:v5.11.0

zookeeper:3.8.2-temurin
