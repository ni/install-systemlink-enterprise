# Problem statement

This document describes how to reset the deployment of Dremio that comes bundled
with the DataFrame Service (DFS). This is useful when needing to accomplish any
of the following tasks:

- Resolve unknown issues with queries in the DataFrame Service after other
  debugging steps have failed
- Restore Dremio when it's in a bad state
- Restore Dremio after changing the directory or bucket used for its distributed
  storage cache
- Reinitialize Dremio when the S3 credentials are changed (only an issue in
  pre-August 2023 versions of the DFS)
- Recover from the failure mode where one of Dremio's volumes becomes full
- Upgrade from `dremio-apache` to `dremio-ee`
- Downgrade from `dremio-ee` to `dremio-apache`

## Prerequisites

Each deployment of the DataFrame Service (DFS) comes with a dedicated deployment
of Dremio. The DFS and Dremio are deployed to the same Kubernetes cluster by the
DFS's Helm chart. In order to reset the Dremio deployment, you need the
following permissions in the Kubernetes cluster that the DFS is deployed to:

- The ability to delete pods
- The ability to delete Persistent Volume Claims (PVCs)

## Resetting Dremio

Dremio's state is persisted to its
Persistent Volumes (PV), and the volumes can be deleted by deleting the associated
Persistent Volume Claims (PVCs). To reset Dremio, you must delete all of
PVCs with `dremio` in the name, delete all Dremio pods, and delete a DFS pod to trigger
logic in the DFS to reinitialize Dremio.

To reset Dremio:

1. Connect to your Kubernetes cluster with kubectl or another tool of your choosing.
1. Run `kubectl get pvc` to list the PVCs in the cluster.
1. Note the PVCs with `dremio` in the name.
1. Run `kubectl delete pvc <dremio pvc name> <dremio pvc name> ...`. Ensure all dremio PVCs are included in the command.
1. Run `kubectl get pods` to list the deployed pods and note pods with `dremio` in the name.
1. Run `kubectl delete pod <dremio pod> <dremio pod> ...`. Ensure all dremio pods are included in the command.
1. Run `kubectl describe pod <dremio pod>` to verify that the **Age** field of the `dremio` PVCs
   are less than a few minutes old. If the PVCs are older than
   expected, repeat steps 4-6.
1. Run `kubectl get pods` to list the deployed pods and note notes with `dataframeservice` in the name.
1. Locate one of the pods that belongs to the DFS C# service. The names of
    these pods will contain `dataframeservice`, but won't have `mongodb`,
    `dremio`, or `zk` in them.
1. Run `kubectl delete pod <DFS pod>` to delete one of the DFS pods listed the previous step.
1. Wait up to a minute for the new DFS pod to become ready. When the pod
    becomes ready, Dremio has been reset, and queries for row data in the DFS
    should now succeed.
