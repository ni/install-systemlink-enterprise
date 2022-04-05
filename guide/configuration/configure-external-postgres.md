# Configure SystemLink Enterprise to use an External PostgresSQL Database

SystemLink Enterprise can store data from its Test Monitor and Dashboard services on an external PostgresSQL server. For this configuration you will need the host name of the database server and at least one set of credentials with access to the database server.

You may also require a public certificate for TLS authentication with the server. Refer to the section on Certificate Files in the [installation guide](../installation-guide.md) for details on deploying this certificate.

## Configure the Test Monitor Service

**Option #1: Connection String

The Test Monitor service can make use of a PostgresSQL connection string stored as a Kubernetes secret. You can deploy this secret by configuring the `testmonitor.secrets.database.connectionString` value in _systemlink-secrets.yaml_. If not managing secrets in the Helm chart, you will instead need to manually create this secret.

**Option #2: Connection Parameters

Alternatively, you can configure the individual connection parameters for the database in the Helm chart.

1. In _systemlink-values.yaml_, comment out the `testmonitor.database.connectionString` group.
2. Uncomment the `testmonitor.database.connectionInfo` group.
3. Add the required parameters in the group.
4. In_systemlink-secrets.yaml_,  configure the `testmonitor.secrets.database.connectionPassword` value or else create the required secret manually.

## Configure the Dashboard Service

The Dashboard service requires the host name and credentials to be provided as a secret.

1. If managing secrets with Helm, this secret in _systemlink-secrets.yaml_ by setting values in  the `dashboardhost.secrets.database` group.
2. In _systemlink-values.yaml_, ensure that the default `dashboardhost.grafana.extraSecretMounts` and `dashboardhost.grafana.extraConfigmapMounts` configurations are enabled.
