# Required Secrets for SystemLink Enterprise

SystemLink Enterprise requires the following secrets.

- Image Pull Secrets
    - niartifacts-secret
- Authentication
    - oidc-secret
- Whitelisted API Keys
    - assetmanagement-apikey
    - jupyterhub-apikey
    - nbexecworker-apikey
    - saltmaster-apikey
    - systemsmamagement-service-apikey
    - webserver-apikey
- Encryption Keys
    - fileingestionservices-encryption-key
    - systemsmanagementservice-dataprotection
    - webappservices-continuation-token
    - webserver-session
- Credentials
    - Grafana
        - grafana-login
    - MongoDB
        - assetmanagementservice-mongodb-credentials
        - fileingestionservices-mongodb-credentials
        - nbexecservice-mongodb-credentials
        - nidataframe-mongodb-credentials
        - sysmgmtevent-mongodb-credentials
        - systemsmangementservice-mongodb-credentials
        - userservices-mongodb-credentials
        - webappservices-mongodb-credentials
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

The NI container repository that hosts SystemLink Enterprise is private and requires authenticated access. You will have received credentials with access to SystemLink Enterprise. Configure image pull secrets for SystemLink Enterprise using the `global.imagePullSecrets` array in _systemlink-values.yaml_.

Image pull secrets must conform to the [kubernetes.io/dockerconfigjson format](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/).

## Authentication

The "oidc-secret" identifies SystemLink Enterprise with your OpenID Connect authentication provider. Refer to the [Configuring Authentication for SystemLink Enterprise](../configuration/configure-authentication.md) document for more information on setting up OpenID Connect. This secret has the following fields.

- `clientId`: An OpenID Connect client ID.
- `clientSecret`: The secret corresponding to `clientId`.
- `jwks`: A JSON web key set. If none is required, set to an empty string value.

## Whitelisted API Keys

SystemLink Enterprise uses Whitelisted API keys to authenticate inter-cluster service to service communication for operations that do not execute in the context of a specific user.

TODO: Describe how to generate API keys and update the hashes list.

## Encryption Keys

SystemLink Enterprise requires the following encryption keys.

| Secret                                  | Field         | Key Type |
|-----------------------------------------|---------------|----------|
| fileingestionservices-encryption-key    | encryptionKey | AES-256  |
| systemsmanagementservice-dataprotection | aesKey        | AES-128  |
| webappservices-continuation-token       | encryptionKey | AEAD     |
| webserver-session                       | encryptionKey | AES-128  |
| webserver-session                       | signatureKey  | SHA-256  |

## Credentials

### Grafana

The "grafana-login" secret defines an admin user for Grafana with the following fields.

- `admin-user`: A user name.
- `admin-password`: The password for `admin-user`.

### MongoDB

All MongoDB instances store credentials in a secret with the following fields.

- `mongodb-root-password`: A password that grants root access to the database cluster.
- `mongodb-password`: An array of passwords that each grant full access to an individual database.

    NOTE: Separate passwords with commas. Do not include whitespace or a trailing delimiter. For example: `password1,password2`

    The `userservices-mongodb-credentials` secret requires two `mongodb-passwords`. For the "user" and "keys" databases in that order.

    All other listed secrets require only a single password for this field.

- `mongodb-replica-set-key`: A key used to authenticate nodes in a MongoDB replica set.

    NOTE: Refer to the [MongoDB documentation](https://www.mongodb.com/docs/manual/tutorial/enforce-keyfile-access-control-in-existing-replica-set/#create-a-keyfile) to generate this key.

### PostgresSQL

#### dashboardhost-postgres-secrets

This secret has the following fields.

- `host`: The Host name of the postgres server.
- `user`: A PostgresSQL user name.
- `password`: The password for `user`.

#### testmonitorservicedb-connection

This secret has two forms depending on whether the database connection has been defined with a connection string or as parameters. Refer to the [Configuring SystemLink Enterprise to use an External PostgresSQL Database](../configuration/configure-external-postgres.md) document for more information on setting up a PostgresSQL connection.

**Option #1:** Connection String

The secret has a single field.

- `connection-string`: A PostgresSQL connection string.

**Option #2:** Connection Parameters

The secret has a single field.

- `password`: A password for the user defined by the `testmonitorservice.database.connectionInfo.user` value.

### RabbitMQ

Two secrets are required to enable connectivity for the RabbitMQ instance.

#### rabbitmq-user

Credentials for authenticating with the RabbitMQ instance. This secret has the following fields.

- `rabbitmq-user`: A user name.
- `rabbitmq-password`: Password for `rabbitmq-user`.

#### rabbitmq-erlang-cookie

An [Erlang Cookie](https://www.rabbitmq.com/clustering.html#erlang-cookie) value. This secret has a single field.

- `rabbitmq-erlang-cookie`: The Erlang cookie value.

### Redis

This secret has a single field.

- `password`: Password used to access the Redis database.

### S3/MinIO

The "minio-credentials" secret has the following fields.

- `root-user`: A user name.
- `root-password`: The password for `root-user`.

The same user name and password should be provided in the secrets that configure S3 access for individual services. The _systemlink-secrets.yaml_ file defaults to this configuration. You can also configure any service to connect to an S3 bucket.

The `fileingestion-s3-credentials` secret has the following fields.

- `aws-access-key-id`: The `root-user` name for MinIO. Alternatively, an S3 access key ID.
- `aws-secret-access-key`: The `root-password` value for MinIO access. Alternatively, an S3 access key ID.
- `aws-default-region`: The AWS region for the instance. Use "us-east-1" for MinIO.

#### nidataframe-s3-credentials

This secret has the following fields.

- `access-key-id`: The `root-user` name for MinIO. Alternatively, an S3 access key ID.
- `secret-access-key`: The `root-password` value for MinIO access. Alternatively, an S3 access key ID.
