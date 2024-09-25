# SystemLink Enterprise release 2024-09 Release Notes

The 2024-09 release for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- Navigate to **Operations** » **Schedule** to view the test plans scheduled across all systems in timeline view
    - [Viewing Scheduled Test Plans](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/viewing-scheduled-test-plans.html).

- Use the following new features when [visualizing data tables in data spaces](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/visualizing-data-tables-in-a-data-space.html).
    - Search for columns to plot from the axis selection grid.
    - Color traces by data table and by column metadata.

- Support for [Private Certificate Authorities](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/private-certificate-authorities.html).
    - Connect to MongoDB and S3 compatible interfaces that use certificates signed by a private authority.
        - Trusted certificates specified at `global.trustedCertificatesSecrets` are now installed on containers that connect to MongoDB and S3 compatible interfaces. These certificates are used when connecting to these external dependencies.
        - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-09/getting-started/templates/systemlink-values.yaml#L113)
    - Call SystemLink APIs from Jupyter Notebook when the SystemLink API endpoint is configured to use a certificate signed by a private authority.
        - Trusted certificates specified at `global.apiHostCertificateSecret` are now installed on containers that run Jupyter notebooks. These certificates are used when calling SystemLink or other external APIs from notebooks.
        - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-09/getting-started/templates/systemlink-values.yaml#L119)
    - Systems Management Service support for deploying a privately signed root certificate authority to all managed systems.
        - Trusted certificates specified at `global.apiHostCertificateSecret` can be automatically deployed to managed systems.
        - Set `global.deployApiHostCertificateToSystems` to `true` to enable automatic deployment.
        - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-09/getting-started/templates/systemlink-values.yaml#L125)

- Adjust how long the SystemLink Enterprise Alarm Service keeps your alarms - [Configuring Alarm Retention](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/configuring-alarm-retention.html).
    - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-09/getting-started/templates/systemlink-values.yaml#L469)

- Adjust how many alarms you can create in the SystemLink Enterprise Alarm Service - [Configuring Alarm Limits](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/configuring-alarm-limits.html).
    - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-09/getting-started/templates/systemlink-values.yaml#L484)

- Learn about the [performance metrics for the Dashboard Host Alarm Service](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/performance-metrics-dashboard-host-service.html).

- The privilege **List published notebooks in SystemLink and download published notebooks into the Jupyter development environment** was split to **List available notebooks** and **List published notebooks in SystemLink and download published notebooks into the Jupyter development environment**.
    - These privileges are enabled by default for Collaborator, Data Maintainer, and Systems Maintainer built-in roles.
    - For the Automated Agent, the **List published notebooks in SystemLink and download published notebooks into the Jupyter development environment** privilege will be removed, as the Automated Agent should not need to download the notebooks content.

- API calls to create, list, download, query and delete notebooks from the WebApp service are rate limited.

## Helm Chart Breaking Changes

- `dataframeservice:1.9.38`, `dremio-ee:24.1.2`
    - Support was added for configuring custom CA certificates to connect to S3 and MongoDB through the `global.trustedCertificatesSecrets` YAML value.
        - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-09/getting-started/templates/systemlink-values.yaml#L113)
    - This may conflict with the use of `extraInitContainers`, `extraVolumes`, and `extraVolumeMounts` to manually add certificates to containers.
    - When setting `global.trustedCertificatesSecrets`, you must also remove `dataframeservice.extraInitContainers`, `dataframeservice.extraVolumes`, `dataframeservice.extraVolumeMounts`, `dataframeservice.sldremio.extraInitContainers`, `dataframeservice.sldremio.extraVolumes`, and `dataframeservice.sldremio.extraVolumeMounts` that are related to configuring certificates.

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
| ---------------- | ----------------------------------- | ---------------------------------- |
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | current                            |

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2024-09](https://github.com/ni/install-systemlink-enterprise/tree/2024-09/release-notes/2024-09/closed-bugs-sle-2024-09.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2024-09/release-notes/2024-09/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2024-09/release-notes/2024-09/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.29.56`

**Admin Helm Chart:** `systemlink-admin 0.29.3`

### NI Containers

alarmservice:0.4.37

assetservice:0.15.65

assetui:0.14.65

comments:0.13.3

dashboardsui:0.17.44

dataframeservice:1.9.38

dremio-ee:24.1.2

executionsui:0.17.48

feedservice:0.6.15

feedsui:0.5.54

filesui:0.18.53

grafana-auth-proxy:0.17.6

grafana-plugins:3.12.1

grafana-rbac-integrator:0.17.16

helium-dataservices-mongomigration:0.16.3

helium-dataservices:0.16.3

helium-fileingestionservices:1.7.4

helium-salt-master:1.14.0

helium-serviceregistry:0.19.25

helium-taghistoriandataretention:0.12.5

helium-taghistorianmongomigration:0.12.5

helium-taghistorianservices:0.12.5

helium-userservices:0.19.7

helium-webappservices:0.17.18

helium-webserver:0.26.21

jupyter-notebook-userpod:2.8.3

jupyterui:0.17.40

labmanagementui:0.8.85

landingpageui:0.17.38

nbexec-execution-helpers:0.18.12

nbexec-notebook-runner:0.18.5

nbexecservice:0.18.32

nbparsingservice:0.17.19

ni-grafana:v10.2.3-19a2369fad-ni

notification:0.17.7

repository:0.13.12

routineeventtrigger:0.18.9

routineexecutor:0.18.8

routinescheduletrigger:0.18.5

routineservice:0.19.5

routinesui:0.18.39

securityui:0.17.40

session-manager-service:0.20.13

sl-configurable-http-proxy:2.5.3

sl-k8s-hub:2.5.9

smtp:0.17.9

specificationmanagement:0.8.8

sysmgmtevent:0.18.10

systemsmanagementservice:0.17.18

systemsstateservice:0.7.8

systemsstatesui:0.6.45

systemsui:0.18.85

tagsui:0.13.48

testinsightsui:0.17.115

testmonitorservice:0.26.18

userdata:0.17.7

userservice-setup:0.20.0

workorder:0.8.25

### 3rd Party Containers

alpine:3.20.2

argoproj/argocli:v3.5.5-linux-amd64

argoproj/argoexec:v3.5.5-linux-amd64

argoproj/workflow-controller:v3.5.5-linux-amd64

bitnami/kubectl:1.28.2-debian-11-r16

bitnami/minio:2024.8.26-debian-12-r0

bitnami/mongodb:5.0.24-debian-11-r20

bitnami/rabbitmq:3.13.7-debian-12-r2

bitnami/redis-cluster:7.4.0-debian-12-r1

busybox:stable@sha256:50aa4698fa6262977cff89181b2664b99d8a56dbca847bf62f2ef04854597cf8

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.3.7

kiwigrid/k8s-sidecar:1.27.5

pause:3.9

swaggerapi/swagger-ui:v5.17.14

zookeeper:3.9.1
