# SystemLink Enterprise 2025-04 Release Notes

The 2025-04 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## Upgrading from the 2025-03 to the 2025-04

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

- Behavior change or new feature description

- Behavior change or new feature description

## Helm Chart Breaking Changes

- Chart Name and version
  - Description of breaking change.

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

- [SystemLink Enterprise 2025-04 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2025-04/release-notes/2025-04/closed-bugs-sle-2025-04.xlsx)

## Software Bill of Materials and Notices

- [SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2025-04/release-notes/2025-04/sbom)
- [Notices](https://github.com/ni/install-systemlink-enterprise/tree/2025-04/release-notes/2025-04/notices)

## Versions

**Top Level Helm Chart:** `systemlink <chart version>`

**Admin Helm Chart:** `systemlink-admin <chart version>`

### NI Containers

```text
container:version
```

### 3rd Party Containers

```text
container:version
```
