# Overview

SystemLink Enterprise uses a distributed search engine called [Elasticsearch](https://www.elastic.co/elasticsearch) to enable fast and scalable search capabilities.

## Installing Elasticsearch

NI provides a [Helm chart](https://needlink.com) that installs Elasticsearch on a Kubernetes cluster. This chart wraps a [Helm chart](https://github.com/bitnami/charts/tree/main/bitnami/elasticsearch) from [Bitnami](https://bitnami.com/) to add features such as automatic user provisioning.

Before you can use this Helm chart, you must configure and deploy the chart.

1. Review the `README.md`in the [Bitnami GitHub repository](https://github.com/bitnami/charts/blob/main/bitnami/elasticsearch/README.md). 
<br />**Note:** All configurable values in the Bitnami chart must have the `sl-elasticsearch.elasticsearch` prefix when using the value with the NI Helm chart. For example, to enable security, set `sl-elasticsearch.elasticsearch.security.enabled` to `true`.
2. Copy and modify the `elasticsearch-values.yaml` and `elasticsearch-secrets.yaml` files from this directory and configure Elasticsearch for your environment.
   - For guidance on selecting storage settings and resource limits and requests, refer to the [SystemLink Enterprise User Manual](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/configuring-a-mongodb-instance.html)
3. Select a namespace to deploy Elasticsearch within. This namespace is often the same namespace that you use to deploy SystemLink Enterprise. This document refers to this namespace as `<namespace>`. 
4. Select a release name to identify your Helm deployment. This document refers to this release name as `<release>` in the examples.
5. Execute the following command.

```bash
helm --namespace <namespace> upgrade <release> oci://registry-1.docker.io/ni/systemlinkelasticsearch --install --values elasticsearch-values.yaml --values elasticsearch-secrets.yaml
```

This command also applies configuration changes to your release.

## Additional Resources

For more information on using advanced search, refer to [Configuring MongoDB Instances](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/configuring-a-mongodb-instance.html) in the SystemLink Enterprise User Manual.
