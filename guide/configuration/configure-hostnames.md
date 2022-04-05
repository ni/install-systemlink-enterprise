# Configure Web Access to SystemLink Enterprise

SystemLink Enterprise requires multiple routable host names to enable access to the application. This document will explain what addresses are required. The process for registering DNS addresses and setting up the ingress controller for your cluster are beyond the scope of this document.

The Kubernetes documentation provides [a detailed overview of Cluster ingresses](https://kubernetes.io/docs/concepts/services-networking/ingress/).

## Configure Access to the UI

The SystemLink UI is the primary access point for the application. After selecting your hostname:

1. In _systemlink-values.yaml, set the `global.host` value to be an array containing your hostname.

    NOTE: The Helm chart supports multiple host names for the UI and API endpoints. This is an advanced feature not discussed here.

2. Set `dashboardhost.grafana.grafana.ini.server.domain` to the same host name.

## Configure Access to the API

A separate hostname is required for programmatic access to the SystemLink API. This can take any form desired, but a standard choice is to take the UI hostname:

"systemlink.myorganization.org"

And add "-api" to get:

"systemlink-api.myorganization.org"

Configure this host name by modifying the `global.apiHosts` array in _systemlink-values.yaml_.

## Configure SaltMaster TCP Access

TODO

## Configure Access to the MinIO API

An additional host name is required for the MinIO API. As above, as standard approach would be to use something like:

"systemlink-minio-api.myorganization.org"

Configure this host name by modifying the `minio.apiIngress.hostname` value in _systemlink-values.yaml_.

## Configure Access to the MinIO UI

If Access to the MinIO UI is enabled, modify the `minio.ingress.hostname` value in _systemlink-secrets.yaml_ with the chosen hostname.
