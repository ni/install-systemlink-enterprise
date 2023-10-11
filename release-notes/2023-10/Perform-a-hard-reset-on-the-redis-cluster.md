# Perform a hard reset of a Redis cluster without deleting the Helm deployment

The following procedure can be used when things have gone very wrong and cannot
be recovered using the CLI. This will cause downtime and will result in full
data loss, so you do not want to do this if you can find any way to avoid it.

NOTE: For the current helium-webserver usage of Redis, the data stored in the
cluster is ephemeral and can be lost without any long-term consequences. This
may not be true for all future uses of Redis.

If you have no other option, do the following:

1. Determine the name of the stateful set used to manage this cluster.

   The stateful set name should be `<helm_release_name>-<service_name>-redis`

2. Determine the name of each persistent volume claim associated with a Redis
   node.

   The volume claims names should be
   `<helm_release_name>-<service_name>-redis-<N>` for each node N in the
   cluster.

3. Delete the Redis stateful set.

   ```bash
   kubectl delete statefulset <name_of_stateful_set> -n <namespace>
   ```

4. The previous command should have terminated all pods in the cluster. Wait for
   them to stop.
5. Delete each persistent volume claim.

   ```bash
   kubectl delete pvc <name_of_volume> -n <namespace>
   ```

6. Determine the current revision number for the helm release.

   ```bash
   helm status <helm_release_name> -n <namespace>
   ```

7. Restore the Helm deployment to the previous state by rolling back to to the
   current revision.

   ```bash
   helm rollback <helm_release_name> <current_revision_number> -n <namespace>
   ```

   Alternatively, run a `helm upgrade` to force redeployment.

8. The Helm rollback or upgrade will recreate the stateful set. Because the
   volumes were deleted, the Redis cluster will be re-initialized in a clean
   state with no data.
