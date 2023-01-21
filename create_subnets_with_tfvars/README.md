### create_subnets_with_tfvars

* This folder also contains same snippet to create vpc and 2 subnets and 1 internet gateway associated with vpc

* The ony differnce is all the default variables are defined in terraform.tfvars

### use of tf vars

* If we don't use tfvars then we need to set varaibales values in variables.tf itself.So if we want to change them it is difficult
* Lets say we need to have different values for all the varaiables(i.e dev and prod). Then it will be benefical to to use dev.tfvars and product.tfvars with respective values in it.
* The tfvars file will be sent to the terraform cmds as shown below:
> terraform plan --var-file=dev.tfvars

**Note**: If we don't specify the values in variables.tf and didn't passed any tfvars, then terraform plan or apply with promt you for the values

By default, it will look for terraform.tfvars file. you don't need to pass it explicitly using --var-file option
