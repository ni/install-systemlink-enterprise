# SystemLink Enterprise release 2025-01 Release Notes

The 2025-01 release for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- Use [dynamic form fields](https://ni.com/docs/en-US/bundle/systemlink-enterprise/page/adding-custom-fields-to-the-ui.html) to add custom input fields to the user interface. You can add fields to the configuration slide-out of the following resources.
    - Assets
    - Products
    - Systems
    - Test Plans
    - Work Orders
- Dynamic form field privileges are available in the **Roles** application.
    - The _Data maintainer_ and _Systems maintainer_ roles now include privileges to manage dynamic form fields
- [Host web applications](https://ni.com/docs/en-US/bundle/systemlink-enterprise/page/hosting-a-web-application.html).
- Preview your text, image, audio, and video files.
- Filter the list of test plans you see based on their status or their metadata. Navigate to Operations » Test Plans and click the summary tiles at the top of the page.
- [Adjust the default rate limits](https://ni.com/docs/en-US/bundle/systemlink-enterprise/page/configuring-jupyter-notebook-limits.html) for Jupyter Notebook operations.
- MinIO is no longer installed with the top-level SLE Helm chart.
    - MinIO should be used only during product evaluations when no other block storage solution are available.
    - You can install MinIO independently of the SLE application.
    - Refer to the [installation and upgrade guide](https://github.com/ni/install-systemlink-enterprise/tree/2025-01/getting-started/templates/Dependencies/MinIO).
- Renamed the **Download files** privileges to **Preview and download files**.
- Enabled Cross origin requests by default in the DataFrame service. You can control the list of origins in the top-level Helm chart.
- Exposed an API to cancel notebook executions.
    - Removed **Cancel notebook executions** privileges from the _Data Maintainer_ role.
- Install software and configure feeds on multiple systems.

## Helm Chart Breaking Changes

- None

## Upgrade Considerations

- `workorder 0.12.23`
    - User-friendly IDs have been introduced for test plan templates, resulting in a breaking change from the previous versions.
    - Migration job will run during the Helm upgrade, with brief downtime depending on the number of existing templates and plans.

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of SystemLink Enterprise. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
|------------------|-------------------------------------|------------------------------------|
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | 0.29.56                            |
| 4.0.x            | 0.30.74                             | current                            |

## Bugs Fixed

- [closed-bugs-sle-2025-01](https://github.com/ni/install-systemlink-enterprise/tree/2025-01/release-notes/2025-01/closed-bugs-sle-2025-01.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2025-01/release-notes/2025-01/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2025-01/release-notes/2025-01/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.33.46`

**Admin Helm Chart:** `systemlink-admin 0.33.4`

### NI Containers

alarmservice:0.8.59

assetservice:0.19.18

assetui:0.18.81

comments:0.17.11

dashboardsui:0.21.35

dataframeservice:1.13.51

dremio-ee:24.1.2

dynamicformfields:0.2.18

executionsui:0.21.36

feedservice:0.10.33

feedsui:0.9.51

filesui:0.22.78

grafana-auth-proxy:0.21.7

grafana-plugins:3.43.6

grafana-rbac-integrator:0.21.14

helium-dataservices-mongomigration:0.20.32

helium-dataservices:0.20.32

helium-fileingestionservices:1.11.16

helium-salt-master:1.18.10

helium-serviceregistry:0.24.13

helium-taghistoriandataretention:0.16.10

helium-taghistorianmongomigration:0.16.10

helium-taghistorianservices:0.16.10

helium-userservices:0.24.11

helium-webappservices:0.22.43

helium-webserver:0.31.32

jupyter-notebook-userpod:2.12.9

jupyterui:0.21.30

labmanagementui:0.12.76

landingpageui:0.21.31

nbexec-execution-helpers:0.22.7

nbexec-notebook-runner:0.22.14

nbexecservice:0.22.46

nbparsingservice:0.21.8

ni-grafana:v10.2.3-c2d2d1c81f-ni

notification:0.21.12

repository:0.17.19

routineeventtrigger:0.22.11

routineexecutor:0.22.9

routinescheduletrigger:0.22.6

routineservice:0.23.17

routinesui:0.22.47

securityui:0.21.30

session-manager-service:0.25.17

sl-configurable-http-proxy:2.12.9

sl-k8s-hub:2.12.8

smtp:0.21.9

specificationmanagement:0.12.10

sysmgmtevent:0.22.14

systemsmanagementservice:0.21.6

systemsstateservice:0.11.11

systemsstatesui:0.10.57

systemsui:0.22.103

tagsui:0.17.35

testinsightsui:0.21.100

testmonitorservice:0.30.10

userdata:0.21.16

userservice-setup:0.25.6

webapphostui:0.20.118

workorder:0.12.23

### 3rd Party Containers

alpine:3.20.3

argoproj/argocli:v3.5.5-linux-amd64

argoproj/argoexec:v3.5.5-linux-amd64

argoproj/workflow-controller:v3.5.5-linux-amd64

bitnami/kubectl:1.29.1-debian-11-r16

bitnami/mongodb:5.0.24-debian-11-r20

bitnami/rabbitmq:4.0.5-debian-12-r0

bitnami/redis-cluster:7.4.2-debian-12-r0

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.3.8

kiwigrid/k8s-sidecar:1.29.0

pause:3.9

swaggerapi/swagger-ui:v5.17.14

zookeeper:3.9.3
