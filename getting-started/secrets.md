# Required Secrets for SystemLink Enterprise

The secrets listed in this document are required. Unless otherwise specified, all secrets have the [Opaque type](https://kubernetes.io/docs/concepts/configuration/secret/#secret-types).

|Category|Secrets|Details|
|--|--|--|
|Image Pull||The NI container repository that hosts SystemLink Enterprise is private and requires authenticated access. You will have received credentials with access to SystemLink Enterprise. Configure image pull secrets for SystemLink Enterprise using the `global.imagePullSecrets` array in _systemlink-values.yaml_. <br/><br/>Image pull secrets must conform to the [kubernetes.io/dockerconfigjson format](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/).|
||niartifacts-secret||
|Authentication|||
||oidc-secret|Identifies SystemLink Enterprise with your OpenID Connect authentication provider and has the following fields. <br/><ul><li>`clientId`: An OpenID Connect client ID.</li><li>`clientSecret`: The secret corresponding to `clientId`.</li><li>`jwks`: A JSON web key set. If none is required, set to an empty string value.</li></ul>|
|Whitelisted API Keys||SystemLink Enterprise uses Whitelisted API keys to authenticate inter-cluster service to service communication for operations that do not execute in the context of a specific user.<br/><br/>TODO: Describe how to generate API keys and update the hashes list.|
||assetmanagement-apikey||
||jupyterhub-apikey||
||nbexecworker-apikey||
||saltmaster-init-apikey||
||systemsmamagement-service-apikey||
||webserver-apikey||
|Encryption Keys|||
||fileingestionservices-encryption-key| Field: encryptionKey<br/>Key Type: AES-256|
||systemsmanagementservice-dataprotection|Field: aesKey<br/>Key Type: AES-128|
||webappservices-continuation-token|Field: encryptionKey<br/>Key Type: AEAD|
||webserver-session|Field: encryptionKey<br/>Key Type: AES-128<br/>Field: signatureKey<br/>Key Type: SHA-256|
|Grafana Credentials|||
||grafana-login|Defines an admin user for Grafana with the following fields.<ul><li>`admin-user`: A user name.</li><li>`admin-password`: The password for `admin-user`.</li></ul>|
|MongoDB Credentials||All MongoDB instances store credentials in a secret with the following fields.<ul><li>`mongodb-root-password`: A password that grants root access to the database cluster.</li><li>`mongodb-password`: An array of passwords that each grant full access to an individual database.</li></ul><br/> NOTE: Separate passwords with commas. Do not include whitespace or a trailing delimiter. For example: `password1,password2`<br/><br/>All mongoDB credential secrets except `userservices-mongodb-credentials` require one password for `mongodb-replica-set-key`, which is a key used to authenticate nodes in a MongoDB replica set.|
||assetmanagementservice-mongodb-credentials||
||fileingestionservices-mongodb-credentials||
||nbexecservice-mongodb-credentials||
||nidataframe-mongodb-credentials||
||sysmgmtevent-mongodb-credentials||
||systemsmangementservice-mongodb-credentials||
||userservices-mongodb-credentials|Requires two `mongodb-passwords`. For the "user" and "keys" databases in that order.|
||webappservices-mongodb-credentials||
|PostgresSQL Credentials|||
||dashboardhost-postgres-secrets|Has the following fields.<ul><li>`host`: The Host name of the postgres server.</li><li>`user`: A PostgresSQL user name.</li><li>`password`: The password for `user`.</li></ul>|
||testmonitorservicedb-connection|Has two forms with the following fields depending on whether the database connection has been defined with a connection string or as parameters. <br/><br/>Connection string<br/>`connection string`: A PostgresSQL connection string.<br/><br/>Connection parameters<br/>`password`: A password for the user defined by the `testmonitorservice.database.connectionInfo.user` value.<br/><br/>Refer to the [Configuring SystemLink Enterprise to use an External PostgresSQL Database](configure-external-postgres.md) document for more information on setting up a PostgresSQL connection.|
|RabbitMQ Credentials|||
||rabbitmq-user|Credentials for authenticating with the RabbitMQ instance. This secret has the following fields.<ul><li>`rabbitmq-user`: A user name.</li><li>`rabbitmq-password`: Password for `rabbitmq-user`.</li></ul>|
||rabbitmq-erlang-cookie|An [Erlang Cookie](https://www.rabbitmq.com/clustering.html#erlang-cookie) value. This secret has a single field.<ul><li>`rabbitmq-erlang-cookie`: The Erlang cookie value.</li></ul>|
|Redis Credentials|||
||webserver-redis-credentials|Has the following field.<ul><li>`password`: Password used to access the Redis database.</li></ul>|
|S3/MinIO Credentials|||
||fileingestion-s3-credentials|Has the following fields.<ul><li>`aws-access-key-id`: The `root-user` name for MinIO. Alternatively, an S3 access key ID.</li><li>`aws-secret-access-key`: The `root-password` value for MinIO access. Alternatively, an S3 access key ID.</li><li>`aws-default-region`: The AWS region for the instance. Use "us-east-1" for MinIO.</li></ul>|
||minio-credentials|Has the following fields.<ul><li>`root-user`: A user name.</li><li>`root-password`: The password for `root-user`.</li></ul><br/><br/>The same user name and password should be provided in the secrets that configure S3 access for individual services. The _systemlink-secrets.yaml_ file defaults to this configuration. You can also configure any service to connect to an S3 bucket.|
||nidataframe-s3-credentials|Has the following fields.<ul><li>`access-key-id`: The `root-user` name for MinIO. Alternatively, an S3 access key ID.</li><li>`secret-access-key`: The `root-password` value for MinIO access. Alternatively, an S3 access key ID.</li></ul>|
