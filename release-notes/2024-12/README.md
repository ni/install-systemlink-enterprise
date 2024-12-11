# SystemLink Enterprise 2024-12 Release Notes

The 2024-12 release for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- Behavior change or new feature description

- Updated **Automated Agent** built-in role to include privileges to **Execute test actions**.

## Helm Chart Breaking Changes

- `dynamicformfields:0.1.310`
    - The Dynamic Form Fields (DFF) Service was added to the top-level chart.
        - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-12/getting-started/templates/systemlink-values.yaml#L1260)        - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-12/getting-started/templates/systemlink-values.yaml#L1260)
    - You must configure the secrets for the PostgreSQL credentials of the DFF service in systemlink-secrets.yaml.
        - [View this secret configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-12/getting-started/templates/systemlink-secrets.yaml#L691)
    - DFF feature flags still defaults to false.

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of SystemLink Enterprise. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
|------------------|-------------------------------------|------------------------------------|
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | current                            |

## Bugs Fixed

- [closed-bugs-sle-2024-12](https://github.com/ni/install-systemlink-enterprise/tree/2024-12/release-notes/2024-12/closed-bugs-sle-2024-12.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2024-12/release-notes/2024-12/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2024-12/release-notes/2024-12/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.32.18`

**Admin Helm Chart:** `systemlink-admin 0.32.4`

### NI Containers

alarmservice:0.7.33

assetservice:0.18.30

assetui:0.17.63

comments:0.16.9

dashboardsui:0.20.23

dataframeservice:1.12.36

dremio-ee:24.1.2

dynamicformfields:0.1.310

executionsui:0.20.33

feedservice:0.9.24

feedsui:0.8.29

filesui:0.21.65

grafana-auth-proxy:0.17.6

grafana-plugins:3.43.6

grafana-rbac-integrator:0.20.13

helium-dataservices-mongomigration:0.19.24

helium-dataservices:0.19.24

helium-fileingestionservices:1.10.8

helium-salt-master:1.17.7

helium-serviceregistry:0.23.1

helium-taghistoriandataretention:0.15.9

helium-taghistorianmongomigration:0.15.9

helium-taghistorianservices:0.15.9

helium-userservices:0.23.5

helium-webappservices:0.21.8

helium-webserver:0.30.15

jupyter-notebook-userpod:2.11.6

jupyterui:0.20.26

labmanagementui:0.11.74

landingpageui:0.20.27

nbexec-execution-helpers:0.21.18

nbexec-notebook-runner:0.21.7

nbexecservice:0.21.35

nbparsingservice:0.20.25

ni-grafana:v10.2.3-c2d2d1c81f-ni

notification:0.20.8

repository:0.16.17

routineeventtrigger:0.21.8

routineexecutor:0.21.7

routinescheduletrigger:0.21.8

routineservice:0.22.21

routinesui:0.21.25

securityui:0.20.25

session-manager-service:0.24.3

sl-configurable-http-proxy:2.11.2

sl-k8s-hub:2.11.4

smtp:0.20.7

specificationmanagement:0.11.8

sysmgmtevent:0.21.11

systemsmanagementservice:0.20.16

systemsstateservice:0.10.13

systemsstatesui:0.9.39

systemsui:0.21.47

tagsui:0.16.24

testinsightsui:0.20.81

testmonitorservice:0.29.13

userdata:0.20.11

userservice-setup:0.24.1

workorder:0.11.29

### 3rd Party Containers

alpine:3.20.3

argoproj/argocli:v3.5.5-linux-amd64

argoproj/argoexec:v3.5.5-linux-amd64

argoproj/workflow-controller:v3.5.5-linux-amd64

bitnami/kubectl:1.29.1-debian-11-r16

bitnami/minio:2024.11.7-debian-12-r0

bitnami/mongodb:5.0.24-debian-11-r20

bitnami/rabbitmq:4.0.4-debian-12-r1

bitnami/redis-cluster:7.4.1-debian-12-r2

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.3.8

kiwigrid/k8s-sidecar:1.28.0

pause:3.9

swaggerapi/swagger-ui:v5.17.14

zookeeper:3.9.1
