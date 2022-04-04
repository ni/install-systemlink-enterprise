# Required Secrets for SystemLink Enterprise

Secrets required for the SystemLink Enterprise application can either be managed directly as part of the Helm chart or created manually prior to installing the application.

The following is a categorized list of required secrets.

- Image Pull Secrets
    - niartifacts-secret
- Authentication
    - oidc-secret
- Whitelisted API Keys
    - jupyterhub-apikey
    - nbexecworker-apikey
    - saltmaster-apikey
    - systemsmamagement-service-apikey
    - webserver-apikey
- Encryption Keys
    - fileingestionservices-encryption-key
    - systemsmanagementservice-dataprotection
    - webserver-session
- Credentials
    - Grafana
        - grafana-login
    - MongoDB
        - fileingestionservices-mongodb-credentials
        - nbexecservice-mongodb-credentials
        - nidataframe-mongodb-credentials
        - sysmgmtevent-mongodb-credentials
        - systemsmangementservice-mongodb-credentials
        - userservices-mongodb-credentials
    - PostgresSQL
        - dashboardhost-postgres-secrets
        - testmonitorservicedb-connection
    - RabbitMQ
        - rabbitmq-user
        - rabbitmq-erlang-cookie
    - Redis
        - webserver-redis-credentials
    - S3/MinIO
        - fileingestion-s3-credentials
        - minio-credentials
        - nidataframe-s3-credentials

The remainder of this document describes each secret in detail. Unless otherwise specified, all secrets have the [Opaque type](https://kubernetes.io/docs/concepts/configuration/secret/#secret-types).

## Image Pull Secrets

The NI container repository that hosts SystemLink Enterprise is private and requires authenticated access. You will have received credentials with access to SystemLink Enterprise. It is necessary to store these credentials as a secret on the cluster so that the cluster can access the repository. You can configure which secrets are used to pull containers from repositories using the `global.imagePullSecrets` array in _systemlink-values.yaml`.

Image pull secrets must conform to [the kubernetes.io/dockerconfigjson format](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/).

## Authentication

The "oidc-secret" identifies SystemLink Enterprise with your OpenID Connect authentication provider. Refer to the [Commonly Modified Settings for SystemLink Enterprise](../configuration/common-configuration.md) document for more information on setting up OpenID Connect. This secret has the following fields:

- `clientId`: OpenID connect client ID.
- `clientSecret`: The secret corresponding to `clientId`.
- `jwks`: A JSON web key set. If none is required, set to an empty string value.

## Whitelisted API Keys

SystemLink Enterprise uses Whitelisted API key secrets to authenticate inter-cluster service to service communication for operations that do not execute in the context of a specific user.

TODO: Describe how to generate API keys and update the hashes list.

## Encryption Keys

Several encryption keys are used to protect application data. The following table gives the expected name and key type for each secret. Note the webserver-session secret contains two separate keys.

| Secret                                  | Field         | Key Type |
|-----------------------------------------|---------------|----------|
| fileingestionservices-encryption-key    | encryptionKey | AES-256  |
| systemsmanagementservice-dataprotection | aesKey        | AES-128  |
| webserver-session                       | encryptionKey | AES-128  |
| webserver-session                       | signatureKey  | SHA-256  |

## Credentials

TODO
