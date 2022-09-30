# Retaining File Ingestion Metadata through the August SLE Upgrade

Complete the following steps if you want to back up metadata for files ingested by SystemLink. This process does not affect any other instances of MongoDB used by other services.

**IMPORTANT! This procedure must be completed before upgrading to the August release of SLE. The export process cannot be completed after the mongodb-sharded instance is terminated during the upgrade.**

## Prerequisites

- Download and install `mongoexport` and `mongoimport` onto your local machine . These are available at [MongoDB's Website](https://www.mongodb.com/try/download/database-tools)
- Root access to the current mongodb-sharded database

## Forwarding the MongoDB service

1. Run `kubectl get services` and locate `fileingestion-mongodb`, to get the service name.

1. RUn `kubectl port-forward services/fileingestion-mongodb 57017:27017` to port-forward the service.


## Exporting the database

1. Run the following command to export the database.

  `mongoexport --uri="mongodb://<root_user>:<root_password>@localhost:<port>/files?authSource=admin" --collection=files_metadata --out=<path>`
  
  Where 


-  `<root_user>` is the root user
-  `<root_password>` is the root password
- `<path>` is a path on your local computer that will contain the specified database export
- `<port>` is the port specified in the previous step


        Example: `mongoexport --uri="mongodb://root:RootPassword123@localhost:57017/files?authSource=admin" --collection=files_metadata --out=/mnt/c/dev/files.json`

## Perform the August SLE Upgrade

Upgrade to the new release bundle of SystemLink Enterprise. This will upgrade the FileIngestion chart. Complete the following steps to clean up resources that will no longer be needed after the upgrade.


### Removing old PVCs

1. Run `kubectl get pvc | grep fileingestion` (or `Select-String` in powershell) to list all the PVCs attached to fileingestion databases
1. Make a list with all PVCs that end with either `configsvr-<index>` or `shard<index>-data-<index>`

          Example: `datadir-fileingestion-mongodb-configsvr-0` and `datadir-fileingestion-mongodb-shard0-data1`.

1. Run `kubectl delete pvc datadir-fileingestion-mongodb-configsvr-0 datadir-fileingestion-mongodb-configsvr-1 datadir-fileingestion-mongodb-configsvr-2 datadir-fileingestion-mongodb-shard0-data0 datadir-fileingestion-mongodb-shard0-data1` for all matched PVCs from the previous step. This command can be run multiple times to remove PVCs for all shards.

### Cleaning up the service [Optional]


Complete the following steps to clean up resources Helm does not remove. 


1. Run `kubectl get services | grep fileingestion` (or `Select-String` in powershell) to list all the services attached to `fileingestion`
1. Delete all services that contain `mongodb` in their name.

        Example `kubectl delete service fileingestion-mongodb fileingestion-mongodb-headless`

## Port Forwarding for the upgraded MongoDB instance

**Note** In these steps we cannot use the service to connect to the database


1. Run `kubectl exec -it <replica_name> -- mongo` to find the primary replica. The result will look similar to the following example: `rs0:PRIMARY>`.


        Example: `kubectl exec -it fileingestion-mongodb-0 -- mongo`

1. Run `kubectl port-forward pods/fileingestion-mongodb-0 50000:27017` replacing the `0` with the index of the primary replica to port-forward the pod locally.


## Importing the database backup into the new MongoDB instance

1. Run the following command to import the database contents.

`mongoimport --uri="mongodb://<root_user>:<root_password>@localhost:<port>/files?authSource=admin" --collection=files_metadata --file=<path>`


Where
-  `<root_user>` is the root user
- `<root_password>` is the root password
- `<path>` is the path on your local computer containing the backup
- `<port>` is the port specified in the previous step.


        Example: `mongoimport --uri="mongodb://admin:RootPassword123:50000/files?authSource=admin" --collection=files_metadata --file=/mnt/c/dev/files.json

1. Log into your SLE instance and navigate to `/files`. If the migration was successful you will see the list of files ingested prior to the upgrade. If no files are listed the migration was unsuccessful.
