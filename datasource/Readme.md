## Datasources
Data sources in Terraform are used to get information about resources external to Terraform, and use them to set up your Terraform resources. For example, to create a subnet in existing vpc.Vpc is already created manually.

## Data source vs importing
Importing an existing resource is similar to pointing a data source at it. In both cases, you get information about the resource made available inside your Terraform configuration.

However, the key difference is that if you import a resource then you now manage it. That means:

* If you terraform destroy your configuration, that resource will be destroyed.
* If you modify or destroy the resource through some other means, your Terraform configuration will try to put it back how it was next time apply runs.

So, if you are thinking of importing an existing resource — perhaps a static piece of infrastructure that was configured manually— just so that you can access its attributes within your Terraform configuration, then instead use a data source. Only import the resource if you intend to bring that resource under the control of this particular Terraform configuration.

More info: [here](https://spacelift.io/blog/terraform-data-sources-how-they-are-utilised)

