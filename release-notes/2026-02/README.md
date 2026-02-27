# SystemLink Enterprise 2026-02 Release Notes

The 2026-02 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## New Features and Behavior changes

- Added new out-of-the-box dashboard for Alarms Overview. For more information,
  refer to
  [Using the Alarms Overview Dashboard](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/alarms-overview-dashboard.html).
- Added new out-of-the-box dashboard for System Health. For more information,
  refer to
  [Using the System Health Dashboard](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/system-health-dashboard.html).
- Removed the `dashboard` suffix from all out-of-the-box dashboard titles.
- Added the box chart type to the Plotly panel in dashboards.
- Added the violin chart type to the Plotly panel in dashboards.
- Removed support for deploying MongoDB with the SystemLink Helm chart.
  SystemLink still requires MongoDB, but now you can decide where to run and set
  up MongoDB. For more information, refer to
  [Configuring MongoDB Instances](https://www.ni.com/docs/en-US/search?bundle=systemlink-enterprise&q=Configuring%20MongoDB%20Instances).
- Added support for Test Result Changed events and Work Item Changed Routine
  events. For more information, refer to
  [Automating Actions with Routines](https://www.ni.com/docs/en-US/search?bundle=systemlink-enterprise&q=Automating%20Actions%20with%20Routines).
- `labmanagementui:0.25.x`
  - Updated the Automate workflows and the Auto-Schedule workflows to use the
    `work_item_ids` parameter instead of the `test_plan_ids` parameter as an
    input. This update is part of the migration from Test Plans to Work Items.
  - Existing notebooks that use `test_plan_ids` as an input parameter will no
    longer pre-populate work item IDs. You will need to update those notebooks
    to use the `work_item_ids` parameter.
- `smtp:0.34.x`
  - Updated SystemLink to use the MailKit SMTP client. The change may alter
    validation behavior or modify email notification headers. This update is
    minor unless you rely on specific header values for your email
    infrastructure.
- `testmonitorservice:0.43.x`
  - Added `testmonitorservice-eventprocessor` pods. You can configure these pods
    through `testmonitorservice.eventProcessor` Helm values.

## Helm Chart Breaking Changes

- `DataFrameService:1.26.x`, `FeedService:0.23.x`, `NbExecService:0.35.x`
  - When using S3-compatible object storage outside of the `us-east-1` region,
    you must explicitly configure the region in the Helm values. Ensure that
    your S3-compatible object storage implementation supports request checksum
    validation.
  - For MinIO, SystemLink requires `RELEASE.2025-01-20T14-49-07Z` or later.
- SystemLink has updated several default Helm settings from `False` to `True`.
  To fully benefit from SystemLink features, enable the following flags in the
  appropriate YAML files.
  - The `flinkoperator.enabled` setting in the `systemlink-admin-values.yaml`
    file.
  - The `fileingestioncdc.enabled` setting in the `systemlink-values.yaml` file.
  - The `fileingestion.featureToggle.searchFiles` setting in the
    `systemlink-values.yaml` file.
- `AssetService:0.32.x`
  - The AssetService chart requires an Elasticsearch configuration. If the
    SystemLink Elasticsearch deployment does not provision Elasticsearch, set
    the Elasticsearch password using the
    `assetservice.secrets.elasticsearch.password` setting. To stop using
    Elasticsearch, refer to
    [Configuring Advanced Search for Files](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/configuring-advanced-search.html)
    in the SystemLink user manual.
- `AssetServiceCDC:0.0.x`
  - SystemLink has added a new AssetServiceCDC chart. This chart requires
    Elasticsearch, MongoDB, and a file storage configuration. To remove
    Elasticsearch, refer to
    [Configuring Advanced Search for Files](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/configuring-advanced-search.html)
    in the SystemLink user manual.
- `FileIngestion:1.24.x`
  - The FileIngestion Service chart requires an Elasticsearch configuration. If
    the SystemLink Elasticsearch deployment does not provision Elasticsearch,
    set the Elasticsearch password using the
    `fileingestion.secrets.elasticsearch.password` setting. To stop using
    Elasticsearch, refer to
    [Configuring Advanced Search for Files](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/configuring-advanced-search.html)
    in the SystemLink user manual.
- `FileIngestionCDC:0.7.x`
  - SystemLink does not enable FileIngestionCDC by default. FileIngestionCDC
    requires Elasticsearch, MongoDB, and a file storage configuration. To stop
    using Elasticsearch, refer to
    [Configuring Advanced Search for Files](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/configuring-advanced-search.html)
    in the SystemLink user manual.
- `dataframeservice:1.26.x`
  - SystemLink has changed the default Helm value for
    `dataframeservice.sldremio.distStorage.aws.authentication` from `metadata`
    to `accessKeySecret`. To use EC2 instance metadata to authenticate your
    distributed storage, set the Helm value to `metadata`.

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

[SystemLink Enterprise 2026-02 Closed Bugs](https://github.com/ni/install-systemlink-enterprise/tree/2026-02/release-notes/2026-02/closed-bugs-sle-2026-02.xlsx)

## Software Bill of Materials and Notices

[SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2026-02/release-notes/2026-02/sbom)

[Notices](https://github.com/ni/install-systemlink-enterprise/tree/2026-02/release-notes/2026-02/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.46.69`

**Admin Helm Chart:** `systemlink-admin 0.46.9`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.8.15`

### NI Containers

```text
alarmservice-0.21.67
alarmsui-0.31.62
argoworkflows-0.34.1
assetservice-0.32.63
assetservicecdc-0.0.176
assetui-0.31.83
comments-0.30.40
dashboardhost-0.34.57
dashboardsui-0.34.59
dataframeservice-1.26.63
dynamicformfields-0.15.40
executionsui-0.34.56
feedservice-0.23.41
feedsui-0.22.67
fileingestion-1.24.36
fileingestioncdc-0.7.47
filesui-0.35.60
grafanaprovisioning-0.34.16
jupyterui-0.34.54
labmanagementui-0.25.82
landingpageui-0.34.52
locationmanagementui-0.4.60
locationservice-0.5.28
nbexecservice-0.35.63
nbparsingservice-0.34.17
notification-0.34.36
rabbitmq-17.2.4
repository-0.30.34
routineeventtrigger-0.35.31
routineexecutor-0.35.60
routinescheduletrigger-0.35.33
routineservice-0.36.37
routinesui-0.35.87
saltmaster-1.31.13
securityui-0.34.54
serviceregistry-0.39.12
sessionmanager-0.40.34
sl-jupyterhub-2.27.31
smtp-0.34.47
specificationmanagement-0.25.39
swaggerapi-0.29.1
systemlink-0.46.66
systems-0.34.19
systemsstate-0.24.22
systemsstatesui-0.23.69
systemsui-0.35.109
taghistorian-0.29.19
tags-0.33.25
tagsui-0.30.60
testinsightsui-0.34.63
testmonitorservice-0.43.62
userdata-0.34.32
userservices-0.39.14
userservicesetup-0.40.22
webapphostui-0.33.59
webappservices-0.37.29
```

### 3rd Party Containers

```text
alpine:3.23.3
argoproj/argocli:v3.7.8-linux-amd64
argoproj/argoexec:v3.7.8-linux-amd64
argoproj/workflow-controller:v3.7.8-linux-amd64
bitnami-secure/containers/debian-12/kubectl:1.35.1
bitnami-secure/containers/debian-12/rabbitmq:4.2.3-debian-12-r1
bitnami-secure/containers/debian-12/redis-cluster:8.4.1-debian-12-r1
busybox:stable@sha256:05a79c7279f71f86a2a0d05eb72fcb56ea36139150f0a75cd87e80a4272e4e39
jupyterhub/k8s-image-awaiter:4.2.0
kiwigrid/k8s-sidecar:2.5.0
pause:3.10
swaggerapi/swagger-ui:v5.31.0
zookeeper:3.9.4@sha256:f0f1d5e4a2763041ce1f7fc25e2b5347a2a0dfb0eaf0f46a49fe2e01945f9f09
```
