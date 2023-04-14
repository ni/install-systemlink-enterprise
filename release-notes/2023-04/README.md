# SystemLink Enterprise 2023-04 Release Notes

The 2023-04 release bundle for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the 2023-03 to the 2023-04 release

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

- Behavior change or new feature description

- Behavior change or new feature description

## Helm Chart Breaking Changes

- userservices 0.2.0
    - Added userservices-contiuation-token secret. This secret is required for deployment and must either be defined in the Helm chart or manually configured prior to upgrade.
    - [View this configuration](link)

- webserver 0.7.0
    - Renamed the rateLimit.apiRequestsPerSecond Helm value to rateLimit.byUser.apiRequestsPerSecond. Deployments which customized the value previously will need to be updated to use the new name. (NOTE: I am not aware of any affected deployments.)
    - [View this configuration](link)

- routineservice 0.2.0
    - A feature flag for scheduled routines was removed becasue this fucntioanlity is now always enabled (The "routineservice.featureToggle.publishScheduleEvent" value has been removed from the helm chart). No user action is required
    - [View this configuration](link)

- nbexecservice 0.2.0
    - We added support to deploy s3 secrets similar with other services. Users will need to update their secret value files and remove s3 secret name overrides in helm chart.
    - [View this configuration](link)

- sl-jupyterhub 1.0.0
    - Jupyter usernames are now based on user emails instead of user IDs. This is reflected in how the Jupyter user pods and persistent volume claims are named. Since the PVC naming changed, users will lose access to their personal Jupyter notebooks and other settings in their Jupyter accounts, so a backup before upgrade is recommended. The old PVCs aren't deleted, so if data wants to be recovered, clients can opt-out and use the legacy implementation by setting this in the helm chart: sl-jupyterhub.jupyterhub.hub.extraEnv.JUPYTER_USERNAME_AS_SYSTEMLINK_USER_ID: "true" (note that "true" is a string, not a boolean value).
    - [View this configuration](link)

