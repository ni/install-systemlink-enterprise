# How to reset Dremio

This document describes how to reset the deployment of Dremio if you want to reduce overall load and lower resource utilization.

## Prerequisites

Before you begin, ensure you have permission to delete pods and Persistent Volume Claims (PVCs) in the Kubernetes cluster.

## Resetting Dremio

To reset Dremio, you must delete all of
PVCs with `dremio` in the name, delete all Dremio pods and delete a DFS pod to trigger
logic in the DFS to reinitialize Dremio. Please follow below steps to reset Dremio -

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
