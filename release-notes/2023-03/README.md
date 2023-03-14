# SystemLink Enterprise 2023-03 Release Notes

The 2023-03 bundle for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- Support for Kubernetes 1.23

- Support for PostgreSQL 13 and 14

- You can export data tables to CSV

- You can query product, results, and steps tables with the table query builder

- OpenTelemetry metrics are available for the following services
    - testmonitor
    - dataframeservice
    - Kafka

- `oidc/user-info` replaced `/oidc/userinfo` as the endpoint to view claims for the current logged in user

- Kafka UI is available for debugging and monitoring

- Kafka S3 sink connectors are automatically deleted if a data table is marked `endOfData`

- Deleted Kafka S3 sink connectors are automatically reestablished if connectors are manually deleted

- The default memory provided to Kafka topic operator has increased from 256MB to 512MB to increase the total number of tables that can be written to by the Data Frame Service.

## Helm Chart Breaking Changes

- `systemlink 0.11.81`
    - Setting image pull secrets
        - Image pull secret specification has been split into two separate global values.
        - You must specify the single required image pull secret in a new value `global.niImagePullSecret` and reference this value in `global.imagePullSecrets`.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-03/getting-started/templates/systemlink-values.yaml#L18)

    - Enabling Kafka metrics
        - Set `global.telemetry.enabled` flag to `true`.
        - You are no longer required to also set options in `kafka.metricsConfigs`, `kafka.jmxOptions`, and `kafka.kafkaExporter` configurations.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-03/getting-started/templates/systemlink-values.yaml#L56)

    - Enabling user claims to be returned in a web browser.
        - Set `webserver.oidc.enableUserInfo` to `true`.
        - You should remove `offline_access` from `webserver.oidc.scope`.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-03/getting-started/templates/systemlink-values.yaml#L110).

    - Enabling Kafka UI
        - To enable the Kafka UI you must override the image pull repository to the repository you are installing SystemLink Enterprise from.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-03/getting-started/templates/systemlink-values.yaml#L606).

    - Encryption key secret for webappservices
        - The `webappservices.secrets.continuationTokenEncryptionKey` secret must be set to a 256-bit random value which is base64 encoded.
        - Failure to base64 encode the value stored in the Helm chart will result in errors from the service.
        - An invalid key will causes issues in future releases.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-03/getting-started/templates/systemlink-secrets.yaml#L409)

## Bugs Fixed

Only customer facing bugs have been included in this list.

[closed-bugs-sle-2023-03](TODO link to closed bugs)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2023-03/release-notes/2023-03/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2023-03/release-notes/2023-03/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.11.81`

**Admin Helm Chart:** `systemlink-admin 0.11.12`

### NI Containers

dashboardsui/20230303.2

dataframeservice-kafka-connect/20230303.2

dataframeservice/20230303.20

dremio-apache/23.0.1

executionsui/20230227.2

filesui/20230302.10

grafana-auth-proxy/20221209.2

grafana-rbac-integrator/20221209.2

helium-fileingestionservices/e15843e497fc0f72e74d205a39fb6a28148df8f2.1

helium-serviceregistry/92171bebc2a296d56c7459ef12735e4ea7d0696d.1

helium-userservices/425d9e6ac9847fcaa2580081965d960837681acb.2

helium-webappservices/c5d0702c5ae9ecf3db3071e1a43bf7c9ed1129b4.1

helium-webserver/e814e1c3e96fb7342a331c183c4294d466423539.1

jupyter-notebook-userpod/20230224.2

jupyterui/20230302.5

landingpageui/20230303.1

license/20230302.1

nbexec-execution-helpers/20230223.2

nbexec-notebook-runner/20230223.2

nbexecservice/20230303.2

nbparsingservice/20230301.2

ni-grafana/v9.4.1-ea9740b6e4-ni

notification/20230303.2

routineeventtrigger/20230228.2

routineexecutor/20230228.2

routinescheduletrigger/20230228.2

routineservice/20230228.2

routinesui/20230303.3

saltmaster-init/20230303.2

saltmaster/20230303.2

securityui/d4f9e2812da877447f9044346434ef6ac268b477.1

session-manager-service/20230303.5

sl-k8s-hub/20230222.2

smtp/20230301.2

sysmgmtevent/20230227.4

systemsmanagementservice/20230227.8

systemsui/20230303.8

testinsightsui/20230303.57

testmonitorservice/20230302.2

userdata/20230228.4

userservice-setup/20230228.4

### Non Container/Chart Artifacts

plotly-panel/1.1.2.zip

systemlink-dataframe-datasource/1.6.2.zip

systemlink-notebook-datasource/1.1.0.zip

### 3rd Party Containers

argoproj/argocli/v3.3.8-linux-amd64

argoproj/argoexec/v3.3.8-linux-amd64

argoproj/workflow-controller/v3.3.8-linux-amd64

bats/bats/1.9.0

bitnami/minio/2023.2.27-debian-11-r1

bitnami/mongodb/5.0.15-debian-11-r1

bitnami/rabbitmq/3.10.8-debian-11-r4

bitnami/redis-cluster/7.0.8-debian-11-r14

bitnami/schema-registry/7.3.2-debian-11-r1

bitnami/schema-registry/sha256__c8dbc7cafaf53600d93a84c7af826cb9f9d4e9c4f659a07a09a9f6b2ffe76041

bitnami/schema-registry/sha256__ef8bca485d80728a4313b7bb0e6d167e04e66302fb13d231c9962a8f87537c0b

busybox/sha256__51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/configurable-http-proxy/4.5.3

jupyterhub/configurable-http-proxy/sha256__7cc28f92e5a81882911a37ddd0d32975bc5fb73012ba928d0b2e4b363d096ce1

jupyterhub/configurable-http-proxy/sha256__cf8a88a21815e8e1f114f640ae43c77d734f8af7f3ec8b1ced68ee755b3af661

jupyterhub/k8s-image-awaiter/2.0.0

jupyterhub/k8s-image-awaiter/sha256__5cbbf70f0cfdb438a69c56536a94a159f6681cbd4966258ac371fbeb7e6e1c32

jupyterhub/k8s-image-awaiter/sha256__f7bfa6bce3337c487527d1a91fa29e0d34ff2607f576ffc769a2608e691c1335

kiwigrid/k8s-sidecar/1.22.4

kube-scheduler/v1.23.10

pause/3.8

zookeeper/3.8.1-temurin

kube-scheduler/v1.23.10
