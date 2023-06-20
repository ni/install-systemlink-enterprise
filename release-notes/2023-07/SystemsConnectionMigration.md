# **Migration plan for systems connectivity that is affected by the breaking change in the salt-master chart.**

## The current release is introducing a breaking change regarding the systems connectivity. This means that any SLE <=0.14 release is affected by this change. The saltmaster service which manages the connectivity with the client systems has been replaced with a new implementation which causes all the connected clients to become disconnected. The next steps will describe how to re-approve and re-connect all the previously connected clients

&nbsp;

## **Before doing the upgrade of SLE**

The old salt-master has a pair of RSA keys that are used for securing the communication. The public key is already cached on all the
accepted clients. We need to persist these keys between all the SLE versions, otherwise the client systems will reject the new salt-master
that would have a different public key.

1. Open a terminal to the current "saltmaster-0" pod.
2. Navigate to /etc/salt/pki/master
3. Grab the master.pem (private key) and master.pub (public key) values.
4. Set these values to the secrets definition object of the saltmaster chart in the top level secrets values yaml file. Make sure
you use the "|" indicator because these are multiline strings.

The new helm chart will create a kubernetes secret using these 2 keys and the pods will use it.

&nbsp;

## **After doing the upgrade of SLE**

The expectation is that all the systems that prior the upgrade were connected (green/orange) are now disconnected and in the
pending list. The pending list is only displaying us minion ids which are hard to identify. For re-approving all those systems we will use a Jupyter Notebook to automate the operation. All the pending clients that are currently managed will be re-approved in their current workspaces.

1. Make sure all clients are in the disconnected state and they appear in the pending systems list.
2. Upload the "NewSaltMaster-SystemsMigration.ipynb" notebook to JupyterHub.
3. Find a "guinea pig" system and make sure this system was connected and now is in the pending systems list.
4. Override "managed_systems_to_approve" with it's id and workspace. The notebook already
contains this line, we only need to uncomment it and add the id and workspace.
5. Run the notebook - check the output, it should say that 1 system was approved.
6. The client should become connected (green). One thing that could prevent that is the improper
configurationrsa of the rsa keys of the saltmaster. If it doesn't become connected we need to check the secret and
the logs from the client side to better understand why it is not gettign connected.
7. After connecting the "guinea pig" system we can now uncomment the override of "managed_systems_to_approve" and run the notebook again.
8. The new run will re-approve all the systems in batches of 50 (this can also be modified in the notebook)
