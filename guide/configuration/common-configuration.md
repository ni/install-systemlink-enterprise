# Commonly Modified Settings for SystemLink Enterprise

## Selecting Host names

The Systemlink Enterprise Application requires three routable host names:

- A hostname for the SystemLink UI.
    - Requires interactive authentication by a user.
    - Configured using the `global.hosts` value in the Helm chart.
- A hostname for the SystemLink API.
    - Requires API key authentication for programmatic access to the application.
    - Configured using the `global.apiHosts` value in the Helm chart.
- A hostname for the API for the hosted MinIO instance.
    - Authentication is handled by MinIO.
    - Configured using the `minio.apiIngress.hostname` value in the Helm chart.

It is possible, but not required, to expose the MinIO API from the application. If this is enabled, a fourth hostname will be required.

A common approach for selecting host names is to start with a base name, e.g. `systemlink` which is added to your chosen domain. For example:

`systemlink.myorganization.org`

This will be the UI hostname. The other host names can then be built off of this base value:

- `systemlink-api.myorganization.org`
- `systemlink-minio-api.myorganization.org`

The process for configuring routing for these host names and the ingress controller for your cluster are beyond the scope of this document.

## Authentication

### OpenID Connect

SystemLink Enterprise uses the OpenID connect protocol to authenticate users from an external authentication provider.

Register SystemLink Enterprise as a client with your authentication provider. The UI hostname configured above must be used for the registration. Refer to the documentation for your authentication provider for the specific registration process.

Once registered, you should have a `client id` and `client secret` value for your application. Depending on the provider, you may also have a [JSON web key set (jwks)](https://datatracker.ietf.org/doc/html/rfc7517#section-5). You will need these plus the URL of your authentication provider in order to configure SystemLink Enterprise.

1. In _systemlink-values.yaml_, set `webserver.oidc.issuer` to the URL of your authentication provider.
2. In _systemlink-secrets.yaml_, set `webserver.secrets.oidc.clientId`, `webserver.secrets.oidc.clientSecret` and `webserver.secrets.oidc.jwks` to the values you received during registration.

    **NOTE:** If not using Helm to manage secrets, you will need to configure the OpenID Connect secret manually as described in the [secrets document](../secrets/secrets.md).

3. \[optional\] In _systemlink-values.yaml_, select the OpenID Connect scopes that will be requested by the SystemLink Enterprise application by configuring `webserver.oidc.scope`. By default, the "openid", "email", and "profile" scopes are request. The "openid" scope is required. The "profile" and "email" scopes are required to populate user details in the UI. Other scopes may be useful when assigning user roles in the application. Consult the documentation for your authentication provider to see what scopes are available.

4. \[optional\] In _systemlink-values.yaml_, configure the OpenID Connect claim that SystemLink Enterprise will use to identify a user by configuring the `webserver.oidc.userIDClaim` value. By default, the user's email will be used.

    **WARNING:** Changing this value after the product is in use will cause all user permissions to be lost.

5. \[option\] In _systemlink-values.yaml_, configure the OpenID Connect claim that SystemLink Enterprise will use as the user name for a given user. By default this is the "name" property. This setting only affects how users are displayed in the UI.

### Assigning an initial system administrator

By default, a user who logs into SystemLink Enterprise will have minimal permissions and will not be able to make changes to the system. When installing the application, it is necessary to assign an initial administrator user who will be able to log in, perform initial configuration of the application, and assign roles to other users.

The administrator is assigned by defining a mapping for a specific Open ID Connect claim.

1. In systemlink-values.yaml, set `initialAdministratorMapping.mappingKey` to the claim to use. The default is "email".
2. Set `initialAdministratorMapping.mappingValue` to the value that identifies the administrator.

For example, set the value to "john.doe@myorganization.org" to make the user with that email address the initial system administrator.

If a mapping is configured that applies to multiple users, all selected users will have administrator access to the cluster.

Normally, the administrator mapping is only configured when performing an install of the SystemLink Enterprise application. Administrators are not configured on upgrade. If you need to assign an administrator during an upgrade, set the `initialAdministratorMapping.createOnUpgrade` value to true.

The intent of this feature is to configure this setting once on initial install and then use the SystemLink application for all future user management. NI recommends to remove the mapping configuration from _systemlink-values.yaml_ once the application is working. Doing so will avoid the possibility of accidentally re-applying an unwanted mapping in the future.

More information on assigning users to roles in the SystemLink application can be found [in the SystemLink documentation](https://www.ni.com/documentation/en/systemlink/latest/setup/mapping-roles/).

## External PostgresSQL Instance

TODO

## Saltmaster TCP access

TODO
