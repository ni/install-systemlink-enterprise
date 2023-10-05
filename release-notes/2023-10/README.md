<!-- This file should be renamed to README.md and placed in the directory for the release. -->

# SystemLink Enterprise release 2023-10 Release Notes

The 2023-10 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the release 2023-09 to the release 2023-10

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
|------------------|-------------------------------------|------------------------------------|
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

**Top Level Helm Chart:** `systemlink 0.18.69`

**Admin Helm Chart:** `systemlink-admin 0.18.9`

### NI Containers

assetservice:0.4.64

assetui:0.3.48

comments:0.2.34

dashboardsui:0.6.38

dataframeservice:0.14.49

dremio-ee:24.1.2

executionsui:0.6.42

filesui:0.7.47

grafana-auth-proxy:20230404.4

grafana-plugins:3.3.0

grafana-rbac-integrator:0.6.10

helium-dataservices:0.5.21

helium-fileingestionservices:0.9.20

helium-salt-master:1.3.18

helium-serviceregistry:0.6.20

helium-taghistoriandataretention:0.1.94

helium-taghistorianservices:0.1.94

helium-userservices:0.6.35

helium-webappservices:0.5.13

helium-webserver:0.13.12

jupyter-notebook-userpod:20230928.21

jupyterui:0.6.36

landingpageui:0.6.45

license:0.6.27

licensesui:0.3.47

nbexec-execution-helpers:20230911.5

nbexec-notebook-runner:20230922.2

nbexecservice:0.7.26

nbparsingservice:0.6.7

ni-grafana:v9.5.8-ed05e1eca2-ni

notification:0.6.19

repository:0.2.16

routineeventtrigger:0.7.6

routineexecutor:0.7.4

routinescheduletrigger:0.7.8

routineservice:0.8.9

routinesui:0.7.30

securityui:0.6.39

session-manager-service:0.7.18

sl-configurable-http-proxy:20230823.1

sl-k8s-hub:20230825.2

smtp:0.6.13

sysmgmtevent:0.7.19

systemsmanagementservice:0.6.23

systemsui:0.7.87

tagsui:0.2.48

testinsightsui:0.6.107

testmonitorservice:0.15.19

userdata:0.6.19

userservice-setup:0.7.3

### Non Container/Chart Artifacts

artifact:version

### 3rd Party Containers

alpine:3.18.3

argoproj/argocli:v3.3.8-linux-amd64

argoproj/argoexec:v3.3.8-linux-amd64

argoproj/workflow-controller:v3.3.8-linux-amd64

bitnami/minio:2023.9.30-debian-11-r0

bitnami/mongodb:5.0.21-debian-11-r12

bitnami/rabbitmq:3.12.6-debian-11-r4

bitnami/redis-cluster:7.2.1-debian-11-r0

busybox:stable@sha256:023917ec6a886d0e8e15f28fb543515a5fcd8d938edb091e8147db4efed388ee

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:2.0.0

kiwigrid/k8s-sidecar:1.25.1

kube-scheduler:v1.23.10

pause:3.8

swaggerapi/swagger-ui:v5.7.2

zookeeper:3.8.1-temurin