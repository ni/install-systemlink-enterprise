# Dropping the work order database

## Assumptions

- The workorder service is deployed but not in use, no data needs to be retained.

  - Administrator has `kubectl` access to the Kubernetes cluster from a local bash shell.
  - Administrator has permission to scale deployments

- If the SystemLink Enterprise deployment uses in-cluster, per-service mongo databases

  - Administrator has command line access to pods via `kubectl exec`.

- If the SystemLink Enterprise deployment uses an external mongo database

  - Local bash shell with `mongosh` installed
  - Network connectivity to the mongo database
  - MongoDB connection string w/ credentials for an account that has permission to drop the `workorders` database

## Procedure

### Scale down the `workorder` service

1. Complete the upgrade to the 2024-04 helm chart

1. Scale down the `workorder` service deployment
   `kubectl scale deployment <release-name>-workorder` --replicas=0

1. Wait for all `<release-name>-workorder` pods to stop.

### Per-service replicasets: Launch a mongo shell - per-service replicasets

Skip this section if SLE connects to an external database.

1. Determine which mongo pod is the primary replicaset.
   `kubectl exec statefulset/<release-name>-workorder-mongodb --exec mongosh -u '$MONGODB_ROOT_USER' -p '$MONGODB_ROOT_PASSWORD' --eval 'rs.isMaster().primary`
   The fully qualified domain name of the primary will be printed. The hostname is the name of the primary pod.
1. Start a mongo shell in the primary pod.
   `kubectl exec dev-systemlink-workorder-mongodb-0 -it -- bash -c 'mongosh -u $MONGODB_ROOT_USER -p $MONGODB_ROOT_PASSWORD'`

### Launch a mongo shell - external database

Skip this section if SLE deploys per-service replicasets.

1. Launch a mongo shell to connect to the database, using a connection string w/ user credentials that have permission to drop the `workorders` database.
   `mongosh <connection string>`

### Drop the `workorders` database

1. In the mongo shell, select the `workorders` database.
   `use workorders`
1. In the mongo shell, drop the `workorders` database.
   `db.dropDatabase()`
1. Exit the mongo shell
   `exit`

### Restart the `workorder` service

1. Scale up the workorder service. If autoscaling is enabled, the service will be scaled up according to the autoscaling configuration. Otherwise, replace `1` with the desired replica count.
   `kubectl scale deployment <release-name>-workorder` --replicas=1
