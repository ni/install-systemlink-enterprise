# SystemLink Enterprise Installation Guide

This document is a guide for configuring and deploying the SystemLink Enterprise application for the first time. This guide assumes that the reader is familiar with basic [Kubernetes](https://kubernetes.io/) concepts and the user of [Helm charts](https://helm.sh/).

## 1. Before You Start

### 1.1 Setup the Cluster

SystemLink Enterprise requires a Kubernetes cluster with the following minimum requirements:

TODO: Define minimum requirements.

Cluster setup is beyond the scope of this document.

The SystemLink Enterprise helm charts currently supports the Nginx ingress controller. It may be possible to use other ingress controllers by customizing ingress annotations in the Helm values file, but this is not officially supported.

### 1.2 External Dependencies

SystemLink Enterprise supports authentication through the OpenID Connect protocol. An external authentication server must be provided. More detail can be found in the [Configure Authentication for SystemLink Enterprise](configuration/configure-authentication.md) document.

SystemLink Enterprise requires an external PostgresSQL Server for data storage.More detail can be found in the [Configure SystemLink Enterprise to use an External PostgresSQL Database](configuration/configure-external-postgres.md)

### 1.3 Install Helm

SystemLink Enterprise is installed using the [Helm](https://helm.sh/) tool. You will need to install this tool locally prior to installing the application. [Refer to the official Helm documentation for installation instructions](https://helm.sh/docs/intro/install/).

## 2. Configure Repositories

Prior to installing SystemLink Enterprise, you must configure required repositories in the Helm tool. The following repositories are required.

| Alias   | Default URL | Description |
| ------- | -------------------------------------------------- | ----------- |
| stable  | `https://charts.helm.sh/stable`                    | A chart repository hosted by the Helm maintainers |
| bitnami | `https://charts.bitnami.com/bitnami`               | A collection of charts for popular open source components maintained by [bitnami](https://bitnami.com/) |
| ni-helm | `https://niartifacts.jfrog.io/artifactory/ni-helm` | NIs public Helm repository |

The NI repository is authenticated. You will have received a username and and access key for the repository when you were granted access to the SystemLink Enterprise product.

Run the following commands to add these repositories to your local helm instance.

```bash
helm repo add stable https://charts.helm.sh/stable

helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo add ni-helm https://niartifacts.jfrog.io/artifactory/ni-helm --username <user> --password <key>
```

### 2.1 Using a Private Repositories

Some organizations may choose to mirror the public Helm repositories on an internal server. This is supported by SystemLink Enterprise. In this case, simply replace the default repository URLs above with the URL of the mirror.

**IMPORTANT** - Do not alter the repository alias names even when using a mirror. The alias names will be used by the SystemLink Helm chart to locate dependencies.

## 3. Configure SystemLink Enterprise

The installation of the SystemLink Enterprise product is configured using Helm values. These values are set in YAML files. This guide will walk through a common configuration and identify required values and common customizations.

### 3.1 Configure the Application

Configuration will be stored in values files. Template files are provided with this guide. These files must be retained for the lifetime of your deployment. NI recommends storing this file in a source control repository.

1. Download [systemlink-values.yaml](templates/systemlink-values.yaml).
2. The file contains detailed comments. NI recommends reading everything to understand what configuration will be applied with your application.
3. In many cases, the default values can be used. In cases where a value must be provided or additional attention is warranted, a `!!TODO!!` content has been added.
4. Review all `!!TODO!!` comments and ensure the required configuration is provided. Delete these comments when done.

Additional detail on specific configuration tasks can be found in the following documents:

- [Configure Web Access to SystemLink Enterprise](configuration/configure-hostnames.md)
- [Configure Authentication for SystemLink Enterprise](configuration/configure-authentication.md)
- [Configure SystemLink Enterprise to use an External PostgresSQL Database](configuration/configure-external-postgres.md)

### 3.2 Configure Secret Values

Sensitive information such as cryptographic keys and passwords required by SystemLink Enterprise will be stored as Kubernetes secrets on the cluster. SystemLink Enterprise supports configuring these secrets as part of Helm deployment.

Refer to the [Required Secrets for SystemLink Enterprise](secrets/secrets.md) document for a detailed description of every secret required by the SystemLink Enterprise application.

1. Download [systemlink-secrets.yaml](templates/systemlink-secrets.yaml).

    NOTE: This file will hold the secrets for your SystemLink Enterprise deployment. As with systemlink-values.yaml, this file must be retained for the lifetime of your deployment. Care must be taken to control access to this file as it contains data that could compromise the security of the application. Best practices for secure management of secrets is beyond the scope of this document.

2. Read the documentation in the file to understand requirements.
3. For every value in the file marked with a `!!TODO!!` comment a value must be provided.
4. After a value is configured, delete the corresponding `TODO`.

NOTE: Helm deployment of secrets is not required. To disable, simply set the `global.deploySecrets` value to `false` in systemlink-values.yaml. When choosing this option, it is up to you to ensure that all required secrets have been deployed to the cluster prior to installing the application.

### 3.3 Deploy Certificate Files

This guide assumes that SystemLink Enterprise will be configured to store data to an external PostgresSQL database. The application will require a public certificate in order to authenticate with the database. You will need to obtain this certificate from your database administrator. This guide assumes that this file is named `postgres.pem`, but any name can be used.

SystemLink Enterprise will deploy this certificate as a ConfigMap resource. The installation examples shown below provide the certificate as configuration using the following Helm argument:

```bash
--set-file database.postgresCertificate=postgres.pem
```

**NOTE:** A certificate is not required if TLS is not enabled for your database. NI recommends using TLS for all communication between SystemLink Enterprise and outside resources.

Rarely, deployments may also require a custom certificate authority in order to communicate with an OpenID Connect authorization server. Again, this is something you will need to obtain from the server administrator. This file can be deployed to the application by appending the following argument to any of the commands described below.

```bash
--set-file webserver.additionalCaCertificates=oidc.pem
```

## 4 Install SystemLink Enterprise

The remainder of this document provides example Helm commands with variables that will be substituted with values specific to your deployment. These are defined here:

- **\<release\>**: The name Helm assigns to the installed collection of software. You will use this name to manage the software in the future. Prefer short names. "systemlink" is a good default.
- **\<admin-release\>**: This is the release name used for installing the systemlink-admin Helm chart. "systemlink-admin" is a good default.
- **\<repo\>**: Absolute URL for the ni-helm repository, as described above.
- **\<version\>**: The specific version of the software to install. NI recommends specifying a specific version for all installations. Omitting this argument will cause the latest stable release to be installed.
- **\<namespace\>**: An existing namespace on the cluster.

### 4.1 Create a Namespace

NI recommends installing SystemLink enterprise to a dedicated namespace on the cluster. You should select a name for your namespace and create it using:

```bash
kubectl create <namespace>
```

### 4.2 Install Cluster Prerequisites

SystemLink Enterprise requires some resources to be installed globally on the cluster. This installation requires a cluster administrator with full access rights.

Prerequisites are installed using the systemlink-admin Helm chart.

You will need download a copy of [systemlink-admin-values.yaml](templates/admin-values.yaml) to deploy the configuration for these prerequisites. It should not be necessary to modify any of the defaults in this file.

Install prerequisites using the following commands:

```bash
helm repo update

helm upgrade <admin-release> systemlink-admin --install --repo <repo> --version <version> --values systemlink-admin-values.yaml --wait --timeout 20m0s
```

This command will wait for up to the configured timeout (20 minutes) for the install to complete and for all resources to enter a ready state. The timeout is conservative, but actual installation times may vary due to a variety of factors. Adjust the timeout if needed.

[Refer to the Helm documentation for additional information about the upgrade command](https://helm.sh/docs/helm/helm_upgrade/).

### 4.3 Install the Application

Installation should be performed by a user with full access to the SystemLink Enterprise namespace created above. Full cluster access is not required.

The following commands can be used to install SystemLink Enterprise using the typical configuration described above.

```bash
helm repo update

helm upgrade <release> systemlink --install --repo <repo> --version <version> --namespace <namespace> --values systemlink-values.yaml --values systemlink-secrets.yaml --set-file database.postgresCertificate=postgres.pem --wait --timeout 20m0s
```

This command will wait for up to the configured timeout (20 minutes) for the install to complete and for all resources to enter a ready state. The timeout is conservative, but actual installation times may vary due to a variety of factors. Adjust the timeout if needed.

[Refer to the Helm documentation for additional information about the upgrade command](https://helm.sh/docs/helm/helm_upgrade/).

## 5. Validate the Install

SystemLink provides a set of Helm tests to help validate a new installation. Run the test using the following command:

```bash
helm test <release> --namespace <namespace>
```

This operation will deploy a series of pods to the cluster, each of which performs a validation test then completes. If the test passes, all deployed containers wil be deleted. If a test fails, deployed pods will remain in place so that logs may be inspected. It may be necessary to manually delete pods in this case.

You can now login to the SystemLink application as the configured system administrator by navigating to the UI hostname you previously configured.

## 6. Updating the Application

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
