# Mirroring SystemLink Repositories

SystemLink Enterprise is distributed in the form of Helm charts and Docker images. These resources are located in the following artifact repositories.

Helm:   `https://niedge01.jfrog.io/artifactory/ni-helm`
Docker: `https://niedge01.jfrog.io/artifactory/ni-docker`

To create a local mirror for the SystemLink application, both must be replicated to a local artifact repository.

## Repository Setup

The NI artifact repositories are organized using the Virtual Repository layout described in JFrog's [whitepaper on structuring and naming repositories](https://jfrog.com/whitepaper/best-practices-structuring-naming-artifactory-repositories/). Any mirror must maintain the same relative naming and layout of artifacts. Failure to do so may prevent installation of the application.

TODO: pull through proxy cache

## Helm Setup

Helm must be configured to use the mirror rather than the niedge01 repository.

```bash
helm repo add ni-helm <mirror-url> --username <user> --password <key>
```

Where `<mirror-url>` is the address of your mirror.

**IMPORTANT** - Do not alter the repository alias names even when using a mirror. The Systemlink Enterprise Helm chart uses the alias names to locate dependencies.

## Docker Setup

In _systemlink-values.yaml_, set `global.imageRegistry to the address of your registry.

You may also need to configure an image pull secret as described in the [Required Secrets for SystemLink Enterprise](secrets.md) document.
