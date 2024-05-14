
# SystemLink Enterprise release 2024-05 Release Notes

The 2024-05 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- Navigate SystemLink Enterprise faster with the intuitively organized UI.
- Visualize data tables in a data space to gain insights into your time-series data.
- Analyze test results with Jupyter Notebooks.
- Annotate steps with keywords from a data space.
- Save custom column configurations for the product specifications grid.
- `workorder 0.4.35`
    - As the work orders and test plans are unlinked, the privileges are split between workorders and tesplans as follows:
        - Create work orders -  `workorder: Create`
        - Modify work orders -  `workorder: Update`
        - Delete work orders -  `workorder: Delete`
        - List and view work orders -  `workorder: Query`
        - Create test plans -  `testplan: Create`
        - Modify test plans -  `testplan: Update`
        - Delete test plans -  `testplan: Delete`
        - List and view test plans -  `testplan: Query`
        - Access work orders web application - `workorder:AccessApplication`
        - Access test plans web application - `testplan:AccessApplication`
- `userservice 0.14.9`
      - Data Maintainer role has been provided with all actions for test plans and query action for test plan template: `testplan: *`, `testplantemplate:Query`

## Helm Chart Breaking Changes

- `webserver 0.21`
    - Removed unused and undocumented routes: `/api/keys`, `/api/keys/duplicate`, `/user/api-key`
- `systemlink 0.25.63` Top Level Helm Chart
    - We upgraded our RabbitMQ dependency from 3.12.x to 3.13.x. Minor updates to the RabbitMQ version are potentially breaking. Customers must install a version of SystemLink Enterprise running RabbitMQ 3.12 before they can successfully upgrade to a version running 3.13.
- `systemlink 0.25.63` Top Level Helm Chart
    - The Work Order and Lab Management services are installed by default. You may disable installation for these services by setting the enabled flag to `false` in the Work Order service configuration.
    - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-05/getting-started/templates/systemlink-values.yaml#L978)

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
|------------------|-------------------------------------|------------------------------------|
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | current                            |

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2024-05](https://github.com/ni/install-systemlink-enterprise/tree/2024-05/release-notes/2024-05/closed-bugs-sle-2024-05.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2024-05/release-notes/2024-05/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2024-05/release-notes/2024-05/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.25.63`

**Admin Helm Chart:** `systemlink-admin 0.25.4`

### NI Containers

assetservice:0.11.7

assetui:0.10.74

comments:0.9.3

dashboardsui:0.13.68

dataframeservice:1.5.27

dremio-ee:24.1.2

executionsui:0.13.76

feedservice:0.2.46

feedsui:0.1.70

filesui:0.14.79

grafana-auth-proxy:0.12.0

grafana-plugins:3.9.2

grafana-rbac-integrator:0.13.5

helium-dataservices:0.12.4

helium-fileingestionservices:1.3.7

helium-salt-master:1.10.2

helium-serviceregistry:0.14.19_8666769

helium-taghistoriandataretention:0.8.2

helium-taghistorianservices:0.8.2

helium-userservices:0.14.9

helium-webappservices:0.12.10

helium-webserver:0.21.12

jupyter-notebook-userpod:2.4.4

jupyterui:0.13.73

labmanagementui:0.4.100

landingpageui:0.13.71

nbexec-execution-helpers:0.14.14

nbexec-notebook-runner:0.14.12

nbexecservice:0.14.21

nbparsingservice:0.13.15

ni-grafana:v10.2.3-19a2369fad-ni

notification:0.13.8

repository:0.9.3

routineeventtrigger:0.14.5

routineexecutor:0.14.1

routinescheduletrigger:0.14.2

routineservice:0.15.2

routinesui:0.14.70

securityui:0.13.67

session-manager-service:0.15.12

sl-configurable-http-proxy:2.3.2

sl-k8s-hub:2.4.3

smtp:0.13.6

specificationmanagement:0.4.6

sysmgmtevent:0.14.3

systemsmanagementservice:0.13.11

systemsstateservice:0.3.5

systemsstatesui:0.2.103

systemsui:0.14.113

tagsui:0.9.65

testinsightsui:0.13.92

testmonitorservice:0.22.17

userdata:0.13.10

userservice-setup:0.15.2

workorder:0.4.35

### 3rd Party Containers

alpine:3.19.1

argoproj/argocli:v3.5.5-linux-amd64

argoproj/argoexec:v3.5.5-linux-amd64

argoproj/workflow-controller:v3.5.5-linux-amd64

bitnami/kubectl:1.28.2-debian-11-r16

bitnami/minio:2024.4.18-debian-12-r0

bitnami/mongodb:5.0.24-debian-11-r20

bitnami/rabbitmq:3.13.1-debian-12-r0

bitnami/redis-cluster:7.2.4-debian-12-r11

busybox:stable@sha256:023917ec6a886d0e8e15f28fb543515a5fcd8d938edb091e8147db4efed388ee

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.3.7

kiwigrid/k8s-sidecar:1.26.1

pause:3.9

swaggerapi/swagger-ui:v5.17.2

zookeeper:3.9.1
