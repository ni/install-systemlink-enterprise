# SystemLink Enterprise 2023-12 Release Notes

The 2023-12 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the release 2023-11 to the release 2023-12

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

- `systemsui`
    - Configuring feeds on a system has been enabled in the System Details Page.
    - Reinstalling packages is available in the Software Page.

- `saltmaster`
    - SaltMaster service now supports the v2 of the salt communication model.
    - Starting with SystemLink Enterprise 2023-12 you will be able to connect systems that have SystemLink Client 2024 Q1 (24.0) or newer installed.
    - Starting with 2024 Q1 (24.0), the SystemLink Client will use the v2 and it will only be compatible with the versions of SaltMaster that are implementing v2.

- `tagsui`
    - The Utilities section now includes a new Tags application, which allows end users to view tags in their organization.

## Helm Chart Breaking Changes

- `smtp`
    - The SMTP service now enforces limits on the size of individual messages. These limits can be configured in the Helm values file - [View this configuration](https://github.com/ni/install-systemlink-enterprise/blob/2023-12/getting-started/templates/systemlink-values.yaml#L912).
        - `smtp.messages.maxRecipients` - Maximum number of recipients for a message (default is 100)
        - `smtp.messages.maxBodyBytes` - Maximum length of the message body in bytes (defaults to 1 Megabyte)
        - `smtp.messages.maxSubjectBytes` - Maximum length of the subject line in bytes (defaults to 10 kilobytes)
    - Additionally, the SMTP service now requires that the subject line of a message contain at least one non-whitespace character.

- `dataframeservice`
    - Support for Kafka-based data table ingestion has been removed.
    - Any appendable tables that are still backed by Kafka will become read-only on upgrade.
    - If the Kafka is still enabled on your cluster, first review the information in the 2023-10 release notes on the procedure for removing Kafka and on when Kafka can safely be disabled prior to installing this update.
    - The following Helm values are obsolete and should be removed from YAML values files:
        - `dataframeservice.ingestion.appendableTableLimit`
        - `dataframeservice.ingestion.producer.*`
        - `dataframeservice.ingestion.kafkaBackend.*`
        - `dataframeservice.kafkacluster.*`
        - `dataframeservice.kafka-ui.*`
        - `dataframeservice.schema-registry.*`
        - `dataframeservice.kafkaconnect.*`

- `systemlinkadmin`
    - The Kafka operator has been removed (previously an optional dependency enabled by default).
    - Any appendable data tables that are still backed by Kafka will become read-only on upgrade.
    - If the operator is still enabled on your cluster, first review the information in the 2023-10 release notes on the procedure for removing Kafka and on when Kafka can safely be disabled prior to installing this update.
    - Helm values under the `strimzi-kafka-operator` key are obsolete and should be removed from YAML values files.

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
|------------------|-------------------------------------|------------------------------------|
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | current                            |

Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed instructions on how to safely upgrade the version of the RabbitMQ dependency.

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
