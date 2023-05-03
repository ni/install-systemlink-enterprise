# SystemLink Enterprise release 2023-05 Release Notes

The 2023-05 release for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- The Tag service now available

- You can now view a system's tags in under the **Tags** tab in a system's details page.

- You can now display tag data in the systems grid.

- You can save and load views from steps grid

## Helm Chart Breaking Changes

- `tags 0.1.0` Tag Helm chart included in the SystemLink top level chart
    - This chart requires setting a new MongoDB secret
    - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-05/getting-started/templates/systemlink-secrets.yaml#L485)

## Bugs Fixed

Only customer facing bugs have been included in this list.

[closed-bugs-sle-2023-05](https://github.com/ni/install-systemlink-enterprise/blob/2023-05/release-notes/2023-05/closed-bugs-sle-2023-05.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2023-05/release-notes/2023-05/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2023-05/release-notes/2023-05/notices)

## Versions

**Top Level Helm Chart:** `systemlink <chart version>`

**Admin Helm Chart:** `systemlink-admin <chart version>`

### NI Containers

container/version

### Non Container/Chart Artifacts

artifact/version

### 3rd Party Containers

container/version
