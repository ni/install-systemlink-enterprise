# SystemLink Enterprise 2026-11 Release Notes

The 2026-11 release for SystemLink Enterprise has been
published to <https://downloads.artifacts.ni.com>. This update includes new
features, bug fixes, and security updates. Work with your account representative
to obtain credentials to access these artifacts. If you are not upgrading from
the previous release, refer to past release notes to ensure you have addressed
all required configuration changes.

## New Features and Behavior changes

- `testmonitorservice-0.52.x`
  - Organization ID information is now part of the database scheme for products, test results, test steps, and paths.
  - The `testmonitorservice.database.migrationCommandAndStatementTimeoutInSeconds` helm value may need to be adjusted to allow more time for migrations of databases with many records. The default value is 600 seconds (10 minutes). The database migration may take up to ~45 minutes depending on database size.
- Role Editor, Bug 4132914: The Role Editor scopes the privileges of the `Dynamic Form Fields` to the resource of another category, such as `workitem:workitem`
  - This bug affected multiple custom roles by storing the DFF privilege under work items instead of as a separate privilege. These roles displayed DFF as `enabled`. However, the roles could not create, update, or delete DFFs.
  - This error occurred after saving a work item, or an older Work Orders/Test Plans privilege, and later adding DFF.
  - This fix instead displays DFF as `disabled` for those roles. To grant the privilege, administrators need to select DFF again and save the role.
  - Use the [find_roles_with_dff_privileges_scoped_to_workitems.ipynb](https://github.com/ni/install-systemlink-enterprise/blob/main/release-notes/2026-11/find_roles_with_dff_privileges_scoped_to_workitems.ipynb) notebook to find affected roles.
  - After the 2026-11 release is deployed, admins should open each listed role, select DFF privileges again, and save the role to grant the privilege.
- Role Editor, Bug 4162676: Users cannot create assets without `system:ExecuteJobs` privileges
  - Users with asset privileges can now run asset jobs on systems.
  - Upgrading to the 2026-11 release does not update the existing custom roles. Only roles created after the upgrade get these job permissions automatically.
  - To update an existing role, open it in the role editor, clear the affected Asset Management permissions, select them again, and save.

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

**Top Level Helm Chart:** `systemlink 0.55.136`

**Admin Helm Chart:** `systemlink-admin 0.55.15`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.17.29`

### NI Containers

```text
aiassistantservice:0.5.110
alarmservice-routine-executor:0.30.56
alarmservice:0.30.56
alarmsui:0.40.49
assetservice:0.41.95
assetservicecdc:0.9.46
assetui:0.40.90
comments:0.39.69
dashboardsui:0.43.49
dataframeservice-nessie:1.35.58
dataframeservice:1.35.58
dynamicformfields:0.24.63
executionsui:0.43.44
feedservice:0.32.53
feedsui:0.31.50
fileingestioncdc:0.16.49
filesui:0.44.54
grafana-auth-proxy:0.42.17
grafana-plugins:5.23.5
grafana-rbac-integrator:0.42.40
helium-dataservices-mongomigration:0.42.31
helium-dataservices:0.42.31
helium-fileingestionservices:1.34.19
helium-salt-master:1.40.23
helium-serviceregistry:0.50.15
helium-taghistoriandataretention:0.38.24
helium-taghistorianmongomigration:0.38.24
helium-taghistorianservices:0.38.24
helium-userservices:0.50.15
helium-webappservices:0.48.11
helium-webserver:0.57.56
jupyter-notebook-userpod:2.34.12
jupyterui:0.43.43
labmanagementui:0.34.68
landingpageui:0.43.44
locationmanagementui:0.13.74
locationservice:0.14.46
nbexec-execution-helpers:0.44.94
nbexec-notebook-runner:0.44.94
nbexecservice:0.44.146
nbparsingservice:0.43.35
ni-grafana:v12.3.1-43671214e26-ni
notification:0.43.48
rabbitmq:0.2.0
repository:0.39.52
routineeventtrigger:0.44.46
routineexecutor:0.44.77
routinescheduletrigger:0.44.43
routineservice-v2:0.45.52
routineservice:0.45.52
routinesui:0.44.65
securityui:0.43.61
session-manager-service:0.51.38
sl-configurable-http-proxy:2.34.11
sl-k8s-hub:2.34.14
smtp:0.43.55
specificationmanagement:0.34.43
swaggerapi:0.38.16
systemscdc:0.7.45
systemsmanagementservice:0.43.67
systemsstateservice:0.33.46
systemsstatesui:0.32.53
systemsui:0.44.154
tageventprocessor:0.42.31
tagsui:0.39.49
tdmreader:0.4.48
testinsightsui:0.43.55
testmonitorservice:0.52.60
userdata:0.43.45
userservice-setup:0.51.13
webapphostui:0.42.41
workitem:0.11.66
```

### 3rd Party Containers

```text
alpine/curl:8.23.0
alpine:3.24.4
apache/flink-kubernetes-operator:1.16.1
bitnami-secure/containers/debian-12/argo-workflow-cli:4.1.6-debian-12-r1
bitnami-secure/containers/debian-12/argo-workflow-controller:4.1.6-debian-12-r1
bitnami-secure/containers/debian-12/argo-workflow-exec:4.1.6-debian-12-r2
bitnami-secure/containers/debian-12/elasticsearch:9.5.6-debian-12-r1
bitnami-secure/containers/debian-12/kibana:9.5.6-debian-12-r1
bitnami-secure/containers/debian-12/kubectl:1.37.2
bitnami-secure/containers/debian-12/redis-cluster:8.10.3-debian-12-r1
bitnami-secure/containers/photon-5/zookeeper:3.9.7@sha256:33c3a840b6ce1fb165883e4cc13390fd508ef7ac7e58b9622ef2155ad9fc5640
dremio/busybox:1.38.0-r3-hardened
dremio/dremio-enterprise:26.1.13
jupyterhub/k8s-image-awaiter:4.4.0
kiwigrid/k8s-sidecar:2.14.3
pause:3.10.1
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
