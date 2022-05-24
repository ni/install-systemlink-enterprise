# Configuring Authentication for SystemLink Enterprise

SystemLink Enterprise uses the OpenID Connect protocol to authenticate users from an external authentication provider. You will need to configure the application to use your authentication provider and create an initial system administrator account.

## Configuring OpenID Connect client access

Before you begin, register SystemLink Enterprise as a client with your authentication provider. Refer to the documentation for your authentication provider for the specific registration process. Use the [UI hostname of the application](configure-hostnames.md) for registration.

### Callback/Redirect URL

Use the following URL to configure the login redirect for your provider:

```url
[protocol]://[ui-hostname]/oidc/callback
```

After registration, you should have a `client id` and `client secret` value for your application. You may also have a [JSON web key set (jwks)](https://datatracker.ietf.org/doc/html/rfc7517#section-5) depending on your provider. You will need these plus the URL of your authentication provider in order to configure SystemLink Enterprise.

1. In _systemlink-values.yaml_, set `webserver.oidc.issuer` to the URL of your authentication provider.
2. In _systemlink-secrets.yaml_, set `webserver.secrets.oidc.clientId`, `webserver.secrets.oidc.clientSecret` and `webserver.secrets.oidc.jwks` to the values you received during registration.

    **NOTE:** If you are not using Helm to manage secrets, you will need to configure the OpenID Connect secret manually as described in the [secrets document](secrets.md).

3. \[optional\] In _systemlink-values.yaml_, configure the `webserver.oidc.scope` value to select the OpenID Connect scopes that SystemLink Enterprise will request. By default, SystemLink Enterprise requests the "openid", "email", and "profile" scopes. The "openid" scope is required. The "profile" and "email" scopes are used to populate user details in the UI and other scopes may be useful when assigning user roles in the application. Consult the documentation for your authentication provider to see what scopes are available.

4. \[optional\] In _systemlink-values.yaml_, configure the webserver.oidc.userIDClaim value to select the OpenID Connect claim that SystemLink Enterprise will use to identify a user. By default, SystemLink Enterprise uses the user's email.

    **WARNING:** If you change this value once the product is in use, all user permissions will be lost.

5. \[option\] In _systemlink-values.yaml_, configure the OpenID Connect claim that SystemLink Enterprise will use as the user name for a given user. By default this is the "name" property. This setting only affects how users are displayed in the UI.

### Viewing Claims

You can view claims returned for a particular user by including the "offline_access" scope in the `webserver.oidc.scope` value. This grants access to a user's claims at `https://<systemlink-host>/oidc/userinfo`.

## [Optional] Proxy Server Configuration

If the cluster requires a proxy server to access your Open ID Connect authentication provider, provide the following configuration. Skip this section if no proxy is required.

1. In _systemlink-values.yaml_, set `webserver.proxy.authority` to the hostname and port of the proxy server.
2. [optional] If credentials are required for the proxy server, uncomment `webserver.proxy.secretName` in _systemlink-values.yaml_. Configure `webserver.secrets.proxy.username` and `webserver.secrets.proxy.password` in _systemlink-secrets.yaml_, or else manually deploy the required secret.

## Assigning an initial system administrator

By default, a user who logs into SystemLink Enterprise will have minimal permissions and will not be able to make changes to the system. At installation, you must assign an initial administrator by defining a mapping for a specific Open ID Connect claim. The administrator will be able to log in, perform initial configuration of the application, and assign roles to other users.

1. In systemlink-values.yaml, set `userservicesetup.initialAdministratorMapping.mappingKey` to the claim to use. The default is "email".
2. Set `userservicesetup.initialAdministratorMapping.mappingValue` to the value that identifies the administrator.

    For example, set the value to "john.doe@myorganization.org" to make the user with that email address the initial system administrator.

If you configure a mapping that applies to multiple users, all selected users will have administrator access to the cluster.

Normally, you configure the administrator mapping only at install but you can assign an administrator during an upgrade by setting the `userservicesetup.initialAdministratorMapping.createOnUpgrade` value to true.

After the initial install, use the SystemLink Enterprise application for all future user management. NI recommends removing the mapping configuration from systemlink-values.yaml once the application is working to avoid accidentally re-applying an unwanted mapping in the future.

Visit [ni.com](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/mapping-roles.html) for more information on assigning users to role in SystemLink Enterprise
