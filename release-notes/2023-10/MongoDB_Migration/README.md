## Do you need to worry about what is in this folder?

The content in this folder can help you if you have recognized a need to migrate existing SystemLink Enterprise MongoDB data to a single MongoDB instance. You should not need this content if deploying a new installation of SystemLink Enterprise.

## Background

Prior to version 2023-10 installations of SystemLink Enterprise deployed a MongoDB instance per service. In version 2023-10 the services were refactored to use a global MongoDB connection string allowing customers to go from running over twenty (20) different MongoDB instances down to one.

Controlling this functionality is done through global Helm values. Configure `global.mongodb.install` to `false` to enable this feature. You will also need to configure `global.secrets.mongodb.connection_string`. Refer to [Configuring Systemlink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/config-systemlink-enterprise.html) for more information.

## Prerequisites

Your MongoDB instance will need to be provisioned with databases and users. Refer to [Configuring Systemlink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/config-systemlink-enterprise.html) for a list of databases. It also lists password fields to update (if using separate credentials per database). NOTE: You will need the current database passwords for the migration. Be sure to backup these values somewhere safe.

## Migration Plan

### MongoDB Atlas

If you are using a [MongoDB Atlas](https://www.ni.com/r/mongodbatalas) cluster use MongoDB's Atlas migration tools to move data between the service databases and MongoDB Atlas.

### Self-hosted MongoDB

From inside the cluster we need to run a `mongodump` piped into a `mongorestore` so that we can migrate the documents to the new MongoDB instance.

The command we want to run is:

```
mongodump --config=/etc/mongodump_config.yaml --archive | mongorestore --archive --config=/etc/mongorestore_config.yaml
```

- The `mongo*_config.yaml` files are where the connection string and password is configured.
- `--archive` is used so that we can pipe (`|`) the output directly into the `mongorestore` command

#### Helm Chart

Included in this folder is a Helm Chart to install into your existing Kubernetes cluster to perform the above plan. It utilizes a `bitnami/mongodb:5.0.19-debian-11-r3` Docker image which your Kubernetes cluster will need to be able to pull.

You will need to fill out the `values.yaml` file with MongoDB password secrets typically stored in `systemlink-secrets.yaml`. Refer to all `<ATTENTION>` comments.

After configuring `values.yaml` install via helm command

1. Change active directory on command line to the folder containing this file.
2. Run `helm install ni_systemlink_enterprise_migrate_mongodb .`

You can observe the progress of each command Job through the Pod logs.

Before continuing ensure all Jobs have completed by running `kubectl get jobs` and observe the `COMPLETIONS` column. `1/1` indicates the Job completed successfully.
