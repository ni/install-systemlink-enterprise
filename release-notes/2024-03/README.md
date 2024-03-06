# SystemLink Enterprise release 2024-03 Release Notes

The 2024-03 release for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the release 2024-02 to the 2024-03

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

- Behavior change or new feature description

- Behavior change or new feature description

## Helm Chart Breaking Changes

- `systemsstateservice 0.1.56`
    - Added new chart for Systems State Service. This requires mongodb credentials.
    - [View this secret configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-03/getting-started/templates/systemlink-secrets.yaml#L629)

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
|------------------|-------------------------------------|------------------------------------|
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | current                            |

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2024-03](https://github.com/ni/install-systemlink-enterprise/tree/2024-03/release-notes/2024-03/closed-bugs-sle-2024-03.xlsx)

## Software Bill of Materials and Notices

[SBOM](link to SBOM)

[Notices](link to SBOM)

## Versions

**Top Level Helm Chart:** `0.23.44`

**Admin Helm Chart:** `0.23.6`

### NI Containers

assetservice:0.9.21

assetui:0.8.41

comments:0.7.7

dashboardsui:0.11.66

dataframeservice:1.3.31

dremio-ee:24.1.2

executionsui:0.11.57

filesui:0.12.68

grafana-auth-proxy:20230404.4

grafana-plugins:3.9.2

grafana-rbac-integrator:0.11.12

helium-dataservices:0.10.9

helium-fileingestionservices:1.1.5

helium-salt-master:1.8.14

helium-serviceregistry:0.12.13

helium-taghistoriandataretention:0.6.10

helium-taghistorianservices:0.6.10

helium-userservices:0.12.9

helium-webappservices:0.10.9

helium-webserver:0.19.4

jupyter-notebook-userpod:2.2.26

jupyterui:0.11.58

labmanagementui:0.2.61

landingpageui:0.11.58

nbexec-execution-helpers:0.10.1

nbexec-notebook-runner:0.12.7

nbexecservice:0.12.16

nbparsingservice:0.11.10

ni-grafana:v10.2.3-19a2369fad-ni

notification:0.11.10

repository:0.7.9

routineeventtrigger:0.12.8

routineexecutor:0.12.6

routinescheduletrigger:0.12.7

routineservice:0.13.8

routinesui:0.12.40

securityui:0.11.56

session-manager-service:0.13.7

sl-configurable-http-proxy:2.1.11

sl-k8s-hub:2.2.13

smtp:0.11.8

specificationmanagement:0.2.7

sysmgmtevent:0.12.10

systemsmanagementservice:0.11.16

systemsstateservice:0.1.56

systemsui:0.12.89

tagsui:0.7.46

testinsightsui:0.11.102

testmonitorservice:0.20.8

userdata:0.11.12

userservice-setup:0.13.3

workorder:0.2.38

### 3rd Party Containers

alpine:3.19.0

argoproj/argocli:v3.4.11-linux-amd64

argoproj/workflow-controller:v3.4.11-linux-amd64

bitnami/kubectl:1.28.2-debian-11-r16

bitnami/minio:2024.1.16-debian-11-r0

bitnami/mongodb:5.0.24-debian-11-r20

bitnami/rabbitmq:3.12.12-debian-11-r21

bitnami/redis-cluster:7.2.4-debian-11-r2

busybox:stable@sha256:023917ec6a886d0e8e15f28fb543515a5fcd8d938edb091e8147db4efed388ee

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.2.1

kiwigrid/k8s-sidecar:1.26.0

pause:3.9

swaggerapi/swagger-ui:v5.11.8

zookeeper:3.8.2-temurin
