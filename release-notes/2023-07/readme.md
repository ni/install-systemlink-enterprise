
# SystemLink Enterprise 2023-07 Release Notes

The 2023-07 release of SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the 2023-06 or previous release to 2023-07

This release includes an updated saltmaster service that will cause previously connected systems to become disconnected upon upgrade. Refer to the [systems connection migration instructions](./SystemsConnectionMigration.md) to minimize the required effort to reconnect these systems.

This release includes Dremio Enterprise. This upgrade requires the removal of previous Dremio volumes.

1. Prior to upgrade, mark for deletion all persistent volume claims with `dremio` in their name.
2. Upgrade using the`systemlink 0.15.52` chart.
3. Kubernetes will automatically create new Dremio persistent volume claims.

**Note:** If this procedure was not completed prior to upgrade you must delete all `dremio` persistent volume claims, delete all `dremio` pods, and delete all `dataframeservice` pods. Kubernetes will automatically schedule new pods to replaced the deleted pods and new PVCs will be automatically created.

## New Features and Behavior changes

- Test Results
    - View detailed test step data under a test result.
    - The Results and Products grids display the number of items matching a query.
- Data Spaces
    - Visualize parametric data with a single click from a test result or from the test results grid.
    - View box, violin, and histogram charts in the margins of a scatter chart in a data space.
    - Color traces in scatter charts by product, result, step, condition, and measurement data.
- Systems
    - The systems grid tag column supports type ahead autocomplete for tag paths.
    - The tag historian service is available.
    - Copy a tag's path using the context menu in the tags grid in a system's details page.
    - Delete tags in the tags grid in a system's details page.
- Notebook dropdowns group notebooks by workspace.
- Work Orders
    - The Work Order collection of privileges now also reference test plans
    - The Work Order service and UI is not included in the SystemLink helm chart and associated privileges can be ignored.

## Helm Chart Breaking Changes

- `dataframeservice 0.11.21`
    - Dremio community edition has been replaced with Dremio Enterprise. Refer to [Upgrading from the 2023-06 or previous release to 2023-07](#upgrading-from-the-2023-06-or-previous-release-to-2023-07) for details steps required to accommodate this upgrade.

- `saltmaster 1.0.0`
    - A secret for MongoDB credentials (`saltmaster.secrets.mongodb`) must be provided.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/tree/2023-07/getting-started/templates/systemlink-secrets.yaml#L356)
    - A secret for a public/private RSA key pair (``saltmaster.secrets.saltmaster`) is required. Refer to the [systems connection migration instructions](./SystemsConnectionMigration.md) for steps to obtain these keys.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/tree/2023-07/getting-started/templates/systemlink-secrets.yaml#L368)

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2023-07](https://github.com/ni/install-systemlink-enterprise/tree/2023-07/release-notes/2023-07/closed-bugs-sle-2023-07.xlsx)

## Software Bill of Materials and Notices

- [SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2023-07/release-notes/2023-07/sbom)
- [Notices](https://github.com/ni/install-systemlink-enterprise/tree/2023-07/release-notes/2023-07/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.15.52`

**Admin Helm Chart:** `systemlink-admin 0.15.5`

### NI Containers

assetservice/0.1.20

dashboardsui/0.3.23

dataframeservice-kafka-connect/20230323.3

dataframeservice/0.11.54

dremio-ee/24.0.1

executionsui/0.3.17

filesui/0.4.27

grafana-auth-proxy/20230404.4

grafana-rbac-integrator/0.3.18

helium-dataservices/4700a9aca4cc30524a665849db62e3c08ca611f0.1

helium-fileingestionservices/8d23db3a30a5805a022ce566ca6e97a0f8801d4e.1

helium-salt-master/04e7a96681a9f89ba0a6b5ed12132f724e1bc46f.1

helium-serviceregistry/dddb1616f9bf43dda84f6f06ff3c882c4aa6686f.1

helium-userservices/a592ea59bdf3ba828e8ca0fe3450e14b4dd0f888.1

helium-webappservices/040be0406ab65d15201978a9122b18f55202d8fb.1

helium-webserver/370e0560c4974520b87f484b7a5fa0e573a92380.1

jupyter-notebook-userpod/20230623.2

jupyterui/0.3.15

landingpageui/0.3.19

license/0.3.12

nbexec-execution-helpers/20230613.4

nbexec-notebook-runner/20230613.3

nbexecservice/0.4.21

nbparsingservice/0.3.6

ni-grafana/v9.4.1-b477366620-ni

notification/0.3.13

routineeventtrigger/0.4.9

routineexecutor/0.4.6

routinescheduletrigger/0.4.10

routineservice/0.5.11

routinesui/0.4.21

securityui/372edd61c88693cbd3c89995da8d76a144144595.1

session-manager-service/0.4.16

sl-configurable-http-proxy/20230620.2

sl-k8s-hub/20230620.2

smtp/0.3.14

sysmgmtevent/0.4.14

systemsmanagementservice/0.3.13

systemsui/0.4.60

testinsightsui/0.3.96

testmonitorservice/0.12.1

userdata/0.3.14

userservice-setup/0.4.5

### Non Container/Chart Artifacts

systemlink-notebook-datasource/1.1.1.zip

systemlink-dataframe-datasource/1.6.2.zip

plotly-panel/1.1.2.zip

### 3rd Party Containers

argoproj/argocli/v3.3.8-linux-amd64

argoproj/argoexec/v3.3.8-linux-amd64

argoproj/workflow-controller/v3.3.8-linux-amd64

bitnami/minio/2023.6.19-debian-11-r0

bitnami/mongodb/5.0.18-debian-11-r11

bitnami/rabbitmq/3.11.18-debian-11-r0

bitnami/redis-cluster/7.0.10-debian-11-r2

bitnami/schema-registry/7.4.0-debian-11-r9

busybox/stable@sha256:1b0a26bd07a3d17473d8d8468bea84015e27f87124b283b91d781bce13f61370

jupyterhub/k8s-image-awaiter/2.0.0

kiwigrid/k8s-sidecar/1.24.4

kube-scheduler/v1.23.10

pause/3.8

provectuslabs/kafka-ui/v0.7.0

zookeeper/3.8.1-temurin

strimzi/kafka/0.34.0-kafka-3.4.0

strimzi/operator/0.34.0