- sl-jupyterhub 1.0.0
    - The resource allocation for user pods changed. The guarantee (request) for CPU is 0.5, the guarantee and the limit for memory is 2G (2Gi). This are helm configurable: sl-jupyterhub.jupyterhub.singleuser.cpu.guarantee, sl-jupyterhub.jupyterhub.singleuser.memory.limit and sl-jupyterhub.jupyterhub.singleuser.memory.guarantee. (Note: Jupyter has specific notation for userpod resources, so for CPU use values like .5, 1, and for memory use values like 2G, 3G, so G instead of Gi, otherwise the pods won't start). Because of this and the previous breaking change, we bumped the major version of the helm chart.
    - [View this configuration](link)

- dataframeservice 0.8.163
    - We modified the Dremio S3 source configuration to enable a setting for automatically promoting missing datasets on query. This will make the DFS more robust in rare occasions where a dataset is deleted at the same time that someone tries to query it. It is recommended, but not required, to uptake this change. To uptake this change, delete all of the Dremio PVCs and bounce all of the Dremio pods. After doing this, a DFS pod also needs to be bounced so that the Dremio admin user can be bootstrapped.
    - [View this configuration](link)

- dataframeservice 0.8.165
    - We added a hard limit on the request body size for all requests to the DataFrame service. The value can be adjusted based on allocated pod memory and expected concurrent request volume.
    - [View this configuration](link)

- dataframeservice 0.8.195
    - We added a limit on the number of appendable tables, configurable via dataframeservice.ingestion.appendableTableLimit. The value should not be adjusted without the direction of NI, as increasing it can get Kafka Connect into a bad state. If the value is increased, dataframeservice.kafkaconnect.spec.replicas must also be increased (ratio TBD). See ni.com/r/setendofdata for more information (KB is a work-in-progress).
    - [View this configuration](link)

- dataframeservice 0.8.189
    - We added support for rate limiting requests for data ingestion. Configurable via dataframeservice.ingestion.requestsLimit. The value represents the number of concurrent requests that the service can respond to concurrently while ingesting data. If the value is increased the cpu requests of the service must increase too. When the dataframe service pods become unhealthy while ingesting data this value must be decreased.
    - [View this configuration](link)

- dataframeservice 0.8.190
    - We moved the "kafkaCleanupService" config into "ingestion.cleanupService". This is only a breaking change if a user had been overriding the defaults, and this config wasn't deemed worthy of surfacing in the user-facing values file, so there is likely no change necessary for users.
    - [View this configuration](link)

## Bugs Fixed

Only customer facing bugs have been included in this list.

[closed-bugs-sle-2023-04](https://github.com/ni/install-systemlink-enterprise/blob/2023-04/release-notes/2023-04/closed-bugs-sle-2023-04.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2023-04/release-notes/2023-04/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2023-04/release-notes/2023-04/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.12.72`

**Admin Helm Chart:** `systemlink-admin 0.12.7`

### NI Containers

dashboardsui/20230403.2

dataframeservice-kafka-connect/20230323.3

dataframeservice/20230406.31

dremio-apache/23.0.1-ni-0

executionsui/20230406.1

filesui/20230407.1

grafana-auth-proxy/20230404.4

grafana-rbac-integrator/20230403.3

helium-fileingestionservices/7822f09ae5f5583d5e6b5e321b3a3c69c21612c6.1

helium-serviceregistry/5c5a64527ad06366f333648b333d2ae1bf05a41c.1

helium-userservices/3d7de48018ab02a2dd7522a48c1c1b27d3a7fbbb.1

helium-webappservices/e8e6ca128201a506c0207a39d063a93bfdc01993.1

helium-webserver/daccc5468f3d266a37b44e925197d2ed862d931c.1

jupyter-notebook-userpod/20230329.2

jupyterui/20230407.1

landingpageui/20230407.2

license/20230405.5

nbexec-execution-helpers/20230330.1

nbexec-notebook-runner/20230330.2

nbexecservice/20230405.8

nbparsingservice/20230329.1

ni-grafana/v9.4.1-ea9740b6e4-ni

notification/20230405.2

routineeventtrigger/20230407.4

routineexecutor/20230406.4

routinescheduletrigger/20230406.4

routineservice/20230406.4

routinesui/20230405.4

saltmaster-init/20230329.7

saltmaster/20230329.7

securityui/0cc21b5c24e41f848c900d2113509e5fe2c28237.1

session-manager-service/20230406.2

sl-configurable-http-proxy/20230330.5

sl-k8s-hub/20230329.2

smtp/20230406.2

sysmgmtevent/20230403.2

systemsmanagementservice/20230405.11

systemsui/20230407.5

testinsightsui/20230406.10

testmonitorservice/20230403.13

userdata/20230407.1

userservice-setup/20230403.2


### Non Container/Chart Artifacts

systemlink-notebook-datasource/1.1.1.zip

systemlink-dataframe-datasource/1.6.2.zip

plotly-panel/1.1.2.zip


### 3rd Party Containers

argoproj/argocli/v3.3.8-linux-amd64

argoproj/argoexec/v3.3.8-linux-amd64

argoproj/workflow-controller/v3.3.8-linux-amd64

bats/bats/1.9.0

bitnami/minio/2023.3.24-debian-11-r1

bitnami/mongodb/5.0.15-debian-11-r11

bitnami/rabbitmq/3.11.13-debian-11-r0

bitnami/redis-cluster/7.0.10-debian-11-r2

bitnami/schema-registry/7.3.2-debian-11-r6

busybox/sha256__51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter/2.0.0

kiwigrid/k8s-sidecar/1.23.1

kube-scheduler/v1.23.10

pause/3.8

provectuslabs/kafka-ui/v0.6.1

zookeeper/3.8.1-temurin

strimzi/jmxtrans/0.34.0

strimzi/kafka-bridge/0.25.0

strimzi/kafka/0.34.0-kafka-3.3.1

strimzi/kafka/0.34.0-kafka-3.3.2

strimzi/kafka/0.34.0-kafka-3.4.0

strimzi/kaniko-executor/0.34.0

strimzi/maven-builder/0.34.0

strimzi/operator/0.34.0
