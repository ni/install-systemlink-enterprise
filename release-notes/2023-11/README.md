<!-- This file should be renamed to README.md and placed in the directory for the release. -->

# SystemLink Enterprise release 2023-11 Release Notes

The 2023-11 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the release 2023-10 to the release 2023-11

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

- Behavior change or new feature description

- Behavior change or new feature description

## Helm Chart Breaking Changes

- Chart Name and version
  - Description of breaking change.

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
| ---------------- | ----------------------------------- | ---------------------------------- |
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | current                            |

Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed instructions on how to safely upgrade the version of the RabbitMQ dependency.

## Bugs Fixed

<!-- This section should link to the excel document that list customer facing bugs, fixed in the current release. The URL for the release (tag) should be used. -->

Only customer facing bugs have been included in this list.

[link to closed bugs](link to closed bugs)

## Software Bill of Materials and Notices

<!-- This section should link to the directories containing notices and SBOM. The URL for the release (tag) should be used. -->

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

grafana-plugins:3.9.0

grafana-rbac-integrator:0.7.24

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
