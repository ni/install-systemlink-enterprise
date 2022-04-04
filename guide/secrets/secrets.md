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
- Encryption Key Secrets
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
        - rabbitmq-erlange-cookie
    - Redis
        - webserver-redis-credentials
    - S3/MinIO
        - fileingestion-s3-credentials
        - minio-credentials
        - nidataframe-s3-credentials

The remainder of this document describes each secret in detail.
