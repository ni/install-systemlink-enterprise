
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

	
- Chart Name and version
    - Description of breaking change.

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

container:version

### Non Container/Chart Artifacts

artifact:version

### 3rd Party Containers

container:version
