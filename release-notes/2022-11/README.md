# SystemLink Enterprise 2022-11 Release Notes

The 2022-11 release bundle for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. Work with your account representative to obtain credentials to access these artifacts.

## New Feature

There are no new features in this release.

## Behavior Changes

- Files up to 10GB can be uploaded through the web interface.

## Software Bill of Materials

<!-- [SLE-SBOM-09-29-2022](SLE-SBOM-09-29-2022). SPDX, JSON, and CDX formats of the SBOM are available. -->

## Versions

**Top Level Helm Chart:** `systemlink 0.8.113`

**Admin Helm Chart:** `systemlink-admin 0.8.6`

### NI Containers

TODO

### Non Container/Chart Artifacts

TODO

### 3rd Party Containers

TODO

## Helm Chart Breaking Changes

- SystemLink Helm Chart 0.8.113
    - Argo custom resource definitions (CRD) are removed from the `argoworkflows 0.1.53` chart
    - You no longer need to specify SystemLink Grafana plugin configuration unless you also intend on installing additional plugins.
- SystemLink-Admin Helm Chart 0.8.6
    - `argoworkflowscrd` chart added as a dependency. This chart installs SystemLink required CRDs

## Bugs Fixed

Only customer facing bugs have been included in this list.

[closed-bugs-sle-2022-11.xlsx](closed-bugs-sle-2022-11.xlsx)

## Vulnerabilities Fixed

See bugs with **XRay** in the title in the list above of closed bugs.

## Known Vulnerabilities

This information is available upon request. Work with your account representative to request this report.

## Upgrading from the 2022-09 Release to the 2022-11 Release

Due to breaking changes in the top level SystemLink and SystemLink-Admin Helm chart the following procedure is required to upgrade the application. Note, this upgrade will cause any currently executing notebooks to fail.

1. Stage your workspace to upgrade the `systemlink-admin` and `systemlink` helm charts to the 2022-11 release.

1. Run the Helm upgrade command to remove existing Argo CRDs. This command should include all flags and value file references you would expect to use for a typical upgrade of the application.

    **Note:** This wil result in an expected failure: `UPGRADE FAILED: unable to recognize "": no matches for kind "WorkflowTemplate" in version "argoproj.io/v1alpha1"`. This error can be ignored.

1. Run the command `kubectl get crds | grep argo` to verify the argo CRDs have been deleted.

1. Run the Helm upgrade command for the `systemlink-admin` helm chart.

1. Run the command `kubectl get crds | grep argo` to verify the new argo CRDs have been installed.

1. Run the helm upgrade command for the `systemlink` Helm chart.
