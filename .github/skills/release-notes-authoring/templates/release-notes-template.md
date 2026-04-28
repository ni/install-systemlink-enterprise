# SystemLink Enterprise [VERSION] Release Notes

The [VERSION] release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## New Features and Behavior changes

[MAIN CONTENT SECTION - Add bullet points for each new feature or change]

- [Feature description]. [Optional: For more information, refer to [link text](documentation-url).]
- [Another feature description with user impact explanation].
- `servicename:version.number`
  - [Service-specific change with clear user impact]
  - [Another change for this service]

## Helm Chart Breaking Changes

[INCLUDE ONLY IF APPLICABLE - Remove section if no breaking changes]

- `ServiceName:version.number`
  - [Description of breaking change and required actions]
  - [Configuration guidance and links to templates when available]

## Upgrade Considerations

[INCLUDE ONLY IF APPLICABLE - Common considerations like RabbitMQ version compatibility]

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the
[RabbitMQ](https://www.rabbitmq.com/) message bus. Because you cannot skip minor
versions when updating RabbitMQ, you may not be able to upgrade directly between
versions of SystemLink Enterprise.

[Include RabbitMQ compatibility table if relevant]

## Bugs Fixed

[SystemLink Enterprise [VERSION] Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/[BRANCH]/release-notes/[VERSION]/closed-bugs-sle-[VERSION].xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/[BRANCH]/release-notes/[VERSION]/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/[BRANCH]/release-notes/[VERSION]/notices)

## Versions

**Top Level Helm Chart:** `systemlink [VERSION]`

**Admin Helm Chart:** `systemlink-admin [VERSION]`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch [VERSION]`

### NI Containers

```text
[LIST OF NI CONTAINER VERSIONS]
```

### 3rd Party Containers

```text
[LIST OF 3RD PARTY CONTAINER VERSIONS]
```