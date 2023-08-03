
# SystemLink Enterprise 2023-08 Release Notes

The 2023-08 release of SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the 2023-07 or previous release to 2023-08

TODO

## New Features and Behavior changes

- systemlink 16.31
    - We have update our RabbitMQ dependency from 3.11.x to 3.12.x. RabbitMQ minor version changes can cause breaking issues on upgrade. In this instance, it is likely RabbitMQ will fail to launch after upgrade if they user is not upgrading from the previous SLE release. A topic on RabbitMQ upgrade issues is being added to the installation guide.
    - [Added discussion to the Updating SystemLink Enterprise topic](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html)
- systemlink 16.35
    - Dependent services are updated to use HorizontalPodAutoscaler v2 Kubernetes API. This change is affecting to minimum Kubernetes version support, because dependencies are no longer support 1.22 or older versions. Minimum Kubernetes version for systemlink will be 1.23 or newer. Existing systemlink-values.yaml file also need to be updated before upgrading an existing installation, either by removing the existing grafana autoscaling config (as in the linked pull request) or update to v2 syntax (https://dev.azure.com/ni/DevCentral/_git/Skyline/pullrequest/527579?_a=files&path=/Enterprise/SystemLink/systemlink-rancher-values.yaml).
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/pull/153)
- systemlink 16.60
    - SystemLink now supports user telemetry tracking via gainsight. Telemetry is enabled by default and must be explicitly disabled using the userTelemetry.enableFrontEndTelemetry flag in your Helm values configuration. Deploying with user telemetry enabled will cause usage data for the SystemLink web UI to be uploaded to https://esp.ni.com and for some content to be injected into the web application from https://web-sdk.ni.com.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/pull/138)
- repository 0.1.0
    - Added a new helm chart. 
      1. It is required to set new MongoDB credentials in `repository.secrets.mongodb`.
      2. This service needs to access external resources (ni.com feeds - "https://download.ni.com/support/nipkg/products/ni-package-manager/released") so make sure the networking of the cluster allows that.
- testmonitorservice 0.13.2
    - TestMonitor service requires a new EF Core PostgreSQL migration to support an upcoming feature. No actions are required. This migration does not change any tables or modify any data. The documented PostgreSQL user privileges are sufficient to perform this migration; no addition privileges are required.  The migration will happen automatically on first launch of the service and should complete immediately. If the version of testmonitorservice is rolled back to a prior version after this migration has been performed the service will fail to start with an "Invalid database configuration" error presented in the service logs.
- assetui 0.2.227
    - Added new helm chart for assets UI. The new app is not yet exposed in navigator, but can be reached to by url (/assets). There are no breaking changes
- dataframeservice 0.12.60
    - This new version restarts the service pods on every helm upgrade in order to detect changes to the S3 credentials and update the connection between dependencies like Dremio and Kafka Connect to S3. This decreases the down time while rotating S3 credentials.

## Helm Chart Breaking Changes

- `dataframeservice 0.12.67`
    - To reduce the likelihood that Dremio's volumes will fill up after too many undecimated queries are run in a 24-hour period, we increased the default size of Dremio's volumes to 256 gigs, up from 128 gigs. Before upgrading, delete all stateful sets with "dremio" in their names. After upgrading, bounce a DFS pod to reinitialize Dremio. Alternatively, to opt-out of this change, override dataframeservice.sldremio.coordinator.volumeSize and dataframeservice.sldremio.executor.volumeSize to "128Gi".

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2023-08](https://github.com/ni/install-systemlink-enterprise/tree/2023-08/release-notes/2023-08/closed-bugs-sle-2023-08.xlsx)

## Software Bill of Materials and Notices

- [SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2023-08/release-notes/2023-08/sbom)
- [Notices](https://github.com/ni/install-systemlink-enterprise/tree/2023-08/release-notes/2023-08/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.16.80`

**Admin Helm Chart:** `systemlink-admin 0.16.5`

### NI Containers

assetservice/0.2.68

assetui/0.2.235

dashboardsui/0.4.37

dataframeservice-kafka-connect/20230323.3

dataframeservice/0.12.78

dremio-ee/24.1.2

executionsui/0.4.34

filesui/0.5.42

grafana-auth-proxy/20230404.4

grafana-plugins/1.6.1

grafana-rbac-integrator/0.4.22

helium-dataservices/97ebc089b94e0f4630ec85ccc5fbc7a63c855244.1

helium-fileingestionservices/988393f42ab332fd09f051a0d928f8aed9d10ccd.1

helium-salt-master/68ad7dc3e8ee7fd8e865d1fe278f769b94013f91.1

helium-serviceregistry/51bb6457f0223c984f6a94231c12cf1893441bfe.1

helium-userservices/d7eac6d0d2d3e16b9d0ca1b8031a5bdffee015fd.1

helium-webappservices/5be5ad1b47f21856069b5be927b1ffa483342894.1

helium-webserver/910d99d59de86b01e5a8b2f3d0ba75e1a79c6a4c.1

jupyter-notebook-userpod/20230720.3

jupyterui/0.4.29

landingpageui/0.4.31

license/0.4.27

licensesui/0.1.222

nbexec-execution-helpers/20230719.1

nbexec-notebook-runner/20230728.2

nbexecservice/0.5.31

nbparsingservice/0.4.15

ni-grafana/v9.5.5-7034709b40-ni

notification/0.4.21

repository/0.1.72

routineeventtrigger/0.5.12

routineexecutor/0.5.13

routinescheduletrigger/0.5.15

routineservice/0.6.17

routinesui/0.5.40

securityui/0.4.19

session-manager-service/0.5.25

sl-configurable-http-proxy/20230720.4

sl-k8s-hub/20230720.5

smtp/0.4.22

sysmgmtevent/0.5.24

systemsmanagementservice/0.4.23

systemsui/0.5.90

testinsightsui/0.4.105

testmonitorservice/0.13.26

userdata/0.4.23

userservice-setup/0.5.7

### 3rd Party Containers

argoproj/argocli/v3.3.8-linux-amd64

argoproj/argoexec/v3.3.8-linux-amd64

argoproj/workflow-controller/v3.3.8-linux-amd64

bitnami/minio/2023.7.18-debian-11-r0

bitnami/mongodb/5.0.19-debian-11-r11

bitnami/rabbitmq/3.12.2-debian-11-r8

bitnami/redis-cluster/7.0.10-debian-11-r2

bitnami/schema-registry/7.4.1-debian-11-r7

busybox/stable@sha256/023917ec6a886d0e8e15f28fb543515a5fcd8d938edb091e8147db4efed388ee

jupyterhub/k8s-image-awaiter/2.0.0

kiwigrid/k8s-sidecar/1.25.0

kube-scheduler/v1.23.10

pause/3.8

provectuslabs/kafka-ui/v0.7.1

zookeeper/3.8.1-temurin

strimzi/kafka/0.34.0-kafka-3.4.0

strimzi/operator/0.34.0
