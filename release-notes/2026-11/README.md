# SystemLink Enterprise 2026-11 Release Notes

The 2026-11 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## Upgrading from SystemLink Enterprise release_older_year-release_older_month to release_year-release_month

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

- Behavior change or new feature description

- Behavior change or new feature description

## Helm Chart Breaking Changes

- `assetservicecdc:0.9.x`, `systemscdc:0.7.x`, `fileingestioncdc:0.16.x`
  - The addition of NetworkPolicy restricts access to the Apache Flink JobManager HTTP API. If a user installed `systemlinkadmin` in a different namespace than SystemLink, they must configure the namespace in NetworkPolicy. Other deployments are unaffected.
  - [View this service configuration - assetservicecdc](https://github.com/ni/install-systemlink-enterprise/blob/2026-11/getting-started/templates/systemlink-values.yaml#L550)
  - [View this service configuration - systemscdc](https://github.com/ni/install-systemlink-enterprise/blob/2026-11/getting-started/templates/systemlink-values.yaml#L1370)
  - [View this service configuration - fileingestioncdc](https://github.com/ni/install-systemlink-enterprise/blob/2026-11/getting-started/templates/systemlink-values.yaml#L095)

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

[SystemLink Enterprise 2026-11 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2026-11/release-notes/2026-11/closed-bugs-sle-2026-11.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2026-11/release-notes/2026-11/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2026-11/release-notes/2026-11/notices)

## Versions

**Top Level Helm Chart:** `systemlink <chart version>`

**Admin Helm Chart:** `systemlink-admin <chart version>`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch <chart version>`

### NI Containers

```text
container:version
```

### 3rd Party Containers

```text
container:version
```

## Verifying Container Signatures

Images published for SystemLink Enterprise are signed with
[cosign v3](https://docs.sigstore.dev/cosign/system_config/installation/).

NI's public container signing key is available at
<https://container-keys.ni.dev/containers-1.pem>.

### Verifying an image

Image names in the **Versions** section above omit their registry path. Build
the full image reference as follows:

- **NI containers**—prefix with
  `downloads.artifacts.ni.com/ni-docker/ni/systemlink/`
- **3rd party containers**—prefix with `downloads.artifacts.ni.com/ni-docker/`

For example, to verify `kiwigrid/k8s-sidecar:2.10.1`:

```bash
cosign verify --key https://container-keys.ni.dev/containers-1.pem \
  downloads.artifacts.ni.com/ni-docker/kiwigrid/k8s-sidecar:2.10.1
```

cosign exits with status 0 and reports the following when the signature is
valid:

```text
Verification for downloads.artifacts.ni.com/ni-docker/kiwigrid/k8s-sidecar:2.10.1 --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - The signatures were verified against the specified public key
```

cosign then writes the signature payload to standard output, which includes the
`docker-manifest-digest` of the image that was verified.

If an image is unsigned, signed with a different key, or has been modified,
cosign exits with a non-zero status and reports an error such as
`no signatures found`.
