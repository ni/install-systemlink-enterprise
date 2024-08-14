# SystemLink Enterprise release 2024-08 Release Notes

The 2024-08 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- Behavior change or new feature description

- Behavior change or new feature description

## Helm Chart Breaking Changes

- Chart Name and version
    - Description of breaking change.

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
|------------------|-------------------------------------|------------------------------------|
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | current                            |

## Bugs Fixed

<!-- This section should link to the excel document that list customer facing bugs, fixed in the current release. The URL for the release (tag) should be used. -->

Only customer facing bugs have been included in this list.

[link to closed bugs](link to closed bugs)

## Software Bill of Materials and Notices

<!-- This section should link to the directories containing notices and SBOM. The URL for the release (tag) should be used. -->

[SBOM](link to SBOM)

[Notices](link to SBOM)

## Versions

**Top Level Helm Chart:** `systemlink 0.28.58`

**Admin Helm Chart:** `systemlink-admin 0.28.2`

### NI Containers

alarmservice:0.3.33

assetservice:0.14.33

assetui:0.13.33

comments:0.12.4

dashboardsui:0.16.16

dataframeservice:1.8.61_10113643

dremio-ee:24.1.2

executionsui:0.16.30

feedservice:0.5.31

feedsui:0.4.59

filesui:0.17.53

grafana-auth-proxy:0.12.0

grafana-plugins:3.10.1

grafana-rbac-integrator:0.16.9

helium-dataservices-mongomigration:0.15.0

helium-dataservices:0.15.0

helium-fileingestionservices:1.6.10

helium-salt-master:1.11.7

helium-serviceregistry:0.18.8

helium-taghistoriandataretention:0.11.1

helium-taghistorianmongomigration:0.11.1

helium-taghistorianservices:0.11.1

helium-userservices:0.18.3

helium-webappservices:0.16.1

helium-webserver:0.25.19

jupyter-notebook-userpod:2.6.3

jupyterui:0.16.20

labmanagementui:0.7.104

landingpageui:0.16.40

nbexec-execution-helpers:0.14.14

nbexec-notebook-runner:0.16.3

nbexecservice:0.17.31

nbparsingservice:0.16.16

ni-grafana:v10.2.3-19a2369fad-ni

notification:0.16.7

repository:0.12.14

routineeventtrigger:0.17.8

routineexecutor:0.17.4

routinescheduletrigger:0.17.8

routineservice:0.18.8

routinesui:0.17.36

securityui:0.16.37

session-manager-service:0.19.3

sl-configurable-http-proxy:2.5.3

sl-k8s-hub:2.5.9

smtp:0.16.8

specificationmanagement:0.7.4

sysmgmtevent:0.17.9

systemsmanagementservice:0.16.19

systemsstateservice:0.6.14

systemsstatesui:0.5.64

systemsui:0.17.95

tagsui:0.12.17

testinsightsui:0.16.106

testmonitorservice:0.25.16

userdata:0.16.14

userservice-setup:0.19.0

workorder:0.7.43

### 3rd Party Containers

alpine:3.20.1

argoproj/argocli:v3.5.5-linux-amd64

argoproj/argoexec:v3.5.5-linux-amd64

argoproj/workflow-controller:v3.5.5-linux-amd64

bitnami/kubectl:1.28.2-debian-11-r16

bitnami/minio:2024.7.29-debian-12-r0

bitnami/mongodb:5.0.24-debian-11-r20

bitnami/rabbitmq:3.13.6-debian-12-r1

bitnami/redis-cluster:7.2.5-debian-12-r4

busybox:stable@sha256:50aa4698fa6262977cff89181b2664b99d8a56dbca847bf62f2ef04854597cf8

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.3.7

kiwigrid/k8s-sidecar:1.27.5

pause:3.9

swaggerapi/swagger-ui:v5.17.14

zookeeper:3.9.1
