# SystemLink Enterprise release 2026-01 Release Notes

The 2026-01 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## New Features and Behavior changes

- TODO

## Helm Chart Breaking Changes

- `global.mongodb.install: true` no longer supported. Services must connect to a seperately deployed mongodb instance by configuring `global.secrets.mongodb.connection_string`.

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
| 4.1.x            | 0.37.84                             | 0.43.92                            |
| 4.2.x            | 0.44.55                             | current                            |

## Bugs Fixed

[SystemLink Enterprise 2025-12 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2026-01/release-notes/2026-01/closed-bugs-sle-2026-01.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2026-01/release-notes/2026-01/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2026-01/release-notes/2026-01/notices)

## Versions

**Top Level Helm Chart:** `systemlink t.o.do`

**Admin Helm Chart:** `systemlink-admin t.o.do`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch t.o.do`

### NI Containers

```text
todo:1.2.3.4
```

### 3rd Party Containers

```text
todo:1.2.3.4
```
