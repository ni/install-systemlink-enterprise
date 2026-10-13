# SystemLink Enterprise 2026-10 Release Notes

The 2026-10 release for SystemLink Enterprise has been published to
<https://downloads.artifacts.ni.com>. This update includes new features, bug
fixes, and security updates. Work with your account representative to obtain
credentials to access these artifacts. If you are not upgrading from the
previous release, refer to past release notes to ensure you have addressed all
required configuration changes.

## Upgrading from SystemLink Enterprise 2026-09 to 2026-10

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
| 4.1.x            | 0.37.84                             | 0.43.92                            |
| 4.2.x            | 0.44.55                             | current                            |

## Bugs Fixed

<!-- This section should link to the excel document that list customer facing bugs, fixed in the current release. The URL for the release (tag) should be used. -->

[link to closed bugs](link to closed bugs)

## Software Bill of Materials and Notices

<!-- This section should link to the directories containing notices and SBOM. The URL for the release (tag) should be used. -->

[SBOM](link to SBOM)

[Notices](link to SBOM)

## Versions

**Top Level Helm Chart:** `systemlink 0.54.126`

**Admin Helm Chart:** `systemlink-admin 0.54.15`

**Elasticsearch Helm Chart:** `systemlinkelasticsearch 0.16.30`

### NI Containers

```text
aiassistantservice:0.4.122
alarmservice:0.29.80
alarmservice-routine-executor:0.29.80
alarmsui:0.39.106
assetservice:0.40.165
assetservicecdc:0.8.77
assetui:0.39.114
comments:0.38.73
dashboardsui:0.42.93
dataframeservice:1.34.59
dataframeservice-nessie:1.34.59
dynamicformfields:0.23.51
executionsui:0.42.93
feedservice:0.31.57
feedsui:0.30.97
fileingestioncdc:0.15.80
filesui:0.43.112
grafana-auth-proxy:0.41.11
grafana-plugins:5.23.2
grafana-rbac-integrator:0.41.24
helium-dataservices:0.41.29
helium-dataservices-mongomigration:0.41.29
helium-fileingestionservices:1.32.67
helium-salt-master:1.39.9
helium-serviceregistry:0.48.26
helium-taghistoriandataretention:0.37.20
helium-taghistorianmongomigration:0.37.20
helium-taghistorianservices:0.37.20
helium-userservices:0.48.24
helium-webappservices:0.46.34
helium-webserver:0.55.54
jupyter-notebook-userpod:2.33.15
jupyterui:0.42.88
labmanagementui:0.33.103
landingpageui:0.42.89
locationmanagementui:0.12.114
locationservice:0.13.40
nbexec-execution-helpers:0.43.68
nbexec-notebook-runner:0.43.110
nbexecservice:0.43.174
nbparsingservice:0.42.22
ni-grafana:v12.3.1-6b8a586a158-ni
notification:0.42.33
rabbitmq:0.1.5
repository:0.38.37
routineeventtrigger:0.43.57
routineexecutor:0.43.77
routinescheduletrigger:0.43.28
routineservice:0.44.46
routineservice-v2:0.44.46
routinesui:0.43.93
securityui:0.42.96
session-manager-service:0.49.37
sl-configurable-http-proxy:2.33.4
sl-k8s-hub:2.33.9
smtp:0.42.38
specificationmanagement:0.33.34
systemscdc:0.6.47
systemsmanagementservice:0.42.77
systemsstateservice:0.32.38
systemsstatesui:0.31.109
systemsui:0.43.129
tageventprocessor:0.41.29
tagsui:0.38.98
tdmreader:0.3.79
testinsightsui:0.42.79
testmonitorservice:0.51.84
userdata:0.42.38
userservice-setup:0.49.19
webapphostui:0.41.100
workitem:0.10.77
```

### 3rd Party Containers

```text
alpine:3.24.1
alpine:3.24.2
alpine/curl:8.22.0
apache/flink-kubernetes-operator:1.16.1
bitnami-secure/containers/debian-12/argo-workflow-cli:4.1.4-debian-12-r1
bitnami-secure/containers/debian-12/argo-workflow-controller:4.1.4-debian-12-r1
bitnami-secure/containers/debian-12/argo-workflow-exec:4.1.4-debian-12-r4
bitnami-secure/containers/debian-12/elasticsearch:9.5.5-debian-12-r0
bitnami-secure/containers/debian-12/kibana:9.5.5-debian-12-r0
bitnami-secure/containers/debian-12/kubectl:1.37.1
bitnami-secure/containers/debian-12/redis-cluster:8.10.2-debian-12-r3
bitnami-secure/containers/photon-5/zookeeper:3.9.6
dremio/busybox:1.37.0-r61-hardened
dremio/dremio-enterprise:26.1.12
jupyterhub/k8s-image-awaiter:4.4.0
kiwigrid/k8s-sidecar:2.14.0
pause:3.10.1
swaggerapi/swagger-ui:v5.33.1
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
