# SystemLink Enterprise 2023-04 Release Notes

The 2023-04 release for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the 2023-03 to the 2023-04 release

- JupyterHub user pod PVCs incorporate a user's email address in the PVC name.
    - This allows you to associate users with JupyterHub PVCs so you can safely remove unused PVCs.
    - This change removes user access to personal Jupyter notebooks and other settings in their JupyterHub instance. Ensure that you create backups of this content before upgrading.
    - Users are encouraged to backup their personal Jupyter notebooks locally prior to upgrading.
    - Old PVCs are not automatically deleted and can be recovered.
    - You can opt-out of this new behavior.
    - This change does not affect notebooks [published](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/sharing-a-jupyter-notebook.html) to SystemLink
    - Refer to **`sl-jupyterhub 1.0.0` PVC name change** in **Helm Chart Breaking Changes** for details.

## New Features and Behavior changes

- You can use data spaces to find and visualize a subset of your test result data. This allows you to interactively slice data to diagnose issues or discover trends that may not obvious without visual inspection.

- The DataFrame Service now uses streaming data deserialization
    - Use larger batch sizes (more rows per write) to take advantage of the improved service performance.

- The Dremio S3 source configuration has been modified to automatically promote missing data sets on query.
    - This results in improved reliability in scenarios where a dataset is deleted at the same time it is queried.
    - To uptake this change delete all Dremio PVCs and restart all Dremio and DataFrame Service pods.

- The DataFrame Service has new limits intended to ensure availability of the service

    | Category               | Default Limit                                             | Error returned at limit                          |  Details                                          | Prevention                                                                               |
    |------------------------|-----------------------------------------------------------|--------------------------------------------------|---------------------------------------------------|------------------------------------------------------------------------------------------|
    | Ingestion Request Size | `dataframeservice.requestBodySizeLimitMegabytes: 256`     | Ingestion requests fail with HTTP 413            | The client sent too much data in a single request. | Ingest data in smaller batch sizes.                                                       |
    | Ingestion Rate         | `dataframeservice.rateLimits.ingestion.requestsLimit: 20` | Ingestion requests fail with HTTP 429            | There are too many concurrent requests for a single pod. If this limit's value is increased the CPU requests for the DataFrame Service must also be increased.     | Clients should implement retry logic with exponential back off.                           |
    | Append-able Tables      | `dataframeservice.ingestion.appendableTableLimit: 250`   | Table creation or ingestion fail with HTTP 409   | There are too many open data tables. This value should not be adjusted without the direction of NI. Increasing this limit may cause Kafka Connect to enter a bad state. Refer to [support documentation](ni.com/r/setendofdata) for additional information. [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-04/getting-started/templates/systemlink-values.yaml#L512).               | Mark `endOfData` on data tables that are complete. |

- You can filter the steps grid by step and measurement name.

- The default image pull policy for `argo-workflows` has changed from `always` to `IfNotPresent`.

- The executions grid groups by status by default.

- Schedule routines are enabled by default.
    - The feature flag `routineservice.featureToggle.publishScheduleEvent` has been removed from the SystemLink Helm chart.

## Helm Chart Breaking Changes

- `sl-jupyterhub 1.0.0` PVC name change
    - You can opt-out of this behavior by setting `sl-jupyterhub.jupyterhub.hub.extraEnv.JUPYTER_USERNAME_AS_SYSTEMLINK_USER_ID: "true"`.
    - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-04/getting-started/templates/systemlink-values.yaml#L713)

- `sl-jupyterhub 1.0.0` resource allocation
    - The default resource allocation for JupyterHub user pods has changed.
    - The default CPU request is now `0.5`.
        - Set `sl-jupyterhub.jupyterhub.singleuser.cpu.guarantee` to override this request as needed.
    - The default memory request and limit it now `2G`.
        - Note the `G` notation used rather than `Gi` used by other resources.
        - Set `sl-jupyterhub.jupyterhub.singleuser.memory.limit` and `sl-jupyterhub.jupyterhub.singleuser.memory.guarantee` to override this limit as needed.
            - Ensure these two configurations are set to the same value.

- `userservices 0.2.0`
    - New `userservices-continuation-token` secret.
    - This secret is required and must either be defined in the Helm chart or manually configured prior to upgrade.
    - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-04/getting-started/templates/systemlink-secrets.yaml#L111)

- `webserver 0.7.0`
    - The `rateLimit.apiRequestsPerSecond` Helm value is renamed to `rateLimit.byUser.apiRequestsPerSecond`.
    - Deployments that set the old value must be be updated to use the new value.

- `nbexecservice 0.2.0`
    - S3 secrets used by this service are deployed by Helm.
    - You will need to update your secret value files and remove s3 secret name overrides.
    - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-04/getting-started/templates/systemlink-secrets.yaml#L287)

- `dataframeservice 0.8.195` Kakfa configuration
    - `kafkaCleanupService` configuration has been moved into `ingestion.cleanupService`.
    - This is not a breaking change unless this value was previously used to override defaults..

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
