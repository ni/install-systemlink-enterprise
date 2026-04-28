# Example: Well-Edited Release Notes (2024-05)

This file shows a complete example of well-edited release notes that follow all established standards.

## Key Patterns to Notice:

1. **Title Format**: Uses "release" in title (note: this varies - check current standard)
2. **Opening Paragraph**: Standard language about publication and credentials
3. **Feature Descriptions**: Clear, user-focused explanations with documentation links
4. **Breaking Changes**: Include specific version numbers and configuration guidance
5. **Template Links**: Links to specific lines in configuration files when available

---

# SystemLink Enterprise release 2024-05 Release Notes

The 2024-05 release bundle for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## New Features and Behavior changes

- Navigate SystemLink Enterprise faster with the intuitively organized Home page
  and the navigation pane.
- [Visualize data tables in a data space](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/visualizing-data-tables-in-a-data-space.html)
  to gain insights into your time-series data.
- [Analyze test results with Jupyter Notebooks](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/analyzing-test-results-with-jupyter-notebooks.html).
- [Annotate steps with keywords from a data space](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/editing-test-result-keywords-from-a-data-space.html).
- Save custom column configurations for the product specifications grid.
- [Create and manage test plans under a product](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/creating-a-test-plan.html).
- Define and apply custom states to a system.
- The privileges for work orders and test plans have been split into distinct
  categories.
  - Create work orders
  - Modify work orders
  - Delete work orders
  - List and view work orders
  - Create test plans
  - Modify test plans
  - Delete test plans
  - List and view test plans
  - Access work orders web application
  - Access test plans web application
- The Data Maintainer role has been updated to include all privileges for
  managing test plans and the privilege to query test plan templates

## Helm Chart Breaking Changes

- `webserver 0.21`
  - Removed unused and undocumented routes: `/api/keys`, `/api/keys/duplicate`,
    `/user/api-key`
- `systemlink 0.25.63` Top Level Helm Chart
  - The RabbitMQ dependency has been upgraded from 3.12.x to 3.13.x. Minor
    updates to the RabbitMQ version are potentially breaking. Customers must
    install a version of SystemLink Enterprise running RabbitMQ 3.12 before they
    can successfully upgrade to a version running 3.13.
- `systemlink 0.25.63` Top Level Helm Chart
  - The Work Order and Lab Management services are installed by default. You may
    disable installation for these services by setting the enabled flag to
    `false` in the work order service configuration.
  - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-05/getting-started/templates/systemlink-values.yaml#L978)

## Upgrade Considerations

### RabbitMQ Version

SystemLink Enterprise includes a deployment of the
[RabbitMQ](https://www.rabbitmq.com/) message bus. Since you cannot skip minor
versions when updating RabbitMQ, you may not be able to upgrade directly between
versions of the SystemLink Enterprise product. The table below shows the version
of the RabbitMQ dependency for each released version of SystemLink Enterprise.
Refer to
[Updating SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/updating-systemlink-enterprise.html)
for detailed update instructions.

| RabbitMQ Version | First SystemLink Enterprise Version | Last SystemLink Enterprise Version |
| ---------------- | ----------------------------------- | ---------------------------------- |
| 3.11.x           | 0.12.x                              | 0.15.x                             |
| 3.12.x           | 0.16.x                              | 0.24.x                             |
| 3.13.x           | 0.25.x                              | current                            |

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2024-05](https://github.com/ni/install-systemlink-enterprise/tree/2024-05/release-notes/2024-05/closed-bugs-sle-2024-05.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2024-05/release-notes/2024-05/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2024-05/release-notes/2024-05/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.25.63`

**Admin Helm Chart:** `systemlink-admin 0.25.4`

### NI Containers

```text
assetservice:0.11.7
assetui:0.10.74
[... additional services omitted for brevity ...]
```