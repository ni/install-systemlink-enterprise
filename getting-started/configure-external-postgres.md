# Configuring SystemLink Enterprise to use an External PostgresSQL Database

SystemLink Enterprise can store data from its Test Monitor and Dashboard services on an external PostgresSQL server. For this configuration you will need the host name of the database server and at least one set of credentials with access to the database server. You may also require a public certificate for TLS authentication with the server. Refer to the section on Certificate Files in the [installation guide](installation-guide.md) for details on deploying this certificate.

You will need access to create databases and users on your PostgresSQL server for the following steps.

## Configuring the Test Monitor Service

1. Create a database on your database server. A good default name for this database is "nisystemlink".
2. Create a user with access to the database.
3. With this information, including the user credentials, choose one of the following configuration options:

**Option #1: Connection String

The Test Monitor service can use a PostgresSQL connection string stored as a Kubernetes secret. To deploy the secret configure the `testmonitorservice.secrets.database.connectionString` value in _systemlink-secrets.yaml_. You can also manually create this secret if you are not managing secrets in the Helm chart.

**Option #2: Connection Parameters

You can configure the individual connection parameters for the database in the Helm chart.

1. In _systemlink-values.yaml_, comment out the `testmonitorservice.database.connectionString` group.
2. Uncomment the `testmonitorservice.database.connectionInfo` group.
3. Add the required parameters in the group.
4. In_systemlink-secrets.yaml_,  configure the `testmonitorservice.secrets.database.connectionPassword` value or create the required secret manually.

## Configuring the Dashboard Service

1. Create a database on your database server. The default name for this database is "grafana". If you choose a different name, update `dashboardhost.grafana.database.name` in _systemlink-values.yaml_.
2. Create a user with access to the database.
3. If you are managing secrets with Helm, add your configuration to the `dashboardhost.secrets.database` group in _systemlink-secrets.yaml_.
4. In _systemlink-values.yaml_, ensure that the default `dashboardhost.grafana.extraSecretMounts` and `dashboardhost.grafana.extraConfigmapMounts` configurations are enabled.

Visit the [Grafana documentation](https://grafana.com/docs/grafana/latest/administration/configuration/#database) for more information on configuring this connection. You can apply the settings in that document to SystemLink Enterprise by modifying the `dashboardhost.grafana.grafana.ini` group in _systemlink-values.yaml_.
