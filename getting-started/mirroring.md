# Mirroring SystemLink Repositories

SystemLink Enterprise is distributed in the form of Helm charts and Docker images. These resources are located in the following artifact repositories.

Helm:   `https://niedge01.jfrog.io/artifactory/ni-helm`
Docker: `https://niedge01.jfrog.io/artifactory/ni-docker`
Generic: `https://niedge01.jfrog.io/artifactory/ni-generic`

## Repository Setup

The NI artifact repositories are organized using the Virtual Repository layout described in JFrog's [whitepaper on structuring and naming repositories](https://jfrog.com/whitepaper/best-practices-structuring-naming-artifactory-repositories/). Any mirror must maintain the same relative naming and layout of artifacts. Failure to do so may prevent installation of the application.

NI recommends configuring the mirror as a pull-through proxy for niedge01.jfrog.io. Create a proxy for each NI repository. When a resource hosted on the NI repository is requested from the mirror, the mirror will automatically download and cache the resource. This approach minimizes maintenance of the mirror while still providing control over what resources can be accessed locally. The process for configuring this mirror will depend on your repository software. An example can be found in [the JFrog documentation](https://jfrog.com/knowledge-base/how-to-configure-a-remote-repository-in-artifactory-to-proxy-a-private-docker-registry-in-docker-hub/).

## Helm Setup

Helm must be configured to use the mirror rather than the niedge01 repository.

```bash
helm repo add ni-helm <mirror-url> --username <user> --password <key>
```

Where `<mirror-url>` is the address of your mirror.

**IMPORTANT** - Do not alter the `ni-helm` alias name when using a mirror.

## Docker Setup

In _systemlink-values.yaml_, set `global.imageRegistry to the address of your registry.

You may also need to configure an image pull secret as described in the [Required Secrets for SystemLink Enterprise](secrets.md) document.
