# SystemLink Enterprise Sizing Examples

The YAML files in this folder are provided as documentation to help with the
task of configuring the SystemLink Enterprise application to scale to a desired
workload. Configuration values which affect the performance and scalability of
the application are shown with their default values and commentary regarding
when and how they should be changed. Service configuration is grouped by
workflow to help clarify which settings affect which features in the product.

These files are not intended to be used directly for deployment to a SystemLink
environment. These files are not a valid configuration by themselves and a
deployment configuration should selectively override values only when the
default value is not sufficient. When creating a deployment configuration,
either copy out required values to another file or comment out values which will
not be modified.
