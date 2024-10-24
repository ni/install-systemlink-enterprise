# SystemLink Enterprise release 2024-10 Release Notes

The 2024-10 release for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the release 2024-09 to the release 2024-10

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

- Changes to privileges and roles
    - Added "Routines" service role.
    - Added "Routine Maintainer" role.
    - Added "Enable" and "Disable" privileges to routines.
    - Added "Cancel notebook execution" privilege. This privilege is not currently enforced.
    - Renamed the "Modify metadata" routine privilege to "Modify routines."
    - "Notebook Execution" privilege category was renamed to "Scripts" to match the application rename
- As a result of the privilege changes above, non-admin users that could previously perform operations on Routines may not be able to any longer. These users should either be applied the "Routine Maintainer" role or have a new role created that grants Routine privileges.
- Routines must now be disabled in order to be updated unless the user has all of enable, disable, and modify privileges.
- testmonitorservice
    - Ugpraded EF Core from 6.0 to 8.0, because the support for EF 6.0 ends on Nov 12, 2024.
- userservice
    - Enabled CORS for DELETE `niauth/v1/session-keys/self` route.
- Service Registry & user service
    - Created new actions for Artifact upload, download & update routes. Used in execution & dataspace privilege definition
        - Updated data maintainer to have all artifact privileges
        - Updated system maintainer to have artifact query privilege.
        - Update collaborator to have artifact query privilege
- Notebook service - artifacts
    - Updated APIs (Create, Download & Update artifacts) to use new artifact actions.
- Notebook execution service
    - Introduced new privilege for specifying a resource profile: `notebookexecution:SpecifyResourceProfile`

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

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2024-10](https://github.com/ni/install-systemlink-enterprise/tree/2024-10/release-notes/2024-10/closed-bugs-sle-2024-10.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2024-10/release-notes/2024-10/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2024-10/release-notes/2024-10/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.30.74`

**Admin Helm Chart:** `systemlink-admin 0.30.6`

### NI Containers

alarmservice:0.5.54

assetservice:0.16.70

assetui:0.15.98_10988922

comments:0.14.9

dashboardsui:0.18.63

dataframeservice:1.10.71

dremio-ee:24.1.2

executionsui:0.18.67

feedservice:0.7.32

feedsui:0.6.66_10988921

filesui:0.19.75

grafana-auth-proxy:0.17.6

grafana-plugins:3.34.1

grafana-rbac-integrator:0.18.40

helium-dataservices-mongomigration:0.17.7

helium-dataservices:0.17.7

helium-fileingestionservices:1.8.11

helium-salt-master:1.15.6

helium-serviceregistry:0.20.18

helium-taghistoriandataretention:0.13.5

helium-taghistorianmongomigration:0.13.5

helium-taghistorianservices:0.13.5

helium-userservices:0.20.25

helium-webappservices:0.18.53

helium-webserver:0.27.32

jupyter-notebook-userpod:2.9.10

jupyterui:0.18.61

labmanagementui:0.9.115

landingpageui:0.18.63

nbexec-execution-helpers:0.18.12

nbexec-notebook-runner:0.19.12

nbexecservice:0.19.63

nbparsingservice:0.18.22

ni-grafana:v10.2.3-19a2369fad-ni

notification:0.18.16

repository:0.14.14

routineeventtrigger:0.19.10

routineexecutor:0.19.10

routinescheduletrigger:0.19.14

routineservice:0.20.25

routinesui:0.19.71

securityui:0.18.59

session-manager-service:0.21.16

sl-configurable-http-proxy:2.9.2

sl-k8s-hub:2.9.7

smtp:0.18.15

specificationmanagement:0.9.9

sysmgmtevent:0.19.15

systemsmanagementservice:0.18.23

systemsstateservice:0.8.11

systemsstatesui:0.7.88

systemsui:0.19.110

tagsui:0.14.65

testinsightsui:0.18.171

testmonitorservice:0.27.22

userdata:0.18.17

userservice-setup:0.21.0

workorder:0.9.20

### 3rd Party Containers

alpine:3.20.3

argoproj/argocli:v3.5.5-linux-amd64

argoproj/argoexec:v3.5.5-linux-amd64

argoproj/workflow-controller:v3.5.5-linux-amd64

bitnami/kubectl:1.28.2-debian-11-r16

bitnami/minio:2024.10.2-debian-12-r0

bitnami/mongodb:5.0.24-debian-11-r20

bitnami/rabbitmq:4.0.2-debian-12-r0

bitnami/redis-cluster:7.4.1-debian-12-r0

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.3.8

kiwigrid/k8s-sidecar:1.28.0

pause:3.9

swaggerapi/swagger-ui:v5.17.14

zookeeper:3.9.1
