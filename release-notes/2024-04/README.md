# SystemLink Enterprise release 2024-04 Release Notes

The 2024-04 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- [Create test plans](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/creating-a-test-plan.html) faster by using a test plan template.
- [Edit result keywords from a data space](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/editing-test-result-keywords-from-a-data-space.html). You can also exclude results from a data space using a keyword that the results have in common.
- Learn about the [performance metrics for the SystemLink DataFrame service](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/dataframe-service-performance-metrics.html).
- Create feeds and upload custom packages.
- Replicate feeds from a remote URL.
- Upload, download, and configure metadata for system state files.
- Easily move third-party assets between test systems or unmanaged locations.

- `feedservice 0.1.212`
    - New helm chart added for feeds. The following existing privileges are being used:
        - feed:Read
        - feed:Create
        - feed:Update
        - feed:Delete
- `feedsui 0.0.364`
    - New helm chart added for feeds.
- `serviceregistry 0.13.12`
    - Added new `testplan:Execute` permission to allow calling the new `/niworkorder/v1/testplans/{testPlanId}/execute` route. The Work Order service is not installed by default. This route is marked "[Beta]" and is still in development.

## Helm Chart Breaking Changes

- `workorder 0.3.79`
    - workorder database needs to be dropped on upgrade. See instructions [here](./Drop-workorder-database.md).
- `workorder 0.3.79`
    - The `status` property has been renamed to `state` in `workorder` and `testplan` APIs.
- `systemsstateservice 0.2.15`
    - Added encryptionKey value for encrypting state content.
    - [View this secret configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-04/getting-started/templates/systemlink-secrets.yaml#L622)

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
|------------------|-------------------------------------|------------------------------------|
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | current                            |

Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed instructions on how to safely upgrade the version of the RabbitMQ dependency.

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2024-04](https://github.com/ni/install-systemlink-enterprise/tree/2024-04/release-notes/2024-04/closed-bugs-sle-2024-04.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2024-04/release-notes/2024-04/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2024-04/release-notes/2024-04/notices)

## Versions

**Top Level Helm Chart:** `0.24.123`

**Admin Helm Chart:** `0.24.4`

### NI Containers

assetservice:0.10.4

assetui:0.9.77

comments:0.8.1

dashboardsui:0.12.67

dataframeservice:1.4.28

dremio-ee:24.1.2

executionsui:0.12.64

feedservice:0.1.212

feedsui:0.0.364

filesui:0.13.70

grafana-auth-proxy:0.12.0

grafana-plugins:3.9.2

grafana-rbac-integrator:0.12.9

helium-dataservices:0.11.4

helium-fileingestionservices:1.2.6

helium-salt-master:1.9.12

helium-serviceregistry:0.13.12

helium-taghistoriandataretention:0.7.6

helium-taghistorianservices:0.7.6

helium-userservices:0.13.7

helium-webappservices:0.11.11

helium-webserver:0.20.7

jupyter-notebook-userpod:2.3.3

jupyterui:0.12.65

labmanagementui:0.3.111

landingpageui:0.12.69

nbexec-execution-helpers:0.10.1

nbexec-notebook-runner:0.13.3

nbexecservice:0.13.10

nbparsingservice:0.12.11

ni-grafana:v10.2.3-19a2369fad-ni

notification:0.12.3

repository:0.8.6

routineeventtrigger:0.13.2

routineexecutor:0.13.0

routinescheduletrigger:0.13.0

routineservice:0.14.0

routinesui:0.13.57

securityui:0.12.46

session-manager-service:0.14.4

sl-configurable-http-proxy:2.3.2

sl-k8s-hub:2.3.4

smtp:0.12.3

specificationmanagement:0.3.2

sysmgmtevent:0.13.4

systemsmanagementservice:0.12.18

systemsstateservice:0.2.15

systemsstatesui:0.1.63

systemsui:0.13.104

tagsui:0.8.65

testinsightsui:0.12.96

testmonitorservice:0.21.7

userdata:0.12.5

userservice-setup:0.14.1

workorder:0.3.79

### 3rd Party Containers

alpine:3.19.1

argoproj/argocli:v3.5.5-linux-amd64

argoproj/argoexec:v3.5.5-linux-amd64

argoproj/workflow-controller:v3.5.5-linux-amd64

bitnami/kubectl:1.28.2-debian-11-r16

bitnami/minio:2024.4.18-debian-12-r0

bitnami/mongodb:5.0.24-debian-11-r20

bitnami/rabbitmq:3.12.12-debian-11-r21

bitnami/redis-cluster:7.2.4-debian-12-r9

busybox:stable@sha256:023917ec6a886d0e8e15f28fb543515a5fcd8d938edb091e8147db4efed388ee

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.2.1

kiwigrid/k8s-sidecar:1.26.1

pause:3.9

swaggerapi/swagger-ui:v5.13.0

zookeeper:3.9.1
