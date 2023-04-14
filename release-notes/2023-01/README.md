# SystemLink Enterprise 2023-01 Release Notes

The 2023-01 release bundle for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- Schedule a Jupyter notebook to run at a specific time or periodically.

- View detailed information about individual test steps within a test result. Refer to [Viewing Test Steps by Result](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/viewing-test-steps-by-result.html).

- Access SystemLink navigation and user account settings when using the Jupyter environment.

## Helm Chart Breaking Changes

There are no breaking changes in this release.

## Bugs Fixed

Only customer facing bugs have been included in this list.

[closed-bugs-sle-2023-01.xlsx](closed-bugs-sle-2023-01.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2023-01/release-notes/2023-01/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2023-01/release-notes/2023-01/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.10.92`

**Admin Helm Chart:** `systemlink-admin 0.10.4`

### NI Containers

dashboardsui/20230110.4

dataframeservice-kafka-connect/20221205.2

dataframeservice/20230111.12

dremio-apache/23.0.1

executionsui/20230110.2

filesui/20230111.2

grafana-auth-proxy/20221209.2

grafana-rbac-integrator/20221209.2

helium-fileingestionservices/b4219172c9da9a0c7c25dd4b3ca500fabd2d22c2.1

helium-serviceregistry/50d2e8921bd19f4794ef8f79ba60d089768e5737.1

helium-userservices/cf8c5a4ec9c63dd98585dec2de364cd8d4e91b56.1

helium-webappservices/03c2246e94932bc07f367b8c66cc16f190abe6a6.1

helium-webserver/9d275e79c073c39e02d617e9a3ce80777b18054e.2

jupyter-notebook-userpod/20230110.2

jupyterui/20230111.2

landingpageui/20230111.2

license/20230111.2

nbexec-execution-helpers/20221229.6

nbexec-notebook-runner/20221229.6

nbexecservice/20230105.2

nbparsingservice/20230112.2

ni-grafana/v9.2.6-76f6bc13ee-ni

notification/20230111.2

routineeventtrigger/20230105.8

routineexecutor/20230105.5

routinescheduletrigger/20230105.7

routineservice/20230105.7

routinesui/20230111.1

saltmaster-init/20230106.4

saltmaster/20230106.4

securityui/2d4eed4ef4bb03da2dc7ff33235f2aa960466e05.1

session-manager-service/20230111.2

sl-k8s-hub/20221206.2

smtp/20230111.2

sysmgmtevent/20230106.2

systemsmanagementservice/20230106.2

systemsui/20230111.2

testinsightsui/20230112.5

testmonitorservice/20230111.3

userdata/20230111.2

userservice-setup/20230106.13

### Non Container/Chart Artifacts

systemlink-notebook-datasource/1.1.0.zip

systemlink-dataframe-datasource/1.6.0.zip

plotly-panel/1.1.2.zip

### 3rd Party Containers

argoproj/argocli/v3.4.4-linux-amd64

argoproj/argoexec/v3.4.4-linux-amd64

argoproj/workflow-controller/v3.4.4-linux-amd64

bats/bats/1.8.2

bitnami/minio/2022.12.12-debian-11-r9

bitnami/mongodb/5.0.14-debian-11-r9

bitnami/rabbitmq/3.10.8-debian-11-r4

bitnami/redis-cluster/7.0.5-debian-11-r19

bitnami/schema-registry/7.3.1-debian-11-r0

busybox/1.35.0@sha256/0d5a701f0ca53f38723108687add000e1922f812d4187dea7feaee85d2f5a6c5

jupyterhub/configurable-http-proxy/4.5.3

jupyterhub/k8s-image-awaiter/2.0.0

kiwigrid/k8s-sidecar/1.21.1

kube-scheduler/v1.23.10

pause/3.8

zookeeper/3.8.0-temurin
