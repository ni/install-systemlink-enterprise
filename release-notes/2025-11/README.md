# SystemLink Enterprise 2025-11 Release Notes

The 2025-11 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## Upgrading from the 2025-10 to the 2025-11

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
[RabbitMQ](https://www.rabbitmq.com/) message bus. Because you cannot skip minor
versions when updating RabbitMQ, you may not be able to upgrade directly between
versions of SystemLink Enterprise.

The following table displays the version of the RabbitMQ dependency for each
released version of SystemLink Enterprise. For more detailed update
instructions, refer to
[Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html).

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
| ---------------- | ----------------------------------- | ---------------------------------- |
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | 0.29.56                            |
| 4.0.x            | 0.30.74                             | 0.36.63                            |
| 4.1.x            | 0.37.84                             | current                            |

## Bugs Fixed

[SystemLink Enterprise 2025-11 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2025-11/release-notes/2025-11/closed-bugs-sle-2025-11.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2025-11/release-notes/2025-11/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2025-11/release-notes/2025-11/notices)

## Versions

**Top Level Helm Chart:** `systemlink <chart version>`

**Admin Helm Chart:** `systemlink-admin <chart version>`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch <chart version`

### NI Containers

```text
container:version
```

### 3rd Party Containers

```text
container:version
```
