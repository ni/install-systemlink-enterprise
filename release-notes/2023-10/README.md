# SystemLink Enterprise release 2023-10 Release Notes

The 2023-10 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the release 2023-09 to the release 2023-10

- webserver 0.13.12
    - Upgraded Redis dependency from 7.0 to 7.2. This is a breaking change. It is necessary to upgrade the entire cluster in parallel, which is not something Kubernetes will do automatically.
        1. Option #1: Set webserver.redis-cluster.redis.update-strategy.type = OnDelete
            - Run the upgrade deployment
            - Run `kubectl -n <namespace> delete pods <release>-webserver-redis-0 <release>-webserver-redis-1 <release>-webserver-redis-2 <release>-webserver-redis-3 <release>-webserver-redis-4 <release>-webserver-redis-5`
            - The pods of the stateful set will be deleted and should be automatically recreated in parallel.
            - Remove the overide of the redis update-strategy from the configuration. You can re-deploy to apply this change but it is not required.
        2. Option #2: Prior to upgrade, run: `kubectl -n <namespace> delete statefulset <release>-webserver-redis`
            - This will delete the redis cluster, preventing UI access to the application.
            - Now run the upgrade deployment. The redis cluster will be recreated and deployed in parallel.
    - Once upgraded, Redis storage will be incompatibile with older versions of the software. If it is necessary to downgrade to an older version, you must perform a hard reset on the redis cluster:
        - [Perform-a-hard-reset-on-the-redis-cluster.md](https://github.com/ni/install-systemlink-enterprise/tree/2023-10/release-notes/2023-10/Perform-a-hard-reset-on-the-redis-cluster.md)

## New Features and Behavior changes

- testinsightsui 0.6.112
    - Comments service was added to top level helm chart in previous release 2023-09. In this release, feature flag is removed and comments tab will be visible in result details page and user can add/view/edit/delete comments under a test result.
- The Test Analytics privilege category has been added, and includes the Query Measurements privilege. This privilege is not currently functional and is being added in support of features that will release in a future version.

## Helm Chart Breaking Changes

- CRITICAL - The systemlink Helm chart defaults to connect to an external MongoDB instance
    - If you have an existing installation of SLE you MUST etiher set `global.mongodb.install` to `true` or migrate your existing data to an external MongoDB instance and provide the connection string in `global.mongodb.connection_string`
- New - mongodb connection string global value override.
    - Customers can specify the user/password directly in the global ("mongodb+srv://user:pass@host/`<database>`") (<> will be replaced during per-service Helm install/upgrade)
    - Customers can use per-service user/password combinations ("mongodb+srv://`<username>`:`<password>`@host/`<database>`") (<> will be replaced during per-service Helm install/upgrade)
- dataframeservice
    - `dataframeservice.requestBodySizeLimitMegabytes` has been renamed to `dataframeservice.requestBodySizeLimit`. It now accepts units in "MiB" (Mebibytes, 1024 KiB) or in "MB" (Megabytes, 1000 KB).
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/4da6c60d63ef48a663e78efd9b393e41b6c40ba4/getting-started/templates/systemlink-values.yaml#L579)
- taghistorian
    - The TagHistorian service was added as part of the top level helm chart of SystemLink Enterprise. The service enables the users to see historical values for their tags.
    - Before running the service, please configure the values according to the instructions from the helm chart.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/4da6c60d63ef48a663e78efd9b393e41b6c40ba4/getting-started/templates/systemlink-secrets.yaml#L549)
    - The service requires a `continuationTokenEncryptionKey` to be configured. When creating the `continuationTokenEncryptionKey`, use a 32-byte cryptographically random value which is base64 encoded.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/4da6c60d63ef48a663e78efd9b393e41b6c40ba4/getting-started/templates/systemlink-secrets.yaml#L566)

## Upgrade Considerations

- dataframeservice 0.14.49
    - The Dremio data set refresh job interval was increased from 2 minutes to 1 hour. This reduces overall load on Dremio.
    - Customers are not required to uptake this change, but doing so will be beneficial as the net result in load reduction.
    - Refer to [How-to-reset-Dremio.md](https://github.com/ni/install-systemlink-enterprise/tree/2023-10/release-notes/2023-10/How-to-reset-Dremio.md) to uptake this change.
- dataframeservice 0.14.49
    - The DataFrame Service now uses a more efficient method for writing data to new tables, replacing Kafka. The DataFrame Service will still use Kafka for data ingestion for tables created before the 2023-10 release, while tables created after upgrading to the 2023-10 release will have data written directly to S3 storage.
    - After upgrading to the 2023-10 release, you can safely remove Kafka from your cluster once all pre-upgrade tables are set to readonly. Please note that disabling Kafka may lead to data loss if pre-upgrade tables are not readonly, because any buffered data may not get written to storage.
    - To remove Kafka from the cluster:
        1. Upgrade to the 2023-10 release.
        2. Confirm that you do not have any remaining appendable tables that were created prior to upgrade that you do not want to be made readonly. To check if any remaining appendable tables exist:
            - Use kubectl or a GUI like Lens to find the pod containing `dfs-kafka-ui`.
            - Enable port forwarding for port `8080` to access the Kafka UI on your localhost.
            - Open the Kafka UI in a browser using the port obtained in the previous step.
            - Navigate to "Topics" in the left-hand navigation.
            - Search for topics starting with `dfs` followed by a data table ID.
            - If no Kafka topics exist for data tables, it's safe to proceed with disabling and removing Kafka from the cluster.

            The presence of `dfs` topics in Kafka indicates that the associated tables are still open for writing data. By default, newly-created data tables have "SupportsAppend" set to "true." To mark a data table as readonly, use the route `POST /nidataframe/v1/tables/{id}/data` with the table's ID and `endOfData: true` in the JSON request body. This action sets the data table's "SupportsAppend" field to "False," making it readonly. Once a table is readonly, it cannot be reopened, so ensure you've finished appending data before setting `endOfData: true`.
        3. Remove the DataFrame Service Kafka pods from the cluster
            - Set the following three Helm values to `false` in the `systemlink-values.yaml` file:
                - `dataframeservice.ingestion.kafkaBackend.enabled`
                - `dataframeservice.kafkacluster.kafka.enabled`
                - `dataframeservice.schema-registry.enabled`
            - Run a Helm upgrade
            - Wait for the `dfs-kafka` pods to disappear from the cluster
        4. Remove the Strimzi Kafka Operator from the cluster
            - Set the following Helm value to false in the `systemlink-admin-values.yaml` file:
                - `strimzi-kafka-operator.enabled`
            - Run a Helm upgrade
        5. Remove the CRDs for the Strimzi Kafka Operator from the cluster. By design, these are not removed when the operator is uninstalled, so they need to be cleaned up manually. Run `kubectl delete -f systemlinkadmin/charts/strimzi-kafka-operator/crds` to delete the CRDs.
        6. Delete the Persistent Volume Claims (PVCs) for the Kafka-related pods. Looks for PVCs containing "dfs-kafka" in Lens.
    - After completing these steps, if you need to update SystemLink Enterprise again, you should skip steps 2 and 3 of the updating instructions for updating the Strimzi Kafka Operator CRDs, to avoid recreating the unneeded CDs.
- dataframeservice 0.14.49
    - Default memory request and limit increased from 2GB per DataFrame Service pod to 4GB. Disabling Kafka (see separate instructions) will greatly reduce overall resource usage for the cluster.
    - Since data tables created after updating won't consume additional Kafka resources, you can likely decrease the dataframeservice.kafkaconnect.spec.resources.requests.memory and/or dataframeservice.kafkacluster.kafka.resources.requests.memory values if required to fit the larger DataFrame Service pods until Kafka is disabled.
    - Note that appendable tables created prior to the update will continue to consume Kafka resources.

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
