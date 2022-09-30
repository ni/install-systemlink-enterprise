# SystemLink Enterprise 9-2022 Release Notes

The 09-2022 release bundle for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. Work with your account representative to obtain credentials to access these artifacts.

**Note:**  If you are upgrading from the 07-2022 release or earlier there is a potential for file meta data loss. [FileIngestionDatabaseRecovery.md](/FileIngestionDatabaseRecovery.md) includes a procedure migrate this data through the upgrade.

## Behavior Changes

- New **Products** application is available under Test Insights. All test results for a product can be viewed in a product's detail's page.
- New **Routines** application is available under **Analysis and Reporting**. Routines enable you to automate the execution of Jupyter notebooks in response to file upload or update events.
- New **Executions** application is available under **Analysis and Reporting**. Executions enable you to view current and past Jupyter notebook executions and the results, properties, and parameters of an execution.
- Clicking **Visualize** on selected data tables in a test result will open the tables in Grafana Explore mode.
- The Data Frame Service plugin for Grafana now supports Lossy, Min/Max, and Entry/Exit/Min/Max decimation strategies. Lossy decimation will not work on tables created prior to the 09-2022 release.
- A test result property can be displayed as a hyperlink in test result grid columns and detail pages. Use hyperlink markdown syntax for the property value to render the hyperlink. Only hyperlinks that are same origin as the SLE web application can be displayed.
- View and edit test result properties from the test results grid or a test result's detail's page.
- In JupyterHub you can view published notebooks and pull a local copy of a notebook into your JuypterHub workspace.
- In JupyterHub you can choose the SystemLink workspace to publish a notebook.
- Analysis routines cannot be run against data tables created prior to the 09-2022 release.

## Software Bill of Materials

[SLE-SBOM-09-29-2022](/SLE-SBOM-09-29-2022). SPDX, JSON, and CDX formats of the SBOM are available.

## Versions

**Top Level Helm Chart:** 0.7.147

**Admin Helm Chart:** 0.7.14

### NI Containers

TODO

### Non Container/Chart Artifacts

TODO

### 3rd party containers

TODO

## Breaking changed in Helm charts

- Top Level Helm Chart 0.7.x
    - `podSecurityContext` has been moved out of `initialAdministratorMapping` and into the top level hierarchy of the `systemlink-value.yaml` file
    - Removed `nbexecworker-apikey` and added `nbexec-argo-workflow-apikey`
    - `nbexecservice` depends on a new bucket for the service: `systemlink-notebook-execution`
    - Added configuration for `argoworkflows` and `nbexecservice`. See [getting-started/templates/systemlink-values.yaml](/getting-started/templates/systemlink-values.yaml) for an example configuration.
    - The default PVC storage size for the MongoDB replica set for `nbexecservice` has increased to 50Gi, which causes Helm upgrade to fail. You manually patch these PVC sizes to allow for Helm upgrade complete successfully. You may also delete the existing PVCs if losing notebook execution history is not an issue for your installation.
- DataFrameService 0.7.x
    - The requirement from the previous release to set `dataframeservice.schema-registry.externalKafka.auth.jaas.password` in the `systemlink-values.yaml` file or via `--set` has been resolved. This setting can be removed from  your values files.
- Admin Helm chart 0.7.x
    - `strimzi-kafka-operator` now requires `defaultImageRegistry` and `imagePullSecrets` to be specified in the `systemlink-admin-values.yaml` file. You must also continue to include these values in `systemlink-values.yaml`. Refer to [getting-started/templates/systemlink-admin-values.yaml](/getting-started/templates/systemlink-admin-values.yaml) for an example of this configuration for `strimzi-kafka-operator`.

## Bugs fixed in latest release

Only customer facing bugs have been included in this list.

[closed-bugs-sle-09-2022.xlsx](/closed-bugs-sle-09-2022.xlsx)

## Vulnerabilities addressed in the release

See bugs with **XRay** in the title in the list above of closed bugs.

## Current list of vulnerabilities

This data is a snapshot from September 27, 2022, and lists the components responsible for Critical or High severity security issues where there is a fix available.

[issues-sle-09-27-2022.xlsx](/issues-sle-09-27-2022.xlsx)
