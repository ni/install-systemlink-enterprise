# SystemLink Enterprise 2022-11 Release Notes

The 2022-11 release bundle for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the 2022-09 Release to the 2022-11 Release

Due to breaking changes in the top level SystemLink and SystemLink-Admin Helm chart the following procedure is required to upgrade the application. Note, this upgrade will cause any currently executing notebooks to fail.

1. Stage your workspace to upgrade the `systemlink-admin` and `systemlink` helm charts to the 2022-11 release.

1. Run the Helm upgrade command on the `systemlink` chart to remove existing Argo CRDs. This must be done before upgrading the `systemlink-admin` chart. This command should include all flags and value file references you would expect to use for a typical upgrade of the application.

    **Note:** This wil result in an expected failure: `UPGRADE FAILED: unable to recognize "": no matches for kind "WorkflowTemplate" in version "argoproj.io/v1alpha1"`. This error can be ignored.

1. Run the command `kubectl get crds | grep argo` to verify the argo CRDs have been deleted. You may need to manually delete remaining CRDs if the Helm upgrade command does not remove all of these objects.

1. Run the Helm upgrade command for the `systemlink-admin` helm chart.

1. Run the command `kubectl get crds | grep argo` to verify the new argo CRDs have been installed.

1. Run the Helm upgrade command for the `systemlink` Helm chart.

- Files up to 10GB can be uploaded through the web interface.

## New Features

There are no new features in this release.

## Behavior Changes

- Files up to 10GB can be uploaded through the web interface.

## Helm Chart Breaking Changes

- SystemLink Helm Chart 0.8.113
    - Argo custom resource definitions (CRD) are removed from the `argoworkflows 0.1.53` chart
    - You no longer need to specify SystemLink Grafana plugin configuration unless you also intend on installing additional plugins.
- SystemLink-Admin Helm Chart 0.8.6
    - `argoworkflowscrd` chart added as a dependency. This chart installs SystemLink required CRDs

## Bugs Fixed

Only customer facing bugs have been included in this list.

[closed-bugs-sle-2022-11.xlsx](closed-bugs-sle-2022-11.xlsx)

## Vulnerabilities Fixed

See bugs with **XRay** in the title in the list above of closed bugs.

## Known Vulnerabilities

This information is available upon request. Work with your account representative to request this report.

## Software Bill of Materials

This information is available upon request. Work with your account representative to request this data.

## Versions

**Top Level Helm Chart:** `systemlink 0.8.113`

**Admin Helm Chart:** `systemlink-admin 0.8.6`

### NI Containers

assetservice/20221031.16

dashboardsui/20221027.2

dataframeservice/20221031.3

dataframeservice-kafka-connect/20221020.2

dremio-apache/23.0.1

executionsui/20221027.8

filesui/20221027.2

grafana-auth-proxy/20220823.49

grafana-rbac-integrator/20221026.4

helium-fileingestionservices/41b2ba986e21b627885feef0a0c0d7070683e60f.1

helium-serviceregistry/94d772ce27e6bca276ab8d534cece368947bec53.1

helium-userservices/76e1ecf2a7d3cbb9680e91d3c8dfc2e85e096d99.1

helium-webappservices/8670ce0a529309247ba9c88cbb82a0d3ebfc4a7d.1

helium-webserver/05b77cdeaabeee8cd79400001d7b4a3465f87394.1

jupyter-notebook-userpod/20221028.2

landingpageui/20221027.2

nbexec-execution-helpers/20221027.2

nbexec-notebook-runner/20221031.2

nbexecservice/20221101.2

nbparsingservice/20221027.4

ni-grafana/v9.2.0-01545b402a-ni

routineengine/20221031.21

routineservice/20221031.21

routinesui/20221027.5

saltmaster/20221027.2

saltmaster-init/20221027.2

securityui/0e84010b0a29bd914dd3b4bff971a98c05d62c59.2

session-manager-service/20221031.3

sl-k8s-hub/20220822.2

sysmgmtevent/20221031.4

systemsmanagementservice/20221101.2

systemsui/20221027.5

testinsightsui/20221027.13

testmonitorservice/20221031.3

userdata/20221031.3

userservice-setup/20221011.2

### Non Container/Chart Artifacts

plotly-panel/1.1.2.zip

systemlink-dataframe-datasource/1.4.0.zip

systemlink-notebook-datasource/1.1.0.zip

### 3rd Party Containers

argoproj/argocli/v3.3.8-linux-amd64

argoproj/argoexec/v3.3.8-linux-amd64

argoproj/workflow-controller/v3.3.8-linux-amd64

bats/bats/1.8.2

bitnami/minio/2022.10.24-debian-11-r0

bitnami/mongodb/5.0.13-debian-11-r9

bitnami/rabbitmq/3.10.8-debian-11-r4

bitnami/redis-cluster/7.0.5-debian-11-r9

bitnami/schema-registry/7.2.2-debian-11-r11

busybox/1.35.0

jupyterhub/configurable-http-proxy/4.5.3

jupyterhub/k8s-image-awaiter/1.2.0

kiwigrid/k8s-sidecar/1.19.5

kube-scheduler/v1.19.13

pause/3.8

strimzi/kafka/0.31.1-kafka-3.2.3

zookeeper/3.8.0-temurin

strimzi/operator/0.31.1
