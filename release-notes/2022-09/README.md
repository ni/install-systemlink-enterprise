# SystemLink Enterprise 9-2022 Release Notes

The 2022-09 release bundle for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. Work with your account representative to obtain credentials to access these artifacts.

**Note:**  If you are upgrading from the 07-2022 release or earlier. Complete the steps in [FileIngestionDatabaseRecovery.md](FileIngestionDatabaseRecovery.md) to avoid losing file metadata.

## Behavior Changes

- New **Products** application is available under Test Insights. All test results for a product can be viewed in a product's detail's page.
- New **Routines** application is available under **Analysis and Reporting**. Routines enable you to automate the execution of Jupyter notebooks in response to file upload or update events.
- New **Executions** application is available under **Analysis and Reporting**. Executions enable you to view current and past Jupyter notebook executions and the results, properties, and parameters of an execution.
- Clicking **Visualize** on selected data tables in a test result will open the tables in Grafana Explore mode.
- The Data Frame Service plugin for Grafana now supports Lossy, Min/Max, and Entry/Exit/Min/Max decimation strategies. Lossy decimation will not work on tables created prior to the 2022-09 release.
- A test result property can be displayed as a hyperlink in test result grid columns and detail pages. Use hyperlink markdown syntax for the property value to render the hyperlink. Only hyperlinks that are same origin as the SLE web application can be displayed.
- View and edit test result properties from the test results grid or a test result's detail's page.
- In JupyterHub you can view published notebooks and pull a local copy of a notebook into your JuypterHub workspace.
- In JupyterHub you can choose the SystemLink workspace to publish a notebook.
- Analysis routines cannot be run against data tables created prior to the 2022-09 release.

## Software Bill of Materials

[SLE-SBOM-09-29-2022](SLE-SBOM-09-29-2022). SPDX, JSON, and CDX formats of the SBOM are available.

## Versions

**Top Level Helm Chart:** 0.7.147

**Admin Helm Chart:** 0.7.14

### NI Containers

assetservice/20220912.2

dashboardsui/20220927.9

dataframeservice/20220927.5

dataframeservice-kafka-connect/20220912.4

dremio-apache/22.0

executionsui/20220926.4

filesui/20220927.4

grafana-auth-proxy/20220823.49

grafana-rbac-integrator/20220823.49

helium-fileingestionservices/d735bd23e8714b50a2c4c4f0acdb4c1ea6efd960.1

helium-serviceregistry/dd0665fd556489809b748debc3b1dd2276c99042.1

helium-userservices/13806ed68e1fef4eab1cee6416e530c7b7fe5073.1

helium-webappservices/fb778a1da34c9f026d19e953f9f5c86090b53b81.1

helium-webserver/d03dec05df0c460d2bd900326a9ef11c6cbb4294.1

jupyter-notebook-userpod/20220921.3

landingpageui/20220927.5

nbexecservice/20220930.2

nbparsingservice/20220927.2

ni-grafana/v9.1.1-978a892fa6-ni

routineengine/20220926.16

routineservice/20220926.16

routinesui/20220926.3

saltmaster/20220928.2

saltmaster-init/20220928.2

securityui/343881889607d5589ff7344df4dd2a0bd0d50649.1

session-manager-service/20220927.2

sl-k8s-hub/20220822.2

sysmgmtevent/20220926.4

systemsmanagementservice/20220926.11

systemsui/20220926.8

testinsightsui/20220929.22

testmonitorservice/20220928.5

userdata/20220927.11

userservice-setup/20220928.1

### Non Container/Chart Artifacts

plotly-panel/1.1.2.zip

systemlink-dataframe-datasource/1.2.1.zip

systemlink-notebook-datasource/1.1.0.zip

### 3rd Party Containers

argoproj/argocli/v3.3.8

argoproj/argoexec/v3.3.8

argoproj/workflow-controller/v3.3.8

bats/bats/1.8.0

bitnami/minio/2022.9.7-debian-11-r4

bitnami/mongodb/5.0.11-debian-11-r3

bitnami/rabbitmq/3.10.7-debian-11-r17

bitnami/redis-cluster/7.0.5-debian-11-r0

bitnami/schema-registry/7.2.1-debian-11-r10

jupyterhub/configurable-http-proxy/4.5.3

jupyterhub/k8s-image-awaiter/1.2.0

kiwigrid/k8s-sidecar/1.19.5

kube-scheduler/v1.19.13

pause/3.8

quay.io/strimzi/kafka:0.31.0-kafka-3.2.1

strimzi/operator/0.31.1

## Helm Chart Breaking Changes

- Top Level Helm Chart 0.7.x
    - `podSecurityContext` has been moved out of `initialAdministratorMapping` and into the top level hierarchy of the `systemlink-value.yaml` file
    - Removed `nbexecworker-apikey` and added `nbexec-argo-workflow-apikey`
    - `nbexecservice` depends on a new bucket for the service: `systemlink-notebook-execution`
    - Added configuration for `argoworkflows` and `nbexecservice`. See [getting-started/templates/systemlink-values.yaml](/getting-started/templates/systemlink-values.yaml) for an example configuration.
    - The default PVC storage size for the MongoDB replica set for `nbexecservice` has increased to 50Gi, which causes Helm upgrade to fail. You manually patch these PVC sizes to allow for Helm upgrade complete successfully. Refer to [increase_nbexec_mongo_storage.sh](increase_nbexec_mongo_storage.sh) for a script to patch there PVCs You may also delete the existing PVCs if losing notebook execution history is not an issue for your installation. Refer to [delete_nbexec_mongo_storage.sh](delete_nbexec_mongo_storage.sh) for a script to delete the existing PVCs.
- DataFrameService 0.7.x
    - The requirement from the previous release to set `dataframeservice.schema-registry.externalKafka.auth.jaas.password` in the `systemlink-values.yaml` file or via `--set` has been resolved. This setting can be removed from  your values files.
- Admin Helm chart 0.7.x
    - `strimzi-kafka-operator` now requires `defaultImageRegistry` and `imagePullSecrets` to be specified in the `systemlink-admin-values.yaml` file. You must also continue to include these values in `systemlink-values.yaml`. Refer to [getting-started/templates/systemlink-admin-values.yaml](/getting-started/templates/systemlink-admin-values.yaml) for an example of this configuration for `strimzi-kafka-operator`.

## Bugs Fixed

Only customer facing bugs have been included in this list.

[closed-bugs-sle-09-2022.xlsx](closed-bugs-sle-09-2022.xlsx)

## Vulnerabilities Fixed

See bugs with **XRay** in the title in the list above of closed bugs.

## Known Vulnerabilities

This data is a snapshot from September 27, 2022, and lists the components responsible for Critical or High severity security issues where there is a fix available.

[issues-sle-09-27-2022.xlsx](issues-sle-09-27-2022.xlsx)
