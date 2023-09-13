
# SystemLink Enterprise release 2023-09 Release Notes

The 2023-09 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- Systems Management
    - You can install and uninstall software on a managed system from the Systems Management web application.
- Dataframe Service
    - The maximum number of simultaneous connections from a DataFrame service pod to S3 storage can be configured with `dataframeservice.s3.maximumConnections`. Previously, the service limited connections to 6. The new default is 32.

## Helm Chart Breaking Changes

- Comments service
    - The Comments service Helm chart is now included in the the SystemLink top level chart. This chart requires a new MongoDB secret.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-09/getting-started/templates/systemlink-secrets.yaml#L545)
    - The UIs that leverage this service have not yet been included in the product.

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

- [closed-bugs-sle-2023-09](https://github.com/ni/install-systemlink-enterprise/tree/2023-09/release-notes/2023-09/closed-bugs-sle-2023-09.xlsx)

## Software Bill of Materials and Notices

- [SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2023-09/release-notes/2023-09/sbom)
- [Notices](https://github.com/ni/install-systemlink-enterprise/tree/2023-09/release-notes/2023-09/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.17.56`

**Admin Helm Chart:** `systemlink-admin 0.17.7`

### NI Containers

assetservice:0.3.44

assetui:0.2.303

comments:0.1.154

dashboardsui:0.5.31

dataframeservice-kafka-connect:20230323.3

dataframeservice:0.13.63

dremio-ee:24.1.2

executionsui:0.5.19

filesui:0.6.31

grafana-auth-proxy:20230404.4

grafana-plugins:2.1.0

grafana-rbac-integrator:0.5.13

helium-dataservices:0.4.11

helium-fileingestionservices:0.8.6

helium-salt-master:d4b05f93688bce0f99945b82199fced5e03eface.1

helium-serviceregistry:0.5.9

helium-userservices:0.5.14

helium-webappservices:0.4.8

helium-webserver:0.12.13

jupyter-notebook-userpod:20230825.4

jupyterui:0.5.19

landingpageui:0.5.25

license:0.5.38

licensesui:0.2.37

nbexec-execution-helpers:20230912.1

nbexec-notebook-runner:20230905.2

nbexecservice:0.6.29

nbparsingservice:0.5.6

ni-grafana:v9.5.8-ed05e1eca2-ni

notification:0.5.17

repository:0.1.89

routineeventtrigger:0.6.11

routineexecutor:0.6.6

routinescheduletrigger:0.6.11

routineservice:0.7.10

routinesui:0.6.17

securityui:0.5.25

session-manager-service:0.6.16

sl-configurable-http-proxy:20230823.1

sl-k8s-hub:20230825.2

smtp:0.5.13

sysmgmtevent:0.6.14

systemsmanagementservice:0.5.21

systemsui:0.6.74

tagsui:0.1.127

testinsightsui:0.5.138

testmonitorservice:0.14.17

userdata:0.5.15

userservice-setup:0.6.2

### 3rd Party Containers

argoproj/argocli:v3.3.8-linux-amd64

argoproj/argoexec:v3.3.8-linux-amd64

argoproj/workflow-controller:v3.3.8-linux-amd64

bitnami/minio:2023.7.18-debian-11-r0

bitnami/mongodb:5.0.19-debian-11-r19

bitnami/rabbitmq:3.12.4-debian-11-r0

bitnami/redis-cluster:7.0.10-debian-11-r2

bitnami/schema-registry:7.4.1-debian-11-r7

busybox:stable@sha256:023917ec6a886d0e8e15f28fb543515a5fcd8d938edb091e8147db4efed388ee

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

busybox:stable@sha256:5cd3db04b8be5773388576a83177aff4f40a03457a63855f4b9cbe30542b9a43

busybox:stable@sha256:67a8ef886e2ca4055f00e7cd13aedb9b24148c1451a6832d16fcc997a157eedc

jupyterhub/k8s-image-awaiter:2.0.0

kiwigrid/k8s-sidecar:1.25.0

kube-scheduler:v1.23.10

pause:3.8

provectuslabs/kafka-ui:v0.7.1

zookeeper:3.8.1-temurin

strimzi/kafka:0.34.0-kafka-3.4.0

strimzi/operator:0.34.0
