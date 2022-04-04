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

### Grafana

The "grafana-login" secret defines an admin user for Grafana with the following fields:

- `admin-user`: User name.
- `admin-password`: Password.

### MongoDB

All MongoDB instances store credentials in a secret with the following fields:

- `mongodb-root-password`: Password for the user with administrator access to the server.
- `mongodb-password`: An array of passwords for database administrator access to individual MongoDB databases. Do not use a comma character in your passwords. See below for additional details.
- ` mongodb-replica-set-key`: A key used to authenticate nodes in a MongoDB replica set. [Refer to the MongoDB documentation for instructions for generating this key](https://www.mongodb.com/docs/manual/tutorial/enforce-keyfile-access-control-in-existing-replica-set/#create-a-keyfile).

Each SystemLink service maintains its own MongoDB replica set. At installation time, the service will create a database in the replica set and allocate a user with administrator access to that database an no access to any other part of the replica set. The `mongodb-passwords` field contains an ordered array of passwords for these users, separated by commas without whitespace. So to configure "password1" and "password2" you would set "password1,password2". No trailing comma and you cannot use comma as a character in your passwords.

Most SystemLink services maintain only a single database and so only require a single password, so the `mongodb-passwords` array will have only a single element. The exception here is the `userservices-mongodb-credentials` which maintains both a "user" and a "keys" database. In this case, the field should be configured with "userPassword,keysPassword". The order is important.

### PostgresSQL

#### dashboardhost-postgres-secrets

This secret has the following fields:

- `host`: Host name of the postgres server.
- `user`: PostgresSQL user name.
- `password`: The password for `user`.

#### testmonitorservicedb-connection

This secret has two forms depending on whether the database connection has been defined with a connection string or as parameters. Refer to the [Commonly Modified Settings for SystemLink Enterprise](../configuration/common-configuration.md) document for more information on setting up a PostgresSQL connection.

**Option #1:** Connection String

The secret has a single field:

- `connection-string`: A PostgresSQL connection string.

**Option #2:** Connection Parameters

The secret has a single field:

- `password`: A password for the user defined by the `testmonitor.database.connectionInfo.user` value.

### RabbitMQ

Two secrets are required to enable connectivity for the RabbitMQ instance.

#### rabbitmq-user

Credentials for authenticating with the RabbitMQ instance. This secret has the following fields:

- `rabbitmq-user`: User name.
- `rabbitmq-password`: Password for `rabbitmq-user`.

#### rabbitmq-erlang-cookie

An [Erlang Cookie](https://www.rabbitmq.com/clustering.html#erlang-cookie) value used to authenticate between instances in a cluster of RabbitMQ containers. This secret has a single field:

- `rabbitmq-erlang-cookie`: The Erlang cookie value.

### Redis

This secret has a single field:

- `password`: Password used to access the Redis database.

### S3/MinIO

SystemLink Enterprise supports S3 for file storage. A MinIO instance is provided to enable S3 access to local volumes. The "minio-credentials" secret defines access to this instance with the following fields:

- `root-user`: A user name.
- `root-password`: The password for `root-user`.

If using the MinIO instance, the same user name and password should be provided in the secrets that configure S3 access for individual services. The _systemlink-secrets.yaml_ file defaults to this configuration. These secrets can, alternatively, be configured to access any S3 instance.

#### fileingestion-s3-credentials

This secret has the following fields:

- `aws-access-key-id`: This is the `root-user` name for MinIO. Otherwise, provide the key ID for your S3 instance.
- `aws-secret-access-key`: This is the `root-password` for MinIO access. Otherwise, provide a key for your S3 instance.
- `aws-default-region`: The AWS region for the instance. Use "us-east-1" for MinIO.

#### nidataframe-s3-credentials

This secret has the following fields:

- `access-key-id`: This is the `root-user` name for MinIO. Otherwise, provide the key ID for your S3 instance.
- `secret-access-key`: This is the `root-password` for MinIO access. Otherwise, provide a key for your S3 instance.
