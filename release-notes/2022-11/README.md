# SystemLink Enterprise 11-2022 Release Notes

The 11-2022 release bundle for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. Work with your account representative to obtain credentials to access these artifacts.

**Note:**  If you are upgrading from the 07-2022 release or earlier. Complete the steps in [FileIngestionDatabaseRecovery.md](FileIngestionDatabaseRecovery.md) to avoid losing file metadata.

## New Feature

- OpenAPI documentation for the Products service is now included and available at `api-hostname`/niapis

## Behavior Changes

- Files up to 10GB can be uploaded through the web interface.


## Software Bill of Materials

<!-- [SLE-SBOM-09-29-2022](SLE-SBOM-09-29-2022). SPDX, JSON, and CDX formats of the SBOM are available. -->

## Versions

**Top Level Helm Chart:** systemlink: 0.8.108


**Admin Helm Chart:** systemlink-admin: 0.8.6

### NI Containers

TODO

### Non Container/Chart Artifacts

TODO

### 3rd Party Containers

TODO

## Helm Chart Breaking Changes

- SystemLink Helm Chart 0.8.108
    - Argo custom resource definitions (CRD) are removed from the `argoworkflows 0.1.53` chart
- SystemLink-Admin Helm Chart 0.8.6
    - `argoworkflowscrd` chart added as a dependency. This chart installs SystemLink required CRDs

## Bugs Fixed

Only customer facing bugs have been included in this list.

[closed-bugs-sle-11-2022.xlsx](closed-bugs-sle-11-2022.xlsx)

## Vulnerabilities Fixed

See bugs with **XRay** in the title in the list above of closed bugs.

## Known Vulnerabilities

This data is a snapshot from MONTH DAY, 2022, and lists the components responsible for Critical or High severity security issues where there is a fix available.

<!-- [issues-sle-09-27-2022.xlsx](issues-sle-09-27-2022.xlsx) -->

## Upgrading from the 09-2022 Release to the 11-2022 Release

Due to breaking changes in the top level SystemLink and SystemLink-Admin Helm chart the following procedure is required to upgrade the application. Note, this upgrade will cause any currently executing notebooks to fail.

1. Run the Helm upgrade command to remove existing Argo CRDs using the 11-2022 release against your cluster running the 09-2022 release. 

    **Note:** This wil result in an expected failure: `PGRADE FAILED: unable to recognize "": no matches for kind "WorkflowTemplate" in version "argoproj.io/v1alpha1"`. This error can be ignored.

1. Run the command `kubectl get crds | grep argo` to verify the argo CRDs have been deleted.

1. Run the Helm upgrade command for the `systemlink-admin` helm chart.

1. Run the command `kubectl get crds | grep argo` to verify the new argo CRDs have been installed.

1. Run the helm upgrade command for the `systemlink` Helm chart.
