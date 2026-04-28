# Section Examples and Best Practices

## New Features - Good Examples

### Feature with Documentation Link
```markdown
- Added support for high resolution zoom in the Data Frames Data Source. For
  more information, refer to
  [Using the Data Frames Data Source in a Dashboard](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/data-frames-data-source.html).
```

### Service-Specific Changes
```markdown
- `systemsmanagementservice:0.36.221`
  - Added API-enforced 500-character limit for the `alias` property to improve
    system performance. You can extend this limit by updating
    `systems.systemLimits.alias.maxStringLength` in the Helm values file if
    longer aliases are required.
  - Added API-enforced limits to improve system security and performance:
    `keywords count: 500`, `keyword string length: 500`, `property count: 1000`,
    `property key string length: 500`, and `property value string length: 5000`.
    These limits are not configurable through the Helm values file and should
    accommodate typical usage patterns.
```

### UI Application Features
```markdown
- Added support for location search through the **Systems** application and the
  **Assets** application.
```

## Breaking Changes - Good Examples

### With Configuration Guidance
```markdown
- `SystemsManagementService:0.36.221`
  - Added new chart for SystemsManagementService. This chart requires a
    configuration for Elasticsearch. If SystemLink did not provision
    Elasticsearch during deployment, you also need to set
    `systems.secrets.elasticsearch.password`. To opt-out of using Elasticsearch,
    refer to the
    [SystemLink Enterprise User Manual](https://www.ni.com/docs/en-US/bundle/systemlink-enterprise/page/configuring-advanced-search.html).
```

### With Template Reference (when available)
```markdown
- `systemlink 0.25.63` Top Level Helm Chart
  - The Work Order and Lab Management services are installed by default. You may
    disable installation for these services by setting the enabled flag to
    `false` in the work order service configuration.
  - [View this service configuration](https://github.com/ni/install-systemlink-enterprise/blob/2024-05/getting-started/templates/systemlink-values.yaml#L978)
```

## Formatting Standards Reference

### Service Names and Versions
- **Correct**: `helium-serviceregistry:0.41.37`
- **Incorrect**: `helium-serviceregistry:0.41.x`

### API Endpoints
- **Correct**: The `/niserviceregistry/v1` API now requires...
- **Incorrect**: The /niserviceregistry/v1 API now requires...

### Configuration Keys
- **Correct**: `systems.secrets.elasticsearch.password`
- **Incorrect**: systems.secrets.elasticsearch.password

### Service Names in Text
- **Correct**: SystemsManagementService, Elasticsearch, MongoDB
- **Incorrect**: `SystemsManagementService`, `Elasticsearch`

### UI Elements
- **Correct**: **Apply on all resources** option
- **Incorrect**: `Apply on all resources` option

### Service References
- **Correct**: userservices (single word)
- **Incorrect**: user services (two words)

## Content Organization Tips

### Order by Impact
1. Major new features first
2. Service-specific changes grouped together
3. Minor improvements last

### Group Related Changes
```markdown
- `helium-serviceregistry:0.41.37`
  - [First change for this service]
  - [Second change for this service]
  - [Third change for this service]
```

### Include User Impact
Always explain:
- **What** changed
- **Why** it changed (performance, security, usability)
- **When** users need to take action
- **How** to configure or adjust if needed