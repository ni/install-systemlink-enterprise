# SystemLink Enterprise release 2024-02 Release Notes

The 2024-02 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- Use the Lab Management System (LMS) to create, view, and manage work orders and test plans for the products you are testing.
- Use Specification Management APIs to maintain a central repository of specifications that you can use to analyze test results and measurements.
- Create routines to automate an action when an event occurs.
- Distribute Helm charts through the Docker registry (OCI) to simplify your deployment.
- Added support for Kubernetes 1.28.

## Helm Chart Breaking Changes

- `systemlink 0.22.55`
    - SystemLink Helm chart now redistributed through an OCI registry. This requires small changes when staging, installing, or upgrading SystemLink Artifacts.
    - Refer to [Configuring SystemLink Repositories](https://www.ni.com/en-US/bundle/systemlink-enterprise/page/config-systemlink-enterprise.html#GUID-B2CD4CC1-DFE3-49CB-A45D-C8A59514BF93__GUID-B1E08EC5-361F-4446-BAA5-EAC1E6C0FB4E) for details on staging SystemLink artifacts in your local repository.
    - Refer to [Installing SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/installing-systemlink-enterprise.html) for details on using OCI registries install SystemLink Enterprise.
    - Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detail on using OCI registries to upgrade SystemLink Enterprise.

- `workorder 0.1.381` and `labmanagementui 0.1.700`
    - Work Order and Lab Management UI Helm charts are now included in the SystemLink top level chart. This chart requires a new mongoDB secret.
    - The Work Order service is an optional installation. By default, it will not be installed. To enable installation, set the `enabled` flag to `true` in the work order service configuration.
    - [View this secret configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-02/getting-started/templates/systemlink-secrets.yaml#L605)
    - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-02/getting-started/templates/systemlink-values.yaml#L908)

- `fileingestion 0.13.0`
    - There is a new required Helm value for an encryption key used to encrypt download tokens. This will enable in the future the capability to download large  files through the UI
    - [View this secret configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-02/getting-started/templates/systemlink-secrets.yaml#L627)
    - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-02/getting-started/templates/systemlink-values.yaml#L766)

- `specificationmanagement 0.1.287`
    - Specification Management Helm chart is now included in the SystemLink top level chart. This chart requires a new mongoDB secret.
    - The  Specification Management service is an optional installation. By default, it will not be installed. To enable installation, set the `enabled` flag to `true` in Specification Management service configuration.
    - The UIs to interact with this service are not yet included in the SystemLink top level chart.
    - [View this secret configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-02/getting-started/templates/systemlink-secrets.yaml#L627)
    - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-02/getting-started/templates/systemlink-values.yaml#L917)

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
|------------------|-------------------------------------|------------------------------------|
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | current                            |

Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed instructions on how to safely upgrade the version of the RabbitMQ dependency.

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2024-02](https://github.com/ni/install-systemlink-enterprise/tree/2024-02/release-notes/2024-02/closed-bugs-sle-2024-02.xlsx)

## Software Bill of Materials and Notices

- [SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2024-02/release-notes/2024-02/sbom)
- [Notices](https://github.com/ni/install-systemlink-enterprise/tree/2024-02/release-notes/2024-02/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.22.55`

**Admin Helm Chart:** `systemlink-admin 0.22.10`

### NI Containers

assetservice:0.8.44

assetui:0.7.29

comments:0.6.15

dashboardsui:0.10.37

dataframeservice:1.2.32

dremio-ee:24.1.2

executionsui:0.10.30

filesui:0.11.42

grafana-auth-proxy:20230404.4

grafana-plugins:3.9.2

grafana-rbac-integrator:0.10.6

helium-dataservices:0.9.16

helium-fileingestionservices:1.0.11

helium-salt-master:1.7.26

helium-serviceregistry:0.11.10

helium-taghistoriandataretention:0.5.15

helium-taghistorianservices:0.5.15

helium-userservices:0.11.13

helium-webappservices:0.9.9

helium-webserver:0.18.9

jupyter-notebook-userpod:2.2.15

jupyterui:0.10.37

labmanagementui:0.1.709

landingpageui:0.10.38

nbexec-execution-helpers:0.10.1

nbexec-notebook-runner:0.11.16

nbexecservice:0.11.31

nbparsingservice:0.10.14

ni-grafana:v9.5.12-61b4dd6cfd-ni

notification:0.10.16

repository:0.6.18

routineeventtrigger:0.11.10

routineexecutor:0.11.8

routinescheduletrigger:0.11.10

routineservice:0.12.11

routinesui:0.11.32

securityui:0.10.35

session-manager-service:0.12.9

sl-configurable-http-proxy:2.1.11

sl-k8s-hub:2.2.5

smtp:0.10.15

specificationmanagement:0.1.293

sysmgmtevent:0.11.16

systemsmanagementservice:0.10.31

systemsui:0.11.55

tagsui:0.6.33

testinsightsui:0.10.74

testmonitorservice:0.19.15

userdata:0.10.18

userservice-setup:0.12.3

workorder:0.1.403

### 3rd Party Containers

alpine:3.19.0

argoproj/argocli:v3.4.11-linux-amd64

argoproj/argoexec:v3.4.11-linux-amd64

argoproj/workflow-controller:v3.4.11-linux-amd64

bitnami/kubectl:1.28.2-debian-11-r16

bitnami/minio:2024.1.16-debian-11-r0

bitnami/mongodb:5.0.24-debian-11-r1

bitnami/rabbitmq:3.12.12-debian-11-r3

bitnami/redis-cluster:7.2.4-debian-11-r2

busybox:stable@sha256:023917ec6a886d0e8e15f28fb543515a5fcd8d938edb091e8147db4efed388ee

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.2.1

kiwigrid/k8s-sidecar:1.25.3

kube-scheduler:v1.26.11

pause:3.9

swaggerapi/swagger-ui:v5.11.2

zookeeper:3.8.2-temurin
