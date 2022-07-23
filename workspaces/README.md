## Workspaces in terraform

Blog post: [workspaces](https://medium.com/devops-mojo/terraform-workspaces-overview-what-is-terraform-workspace-introduction-getting-started-519848392724)

syntax to apply using non default tfvars file

> terraform apply --auto-approve --var-file=<tfvars_filename>

Before understanding workspaces, we will try to understand one problem and then we will understand how workspaces solves this.

**problem**

Let say we have a sample code snippet to create vpc,subnets,instances and everything in a single folder.You want to created exactly same environment(ofcourse vpc id and other conflicting things will be changed).To achieve thisyou have written 2 tfvar files with respective configurations.when you try to apply the 2nd config using bekow cmd

> terraform apply --from-file=env2.tfvars

Then terraform will delete first env and create 2nd env. why did this happen?

Because statefiles of 2 envs are stored in a same file.

**solution**

workspaces just store the state files in seperate locations by creating respective folders

## Lab Activity:

1. create dev env with same code(1 vpc,1 gw and 2 subnets) and store all variables values related to env in dev.tfvars

1. create prod env with exactly same code and diff values in configurtaion.

1. We will create workspaces and will see how state files are isolated

1. Created s3 bucket and store all state files there instead of storing locally

>**Note:** workspaces are not widely used in realtime because no one uses 2 env(eg: test and prod) with same configuration.We need to pay little attention while using workspaces using wrong tfvars in different workspace may delete entire environment


Steps:

*  Using above code snippet, creat e2 work spaces

> terraform workspace new prod <br>
> terraform workspace new dev

* List workpaces(It should show 3 workspaces including default)

> terraform workspace list

* switch to prod workspace

> terraform workspace select prod

* apply configuration using prod.tfvars

> terraform apply --auto-approve --var-file=prod.tfvars

* switch to dev workspace

> terraform workspace select dev

* apply configuration using dev.tfvars

> terraform apply --auto-approve --var-file=prod.tfvars


###  Another lab activity to store state configurations in aws s3 bucket

* Delete .terraform folder

* Execute terraform init(If it sees keyword backend inside remotebackend.tf, then it will execute that code first)

* It will not pick aws creds(i.e access and secret key from tfvars file, since before init it will be executed and it is unaware of creds we defined)

* If you don' gave access and secret keys in your local aws configure, I will fail you need to specify ceds in seperate file and need t sipply to init a sshown

> terraform init -backend-config=backend.json

***Note***: you wont see any data in s3 bucket now, just repeat the above steps of creating workspaces and deploying infra with tfvars files, this time state files will be stored in s3
