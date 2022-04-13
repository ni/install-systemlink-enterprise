# SystemLink Enterprise Installation Guide

Before you begin, make sure you are familiar with [Kubernetes](https://kubernetes.io/) concepts and the user of [Helm charts](https://helm.sh/).

## 1. Before You Start

### 1.1 Setup the Cluster

SystemLink Enterprise requires a Kubernetes cluster with the following minimum requirements:

- 16 CPUs
- 80 Gigabytes of RAM
- 1 Terabyte of storage
- At least two nodes with 8CPUs and 32 Gigabytes of RAM each
    NOTE: Apply the `high_mem` [taint](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) to nodes with 32 Gigabytes of RAM or more.

SystemLink Enterprise supports the Nginx Ingress Controller for HTTP communication.

SystemLink Enterprise requires the [MetalLB](https://metallb.universe.tf/) for TCP communication. Refer to the [MetalLB documentation](https://metallb.universe.tf/installation/) for installation instructions.

### 1.2 External Dependencies

SystemLink Enterprise supports authentication through the OpenID Connect protocol. You must provide an external authentication server. Visit [Configuring Authentication for SystemLink Enterprise](configure-authentication.md) for more details.

SystemLink Enterprise requires an external PostgresSQL Server for data storage. Visit [Configuring SystemLink Enterprise to use an External PostgresSQL Database](configure-external-postgres.md) for more details.

### 1.3 Install Helm

SystemLink Enterprise is installed using the [Helm](https://helm.sh/) tool. You will need to install this tool locally prior to installing the application. Refer to the [official Helm documentation](https://helm.sh/docs/intro/install/) for installation instructions.

## 2. Configure Repositories

Before installing SystemLink Enterprise, you must configure the following required repositories.

| Alias     | Default URL                                        | Description |
| --------- | -------------------------------------------------- | ----------- |
| stable    | `https://charts.helm.sh/stable`                    | A chart repository hosted by the Helm maintainers. |
| bitnami   | `https://charts.bitnami.com/bitnami`               | A collection of charts for popular open source components maintained by [bitnami](https://bitnami.com/). |
| grafana   | `https://grafana.github.io/helm-charts`            | The Helm repository for [Grafana](https://grafana.com/). |
| jupyterhub| `https://jupyterhub.github.io/helm-chart/`         | The Helm repository for [JupyterHub](https://jupyter.org/hub). |
| strimzi   | `https://strimzi.io/charts`                        | The Helm repository for [Apache Kafka](https://kafka.apache.org/). |
| ni-helm   | `https://niartifacts.jfrog.io/artifactory/ni-helm` | NI's public Helm repository. The NI repository is authenticated. |

Run the following commands to add these repositories to your local helm instance using the username and access key you received when you were granted access to SystemLink Enterprise.

```bash
helm repo add stable https://charts.helm.sh/stable

helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo add grafana https://grafana.github.io/helm-charts

helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/

helm repo add strimzi https://strimzi.io/charts

helm repo add ni-helm https://niartifacts.jfrog.io/artifactory/ni-helm --username <user> --password <key>
```

### 2.1 Using a Private Repositories

To mirror the public Helm repositories on an internal server, replace the default repository URLs above with the URL of the mirror.

**IMPORTANT** - Do not alter the repository alias names even when using a mirror. The Systemlink Enterprise Helm chart uses the alias names to locate dependencies.

## 3. Configure SystemLink Enterprise

SystemLink Enterprise installation is configured using Helm values set in YAML files. This guide will walk through a common configuration and identify which values are required and which are customizable.

### 3.1 Configure the Application

Configuration is stored in values files that must be retained for the lifetime of your deployment. NI recommends storing these files in a source control repository. You can find templates for these files at in the [templates](templates) folder.

1. Download [systemlink-values.yaml](templates/systemlink-values.yaml).

    NOTE: The file contains detailed comments. NI recommends reading everything to understand what configuration will be applied with your application.

2. In many cases, you can use the default values. Cases where a value must be provided or additional attention is warranted are marked with a `<ATTENTION>`.
3. Review all `<ATTENTION>` comments and ensure the required configuration is provided. Delete these comments when you are done.

Visit the following pages for details on specific configuration tasks.

- [Configuring Web Access to SystemLink Enterprise](configure-hostnames.md)
- [Configuring Authentication for SystemLink Enterprise](configure-authentication.md)
- [Configuring SystemLink Enterprise to use an External PostgresSQL Database](configure-external-postgres.md)

### 3.2 Configure Secret Values

Sensitive information such as cryptographic keys and passwords required by SystemLink Enterprise will be stored as Kubernetes secrets on the cluster. SystemLink Enterprise supports configuring these secrets as part of Helm deployment.

Refer to the [Required Secrets for SystemLink Enterprise](secrets.md) document for a detailed description of every secret required by the SystemLink Enterprise application.

1. Download [systemlink-secrets.yaml](templates/systemlink-secrets.yaml).

    NOTE: This file will hold the secrets for your SystemLink Enterprise deployment and must be retained for the lifetime of your deployment. Restrict access to this file to avoid compromising the security of the application.

2. Read the documentation in the file to understand requirements.
3. Provide a value for every `<ATTENTION>` comment and delete the comment when you are done.

NOTE: You can disable Helm deployment of secrets by setting the `global.deploySecrets` value to false in _systemlink-values.yaml_. If you disable this option, you must ensure that all required secrets have been deployed to the cluster prior to installing the application.

### 3.3 Deploy Certificate Files

This guide assumes that SystemLink Enterprise will be configured to store data to an external PostgresSQL database. Obtain a public certificate from your database administrator to authenticate with the database. This guide assumes that the certificate is named "postgres.pem", but you can use any name. SystemLink Enterprise deploys the certificate as a ConfigMap resource. The installation examples provide the certificate as a configuration using the following Helm argument.

```bash
--set-file database.postgresCertificate=postgres.pem
```

**NOTE:** You do not need a certificate if TLS is not enabled for your database. NI recommends using TLS for all communication between SystemLink Enterprise and outside resources.

In rare cases, deployments may also require you to obtain a custom certificate authority from the server administrator to communicate with an OpenID Connect authorization server. You can deploy this file to the application by appending the following argument to any of the commands described below.

```bash
--set-file webserver.additionalCaCertificates=oidc.pem
```

## 4 Install SystemLink Enterprise

The example Helm commands in the remainder of this document contain the following variables that you will substitute with values specific to your deployment.

- **\<release\>**: The name Helm assigns to the installed collection of software. You will use this name to manage the software. Use short names such as "systemlink."
- **\<admin-release\>**: The release name used for installing the systemlink-admin Helm chart. For example, "systemlink-admin".
- **\<repo\>**: The absolute URL for the ni-helm repository.
- **\<version\>**: The specific version of the software to install.
- **\<namespace\>**: The namespace created for the application.
- **\<admin-namespace\>**: The namespace created for the systemlink-admin Helm chart.

### 4.1 Create Namespaces

Create the \<namespace\> and \<admin-namespace\> namespaces using the following commands.

```bash
kubectl create namespace <admin-namespace>
kubectl create namespace <namespace>
```

### 4.2 Install Cluster Prerequisites

A cluster administrator with full access rights must use the systemlink-admin Helm chart to install prerequisite resources globally on the cluster. Download a copy of [systemlink-admin-values.yaml](templates/admin-values.yaml) to deploy the configuration for these prerequisites. You will not need to modify any of the defaults in this file.

Use the following commands to install prerequisites to the \<systemlink-admin\> namespace.

```bash
helm repo update

helm upgrade <admin-release> systemlink-admin --install --repo <repo> --version <version> --namespace <admin-namespace> --values systemlink-admin-values.yaml --values systemlink-values.yaml --values systemlink-secrets.yaml --wait --timeout 10m0s
```

This command will wait for up to the configured timeout (10 minutes) for the install to complete and for all resources to enter a ready state. The timeout is conservative, but actual installation times may vary due to a variety of factors. Adjust the timeout if needed.

Refer to the [Helm documentation](https://helm.sh/docs/helm/helm_upgrade/) for additional information about the upgrade command.

### 4.3 Install the Application

The user who preforms the installation does not need full cluster access but must have full access to \<namespace\>.

Use the following commands to install SystemLink Enterprise.

```bash
helm repo update

helm upgrade <release> systemlink --install --repo <repo> --version <version> --namespace <namespace> --values systemlink-values.yaml --values systemlink-secrets.yaml --set-file database.postgresCertificate=postgres.pem --wait --timeout 20m0s
```

This command will wait for up to the configured timeout (20 minutes) for the install to complete and for all resources to enter a ready state. The timeout is conservative, but actual installation times may vary due to a variety of factors. Adjust the timeout if needed.

Refer to the [Helm documentation](https://helm.sh/docs/helm/helm_upgrade/) for additional information about the upgrade command.

## 5. Validate the Install

Use the following command to run a set of Helm tests to help validate a new installation.

```bash
helm test <release> --namespace <namespace>
```

This command deploys a series of pods that each perform a validation test on the cluster. If the test passes, the command deletes all deployed pods. If a test fails, deployed pods remain in place so you can inspect the pod log.

Navigate to the UI hostname you configured to login to SystemLink Enterprise as the configured system administrator.

## 6. Updating the Application

To modify the configuration of the SystemLink application or to upgrade to a newer version of the product, re-run the same command you used to install the product as shown in the following example.

```bash
helm repo update

helm upgrade <release> systemlink --install --repo <repo> --version <version> --namespace <namespace> --values systemlink-values.yaml --values systemlink-secrets.yaml --set-file database.postgresCertificate=postgres.pem
```

The update command will apply any changes you made to the values in your files since installing. If necessary, containers will be updated to the specified `<version>`. Changes will be applied using a [RollingUpdate](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#rolling-update-deployment) strategy to avoid downtime.

**!!IMPORTANT!!** - You must provide all configuration files when you upgrade. Failing to provide part of the configuration may result in resources being deleted from the cluster and application failures.

## 7. Uninstalling SystemLink

Prior to uninstalling SystemLink, backup any critical data to avoid potential data loss.

Uninstalling SystemLink will remove all resources associated with the Helm release except persistent volume claims and associated storage. You must delete volumes manually. If you install SystemLink again in the same namespace with the same release name, the application will attempt to re-use any existing volumes.

To Uninstall SystemLink, run the following commands:

```bash
helm delete <release> --namespace <namespace>
helm delete <admin-release> --namespace <namespace>
```
