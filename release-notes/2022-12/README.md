# SystemLink Enterprise 2022-12 Release Notes

The 2022-12 release bundle for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- The top level helm chart includes the License service. Refer to **Helm Chart Breaking Changes** for details on the required configuration for this service.
- Users can specify data table IDs as variables in dashboards.
- Users can customize, filter, save, and load views in the Products grid.
- Users can upload and view files associated with a product.
- Users can filter the Executions grid by date ranges and workspaces.

## Helm Chart Breaking Changes

- `systemlink 0.9.88`, `systemlink-admin 0.9.4`
    - Containers inside a Pod now use a more strict `securityContext` configuration by default.
    - The new default `securityContext` configuration for containers is as follows:
        - `allowPrivilegeEscalation` defaults to `false`
        - `readOnlyRootFilesystem` defaults to `true`
        - `privileged` defaults to `false`
        - `capabilities.drop` defaults to `[all]`.
    - This change only affects the default values of _Containers_. The default values for _Pod_ `securityContext` remains the same.
- `license 0.1.0`
    - This service requires the persistent storage class `ReadWriteMany`.
    - Configure secrets for the service
        - Refer to [systemlink-secrets.yaml](https://github.com/ni/install-systemlink-enterprise/blob/2022-12/getting-started/templates/systemlink-secrets.yaml)
        - Refer to [Required Secrets](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/required-secrets.html)
    - Configure values for the service
        - Refer to [systemlink-values.yaml](https://github.com/ni/install-systemlink-enterprise/blob/2022-12/getting-started/templates/systemlink-values.yaml)
        - Refer to [What Do You Need to Use SystemLink Enterprise?](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/systemlink-enterprise-requirements.html)
- `nbexecservice 0.1.312`
    - Config map renamed from `nbexec-service-argo-configmap` to `<helm_release_name>-nbexecservice-argo-configmap`.
    - Service names have been moved from config map to workflow-template.
    - During helm upgrade in progress executions may fail.
- `routines`
    - Remove the whitelisted API key
- `routineeventtrigger 0.2.0`
    - Values have moved from the `routineservice.engine` into the `routineeventtrigger` chart.
    - Refer to [systemlink-secrets.yaml](https://github.com/ni/install-systemlink-enterprise/blob/2022-12/getting-started/templates/systemlink-secrets.yaml) for required changes
- `routinescheduletrigger 0.2.0`
    - Newly included chart
    - You must configure the `userservices.secrets.whitelistedApiKeys` value with an entry for `routinescheduletrigger` `serviceName`.
    - You must configure MongoDB credentials in `routinescheduletrigger.secrets.mongodb`.
- `routineexecutor 0.2.0`
    - Newly included chart
    - You must configure the `userservices.secrets.whitelistedApiKeys` value with an entry for `routineexecutor` `serviceName`.
- `notification 0.1.0`
    - Newly included chart
    - You must configure a secret for MongoDB credentials in `notification.secrets.mongodb`

## Bugs Fixed

Only customer facing bugs have been included in this list.

[closed-bugs-sle-2022-12.xlsx](closed-bugs-sle-2022-12.xlsx)

## Vulnerabilities Fixed

See bugs with **XRay** in the title in the above list of closed bugs.

## Known Vulnerabilities

This information is available upon request. Work with your account representative to request this report.

## Software Bill of Materials

This information is available upon request. Work with your account representative to request this data.

## Versions

**Top Level Helm Chart:** `systemlink 0.9.88`

**Admin Helm Chart:** `systemlink-admin 0.9.4`

### NI Containers

assetservice/20221118.6

dashboardsui/20221111.2

dataframeservice/20221118.4

dataframeservice-kafka-connect/20221020.2

dremio-apache/23.0.1

executionsui/20221121.3

filesui/20221122.1

grafana-auth-proxy/20220823.49

grafana-rbac-integrator/20221026.4

helium-fileingestionservices/dc33be88fa6bb48bc2579c1388f7813f4898ae4d.1

helium-serviceregistry/73420f07fb9b610a8b50243690300af644852736.1

helium-userservices/b0bf0d034f0fecf7ab35170b408a8b7fbb89cd36.1

helium-webappservices/3ba5384cc64762f3e2701e0f5d81f6d658537548.1

helium-webserver/9ec4fb54f928a14c96fce899e063cc05b1b4de7e.1

jupyter-notebook-userpod/20221118.9

landingpageui/20221122.3

license/20221121.2

nbexec-execution-helpers/20221117.1

nbexec-notebook-runner/20221118.2

nbexecservice/20221123.4

nbparsingservice/20221117.1

ni-grafana/v9.2.0-01545b402a-ni

notification/20221119.6

routineeventtrigger/20221122.3

routineexecutor/20221122.7

routinescheduletrigger/20221122.15

routineservice/20221122.10

routinesui/20221122.4

saltmaster/20221121.4

saltmaster-init/20221121.4

securityui/d9bf470abbab0d89f3fc331025235bc092ad0bc0.1

session-manager-service/20221119.4

sl-k8s-hub/20221118.7

smtp/20221119.2

sysmgmtevent/20221116.7

systemsmanagementservice/20221121.2

systemsui/20221122.4

testinsightsui/20221125.4

testmonitorservice/20221122.10

userdata/20221121.2

userservice-setup/20221118.2

### Non Container/Chart Artifacts

plotly-panel/1.1.2.zip

systemlink-dataframe-datasource/1.6.0.zip

systemlink-notebook-datasource/1.1.0.zip

### 3rd Party Containers

argoproj/argocli/v3.4.3-linux-amd64

argoproj/argoexec/v3.4.3-linux-amd64

argoproj/workflow-controller/v3.4.3-linux-amd64

bats/bats/1.8.2

bitnami/minio/2022.11.11-debian-11-r0

bitnami/mongodb/5.0.13-debian-11-r9

bitnami/rabbitmq/3.10.8-debian-11-r4

bitnami/redis-cluster/7.0.5-debian-11-r9

bitnami/schema-registry/7.2.2-debian-11-r11

busybox/1.35.0

jupyterhub/configurable-http-proxy/4.5.3

jupyterhub/k8s-image-awaiter/2.0.0

kiwigrid/k8s-sidecar/1.21.0

kube-scheduler/v1.23.10

pause/3.8

strimzi/kafka/0.32.0-kafka-3.2.3

strimzi/kafka/0.32.0-kafka-3.3.1

zookeeper/3.8.0-temurin

strimzi/operator/0.32.0
