
# SystemLink Enterprise release 2023-07 Release Notes

The 2023-07 release bundle for SystemLink Enterprise has been published to <https://downloads.artifacts.ni.com>. This update includes new features, bug fixes, and security updates. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## Upgrading from the release year-release-month to the release year-release-month

<!-- Optional section to include comments and instructions needed to successfully upgrade from the previous release to the current release. If the only changes needed are already captured in Helm Chart Breaking Changes, this section is not needed. -->

## New Features and Behavior changes

- testmonitorservice
	- The following privileges are added in the testmonitor to enable access to the comments feature
		- "comments:Create","comments:Query","comments:UpdateOwn","comments:DeleteOwn"
		- Note: the comments service is not added in the helm chart

- workorderservice
	- The following privileges are added in the workorder to enable access to the test plan
		- "testplan:Create","testplan:Query","testplan:Update","testplan:Delete", "testplan:*", "testplan:AccessApplication"
		- Note: the workorder service is not added in the helm chart. Hence, both workorder and testplan will not be accessible in the application

## Helm Chart Breaking Changes

- dataframeservice 0.11.21
    - Upgraded to Dremio Enterprise. When upgrading from a free version of Dremio to Dremio Enterprise, Dremio's volumes need to be cleared out. 
	- Before upgrading, mark all persistent volume claims with "dremio" in their names for deletion (you can just delete them from Lens). 
	- When the Dremio pods restart during the upgrade, the volume claims will be released and the Dremio pods will get fresh volumes. 
	- If this isn't done before upgrading, the steps to recover are to delete all of the "dremio" persistent volume claims, bounce all of the Dremio pods (to release the claims), and then bounce a DFS pod (to trigger logic to re-initialize Dremio).
	
- saltmaster 1.0.0
    - The new saltmaster helm chart is coming with 2 breaking changes:
		1. It is now using mongo so we will need to provide the mongodb credentials for the secret to be created: "saltmaster.secrets.mongodb"
		2. The helm chart now needs a pair of RSA keys (private & public) for securing the communication with the SL clients. There are instructions in the migration plan for getting the current pair of keys and setting them accordingly to "saltmaster.secrets.saltmaster" in order to create the necessary secret.

## Bugs Fixed

Only customer facing bugs have been included in this list.

- [closed-bugs-sle-2023-07](https://github.com/ni/install-systemlink-enterprise/blob/2023-07/release-notes/2023-07/closed-bugs-sle-2023-07.xlsx)

## Software Bill of Materials and Notices

- [SBOM](https://github.com/ni/install-systemlink-enterprise/tree/2023-07/release-notes/2023-07/sbom)
- [Notices](https://github.com/ni/install-systemlink-enterprise/tree/2023-07/release-notes/2023-07/notices)

## Versions

**Top Level Helm Chart:** `systemlink 0.15.48`

**Admin Helm Chart:** `systemlink-admin 0.15.5`

### NI Containers

assetservice/0.1.20

dashboardsui/0.3.23

dataframeservice-kafka-connect/20230323.3

dataframeservice/0.11.54

dremio-ee/24.0.1

executionsui/0.3.17

filesui/0.4.27

grafana-auth-proxy/20230404.4

grafana-rbac-integrator/0.3.18

helium-dataservices/4700a9aca4cc30524a665849db62e3c08ca611f0.1

helium-fileingestionservices/8d23db3a30a5805a022ce566ca6e97a0f8801d4e.1

helium-salt-master/04e7a96681a9f89ba0a6b5ed12132f724e1bc46f.1

helium-serviceregistry/dddb1616f9bf43dda84f6f06ff3c882c4aa6686f.1

helium-userservices/a592ea59bdf3ba828e8ca0fe3450e14b4dd0f888.1

helium-webappservices/040be0406ab65d15201978a9122b18f55202d8fb.1

helium-webserver/370e0560c4974520b87f484b7a5fa0e573a92380.1

jupyter-notebook-userpod/20230623.2

jupyterui/0.3.15

landingpageui/0.3.19

license/0.3.12

nbexec-execution-helpers/20230613.4

nbexec-notebook-runner/20230613.3

nbexecservice/0.4.21

nbparsingservice/0.3.6

ni-grafana/v9.4.1-b477366620-ni

notification/0.3.13

routineeventtrigger/0.4.9

routineexecutor/0.4.6

routinescheduletrigger/0.4.10

routineservice/0.5.11

routinesui/0.4.21

securityui/372edd61c88693cbd3c89995da8d76a144144595.1

session-manager-service/0.4.16

sl-configurable-http-proxy/20230620.2

sl-k8s-hub/20230620.2

smtp/0.3.14

sysmgmtevent/0.4.14

systemsmanagementservice/0.3.13

systemsui/0.4.60

testinsightsui/0.3.89

testmonitorservice/0.12.1

userdata/0.3.14

userservice-setup/0.4.5

### Non Container/Chart Artifacts

systemlink-notebook-datasource/1.1.1.zip

systemlink-dataframe-datasource/1.6.2.zip

plotly-panel/1.1.2.zip

### 3rd Party Containers

argoproj/argocli/v3.3.8-linux-amd64

argoproj/argoexec/v3.3.8-linux-amd64

argoproj/workflow-controller/v3.3.8-linux-amd64

bitnami/minio/2023.6.19-debian-11-r0

bitnami/mongodb/5.0.18-debian-11-r11

bitnami/rabbitmq/3.11.18-debian-11-r0

bitnami/redis-cluster/7.0.10-debian-11-r2

bitnami/schema-registry/7.4.0-debian-11-r9

busybox/stable@sha256:51de9138b0cc394c813df84f334d638499333cac22edd05d0300b2c9a2dc80dd

jupyterhub/k8s-image-awaiter/2.0.0

kiwigrid/k8s-sidecar/1.24.4

kube-scheduler/v1.23.10

pause/3.8

provectuslabs/kafka-ui/v0.7.0

zookeeper/3.8.1-temurin

strimzi/kafka/0.34.0-kafka-3.4.0

strimzi/operator/0.34.0
