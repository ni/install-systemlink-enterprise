# Configuring Web Access to SystemLink Enterprise

SystemLink Enterprise requires multiple routable host names to enable access to the application. This document will explain what addresses are required. The process for registering DNS addresses and setting up the ingress controller for your cluster are beyond the scope of this document.

Visit the [Kubernetes documentation](https://kubernetes.io/docs/concepts/services-networking/ingress/) for a detailed overview of Cluster ingresses.

## Configuring Access to the UI

The SystemLink UI is the primary access point for the application. In _systemlink-values.yaml_, set the first value in the `global.hosts` array to your chosen hostname.

## Configuring Access to the API

You need a separate hostname for programmatic access to the SystemLink API. To configure the hostname, modify the `global.apiHosts`' array in _systemlink-values.yaml_. For example, if your UI hostname is "systemlink.myorganization.org", you can use "systemlink-api.myorganization.org".

## Configuring SaltMaster TCP Access

TODO

## (Optional) Configuring Access to MinIO

If required, enable access to the MiniO UI as follows:

1. In systemlink-values.yaml, set `minio.ingress.enabled` to true.
2. Provide a hostname for `minio.ingress.hostname`. For example, "systemlink-minio.myorganization.org".

Enable access to the MinIO API as follows:

1. In systemlink-values.yaml, set `minio.apiIngress.enabled` to true.
2. Provide a hostname for `minio.apiIngress.hostname`. For example, "systemlink-minio-api.myorganization.org"