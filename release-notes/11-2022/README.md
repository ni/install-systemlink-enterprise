# SystemLink Enterprise 11-2022 Release Notes

The 11-2022 release bundle for SystemLink Enterprise has been published to <https://niedge01.jfrog.io>. Work with your account representative to obtain credentials to access these artifacts.

**Note:**  If you are upgrading from the 07-2022 release or earlier. Complete the steps in [FileIngestionDatabaseRecovery.md](FileIngestionDatabaseRecovery.md) to avoid losing file metadata.

## New Feature

- Initial inclusion of the SystemLink License service. This service does not yet enforce licensing.
- OpenAPI documentation for the Products service is now included and available at `api-hostname`/niapis

## Behavior Changes

- Files up to 10GB can be uploaded through the web interface.
- The SystemLink License service requires a persistent storage class with ""ReadWriteMany"" in the cluster hosting SystemLink.


## Software Bill of Materials

<!-- [SLE-SBOM-09-29-2022](SLE-SBOM-09-29-2022). SPDX, JSON, and CDX formats of the SBOM are available. -->

## Versions

**Top Level Helm Chart:** TOOD

**Admin Helm Chart:** TODO

### NI Containers

TODO

### Non Container/Chart Artifacts

TODO

### 3rd Party Containers

TODO

## Helm Chart Breaking Changes

- Top Level Helm Chart <version???>
     - You must set the name of the persistent storage class that supports `ReadWriteMany` in the `licenseservicelimo` section.

## Bugs Fixed

Only customer facing bugs have been included in this list.

<!-- [closed-bugs-sle-09-2022.xlsx](closed-bugs-sle-09-2022.xlsx) -->

## Vulnerabilities Fixed

See bugs with **XRay** in the title in the list above of closed bugs.

## Known Vulnerabilities

This data is a snapshot from MONTH DAY, 2022, and lists the components responsible for Critical or High severity security issues where there is a fix available.

<!-- [issues-sle-09-27-2022.xlsx](issues-sle-09-27-2022.xlsx) -->
