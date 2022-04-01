# SystemLink Enterprise Installation Guide

## First Steps

### Cluster Requirements

!!!TODO!!!

### Installing Helm

SystemLink Enterprise is installed using the [Helm](https://helm.sh/) tool. You will need to install this tool locally prior to installing the application. [Refer to the official Helm documentation for installation instructions](https://helm.sh/docs/intro/install/).

## Configure Repositories

Prior to installing SystemLink Enterprise, you must configure required repositories in the Helm tool. The following repositories are required.

| Alias   | Default URL | Description |
| ------- | ---------------------------------------------------- | ----------- |
| stable  | https://charts.helm.sh/stable                        | A chart repository hosted by the Helm maintainers |
| bitnami | https://charts.bitnami.com/bitnami                   | A collection of charts for popular open source components maintained by [bitnami](https://bitnami.com/) |
| ni-helm | https://niartifacts.jfrog.io/artifactory/ni-helm | NIs public Helm repository |

The NI repository is authenticated. You will have received a username and and access key for the repository when you were granted access to the SystemLink Enterprise product.

Run the following commands to add these repositories to your local helm instance.

```bash
helm repo add stable https://charts.helm.sh/stable

helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo add ni-helm https://niartifacts.jfrog.io/artifactory/ni-helm --username <user> --password <key>
```

### Private Repositories

Some organizations may choose to mirror the public Helm repositories on an internal server. This is supported by SystemLink Enterprise. In this case, simply replace the default repository URLs above with the URL of the mirror.

**!!IMPORTANT!!** - Do not alter the repository alias names even when using a mirror. The alias names will be used by the SystemLink Helm chart to locate dependencies.

## Configuration

The installation of the SystemLink Enterprise product is configured using Helm values. These values are set in YAML files. This guide will walk through a common configuration and identify required values and common customizations.

### General Configuration

Download [values.yaml](templates/systemlink-values.yaml). This file

### Secrets

### Certificate files

This guide assumes that SystemLink Enterprise will be configured to store data to an external PostgresSQL database. The application will require a public certificate in order to authenticate with the database. You will need to obtain this certificate from your database administrator. This guide assumes that this file is named `postgres.pem`, but any name can be used.

SystemLink Enterprise will deploy this certificate as a ConfigMap resource. The installation examples shown below provide the certificate as configuration using the following Helm argument:

```bash
--set-file database.postgresCertificate=postgres.pem
```

Rarely, deployments may also require a custom certificate authority in order to communicate with an OpenID Connect authorization server. Again, this is something you will need to obtain from the server administrator. This file can be deployed to the application by appending the following argument to any of the commands described below.

```
--set-file webserver.additionalCaCertificates=oidc.pem
```

## Installation

### Create a namespace

NI recommends installing SystemLink enterprise to a dedicated namespace on the cluster. You should select a name for your namespace and create it using:

```bash
kubectl create <namespace>
```

### Variables for Helm Commands

The remainder of this document provides example Helm commands with variables that will be substituted with values specific to your deployment. These are defined here:

- **\<release\>**: The name Helm assigns to the installed collection of software. You will use this name to manage the software in the future. Prefer short names. "systemlink" is a good default.
- **\<admin-release\>**: This is the release name used for installing the systemlink-admin Helm chart. "systemlink-admin" is a good default.
- **\<repo\>**: Absolute URL for the ni-helm repository, as described above.
- **\<version\>**: The specific version of the software to install. NI recommends specifying a specific version for all installations. Omitting this argument will cause the latest stable release to be installed.
- **\<namespace\>**: An existing namespace on the cluster.

### Install Cluster Prerequisites

SystemLink Enterprise requires some resources to be installed globally on the cluster. This installation requires a cluster administrator with full access rights.

Prerequisites are installed using the systemlink-admin Helm chart.

You will need download a copy of [systemlink-admin-values.yaml](templates/admin-values.yaml) to deploy the configuration for these prerequisites. It should not be necessary to modify any of the defaults in this file.

Install prerequisites using the following commands:

```bash
helm repo update

helm upgrade <admin-release> systemlink-admin --install --repo <repo> --version <version> --values systemlink-admin-values.yaml
```

### Install SystemLink Enterprise

Installation should be performed by a user with full access to the SystemLink Enterprise namespace created above. Full cluster access is not required.

The following commands can be used to install SystemLink Enterprise using the typical configuration described above.

```bash
helm repo update

helm upgrade <release> systemlink --install --repo <repo> --version <version> --namespace <namespace> --values systemlink-values.yaml --values systemlink-secrets.yaml --set-file database.postgresCertificate=postgres.pem
```

[Refer to the Helm documentation for additional information about the install command](https://helm.sh/docs/helm/helm_upgrade/).

## Validation

SystemLink provides a set of Helm tests to help validate a new installation. These can be run as follows:

```bash
helm test <release> --namespace <namespace>
```

This operation will deploy a series of pods to the cluster, each of which performs a validation test then completes. If the test passes, all deployed containers wil be deleted. If a test fails, deployed pods will remain in place so that logs may be inspected. It may be necessary to manually delete pods in this case.

You can now login to the SystemLink application as the configured system administrator by navigating to the Host URL you previously configured.

## Upgrades and Modifications

To modify the configuration of the SystemLink application or to upgrade to a newer version of the product, you will re-run the same command used to install the product, for example:

```bash
helm repo update

helm upgrade <release> systemlink --install --repo <repo> --version <version> --namespace <namespace> --values systemlink-values.yaml --values systemlink-secrets.yaml --set-file database.postgresCertificate=postgres.pem
```

Changes to the values files will be applied. New pods will be deployed as needed using the specified `<version>` using a rolling update strategy.

**!!IMPORTANT!!** - All configuration files must be provided whenever an upgrade is performed. Failing to provide some part of the configuration may result in resources being deleted from the cluster and failures in the application.

If it is necessary to completely remove SystemLink Enterprise from a cluster, you can do so by running:

```bash
helm delete <release> --namespace <namespace>
```

Doing so will remove all resources associated with the Helm release, with the exception of persistent volume claims and associated storage. Volumes will remain in place until manually deleted. If SystemLink Enterprise is subsequently re-installed in the same namespace with the same release name, the application will attempt to re-use any existing volumes.
