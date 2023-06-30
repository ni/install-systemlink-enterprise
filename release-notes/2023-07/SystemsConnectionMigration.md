# Migrating Connected Systems to SLE 2023-07 or later

The current release is introduces a breaking change regarding the systems connectivity that affects releases prior to SLE 2023-07. The saltmaster service which manages the connectivity with the client systems has been replaced with a new implementation that disconnects all connected clients. Complete the following steps to re-approve and re-connect all previously connected clients.

## Prior to upgrading to SLE 2023-07

The old salt-master uses a pair of RSA keys to secure communication. The public key is already cached on all
accepted clients. You must persist these keys between all versions of SLE, so the client systems do not reject the new salt-master
that would have a different public key.

1. Open a terminal to the current 'saltmaster-0' pod.
2. Navigate to '/etc/salt/pki/master'
3. Make a note of the master.pem (private key) and master.pub (public key) values.
4. Set these values to the secrets definition object of the saltmaster chart in the top level secrets values yaml file. Make sure
you use the '|' indicator because these are multiline strings. See more info here: <https://yaml-multiline.info/>

The updated chart will create a Kubernetes secret using these two keys.

## Post SLE Upgrade

After the upgrade, all previously connected (green/orange systems) will be shown as **Disconnected**. Additionally, all these clients will also be shown in the **Pending systems** list. You can use the [Jupyter Notebook](./NewSaltMaster-SystemsMigration.ipynb) provided to automate system approval. This notebook will add systems to the workspace they were previously a member of. The user who runs the notebook must have the **Add systems** privilege in all the necessary workspaces.  

1. Ensure all systems are disconnected and appear in the pending systems list.
1. Upload **NewSaltMaster-SystemsMigration.ipynb** to JupyterHub.
1. Identify a single system to validate the notebook operation.
1. Override `managed_systems_to_approve` with its id and workspace. The notebook already
contains this line, we only need to uncomment it and add the id and workspace:

    ```python
    managed_systems_to_approve = [{"id":"Precision_5570--SN-GPP8WT3--MAC-15-75-5B-DC-5F-BB","workspace":"846e294a-a007-47ac-9fc2-fac07eab240a"}]
    ```

1. Run the notebook and check the output. It should say that one system was approved.

    ```python
    Approving 1 batches of 50 systems
    Approving 1 minions, batch: 1
    [{'action': 'ACCEPT',
    'id': 'Precision_5570--SN-GPP8WT3--MAC-15-75-5B-DC-5F-BB',
    'key': None,
    'workspace': '846e294a-a007-47ac-9fc2-fac07eab240a'}]
    Manage Systems Keys Result: {} {'error': None}
    ```

1. Validate that the selected system is now connected (green).

    **Note** Misconfiguration of the RSA keys for the salt master may cause this operation to fail. Review the new secrets and [logs on the system](https://knowledge.ni.com/KnowledgeArticleDetails?id=kA00Z000000kGcSSAU&l=en-US)
1. After connecting this single system, you can now uncomment the override of `managed_systems_to_approve` and run the notebook again.

    ```python
    # managed_systems_to_approve = [{"id":"Precision_5570--SN-GPP8WT3--MAC-15-75-5B-DC-5F-BB","workspace":"846e294a-a007-47ac-9fc2-fac07eab240a"}]
    ```

    **Note** The new run will re-approve all the systems in batches of 50 (this can also be modified in the notebook)
1. Ensure all the previously connected clients are connected (green).
1. [Optional] Delete the PVCs and volumes used by the old implementation. PVC names: `saltmaster-pillar-saltmaster-0` and `saltmaster-pki-saltmaster-0`.
