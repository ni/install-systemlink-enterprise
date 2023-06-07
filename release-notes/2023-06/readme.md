# SystemLink Enterprise release 2023-06 Release Notes

The 2023-06 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the release year-release-month to the release year-release-month

- 'assetservice >= 0.0.283'
    - Description: New service was introduced in SystemLink chart. Any PVC that contains assetservice in its name needs to be removed prior to the upgrade. The following privileges are being used: asset:Query, asset:Create, asset:Update, asset:Delete.
    - Installation guide: Remove pvc that have assetservice in its name.

## New Features and Behavior changes

- Track the location and status of assets on the Assets tab for your system.
- Manually add assets to your system to track third-party devices and devices without drivers.
- Edit and delete data spaces from the data spaces table and from an individual data space.
- The PostgreSQL backend for the Test Insights Service is more resilient.

## Helm Chart Breaking Changes

- 'dashboardhost 0.1.207' 
    - Added `apiIngress` section to expose the Grafana API on the API ingress. (A Grafana API route is needed for Service Registry to determine Grafana's status, which then controls whether to show Dashboards in the navigation tree.)
    - [https://github.com/ni/install-systemlink-enterprise/pull/140](https://github.com/ni/install-systemlink-enterprise/pull/140)

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2023-06](https://github.com/ni/install-systemlink-enterprise/blob/2023-06/release-notes/2023-06/closed-bugs-sle-2023-06.xlsx)

## Software Bill of Materials and Notices

- [SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2023-06/release-notes/2023-06/sbom)
- [Notices](https://github.com/ni/install-systemlink-enterprise/tree/2023-06/release-notes/2023-06/notices)

## Versions

- Top Level Helm Chart: `systemlink 0.14.35`
- Admin Helm Chart: `systemlink-admin 0.14.7`

### NI Containers

- assetservice/v0.0.293
- dashboardsui/v0.2.10
- dataframeservice-kafka-connect/20230323.3
- dataframeservice/v0.10.5
- dremio-apache/23.0.1-ni-0
- executionsui/v0.2.11
- filesui/v0.3.15
- grafana-auth-proxy/20230404.4
- grafana-rbac-integrator/20230403.3
- helium-dataservices/01c0fdf90d18ca3fcec7af56053de5b9e94ef274.1
- helium-fileingestionservices/b29eb13edbdabdb66aba40e4629690103be58d34.1
- helium-serviceregistry/cb119302d8e711a54de206ee61ff57f9a237ff03.1
- helium-userservices/8915be4ca893873be38dc065035b1d7646901494.1
- helium-webappservices/bef0f96c685887b905f129e4a2268455a9620f20.2
- helium-webserver/85d305090cd77fd2c28eb1e0f4c1d68736a4f25c.1
- jupyter-notebook-userpod/v20230530.3
- jupyterui/v0.2.11
- landingpageui/v0.2.14
- license/v0.2.6
- nbexec-execution-helpers/v20230516.4
- nbexec-notebook-runner/v20230426.4
- nbexecservice/v0.3.10
- nbparsingservice/v0.2.3
- ni-grafana/v9.4.1-b477366620-ni
- notification/v0.2.8
- routineeventtrigger/v0.3.2
- routineexecutor/v0.3.4
- routinescheduletrigger/v0.3.6
- routineservice/v0.4.7
- routinesui/v0.3.13
- saltmaster-init/v0.2.3
- saltmaster/v0.2.3
- securityui/8ffd4c6ddf4b74423a4e79197e215f5db5938a76.1
- session-manager-service/v0.3.7
- sl-configurable-http-proxy/20230330.5
- sl-k8s-hub/v20230530.3
- smtp/v0.2.6
- sysmgmtevent/v0.3.7
- systemsmanagementservice/v0.2.135
- systemsui/v0.3.32
- testinsightsui/v0.2.34
- testmonitorservice/v0.11.12
- userdata/v0.2.11
- userservice-setup/v0.3.1


### Non Container/Chart Artifacts

- systemlink-notebook-datasource/1.1.1.zip
- systemlink-dataframe-datasource/1.6.2.zip
- plotly-panel/1.1.2.zip

### 3rd Party Containers

- argoproj/argocli/v3.3.8-linux-amd64
- argoproj/argoexec/v3.3.8-linux-amd64
- argoproj/workflow-controller/v3.3.8-linux-amd64
- bitnami/minio/2023.5.18-debian-11-r0
- bitnami/mongodb/5.0.18-debian-11-r1
- bitnami/rabbitmq/3.11.16-debian-11-r3
- bitnami/redis-cluster/7.0.10-debian-11-r2
- bitnami/schema-registry/7.3.3-debian-11-r9
- busybox/stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd
- jupyterhub/k8s-image-awaiter/2.0.0
- kiwigrid/k8s-sidecar/1.24.3
- kube-scheduler/v1.23.10
- pause/3.8
- provectuslabs/kafka-ui/v0.6.2
- zookeeper/3.8.1-temurin
- strimzi/kafka/0.34.0-kafka-3.4.0
- strimzi/operator/0.34.0
