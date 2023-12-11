# SystemLink Enterprise 2023-12 Release Notes

The 2023-12 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- `systemsui`
    - Configuring feeds on a system has been enabled in the System Details Page.
    - Reinstalling packages is available in the Software Page.

- `saltmaster`
    - SaltMaster service now supports the v2 of the salt communication model.
    - Starting with SystemLink Enterprise 2023-12 you will be able to connect systems that have SystemLink Client 2024 Q1 (24.0) or newer installed.
    - Starting with 2024 Q1 (24.0), the SystemLink Client will use the v2 and it will only be compatible with the versions of SaltMaster that are implementing v2.

- `tagsui`
    - The Utilities section now includes a new Tags application, which allows end users to view tags in their organization.

## Helm Chart Breaking Changes

- `smtp`
    - The SMTP service now enforces limits on the size of individual messages. These limits can be configured in the Helm values file - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-12/getting-started/templates/systemlink-values.yaml#L912).
        - `smtp.messages.maxRecipients` - Maximum number of recipients for a message (default is 100)
        - `smtp.messages.maxBodyBytes` - Maximum length of the message body in bytes (defaults to 1 Megabyte)
        - `smtp.messages.maxSubjectBytes` - Maximum length of the subject line in bytes (defaults to 10 kilobytes)
    - Additionally, the SMTP service now requires that the subject line of a message contain at least one non-whitespace character.

- `dataframeservice`
    - Support for Kafka-based data table ingestion has been removed.
    - Any appendable tables that are still backed by Kafka will become read-only on upgrade.
    - If the Kafka is still enabled on your cluster, first review the information in the 2023-10 release notes on the procedure for removing Kafka and on when Kafka can safely be disabled prior to installing this update.
    - The following Helm values are obsolete and should be removed from YAML values files:
        - `dataframeservice.ingestion.appendableTableLimit`
        - `dataframeservice.ingestion.producer.*`
        - `dataframeservice.ingestion.kafkaBackend.*`
        - `dataframeservice.kafkacluster.*`
        - `dataframeservice.kafka-ui.*`
        - `dataframeservice.schema-registry.*`
        - `dataframeservice.kafkaconnect.*`

- `systemlinkadmin`
    - The Kafka operator has been removed (previously an optional dependency enabled by default).
    - Any appendable data tables that are still backed by Kafka will become read-only on upgrade.
    - If the operator is still enabled on your cluster, first review the information in the 2023-10 release notes on the procedure for removing Kafka and on when Kafka can safely be disabled prior to installing this update.
    - Helm values under the `strimzi-kafka-operator` key are obsolete and should be removed from YAML values files.

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
|------------------|-------------------------------------|------------------------------------|
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | current                            |

Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed instructions on how to safely upgrade the version of the RabbitMQ dependency.

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2023-12](https://github.com/ni/install-systemlink-enterprise/tree/2023-12/release-notes/2023-12/closed-bugs-sle-2023-12.xlsx)

## Software Bill of Materials and Notices

- [SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2023-12/release-notes/2023-12/sbom)
- [Notices](https://github.com/ni/install-systemlink-enterprise/tree/2023-12/release-notes/2023-12/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.20.46`

**Admin Helm Chart:** `systemlink-admin 0.20.7`

### NI Containers

assetservice:0.6.55

assetui:0.5.80

comments:0.3.21

dashboardsui:0.8.46

dataframeservice:1.0.5

dremio-ee:24.1.2

executionsui:0.8.49

filesui:0.9.56

grafana-auth-proxy:20230404.4

grafana-plugins:3.9.1

grafana-rbac-integrator:0.8.3

helium-dataservices:0.7.7

helium-fileingestionservices:0.11.7

helium-salt-master:1.5.17

helium-serviceregistry:0.8.9

helium-taghistoriandataretention:0.3.7

helium-taghistorianservices:0.3.7

helium-userservices:0.8.7

helium-webappservices:0.7.6

helium-webserver:0.15.7

jupyter-notebook-userpod:2.1.4

jupyterui:0.8.45

landingpageui:0.8.48

license:0.8.15

licensesui:0.5.46

nbexec-execution-helpers:0.9.5

nbexec-notebook-runner:0.9.7

nbexecservice:0.9.14

nbparsingservice:0.8.11

ni-grafana:v9.5.12-61b4dd6cfd-ni

notification:0.8.7

repository:0.4.11

routineeventtrigger:0.9.4

routineexecutor:0.9.3

routinescheduletrigger:0.9.3

routineservice:0.10.5

routinesui:0.9.55

securityui:0.8.39

session-manager-service:0.9.6

sl-configurable-http-proxy:2.1.3

sl-k8s-hub:2.1.7

smtp:0.8.4

sysmgmtevent:0.9.8

systemsmanagementservice:0.8.11

systemsui:0.9.92

tagsui:0.4.47

testinsightsui:0.8.102

testmonitorservice:0.17.5

userdata:0.8.8

userservice-setup:0.9.1

### 3rd Party Containers

alpine:3.18.4

argoproj/argocli:v3.4.11-linux-amd64

argoproj/argoexec:v3.4.11-linux-amd64

argoproj/workflow-controller:v3.4.11-linux-amd64

bitnami/kubectl:1.28.2-debian-11-r16

bitnami/minio:2023.11.20-debian-11-r0

bitnami/mongodb:5.0.22-debian-11-r0

bitnami/mongodb:5.0.23-debian-11-r0

bitnami/rabbitmq:3.12.10-debian-11-r0

bitnami/redis-cluster:7.2.3-debian-11-r1

busybox:stable@sha256:023917ec6a886d0e8e15f28fb543515a5fcd8d938edb091e8147db4efed388ee

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.1.0

kiwigrid/k8s-sidecar:1.25.3

kube-scheduler:v1.26.9

pause:3.9

swaggerapi/swagger-ui:v5.10.3

zookeeper:3.8.1-temurin
