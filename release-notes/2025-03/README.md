# SystemLink Enterprise 2025-03 Release Notes

The 2025-03 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## Upgrading from the 2025-02 to the 2025-03

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

- Behavior change or new feature description

- Behavior change or new feature description

## Helm Chart Breaking Changes

- `feedservice:0.12.56`
  - The S3 settings are now under 'storage'. The previously used S3 settings under 'feedservice' will continue to work, but are now deprecated.
    - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2025-03/getting-started/templates/systemlink-values.yaml#L850)
- `workorder:0.14.34`
  - The first class property 'slotIds' in the schedule test plans API is renamed to 'fixtureIds' to avoid the confusion on the terminology used across industries/domain areas.
- `sl-jupyterhub 2.16.16`
  - The chart now require Kubernetes 1.28+
  - Notebooks are now running on Python 3.12
    - [View "Deprecated" section in the release notes for Python 3.12](https://docs.python.org/3.12/whatsnew/3.12.html#deprecated)
    - [View "Removed" section in the release notes for Python 3.12](https://docs.python.org/3.12/whatsnew/3.12.html#removed)
- `nbexecservice 0.24.74`
  - Notebooks are now running on Python 3.12
    - [View "Deprecated" section in the release notes for Python 3.12](https://docs.python.org/3.12/whatsnew/3.12.html#deprecated)
    - [View "Removed" section in the release notes for Python 3.12](https://docs.python.org/3.12/whatsnew/3.12.html#removed)

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the
[RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor
versions when updating RabbitMQ, you may not be able to upgrade directly between
versions of SystemLink Enterprise. The table below shows the version of the
RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to
[Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html)
for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
| ---------------- | ----------------------------------- | ---------------------------------- |
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | 0.29.56                            |
| 4.0.x            | 0.30.74                             | current                            |

## Bugs Fixed

- [closed-bugs-sle-2025-03](https://github.com/ni/install-systemlink-enterprise/tree/2025-03/release-notes/2025-03/closed-bugs-sle-2025-03.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2025-03/release-notes/2025-03/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2025-03/release-notes/2025-03/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.35.33`

**Admin Helm Chart:** `systemlink-admin 0.35.4`

### NI Containers

```text
alarmservice:0.10.61

alarmsui:0.20.281

assetservice:0.21.53

assetui:0.20.82

comments:0.19.24

dashboardsui:0.23.36

dataframeservice-nessie:1.15.39

dataframeservice:1.15.39

dremio-ee:25.2.2

dynamicformfields:0.3.18

executionsui:0.23.66

feedservice:0.12.56

feedsui:0.11.62

filesui:0.24.82

grafana-auth-proxy:0.21.7

grafana-plugins:3.48.1

grafana-rbac-integrator:0.23.30

helium-dataservices-mongomigration:0.22.35

helium-dataservices:0.22.35

helium-fileingestionservices:1.13.15

helium-salt-master:1.20.13

helium-serviceregistry:0.27.5

helium-taghistoriandataretention:0.18.13

helium-taghistorianmongomigration:0.18.13

helium-taghistorianservices:0.18.13

helium-userservices:0.27.7

helium-webappservices:0.25.21

helium-webserver:0.34.5

jupyter-notebook-userpod:2.14.5

jupyterui:0.23.44

labmanagementui:0.14.103

landingpageui:0.23.41_13158771

nbexec-execution-helpers:0.24.19

nbexec-notebook-runner:0.24.11

nbexecservice:0.24.72

nbparsingservice:0.23.17

ni-grafana:v10.2.3-ca8100c6aa-ni

notification:0.23.27

repository:0.19.31

routineeventtrigger:0.24.14

routineexecutor:0.24.16

routinescheduletrigger:0.24.18

routineservice:0.25.64

routinesui:0.24.58

securityui:0.23.41

session-manager-service:0.28.15

sl-configurable-http-proxy:2.14.5

sl-k8s-hub:2.14.6

smtp:0.23.25

sysmgmtevent:0.24.18

systemsmanagementservice:0.23.25

systemsstateservice:0.13.28

systemsstatesui:0.12.76

systemsui:0.24.99

tagsui:0.19.47

testinsightsui:0.23.94

testmonitorservice:0.32.34

userdata:0.23.26

userservice-setup:0.28.1

webapphostui:0.22.56

workorder:0.14.34
```

### 3rd Party Containers

```text
alpine:3.20.3

alpine:3.21.3

argoproj/argocli:v3.6.4-linux-amd64

argoproj/argoexec:v3.6.4-linux-amd64

argoproj/workflow-controller:v3.6.4-linux-amd64

bitnami/kubectl:1.29.1-debian-11-r16

bitnami/kubectl:1.32.3

bitnami/mongodb:5.0.24@sha256:e56a75744316419cd150400ccd8d985c6b0762f03c7a3b015f233524d043731f

bitnami/rabbitmq:4.0.7-debian-12-r0

bitnami/redis-cluster:7.4.2-debian-12-r4

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:4.1.0

kiwigrid/k8s-sidecar:1.30.2

pause:3.10

swaggerapi/swagger-ui:v5.20.1

zookeeper:3.9.3
```
