# Existing MongoDB Data Migration to a Single Instance

## Do you need to worry about what is in this folder?

This content is for users who need to migrate existing SystemLink Enterprise MongoDB data to a single MongoDB instance. You do not need to do this if you are deploying a new installation of SystemLink Enterprise.

## Process

SystemLink Enterprise installations prior to 2023-10 deployed a MongoDB instance per service. Version 2023-10 uses a global MongoDB connection string that allows customers to consolidate over 20 different MongoDB instances down to one.

Refer to [Configuring Systemlink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/config-systemlink-enterprise.html) for instructions on editing the Helm values that determine this functionality.

## Prerequisites

Before you begin, you must provision your MongoDB instance with databases and users. Refer to [Configuring Systemlink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/config-systemlink-enterprise.html) for a list of databases and password fields to update if using separate credentials per database. NOTE: Ensure that you backup the current database passwords for the migration.

## Migration Plan

### MongoDB Atlas

If you are using a [MongoDB Atlas](https://www.ni.com/r/mongodbatalas) cluster use the MongoDB Atlas migration tools to move data between the service databases and MongoDB Atlas.

### Self-hosted MongoDB

Run the following command from inside the cluster to migrate the documents to the new MongoDB instance.


```sh
mongodump --config=/etc/mongodump_config.yaml --archive | mongorestore --archive --config=/etc/mongorestore_config.yaml
```
Where
-  `mongo*_config.yaml` is where the connection string and password are configured.
`--archive` allows you to pipe (`|`) the output directly into the `mongorestore` command

#### Helm Chart

This folder includes a Helm Chart to install into your existing Kubernetes cluster to execute the plan described above for self-hosted MongoDB. Your Kubernetes cluster must be able to pull the `bitnami/mongodb:5.0.19-debian-11-r3` Docker image.

1. Fill out the `values.yaml` file with MongoDB password secrets stored in `systemlink-secrets.yaml`. Refer to all `<ATTENTION>` comments.


1. Change active directory on command line to the folder containing this file.
2. Run `helm install ni_systemlink_enterprise_migrate_mongodb .`

You can observe the progress of each command Job through the Pod logs.

Before continuing, run `kubectl get jobs` and observe the `COMPLETIONS` column to ensure all jobs have completed. `1/1` indicates the job completed successfully.
