# Dropping the work order database

## Assumptions

- The workorder service is enabled but not in use, no data needs to be retained.
- SystemLink Enterprise deployment uses in-cluster, per-service mongo databases.
- Administrator has `kubectl` access to the Kubernetes cluster from a local bash shell.
- Administrator has permission to stop and start deployments and to exec into pods.

## Procedure

1. Complete the upgrade to the 2024-04 helm chart
1. Stop the work order deployment
   `kubectl scale deployment <release-name>-workorder` --replicas=0
1. Wait for all `<release-name>-workorder` pods to stop.
1. Determine which mongo pod is the primary replicaset.
   `kubectl exec statefulset/<release-name>-workorder-mongodb --exec mongosh -u '$MONGODB_ROOT_USER' -p '$MONGODB_ROOT_PASSWORD' --eval 'rs.isMaster().primary`
   The fully qualified domain name of the primary will be printed. The hostname is the name of the primary pod.
1. Start a mongo shell in the primary pod.
   `kubectl exec <primary pod name> -- mongosh -u '$MONGODB_ROOT_USER' -p 'MONGODB_ROOT_PASSWORD'`
1. In the mongo shell, select the `workorders` database.
   `use workorders`
1. In the mongo shell, drop the `workorders` database.
   `db.dropDatabase()`
1. Exit the mongo shell
   `exit`
1. Restart the deployment
   `kubectl scale deployment <release-name>-workorder` --replicas=2
