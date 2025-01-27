# Overview

[MinIO](https://min.io/) is a lightweight object storage solution which provides
compatibility with Amazon's S3 API. It can be used in place of S3 or another
production-grade object store when evaluating the SystemLink Enterprise
application. NI does not recommend MinIO for use with a production deployment.

Versions of SystemLink Enterprise released prior to January 2025 included MinIO
as an optional install alongside the SystemLink application. This is no longer
supported. This document provides a basic guide to installing MinIO to a
Kubernetes cluster as part of a SystemLink Enterprise evaluation. It also
provides guidance to help migrate existing evaluation deployments which were
deployed using the included MinIO and need to be upgraded to a more recent
version of the application.

## Installing MinIO

[Bitnami](https://bitnami.com/) provides a
[Helm chart](https://github.com/bitnami/charts/tree/main/bitnami/minio) which
can be used to install MinIO to a Kubernetes cluster. Use the following
procedure to configure and deploy this chart.

1. Review the
   [`README.md`](https://github.com/bitnami/charts/blob/main/bitnami/minio/README.md)
   from the Bitnami GitHub repo.
2. Copy and modify the `minio-values.yaml` file from this directory and
   configure MinIO for your environment.
   - A default username and password for the root user must be provided. Further
     configuration is optional.
3. Select the namespace where MinIO will be deployed, subsequently referred to
   as `<namespace>` in this document. This will often be the same namespace used
   to deploy SystemLink Enterprise.
4. Select the release name that will identify your Helm deployment, subsequently
   referred to as `<release>` in this document.
5. Execute the deployment:

```bash
helm --namespace <namespace> upgrade <release> oci://registry-1.docker.io/bitnamicharts/minio --install --values minio-values.yaml
```

The same command can be used to apply configuration changes to your release.

## Configuring SystemLink Enterprise to use MinIO

Configuring object storage is part of the standard process of deploying
SystemLink Enterprise. The following configuration is required to use MinIO.

In `systemlink-values.yaml`:

1. Set `s3Host` to an empty string.
2. Set `s3ServiceName` to `<release>-minio.<namespace>.svc.cluster.local`.
3. Set `s3Scheme` to `http`.
   - Unless you enabled TLS in your MinIO configuration, in which case use
     `https`.
4. Set `s3Port` to `9000`.
5. Leave `s3Region` with its default value.
6. Uncomment the commented-out text for
   `dataframeservice.sldremio.distStorage.aws.extraProperties` and configure the
   `fs.s3a.endpoint` and `fs.s3a.connection.ssl.enabled` properties in that
   section using the value set for s3ServiceName and the TLS configuration for
   your MinIO instance.

In `systemlink-secrets.yaml`:

1. Set `s3User` to the configured root user name.
2. Set `s3Password` to the configured root password.

## Migrating an existing MinIO deployment

If a version of SystemLink Enterprise prior to January 2025 has been deployed
using the included MinIO instance for object storage, it is possible to upgrade
to a release that does not include MinIO without loss of data. This will cause
an application downtime. If preservation of data is not required, you can simply
install a fresh copy of MinIO to the cluster and update the SystemLink
Enterprise configuration to use it, as described above.

To migrate data from the included MinIO:

1. Copy the `minio` section from the `systemlink-values.yaml` file used for the
   deployment to `minio-values.yaml`.
2. Upgrade SystemLink Enterprise to the desired version. This will delete the
   previously installed MinIO instance, which will leave the application in an
   error state. However, data previously stored in MinIO will not be deleted by
   this step.
3. Follow the instructions for [Installing Minio](#installing-minio) to install
   a new MinIO instance. Chose the same `<namespace>` as the SystemLink
   Enterprise deployment. Choose a `<release>` name matching
   `<systemlink release>-minio`.
   - For example, if you used `systemlink` for the release name for the
     SystemLink Enterprise deployment, use `systemlink-minio` for the MinIO
     deployment.
4. Verify that the MinIO deployment succeeds and that the MinIO instance is
   using the same persistent volume claims as the previous deployment.
5. You should not need to make further changes to the SystemLink Enterprise
   configuration. However, you will want to delete any pods belonging to the
   `dataframeservice`, `dfs-dremio`, `fileingestion`, `feedservice`, and
   `nbexec` services to force them to restart and use the newly available MinIO
   instance.
