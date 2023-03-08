# SystemLink Enterprise 2023-03 Release Notes

The 2023-03 bundle for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes

- Support for Kubernetes 1.23

- Support for both PostgreSQL 13 and 14.

- Product, results, and steps tables can be queried using the table query builder.

- OpenTelemetry metrics available for the following services
    - testmonitor
    - dataframeservice
    - Kafka

- The endpoint to view claims for the current logged in user `/oidc/userinfo` has been removed and replaced with `oidc/user-info`.

- Kafka UI is now available

- Increase the default memory provided to Kafka connect from XXX to YYY.

## Helm Chart Breaking Changes

- systemlink TODO Version
    - Enabling Kafka OpenTelemetry metrics
        - Set `global.telemetry.enabled` flag to `true`.
        - You are no longer required to also set options in `kafka.metricsConfigs`, `kafka.jmxOptions`, and `kafka.kafkaExporter` configurations
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-03/getting-started/templates/systemlink-values.yaml#L56)

    - Enabling user claims to be returned in a web browser
        - Set `webserver.oidc.enableUserInfo` to `true`
        - You should remove `offline_access` from `webserver.oidc.scope`.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-03/getting-started/templates/systemlink-values.yaml#L110)

    - Enabling Kafka UI
        - To enable the Kafka UI you must override the image pull repository to the repository you are installing SystemLink Enterprise from.
        - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-03/getting-started/templates/systemlink-values.yaml#L606)

## Bugs Fixed

Only customer facing bugs have been included in this list.

[closed-bugs-sle-2023-03](TODO link to closed bugs)

## Software Bill of Materials and Notices

<!-- This section should link to the directories containing notices and SBOM. The URL for the release (tag) should be used. -->

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2023-03/release-notes/2023-03/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2023-03/release-notes/2023-03/notices)

## Versions

**Top Level Helm Chart:** `systemlink <chart version>`

**Admin Helm Chart:** `systemlink-admin <chart version>`

### NI Containers

container/version

### Non Container/Chart Artifacts

artifact/version

### 3rd Party Containers

container/version
