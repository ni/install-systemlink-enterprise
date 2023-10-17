# SystemLink Enterprise 2023-10 Release Notes

The 2023-10 release for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- You can view the current and historical values of tags in dashboards.
- Data tables have improved reliability and scalability and can support thousands of concurrent writers.
- Systems data can be visualized in dashboards.
- You can change the version of a package installed on a managed system.
- You can view all tracked assets on the Assets page
- You can add comments to a test result
- You can connect to external MongoDB instances.
    - This is a breaking change. Refer to **Helm Chart Breaking Changes** for detail on how to opt-out of this capability or migrate to a new MongoDB instance.
- New Test Analytics privilege category is available.
    - The Test Analytics privilege category has been added, and includes the Query Measurements privilege. This privilege is not currently functional and is being added in support of features that will release in a future version.

## Upgrading from the release 2023-09 to the release 2023-10

- This release upgrade Redis from 7.0 to 7.2. This is a breaking change. It is necessary to upgrade the Redis cluster. Helm will not perform this upgrade automatically.
- Option #1
    1. Set `webserver.redis-cluster.redis.update-strategy.type = OnDelete`
    1. Run the Helm command to upgrade your deployment to this release.
    1. Run `kubectl -n <namespace> delete pods <release>-webserver-redis-0 <release>-webserver-redis-1 release>-webserver-redis-2 <release>-webserver-redis-3 <release>-webserver-redis-4 <release>-webserver-redis-5`. The pods of the stateful set will be deleted and will be automatically recreated.
    1. Remove the override of the Redis update-strategy from the configuration. You can re-deploy to apply this change but it is not required.
- Option #2
    1. Prior to upgrade, run: `kubectl -n <namespace> delete statefulset <release>-webserver-redis`
    1. This will delete the redis cluster, preventing UI access to the application.
    1. Run the Helm command to upgrade your deployment to this release. The Redis cluster will be recreated and deployed in parallel.
