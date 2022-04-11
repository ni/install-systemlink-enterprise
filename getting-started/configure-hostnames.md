# Configuring Web Access to SystemLink Enterprise

SystemLink Enterprise requires multiple routable host names to enable access to the application. This document will explain what addresses are required. The process for registering DNS addresses and setting up the ingress controller for your cluster are beyond the scope of this document.

Visit the [Kubernetes documentation](https://kubernetes.io/docs/concepts/services-networking/ingress/) for a detailed overview of Cluster ingresses.

## Configuring Access to the UI

The SystemLink UI is the primary access point for the application. In _systemlink-values.yaml_, set the first value in the `global.hosts` array to your chosen hostname.

## Configuring Access to the API

You need a separate hostname for programmatic access to the SystemLink API. To configure the hostname, modify the `global.apiHosts`' array in _systemlink-values.yaml_. For example, if your UI hostname is "systemlink.myorganization.org", you can use "systemlink-api.myorganization.org".

## Configuring SaltMaster TCP Access

SystemLink Enterprise uses the [Salt](https://saltproject.io/) infrastructure management engine to manage test systems. Salt communicates with test systems using [a TCP-based protocol](https://docs.saltproject.io/en/getstarted/system/communication.html). Salt communication uses TCP ports 4505 and 4506.

1. Create a layer2 [MetalLB address pool](https://metallb.universe.tf/concepts/) for Salt. This pool must contain all IP addresses which will be used for Salt access. An example can be found [here](https://metallb.universe.tf/configuration/#layer-2-configuration).
2. In _systemlink-values.yaml_, modify `saltmaster.serviceTCP.annotations.metallb.universe.tf/address-pool` with the name of your address pool.

## (Optional) Configuring Access to MinIO

If required, enable access to the MiniO UI as follows:

1. In systemlink-values.yaml, set `minio.ingress.enabled` to true.
2. Provide a hostname for `minio.ingress.hostname`. For example, "systemlink-minio.myorganization.org".

Enable access to the MinIO API as follows:

1. In systemlink-values.yaml, set `minio.apiIngress.enabled` to true.
2. Provide a hostname for `minio.apiIngress.hostname`. For example, "systemlink-minio-api.myorganization.org"
