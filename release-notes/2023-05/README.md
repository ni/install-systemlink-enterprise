# SystemLink Enterprise release 2023-05 Release Notes

The 2023-05 release for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- Added tags. Publish and view the current value of tags from your test systems. Monitor the status of your test fleet with automatically published system health data on the System Details page.

- You can save and load views from the steps grid.

## Helm Chart Breaking Changes

- `tags 0.1.0` Tag Helm chart included in the SystemLink top level chart
    - This chart requires setting a new MongoDB secret
    - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-05/getting-started/templates/systemlink-secrets.yaml#L485)

## Bugs Fixed

Only customer facing bugs have been included in this list.

[closed-bugs-sle-2023-05](https://github.com/ni/install-systemlink-enterprise/blob/2023-05/release-notes/2023-05/closed-bugs-sle-2023-05.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2023-05/release-notes/2023-05/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2023-05/release-notes/2023-05/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.13.32`

**Admin Helm Chart:** `systemlink-admin 0.13.4`

### NI Containers

dashboardsui/v0.1.201

dataframeservice-kafka-connect/20230323.3

dataframeservice/v0.8.238

dremio-apache/23.0.1-ni-0

executionsui/v0.1.202

filesui/v0.2.135

grafana-auth-proxy/20230404.4

grafana-rbac-integrator/20230403.3

helium-dataservices/22f30a9f82d967bd5942fd2cb6e376be6c14d1a1.3

helium-fileingestionservices/586c2ad918e2a57f541d7c45be2013fbb6cccd90.4

helium-serviceregistry/3c59b15ed98957deb98d637e0e3f7787be7827f2.1

helium-userservices/8db82e5bf7b002146fdbcd6df703e9e95c4d736d.3

helium-webappservices/2c5ddd9dcecb0457345b300027af6b1d5c1c8fdc.2

helium-webserver/f7260dd27cabe3dfe09d6699742e1669e4659766.1

jupyter-notebook-userpod/20230424.5

jupyterui/v0.1.107

landingpageui/v0.1.142

license/v0.1.121

nbexec-execution-helpers/v20230426.4

nbexec-notebook-runner/v20230426.4

nbexecservice/v0.2.34

nbparsingservice/v0.1.57

ni-grafana/v9.4.1-8c272247b7-ni

notification/v0.1.154

routineeventtrigger/v0.2.82

routineexecutor/v0.2.79

routinescheduletrigger/v0.2.84

routineservice/v0.3.111

routinesui/v0.2.142

saltmaster-init/v0.1.88

saltmaster/v0.1.88

securityui/156ee4217447ec9031a966f3f501bf7075c0cbc6.2

session-manager-service/v0.2.140

sl-configurable-http-proxy/20230330.5

sl-k8s-hub/20230329.2

smtp/v0.1.100

sysmgmtevent/v0.2.62

systemsmanagementservice/v0.2.112

systemsui/v0.2.233

testinsightsui/v0.1.732

testmonitorservice/v0.10.46

userdata/v0.1.202

userservice-setup/v0.2.39

### Non Container/Chart Artifacts

systemlink-notebook-datasource/1.1.1.zip

systemlink-dataframe-datasource/1.6.2.zip

plotly-panel/1.1.2.zip

### 3rd Party Containers

argoproj/argocli/v3.3.8-linux-amd64

argoproj/argoexec/v3.3.8-linux-amd64

argoproj/workflow-controller/v3.3.8-linux-amd64

bitnami/minio/2023.4.28-debian-11-r0

strimzi/kafka/0.34.0-kafka-3.4.0

strimzi/operator/0.34.0

bitnami/mongodb/5.0.17-debian-11-r1

bitnami/rabbitmq/3.11.13-debian-11-r0

bitnami/redis-cluster/7.0.10-debian-11-r2

bitnami/schema-registry/7.3.3-debian-11-r1

busybox/stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter/2.0.0

kiwigrid/k8s-sidecar/1.23.1

kube-scheduler/v1.23.10

pause/3.8

provectuslabs/kafka-ui/v0.6.2

zookeeper/3.8.1-temurin

bats/bats:1.9.0
