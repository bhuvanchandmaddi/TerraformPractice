Note: All the files in this repo are created for testing purpose.Notes with imp points is available at: [bmaadi terraform blog](https://bhuvandevopsnotes.blogspot.com/2022/07/terraform-by-harsha.html)

## Imp Points:

* If terraform plan executes without error we cannot confirm apply also works any without issuees. plan is like a dry run.

Eg: we cannot attach 2 internet gateways to a single vpc, If you try to do that in code the plan will succeed, since it doesn't check any conditions and error will be thrown out while applying 

* All the varaible declartaion will be done in variable.tf file.We can provide default value to them or not.
* The actual variables are specified in terraform.tfvars

**Note**: Read below this [blog](https://spacelift.io/blog/terraform-tfvars) to get full info
* Terraform state file is super important.This is where applied config information is stored. If we want to maintain same configuration for 2 different envs like dev and prod.Then we need to create 2 tfvars(like dev.tfvar and prod.tfvar)
* If we apply the dev config then it will create dev sources and then if we apply prod config.It will delete all the dev resources and create prod resources.This is because you are using same terraform satte file. The workaround for this problem is to isolate the terraform state files using workspaces.

**Note**: More info on workspaces can be found in this [blog](https://medium.com/devops-mojo/terraform-workspaces-overview-what-is-terraform-workspace-introduction-getting-started-519848392724)
* If you store the state file locally then only you can work with the project. If you want to share the project to others like pushing it to the gitlab,github etc.Then you need to separate statefile because if both of you use the same state file at the same time then yiu will run into issues.
* So you can push the terraform statefile to aws s3 bucket using terraform backend and you can set the lock on that

## Terreform functions
