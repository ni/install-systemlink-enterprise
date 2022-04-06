# Configuring Web Access to SystemLink Enterprise

SystemLink Enterprise requires multiple routable host names to enable access to the application. This document will explain what addresses are required. The process for registering DNS addresses and setting up the ingress controller for your cluster are beyond the scope of this document.

Visit the [Kubernetes documentation](https://kubernetes.io/docs/concepts/services-networking/ingress/) for a detailed overview of Cluster ingresses.

## Configuring Access to the UI

The SystemLink UI is the primary access point for the application. In _systemlink-values.yaml_, set the first value in the `global.hosts` array to your chosen hostname.

NOTE: The Helm chart supports multiple host names for the UI and API endpoints. This is an advanced feature not discussed here.

## Configuring Access to the API

A separate hostname is required for programmatic access to the SystemLink API. This can take any form desired, but a standard choice is to take the UI hostname:

"systemlink.myorganization.org"

And add "-api" to get:

"systemlink-api.myorganization.org"

Configure this host name by modifying the `global.apiHosts` array in _systemlink-values.yaml_.

## Configuring SaltMaster TCP Access

TODO

## (Optional) Configuring Access to MinIO

If required, enable access to the MiniO UI as follows:

1. In systemlink-values.yaml, set `minio.ingress.enabled` to true.
2. Provide a hostname for `minio.ingress.hostname`. A suggestion would be "systemlink-minio.myorganization.org"

Enable access to the MinIO API as follows:

1. In systemlink-values.yaml, set `minio.apiIngress.enabled` to true.
2. Provide a hostname for `minio.apiIngress.hostname`. A suggestion would be "systemlink-minio-api.myorganization.org"
