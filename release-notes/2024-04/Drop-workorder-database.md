# Dropping the `workorder` service's database

## Assumptions

- The `workorder` service is deployed but not in use, no data needs to be retained.

- Administrator has `kubectl` access to the Kubernetes cluster from a local bash shell.

- Administrator has permission to scale deployments

- If the SystemLink Enterprise deployment uses in-cluster, per-service MongoDB replica sets.

  - Administrator has command line access to pods via `kubectl exec`.

- If the SystemLink Enterprise deployment uses an external MongoDB instance.

  - Local bash shell with `mongosh` installed

  - Network connectivity to the external MongoDB instance.

  - MongoDB connection string w/ credentials for an account that has permission to drop the `workorders` database

## Release and namespace name

Throughout these instructions, `<release>` refers to the SystemLink Enterprise Helm release name, and
`<namespace>` refers to the namespace where the Helm chart is deployed. Replace with the same names
that were used when
[Installing SystemLink Enterprise](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/installing-systemlink-enterprise.html#GUID-C371BF44-6A52-4ABC-89F5-410B2B38B5C2).

## Procedure

### Stop the `workorder` service

1. Complete the upgrade to the 2024-04 version of the SystemLink Enterprise Helm chart

1. Scale down the `workorder` service deployment

   `kubectl --namespace <namespace> scale deployment <release>-workorder --replicas=0`

1. Wait for all `<release>-workorder` pods to stop.

### Launch a MongoDB shell (Per-service MongoDB replica sets)

Skip this section if SystemLink Enterprise connects to an external database.

1. Determine the name of the pod that is running the MongoDB primary replica.

   `kubectl --namespace <namespace> exec statefulset/<release>-workorder-mongodb exec -- mongosh --eval 'rs.isMaster().primary'`

   The fully qualified domain name of the primary replica will be printed. The hostname is the name of the
   pod. For example, if
   `release-workorder-mongodb-1.release-workorder-mongodb-headless.namespace.svc.cluster.local:27017` is
   printed, the primary replica's pod name is `release-workorder-mongodb-1`

1. Start a MongoDB shell in the primary pod.

   `kubectl --namespace <namespace> exec <primary replica pod name> -it -- bash -c 'mongosh -u $MONGODB_ROOT_USER -p $MONGODB_ROOT_PASSWORD'`

### Launch a MongoDB shell (External MongoDB instance)

Skip this section if SystemLink Enterprise deploys per-service MongoDB replica sets.

1. Launch a MongoDB shell to connect to the database, using a connection string w/ user credentials
   that have permission to drop the `workorders` database.

   `mongosh <connection string>`

### Drop the `workorders` database

Run the following commands in the MongoDB shell to drop the `workorder` service's database:

```
use workorders
db.dropDatabase()
exit
```

### Restart the `workorder` service

1. Scale up the workorder service. If autoscaling is enabled, the service will be scaled up according
   to the autoscaling configuration. Otherwise, replace `1` with the desired number of `workorder`
   service instances.

   `kubectl --namespace <namespace> scale deployment <release>-workorder --replicas=1`
