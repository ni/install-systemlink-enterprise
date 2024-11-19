# SystemLink Enterprise release 2024-11 Release Notes

The 2024-11 release for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- Updated the "Collaborator", "Data Maintainer", and "Systems Maintainer" built-in roles to have privileges to "Access web application" and "List and view web applications."

## Helm Chart Breaking Changes

This release contains no Helm chart breaking changes.

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
|------------------|-------------------------------------|------------------------------------|
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | current                            |

## Bugs Fixed

- [closed-bugs-sle-2024-11](https://github.com/ni/install-systemlink-enterprise/tree/2024-11/release-notes/2024-11/closed-bugs-sle-2024-11.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2024-11/release-notes/2024-11/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2024-11/release-notes/2024-11/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.31.59`

**Admin Helm Chart:** `systemlink-admin 0.31.6`

### NI Containers

alarmservice:0.6.44

assetservice:0.17.43

assetui:0.16.70

comments:0.15.10

dashboardsui:0.19.17

dataframeservice:1.11.58

dremio-ee:24.1.2

executionsui:0.19.50

feedservice:0.8.30

feedsui:0.7.60

filesui:0.20.60

grafana-auth-proxy:0.17.6

grafana-plugins:3.43.5

grafana-rbac-integrator:0.19.32

helium-dataservices-mongomigration:0.18.9

helium-dataservices:0.18.9

helium-fileingestionservices:1.9.7

helium-salt-master:1.16.3

helium-serviceregistry:0.21.13

helium-taghistoriandataretention:0.14.8

helium-taghistorianmongomigration:0.14.8

helium-taghistorianservices:0.14.8

helium-userservices:0.21.21

helium-webappservices:0.19.28

helium-webserver:0.28.30

jupyter-notebook-userpod:2.10.9

jupyterui:0.19.47

labmanagementui:0.10.113

landingpageui:0.19.46

nbexec-execution-helpers:0.20.11

nbexec-notebook-runner:0.20.19

nbexecservice:0.20.52

nbparsingservice:0.19.18

ni-grafana:v10.2.3-19a2369fad-ni

notification:0.19.17

repository:0.15.16

routineeventtrigger:0.20.11

routineexecutor:0.20.7

routinescheduletrigger:0.20.12

routineservice:0.21.24

routinesui:0.20.62

securityui:0.19.42

session-manager-service:0.22.17

sl-configurable-http-proxy:2.10.3

sl-k8s-hub:2.10.9

smtp:0.19.13

specificationmanagement:0.10.15

sysmgmtevent:0.20.5

systemsmanagementservice:0.19.29

systemsstateservice:0.9.16

systemsstatesui:0.8.65

systemsui:0.20.88

tagsui:0.15.51

testinsightsui:0.19.71

testmonitorservice:0.28.27

userdata:0.19.16

userservice-setup:0.22.4

workorder:0.10.35

### 3rd Party Containers

alpine:3.20.3

argoproj/argocli:v3.5.5-linux-amd64

argoproj/argoexec:v3.5.5-linux-amd64

argoproj/workflow-controller:v3.5.5-linux-amd64

bitnami/kubectl:1.29.1-debian-11-r16

bitnami/minio:2024.11.7-debian-12-r0

bitnami/mongodb:5.0.24-debian-11-r20

bitnami/rabbitmq:4.0.3-debian-12-r0

bitnami/redis-cluster:7.4.1-debian-12-r0

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.3.8

kiwigrid/k8s-sidecar:1.28.0

pause:3.9

swaggerapi/swagger-ui:v5.17.14

zookeeper:3.9.1
