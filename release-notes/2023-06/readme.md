# SystemLink Enterprise release 2023-06 Release Notes

The 2023-06 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the release year-release-month to the release year-release-month

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

- 'assetservice >= 0.0.283'
    - Description: New service was introduced in SystemLink chart. Any PVC that contains assetservice in its name needs to be removed prior to the upgrade. The following privileges are being used: asset:Query, asset:Create, asset:Update, asset:Delete.
    - Installation guide: Remove pvc that have assetservice in its name.

## New Features and Behavior changes

- Behavior change or new feature description

- Behavior change or new feature description

## Helm Chart Breaking Changes

- 'dashboardhost 0.1.207' 
    - Added `apiIngress` section to expose the Grafana API on the API ingress. (A Grafana API route is needed for Service Registry to determine Grafana's status, which then controls whether to show Dashboards in the navigation tree.)
    - [https://github.com/ni/install-systemlink-enterprise/pull/140](https://github.com/ni/install-systemlink-enterprise/pull/140)
    - [View this configuration](pending link)

## Bugs Fixed

<!-- This section should link to the excel document that list customer facing bugs, fixed in the current release. The URL for the release (tag) should be used. -->

Only customer facing bugs have been included in this list.

[link to closed bugs](link to closed bugs)

## Software Bill of Materials and Notices

<!-- This section should link to the directories containing notices and SBOM. The URL for the release (tag) should be used. -->

[SBOM](link to SBOM)

[Notices](link to SBOM)

## Versions

**Top Level Helm Chart:** `systemlink <chart version>`

**Admin Helm Chart:** `systemlink-admin <chart version>`

### NI Containers

container:version

### Non Container/Chart Artifacts

artifact:version

### 3rd Party Containers

container:version
