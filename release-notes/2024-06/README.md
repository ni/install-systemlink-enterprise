
# SystemLink Enterprise release 2024-06 Release Notes

The 2024-06 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- [Create alarms](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/generating-custom-alarms.html) to notify you when an issue occurs in your system.
- [Delete one or more product specifications](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/deleting-specifications.html) you no longer need.
- [Select one or more Test Results and send them to a Jupyter Notebook for analysis](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/analyzing-test-results-with-jupyter-notebooks.html).
- [Select one or more product specifications and send them to a Jupyter Notebook for analysis](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/analyzing-specification-compliance-with-jupyter-notebooks.html).
- Automatically copy files linked to a test plan template when you [create a test plan](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/creating-a-test-plan.html) from the template.
- Filter the test plans table by a test plan.
- The DataFrame service now enforces a limit on the number of rows a single data table can have. The limit defaults to 1 billion rows and can be changed by setting the `dataframeservice.ingestion.maxRowCount` value when installing the Helm chart.
    - When a table reaches the row limit, requests to append more rows to the table will return a `409 Conflict` HTTP error. Query performance for tables with such a large number of rows is dependent upon the number of columns, the resources available to Dremio, and the number of executors.
- The parameters field for notebook execution actions for the Work Order service now supports nested JSON in addition to strings parameters.
- AWS specific values are provided to use SystemLink with AWS ALB ingresses.
    - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-06/getting-started/templates/AWS/aws_supplemental_values.yml)

## Helm Chart Breaking Changes

- `systemlink 0.26.64` Top Level Helm Chart
    - The Alarm Service was added to the top-level chart.
        - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-06/getting-started/templates/systemlink-values.yaml#L346)
    - Secrets for the service's MongoDB credentials must be configured.
        - [View this secret configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-06/getting-started/templates/systemlink-secrets.yaml#L180)
    - The `argoworkflows` configuration for `argoworkflows.argo-workflows.controller.workflowDefaults.spec.ttlStrategy.secondAfterFailure` and `secondsAfterSuccess` has been replaced with `secondsAfterCompletion`. This new configuration defaults to 600 seconds (10 minutes)
        - If `secondAfterFailure` and `secondsAfterSuccess` are set to 600 and 0, these values can be removed since they match the new default for `secondsAfterCompletion`.
        - This setting enables system administrators to inspect `execution-<executionID>-<GUID>` pods after they have completed to to inspect conditions such as a notebook execution failure or timeout. This setting ensures those pods exist after completion such than an administrator can connect to them to debug.

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

- [closed-bugs-sle-2024-06](https://github.com/ni/install-systemlink-enterprise/tree/2024-06/release-notes/2024-06/closed-bugs-sle-2024-06.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2024-06/release-notes/2024-06/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2024-06/release-notes/2024-06/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.26.64`

**Admin Helm Chart:** `systemlink-admin 0.26.5`

### NI Containers

alarmservice:0.1.347

assetservice:0.12.22

assetui:0.11.91

comments:0.10.15

dashboardsui:0.14.107

dataframeservice:1.6.71

dremio-ee:24.1.2

executionsui:0.14.110

feedservice:0.3.69

feedsui:0.2.134

filesui:0.15.120

grafana-auth-proxy:0.12.0

grafana-plugins:3.10.1

grafana-rbac-integrator:0.14.17

helium-dataservices-mongomigration:0.13.13

helium-dataservices:0.13.13

helium-fileingestionservices:1.4.10

helium-salt-master:1.11.7

helium-serviceregistry:0.15.10

helium-taghistoriandataretention:0.9.12

helium-taghistorianmongomigration:0.9.12

helium-taghistorianservices:0.9.12

helium-userservices:0.15.14

helium-webappservices:0.13.15

helium-webserver:0.22.13

jupyter-notebook-userpod:2.5.6

jupyterui:0.14.106

labmanagementui:0.5.199

landingpageui:0.14.109

nbexec-execution-helpers:0.14.14

nbexec-notebook-runner:0.14.12

nbexecservice:0.15.21

nbparsingservice:0.14.16

ni-grafana:v10.2.3-19a2369fad-ni

notification:0.14.21

repository:0.10.30

routineeventtrigger:0.15.14

routineexecutor:0.15.13

routinescheduletrigger:0.15.13

routineservice:0.16.14

routinesui:0.15.107

securityui:0.14.100

session-manager-service:0.16.20

sl-configurable-http-proxy:2.5.3

sl-k8s-hub:2.5.9

smtp:0.14.21

specificationmanagement:0.5.19

sysmgmtevent:0.15.18

systemsmanagementservice:0.14.24

systemsstateservice:0.4.25

systemsstatesui:0.3.137

systemsui:0.15.141

tagsui:0.10.102

testinsightsui:0.14.247

testmonitorservice:0.22.17

userdata:0.14.19

userservice-setup:0.16.2

workorder:0.5.74

### 3rd Party Containers

alpine:3.20.0

argoproj/argocli:v3.5.5-linux-amd64

argoproj/argoexec:v3.5.5-linux-amd64

argoproj/workflow-controller:v3.5.5-linux-amd64

bitnami/kubectl:1.28.2-debian-11-r16

bitnami/minio:2024.6.6-debian-12-r0

bitnami/mongodb:5.0.24-debian-11-r20

bitnami/rabbitmq:3.13.2-debian-12-r4

bitnami/redis-cluster:7.2.5-debian-12-r0

busybox:stable@sha256:023917ec6a886d0e8e15f28fb543515a5fcd8d938edb091e8147db4efed388ee

busybox:stable@sha256:50aa4698fa6262977cff89181b2664b99d8a56dbca847bf62f2ef04854597cf8

busybox:stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter:3.3.7

kiwigrid/k8s-sidecar:1.27.4

pause:3.9

swaggerapi/swagger-ui:v5.17.14

zookeeper:3.9.1
