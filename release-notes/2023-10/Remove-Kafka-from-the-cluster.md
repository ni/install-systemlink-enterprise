# Remove Kafka from the cluster

The 2023-10 release removes SystemLink Enterprise's dependency on Kafka. The
following steps can be followed to remove Kafka after upgrading to 2023-10.

To remove Kafka from the cluster:

1. Upgrade to the 2023-10 release.
1. Confirm that you do not have any remaining appendable tables that were
   created prior to upgrade that you do not want to be made readonly. To check
   if any remaining appendable tables exist:

   1. Use kubectl or a GUI like Lens to find the pod containing `dfs-kafka-ui`.
   1. Enable port forwarding for port `8080` to access the Kafka UI on your
      localhost.
   1. Open the Kafka UI in a browser using the port obtained in the previous
      step.
   1. Navigate to "Topics" in the left-hand navigation.
   1. Search for topics starting with `dfs` followed by a data table ID.
   1. If no Kafka topics exist for data tables, it's safe to proceed with
      disabling and removing Kafka from the cluster.

   The presence of `dfs` topics in Kafka indicates that the associated tables
   are still open for writing data. By default, newly-created data tables have
   "SupportsAppend" set to "true." To mark a data table as readonly, use the
   route `POST /nidataframe/v1/tables/{id}/data` with the table's ID and
   `endOfData: true` in the JSON request body. This action sets the data table's
   "SupportsAppend" field to "False," making it readonly. Once a table is
   readonly, it cannot be reopened, so ensure you've finished appending data
   before setting `endOfData: true`.

1. Remove the DataFrame Service Kafka pods from the cluster
   1. Set the following three Helm values to `false` in the
      `systemlink-values.yaml` file:
   - `dataframeservice.ingestion.kafkaBackend.enabled`
   - `dataframeservice.kafkacluster.kafka.enabled`
   - `dataframeservice.schema-registry.enabled`
   1. Run a Helm upgrade
   1. Wait for the `dfs-kafka` pods to disappear from the cluster
1. Remove the Strimzi Kafka Operator from the cluster
   1. Set the following Helm value to false in the
      `systemlink-admin-values.yaml` file:
   - `strimzi-kafka-operator.enabled`
   1. Run a Helm upgrade
1. Remove the CRDs for the Strimzi Kafka Operator from the cluster. By design,
   these are not removed when the operator is uninstalled, so they need to be
   cleaned up manually. Run
   `kubectl delete -f systemlinkadmin/charts/strimzi-kafka-operator/crds` to
   delete the CRDs.
1. Delete the Persistent Volume Claims (PVCs) for the Kafka-related pods. Looks
   for PVCs containing `dfs-kafka` in Lens.

After completing these steps, if you need to update SystemLink Enterprise again,
you should skip steps 2 and 3 of the updating instructions for updating the
Strimzi Kafka Operator CRDs, to avoid recreating the unneeded CRDs.
