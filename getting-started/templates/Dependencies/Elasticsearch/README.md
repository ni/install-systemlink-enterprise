# Overview

[Elasticsearch](https://www.elastic.co/elasticsearch) is a distributed search
engine that SystemLink Enterprise uses to enable fast and scalable search
capabilities.

## Installing Elasticsearch

NI provides a [Helm chart](https://needlink.com) which can be used to install
Elasticsearch on a Kubernetes cluster. This chart wraps
[Bitnami's](https://bitnami.com/)
[Helm chart](https://github.com/bitnami/charts/tree/main/bitnami/elasticsearch)
to add features such as automatic user provisioning. Use the following procedure
to configure and deploy this chart.

1. Review the
   [`README.md`](https://github.com/bitnami/charts/blob/main/bitnami/elasticsearch/README.md)
   from the Bitnami GitHub repository. Note: All values configurable in the
   Bitnami chart need to be prefixed with `sl-elasticsearch.elasticsearch` when
   used with the NI Helm chart. For example, to enable security, set
   `sl-elasticsearch.elasticsearch.security.enabled` to `true`.
2. Copy and modify the `elasticsearch-values.yaml` and
   `elasticsearch-secrets.yaml` files from this directory and configure
   Elasticsearch for your environment.
   - For guidance on selecting storage settings and resource limits and
     requests, refer to the
     [SystemLink Enterprise User Manual](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/configuring-a-mongodb-instance.html)
3. Select the namespace where Elasticsearch will be deployed, subsequently
   referred to as `<namespace>` in this document. This will often be the same
   namespace used to deploy SystemLink Enterprise.
4. Select the release name that will identify your Helm deployment, subsequently
   referred to as `<release>` in this document.
5. Execute the deployment:

```bash
helm --namespace <namespace> upgrade <release> oci://registry-1.docker.io/ni/systemlinkelasticsearch --install --values elasticsearch-values.yaml --values elasticsearch-secrets.yaml
```

The same command can be used to apply configuration changes to your release.

## Configuring SystemLink Enterprise to use Elasticsearch

Visit the NI Documentation portal for info about
[configuring SystemLink Enterprise to use advanced search](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/configuring-a-mongodb-instance.html)