- Once upgraded, Redis storage will be incompatible with older versions of the software. If it is necessary to downgrade to an older version of SystemLink Enterprise, you must perform a hard reset on the redis cluster. These steps are not required if you are only upgrading to the latest release.
    - Refer to [Perform-a-hard-reset-on-the-redis-cluster.md](https://github.com/ni/install-systemlink-enterprise/tree/2023-10/release-notes/2023-10/Perform-a-hard-reset-on-the-redis-cluster.md) for steps to reset Redis.

## Helm Chart Breaking Changes

- Support for single external MongoDB replica set
    - The systemlink Helm chart defaults to connect to an external MongoDB instance
    - If you have an existing installation of SLE you MUST either set `global.mongodb.install` to `true` or migrate your existing data to an external MongoDB instance and provide the connection string in `global.mongodb.connection_string`
- MongoDB connection string global value override.
    - You can specify the username and password in the global (`mongodb+srv://user:pass@host/<database>`). `<database>` will be replaced during per-service Helm install/upgrade. This forces SystemLink Enterprise to use the same username and password for all databases hosted in your MongoDB instance.
    - You can also use per-service username and password combinations (`mongodb+srv://<username>:<password>@host/<database>`) `<username>`, `<password>`, and `<database>` will be replaced during per-service Helm install/upgrade. This forces SystemLink Enterprise to use your specified usernames and passwords for each database hosted in your MongoDB instance.
- Data Frame Service
    - `dataframeservice.requestBodySizeLimitMegabytes` has been renamed to `dataframeservice.requestBodySizeLimit`. It now accepts units in "MiB" (Mebibytes, 1024 KiB) or in "MB" (Megabytes, 1000 KB).
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-10/getting-started/templates/systemlink-values.yaml#L579)
- Tag Historian service
    - The Tag Historian service is included in the SystemLink Enterprise top level Helm chart.
    - You must configure the secrets for MongoDB required by this service.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-10/getting-started/templates/systemlink-secrets.yaml#L549)
    - The service requires a `continuationTokenEncryptionKey` to be configured. When creating the `continuationTokenEncryptionKey`, use a 32-byte cryptographically random value which is base64 encoded.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-10/getting-started/templates/systemlink-secrets.yaml#L566)

## Upgrade Considerations

- DataFrame Service Kafka dependency has been removed
    - The DataFrame Service now uses a more efficient method for writing data to new tables, replacing Kafka. The DataFrame Service will still use Kafka for data ingestion for tables created before the 2023-10 release, while tables created after upgrading to the 2023-10 release will have data written directly to S3 storage. This changes leads to greatly reduced resource utilization.
    - After upgrading to the 2023-10 release, you can safely remove Kafka from your cluster once all pre-upgrade tables are set to readonly. Please note that disabling Kafka may lead to data loss if pre-upgrade tables are not readonly, because any buffered data may not get written to storage.
    - Refer to [Remove-Kafka-from-the-cluster.md](https://github.com/ni/install-systemlink-enterprise/tree/2023-10/release-notes/2023-10/Remove-Kafka-from-the-cluster.md) for detailed instructions.
- DataFrame Service Dremio refresh interval
    - The Dremio data set refresh job interval was increased from 2 minutes to 1 hour. This reduces overall load on Dremio.
    - Customers are not required to uptake this change, but doing so will result in lower load and lower resource utilization.
    - Refer to [How-to-reset-Dremio.md](https://github.com/ni/install-systemlink-enterprise/tree/2023-10/release-notes/2023-10/How-to-reset-Dremio.md) to uptake this change.
- DataFrame Service increased memory limit.
    - The default memory request and limit increased from 2GB per DataFrame Service pod to 4GB.

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
|------------------|-------------------------------------|------------------------------------|
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | current                            |

Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed instructions on how to safely upgrade the version of the RabbitMQ dependency.

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2023-10](https://github.com/ni/install-systemlink-enterprise/tree/2023-10/release-notes/2023-10/closed-bugs-sle-2023-10.xlsx)

## Software Bill of Materials and Notices

- [SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2023-10/release-notes/2023-10/sbom)
- [Notices](https://github.com/ni/install-systemlink-enterprise/tree/2023-10/release-notes/2023-10/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.18.70`

**Admin Helm Chart:** `systemlink-admin 0.18.9`

### NI Containers

assetservice:0.4.64

assetui:0.3.48

comments:0.2.34

dashboardsui:0.6.38

dataframeservice:0.14.49

dremio-ee:24.1.2

executionsui:0.6.42

filesui:0.7.47

grafana-auth-proxy:20230404.4

grafana-plugins:3.3.0

grafana-rbac-integrator:0.6.10

helium-dataservices:0.5.21

helium-fileingestionservices:0.9.20

helium-salt-master:1.3.18

helium-serviceregistry:0.6.20

helium-taghistoriandataretention:0.1.94

helium-taghistorianservices:0.1.94

helium-userservices:0.6.35

helium-webappservices:0.5.13

helium-webserver:0.13.12

jupyter-notebook-userpod:20230928.21

jupyterui:0.6.36

landingpageui:0.6.45

license:0.6.27

licensesui:0.3.47

nbexec-execution-helpers:20230911.5

nbexec-notebook-runner:20230922.2

nbexecservice:0.7.26

nbparsingservice:0.6.7

ni-grafana:v9.5.8-ed05e1eca2-ni

notification:0.6.19

repository:0.2.16

routineeventtrigger:0.7.6

routineexecutor:0.7.4

routinescheduletrigger:0.7.8

routineservice:0.8.9

routinesui:0.7.30

securityui:0.6.39

session-manager-service:0.7.18

sl-configurable-http-proxy:20230823.1

sl-k8s-hub:20230825.2

smtp:0.6.13

sysmgmtevent:0.7.19

systemsmanagementservice:0.6.23

systemsui:0.7.87

tagsui:0.2.48

testinsightsui:0.6.112

testmonitorservice:0.15.19

userdata:0.6.19

userservice-setup:0.7.3

### 3rd Party Containers

alpine:3.18.3

argoproj/argocli:v3.3.8-linux-amd64

argoproj/argoexec:v3.3.8-linux-amd64

argoproj/workflow-controller:v3.3.8-linux-amd64

bitnami/minio:2023.9.30-debian-11-r0

bitnami/mongodb:5.0.21-debian-11-r12

bitnami/rabbitmq:3.12.6-debian-11-r4

bitnami/redis-cluster:7.2.1-debian-11-r0

busybox:stable@sha256:023917ec6a886d0e8e15f28fb543515a5fcd8d938edb091e8147db4efed388ee

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:2.0.0

kiwigrid/k8s-sidecar:1.25.1

kube-scheduler:v1.23.10

pause:3.8

swaggerapi/swagger-ui:v5.7.2

zookeeper:3.8.1-temurin
