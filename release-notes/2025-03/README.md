# SystemLink Enterprise 2025-03 Release Notes

The 2025-03 release for
[SystemLink Enterprise](https://downloads.artifacts.ni.com/) has been published.
This update includes new features, bug fixes, and security updates. Contact your
account representative to obtain access credentials. If you are not upgrading
from the previous SystemLink Enterprise release, refer to past release notes to
address all previous configuration changes.

## New Features and Behavior changes

- Kubernetes 1.28 is the minimum supported version for SystemLink Enterprise.
  Refer to
  [SystemLink Enterprise and External Dependencies Compatibility](https://www.ni.com/en/support/documentation/compatibility/25/systemlink-enterprise-and-external-dependencies-compatibility-.html)
  for additional details.
- Preview your .csv files.
- Preview your .html files.
- Notebooks now run on Python 3.12
  - [View the "Deprecated" section in the release notes for Python 3.12](https://docs.python.org/3.12/whatsnew/3.12.html#deprecated)
  - [View the "Removed" section in the release notes for Python 3.12](https://docs.python.org/3.12/whatsnew/3.12.html#removed)
- The Work Order first class property `slotIds` in the schedule test plans API
  is renamed to `fixtureIds`.

## Helm Chart Breaking Changes

- `feedservice:0.12.57`
  - The S3 settings are now under `feedservice.storage`. The previously used S3
    settings under `feedservice` will continue to work, but are now deprecated.
    - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2025-03/getting-started/templates/systemlink-values.yaml#L850)

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the
[RabbitMQ](https://www.rabbitmq.com/) message bus. Because you cannot skip minor
versions when updating RabbitMQ, you may not be able to upgrade directly between
versions of SystemLink Enterprise. For more detailed update instructions, refer
to
[Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html).

The following table displays the version of the RabbitMQ dependency for each
released version of SystemLink Enterprise.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
| ---------------- | ----------------------------------- | ---------------------------------- |
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | 0.29.56                            |
| 4.0.x            | 0.30.74                             | current                            |

## Bugs Fixed

- [SystemLink Enterprise 2025-03 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2025-03/release-notes/2025-03/closed-bugs-sle-2025-03.xlsx)

## Software Bill of Materials and Notices

- [SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2025-03/release-notes/2025-03/sbom)
- [Notices](https://github.com/ni/install-systemlink-enterprise/tree/2025-03/release-notes/2025-03/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.35.52`

**Admin Helm Chart:** `systemlink-admin 0.35.5`

### NI Containers

```text
alarmservice:0.10.62

alarmsui:0.20.282

assetservice:0.21.56

assetui:0.20.86

comments:0.19.24

dashboardsui:0.23.37

dataframeservice-nessie:1.15.39

dataframeservice:1.15.39

dremio-ee:25.2.2

dynamicformfields:0.3.18

executionsui:0.23.70

feedservice:0.12.57

feedsui:0.11.64

filesui:0.24.85

grafana-auth-proxy:0.21.7

grafana-plugins:3.48.1

grafana-rbac-integrator:0.23.30

helium-dataservices-mongomigration:0.22.35

helium-dataservices:0.22.35

helium-fileingestionservices:1.13.15

helium-salt-master:1.20.13

helium-serviceregistry:0.27.7

helium-taghistoriandataretention:0.18.13

helium-taghistorianmongomigration:0.18.13

helium-taghistorianservices:0.18.13

helium-userservices:0.27.8

helium-webappservices:0.25.22

helium-webserver:0.34.8

jupyter-notebook-userpod:2.14.6

jupyterui:0.23.46

labmanagementui:0.14.106

landingpageui:0.23.43

nbexec-execution-helpers:0.24.20

nbexec-notebook-runner:0.24.12

nbexecservice:0.24.74

nbparsingservice:0.23.18

ni-grafana:v10.2.3-ca8100c6aa-ni

notification:0.23.27

repository:0.19.32

routineeventtrigger:0.24.14

routineexecutor:0.24.16

routinescheduletrigger:0.24.18

routineservice:0.25.64

routinesui:0.24.60

securityui:0.23.43

session-manager-service:0.28.16

sl-configurable-http-proxy:2.14.6

sl-k8s-hub:2.14.7

smtp:0.23.25

sysmgmtevent:0.24.19

systemsmanagementservice:0.23.26

systemsstateservice:0.13.28

systemsstatesui:0.12.77

systemsui:0.24.103

tagsui:0.19.48

testinsightsui:0.23.100

testmonitorservice:0.32.34

userdata:0.23.27

userservice-setup:0.28.1

webapphostui:0.22.58

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
