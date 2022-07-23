## Terraform CLI defines the following optional arguments for variable declarations:

* default - A default value which then makes the variable optional.
* type - This argument specifies what value types are accepted for the variable.
* description - This specifies the input variable's documentation.
* validation - A block to define validation rules, usually in addition to type constraints.
* sensitive - Limits Terraform UI output when the variable is used in configuration.
* nullable - Specify if the variable can be null within the module.

## variables vs tfvars

https://stackoverflow.com/questions/56086286/terraform-tfvars-vs-variables-tf-difference

The distinction between these is of declaration vs. assignment.
variable blocks (which can actually appear in any .tf file, but are in variables.tf by convention) declare that a variable exists:
variable "example" {}

This tells Terraform that this module accepts an input variable called example. Stating this makes it valid to use var.example elsewhere in the module to access the value of the variable.
We can pass the variable information using -var switch or using --var-file for tfvars. If we use the name terraform.tfvars, it will be automatically compiled.
