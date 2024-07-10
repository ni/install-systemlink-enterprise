# SystemLink Enterprise release 2024-07 Release Notes

The 2024-07 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- Behavior change or new feature description
- `helium-serviceregistry 0.16.7`
    - The Alarm Service privileges are exposed under the `Alarms` category in the security UI.
- `testmonitorservice 0.24.22`
    - Products have workspaces.
    - This update includes a PostgreSQL migration to add workspaces to each product.
    - New helm chart values are added to facilitate this migration.
        - This includes a new required whitelisted API key secret used to retrieve workspace information used during the migration.
        - The migration should complete quickly automatically after deployment with no required manual intervention.
        - After upgrading, downgrading to prior versions is not supported.

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
|------------------|-------------------------------------|------------------------------------|
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | current                            |

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2024-07](https://github.com/ni/install-systemlink-enterprise/tree/2024-07/release-notes/2024-07/closed-bugs-sle-2024-07.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2024-07/release-notes/2024-07/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2024-07/release-notes/2024-07/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.27.62`

**Admin Helm Chart:** `systemlink-admin 0.27.3`

### NI Containers

alarmservice:0.2.34

assetservice:0.13.12

assetui:0.12.34

comments:0.11.4

dashboardsui:0.15.25

dataframeservice:1.7.47

dremio-ee:24.1.2

executionsui:0.15.24

feedservice:0.4.31

feedsui:0.3.78

filesui:0.16.33

grafana-auth-proxy:0.12.0

grafana-plugins:3.10.1

grafana-rbac-integrator:0.15.2

helium-dataservices-mongomigration:0.14.2

helium-dataservices:0.14.2

helium-fileingestionservices:1.5.4

helium-salt-master:1.11.7

helium-serviceregistry:0.16.7

helium-taghistoriandataretention:0.10.2

helium-taghistorianmongomigration:0.10.2

helium-taghistorianservices:0.10.2

helium-userservices:0.16.6

helium-webappservices:0.14.10

helium-webserver:0.23.28

jupyter-notebook-userpod:2.6.3

jupyterui:0.15.24

labmanagementui:0.6.64

landingpageui:0.15.29

nbexec-execution-helpers:0.14.14

nbexec-notebook-runner:0.16.3

nbexecservice:0.16.17

nbparsingservice:0.15.9

ni-grafana:v10.2.3-19a2369fad-ni

notification:0.15.9

repository:0.11.8

routineeventtrigger:0.16.9

routineexecutor:0.16.6

routinescheduletrigger:0.16.10

routineservice:0.17.10

routinesui:0.16.27

securityui:0.15.30

session-manager-service:0.17.11

sl-configurable-http-proxy:2.5.3

sl-k8s-hub:2.5.9

smtp:0.15.5

specificationmanagement:0.6.7

sysmgmtevent:0.16.7

systemsmanagementservice:0.15.11

systemsstateservice:0.5.7

systemsstatesui:0.4.40

systemsui:0.16.57

tagsui:0.11.29

testinsightsui:0.15.78

testmonitorservice:0.24.22

userdata:0.15.11

userservice-setup:0.17.1

workorder:0.6.28

### 3rd Party Containers

alpine:3.20.1

argoproj/argocli:v3.5.5-linux-amd64

argoproj/argoexec:v3.5.5-linux-amd64

argoproj/workflow-controller:v3.5.5-linux-amd64

bitnami/kubectl:1.28.2-debian-11-r16

bitnami/minio:2024.6.29-debian-12-r1

bitnami/mongodb:5.0.24-debian-11-r20

bitnami/rabbitmq:3.13.2-debian-12-r4

bitnami/redis-cluster:7.2.5-debian-12-r0

busybox:stable@sha256:50aa4698fa6262977cff89181b2664b99d8a56dbca847bf62f2ef04854597cf8

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.3.7

kiwigrid/k8s-sidecar:1.27.4

pause:3.9

swaggerapi/swagger-ui:v5.17.14

zookeeper:3.9.1
