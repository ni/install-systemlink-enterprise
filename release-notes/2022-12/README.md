# SystemLink Enterprise 2022-12 Release Notes

The 2022-12 release bundle for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. Work with your account representative to obtain credentials to access these artifacts. If you are not upgrading from the previous release, refer to past release notes to ensure you have addressed all required configuration changes.

## New Features

- License service now included in the top level helm chart. Refer to **Helm Chart Breaking Changes** for details on the required configuration for this service.

## Behavior Changes

- TODO

## Helm Chart Breaking Changes

- TODO

- All Charts `TODO top level chart version`
    - Containers inside a Pod now use a stricter `securityContext` configuration by default.
    - The new default `securityContext` configuration for containers is as follows:
        - `allowPrivilegeEscalation` defaults to `false`
        - `readOnlyRootFilesystem` defaults to `true`
        - `privileged` defaults to `false`
        - `capabilities.drop` defaults to `[all]`.
    - This change only affects the default values of _Containers_. The default values for the _Pod_ `securityContext` remain the same.
- `license 0.1.0`
    - This service requires the persistent storage class `ReadWriteMany`.
    - Configure secrets for the service
        - Refer to [systemlink-secrets.yaml](https://github.com/ni/install-systemlink-enterprise/blob/main/release-notes/2022-12/templates/systemlink-secrets.yaml)
        - Refer to [Required Secrets](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/required-secrets.html)
    - Configure values for the service
        - Refer to [systemlink-values.yaml](https://github.com/ni/install-systemlink-enterprise/blob/main/getting-started/templates/systemlink-values.yaml)
        - Refer to [What Do You Need to Use SystemLink Enterprise?](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/systemlink-enterprise-requirements.html)
- `nbexecservice 0.1.312`
    - Config map renamed from `nbexec-service-argo-configmap` to `<helm_release_name>-nbexecservice-argo-configmap`.
    - Service names were moved from config map to workflow-template.
    - During helm upgrade in progress executions may fail.
- `routineservice 0.2.0`
    - The contents of the `routineservice` helm chart have been split into two charts": `routineservice` and `routineeventtrigger`
    - There are no breaking changes to the existing chart but some values and secrets can be removed or renamed.
        - Within `userservices.secrets.whitelistedApiKeys`, `routines` can be removed and `routineeventtrigger` should be added.
        - The `routineservice.engine` configuration is deprecated. If you used this configuration, migrate by moving it under `routineeventtrigger`. 
- `routineeventtrigger 0.2.0`
    - Some components from the "routineservice" into the `routineeventtrigger` chart.
    - Refer to [systemlink-secrets.yaml](TODO Link) for required changes
- `routinescheduletrigger 0.2.0`
    - Newly included chart
    - You must configure the `userservices.secrets.whitelistedApiKeys` value with an entry for `routinescheduletrigger` `serviceName`.
    - You must configure MongoDB credentials in `routinescheduletrigger.secrets.mongodb`.
- `routineexecutor 0.2.0`
    - Newly included chart
    - You must configure the `userservices.secrets.whitelistedApiKeys` value with a n entry for `routineexecutor` `serviceName`.
- `notification 0.1.0`
    - Newly included chart
    - You must configure a secret for MongoDB credentials in `notification.secrets.mongodb`


## Bugs Fixed

Only customer facing bugs have been included in this list.

<!-- [closed-bugs-sle-2022-12.xlsx](closed-bugs-sle-2022-12.xlsx) --> TODO

## Vulnerabilities Fixed

See bugs with **XRay** in the title in the above list of closed bugs.

## Known Vulnerabilities

This information is available upon request. Work with your account representative to request this report.

## Software Bill of Materials

This information is available upon request. Work with your account representative to request this data.

## Versions

<!-- **Top Level Helm Chart:** `systemlink 0.8.113` -->TODO

<!-- **Admin Helm Chart:** `systemlink-admin 0.8.6` -->TODO

### NI Containers

TODO

### Non Container/Chart Artifacts

TODO

### 3rd Party Containers

TODO
