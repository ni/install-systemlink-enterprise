# SystemLink Enterprise release 2024-02 Release Notes

The 2024-02 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features and Behavior changes



## Helm Chart Breaking Changes




### RabbitMQ Version

SystemLink Enterprise includes a deployment of the [RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor versions when updating RabbitMQ, you may not be able to upgrade directly between versions of the SystemLink Enterprise product. The table below shows the version of the RabbitMQ dependency for each released version of SystemLink Enterprise. Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
|------------------|-------------------------------------|------------------------------------|
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | current                            |

Refer to [Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html) for detailed instructions on how to safely upgrade the version of the RabbitMQ dependency.

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2024-02](https://github.com/ni/install-systemlink-enterprise/tree/2024-02/release-notes/2024-02/closed-bugs-sle-2024-02.xlsx)

## Software Bill of Materials and Notices

- [SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2024-02/release-notes/2024-02/sbom)
- [Notices](https://github.com/ni/install-systemlink-enterprise/tree/2024-02/release-notes/2024-02/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.22.55`

**Admin Helm Chart:** `systemlink-admin 0.22.10`

### NI Containers


### 3rd Party Containers

