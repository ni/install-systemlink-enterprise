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

This guide assumes [OpenLens](https://github.com/MuhammedKalkan/OpenLens) is installed, but the instructions can be adapted for `kubectl` and other tools as well.

## Resetting Dremio

The DFS's usage of Dremio is mostly stateless, and the service is tolerant to
datasets disappearing if Dremio is reset. Dremio's state is persisted to its
Persistent Volumes, and the volumes can be deleted by deleting the associated
Persistent Volume Claims (PVCs). To reset Dremio, we need to delete all of the
PVCs with `dremio` in their names, delete all of the Dremio pods (to release the
PVCs so that the new pods get fresh volumes), and delete a DFS pod (to trigger
logic in the DFS to reinitialize Dremio). To reset Dremio:

1. Launch OpenLens.
2. Open the cluster where the DFS is deployed.
3. From the **Storage > Persistent Volume Claims** section of OpenLens, search
   for `dremio`. If the DFS is installed to a namespace other than the default
   namespace, or if there are multiple deployments of the DFS in the cluster,
   you may need to refine your search to a specific namespace using the dropdown
   menu adjacent to the search box.
4. Tick the checkbox next to each PVC with `dremio` in its name. Double-check
   that the selected PVCs are in the expected namespace.
5. Mark the PVCs for deletion by clicking the circular button in the lower-right
   corner of the OpenLens window that contains a large minus sign.

   We'll refer to this button as the _OpenLens delete button_ from now on. Note
   that clicking the OpenLens delete button will not immediately delete the
   PVCs. Instead, the PVCs will be marked for removal such that they will be
   deleted when the pods that are using them shut down. To reiterate, it is
   completely safe to delete all of Dremio's PVCs.

6. From the **Workloads > Pods** section of OpenLens, search for `dremio`. As in
   step three, refine the namespace if necessary.
7. Tick the checkbox next to each pod with `dremio` in its name. Double-check
   that the selected pods are in the expected namespace.
8. Delete the pods by clicking the OpenLens delete button. The Dremio PVCs will
   be deleted when the Dremio pods shut down. New Dremio pods will be
   automatically created as soon as the old ones shut down, and they will be
   given fresh volumes.
9. Repeat step three, and verify that the **Age** field of the `dremio` PVCs
   shows that they are less than a few minutes old. If the PVCs are older than
   expected, repeat steps 3-8.
10. From the **Workloads > Pods** section of OpenLens, search for
    `dataframeservice`.
11. Locate one of the pods that belongs to the DFS C# service. The names of
    these pods will contain `dataframeservice`, but won't have `mongodb`,
    `dremio`, or `zk` in them. To confirm that you have the correct pod
    selected, you can verify that `dataframeservice` appears in the **Image**
    field in the pod details slideout.
12. Delete the pod you selected in step 10 by ticking its checkbox and clicking
    the OpenLens delete button. This will cause a new DFS pod to be created, and
    the startup routine of that pod will reinitialize Dremio.
13. Wait up to a minute for the new DFS pod to become ready. When the pod
    becomes ready, Dremio has been reset, and queries for row data in the DFS
    should now succeed.
