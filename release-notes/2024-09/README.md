# SystemLink Enterprise release 2024-09 Release Notes

The release_year-release_month release for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the release 2024-08 to the release 2024-09

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
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | current                            |

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2024-09](https://github.com/ni/install-systemlink-enterprise/tree/2024-09/release-notes/2024-09/closed-bugs-sle-2024-09.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2024-09/release-notes/2024-09/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2024-09/release-notes/2024-09/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.29.49`

**Admin Helm Chart:** `systemlink-admin 0.29.3`

### NI Containers

alarmservice:0.4.36

assetservice:0.15.63

assetui:0.14.65

comments:0.13.3

helium-taghistoriandataretention:0.12.5

helium-taghistorianmongomigration:0.12.5

helium-taghistorianservices:0.12.5

helium-userservices:0.19.7

helium-webappservices:0.17.18

helium-webserver:0.26.21

jupyter-notebook-userpod:2.8.3

jupyterui:0.17.40

labmanagementui:0.8.84

landingpageui:0.17.38

nbexec-execution-helpers:0.18.12

nbexec-notebook-runner:0.18.5

nbexecservice:0.18.31

nbparsingservice:0.17.19

ni-grafana:v10.2.3-19a2369fad-ni

notification:0.17.7

repository:0.13.12

routineeventtrigger:0.18.9

routineexecutor:0.18.8

routinescheduletrigger:0.18.5

routineservice:0.19.5

routinesui:0.18.39

securityui:0.17.40

session-manager-service:0.20.13

sl-configurable-http-proxy:2.5.3

sl-k8s-hub:2.5.9

smtp:0.17.9

specificationmanagement:0.8.8

sysmgmtevent:0.18.10

systemsmanagementservice:0.17.18

systemsstateservice:0.7.8

systemsstatesui:0.6.45

systemsui:0.18.85

tagsui:0.13.48

testinsightsui:0.17.113

testmonitorservice:0.26.18

userdata:0.17.7

userservice-setup:0.20.0

workorder:0.8.25

### 3rd Party Containers

alpine:3.20.2

argoproj/argocli:v3.5.5-linux-amd64

argoproj/argoexec:v3.5.5-linux-amd64

argoproj/workflow-controller:v3.5.5-linux-amd64

bitnami/kubectl:1.28.2-debian-11-r16

bitnami/minio:2024.8.26-debian-12-r0

bitnami/mongodb:5.0.24-debian-11-r20

bitnami/rabbitmq:3.13.7-debian-12-r2

bitnami/redis-cluster:7.4.0-debian-12-r1

busybox:stable@sha256:50aa4698fa6262977cff89181b2664b99d8a56dbca847bf62f2ef04854597cf8

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.3.7

kiwigrid/k8s-sidecar:1.27.5

pause:3.9

swaggerapi/swagger-ui:v5.17.14

zookeeper:3.9.1