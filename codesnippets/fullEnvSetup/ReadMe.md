### This project provisions below resources:
* Create a vpc & Internet gateway associated with it
* 3 public subnets & 3 private subnets
* Routing tables
* Associate routing tables to subnets
* Security groups and key pairs
* Deploy 3 ec2 instances in 3  public subnets

## Additional requiments
* Build the infra in aws
* Store the remote statefile in s3 and lock it using dynamodb

## Pre-requisites
* aws creds -> env vars or ~/.aws/credentails
* Key -> If you already have a key in the region where you want to deploy this env, specify taht in the ec2.tf file
* Else create a key-pair using(ssh-keygen) and specify the public key in ec2.tf file & edit key_name section in ec2 resource(which is mentioned in comments)
**Note:** For now commenting key creation logic, which is present in ec2.tf file


## Break down the project into chucks

>__set up the backend to store the state file__
* For this we need to create s3 bucket and dynamodb first before adding backend section in terraform{} block in provider.tf
* Just comment out the backend section in provider.tf and consider only 2 files, i.e backend.tf and provider.tf
* Execute bellow commands: 
    * terraform init -> Downloades the provider plugins, aws plugin in our case
    * terraform plan -> Plans the resources creation(3 resources in our case, i.e s3 bucket,bucket access control list and dynamodb) and creates state file(terraform.tfstate) locally
    * terraform apply -> Creates the actual resources
* Our goal is to store statfile in s3 bucket and obtain lock over it using dynamo db.
* So uncomment backend secyion in provider.tf file under terraform block.
* Again we need to execute the terraform init, because we added new section under terraform block and terraform block will be executed only when we run init.
* It will promt do you like to copy the statefile to aws s3. Enter yes and statefile will be created in s3.

**Note:** You can see statefile is also loacted locally but our project used statefile located in s3.You can manually delete the local statefile.

>**Create vpc and internet gateway**
* This is straight forward just  use vpc.tf and internetgateway.tf files
* The required variables can be declared in variables.tf or terraform.tfvars

>**subnets creation**
* subnets creation logic is tricky, we have used count function instead of duplicating the code
* The cidr blocks and availabilty zones  info was stored inside list and they are accessed using element function(collection function)
* We have created 3 public and 3 private subnets.So we just duplicated the code 

>**Routing tables creation**
* Here we need to create 2 routing tables(PublicRouteTable & PrivateRouteTable) i.e one with Internet gateway route(used for public subnets)
* Another without any route(as aws routing table automatically adds route to current VPC)

>**Route table association**
* We need to associate above 2 routes to subnets
* We need to add the PublicRouteTable to public subnets and PrivateRouteTable to private subnets
* one tricky thing here is we need to get all the public or private subnet names by looping over them and we need to set  subnet_id to point to each subnet in iteration.
```
subnet_id = element(aws_subnet.public_subnets.*.id,count.index)
```
* Here we used a concept called [splat](https://developer.hashicorp.com/terraform/language/expressions/splat) syntax. elemnet function expects first argument as list.
 *aws_subnet.public_subnets.\*.id* -> It retuns the list of public subnet objects and id over it returns list of strings

 >**Creation of security groups and keypairs**
 * These were staight forward. one intresting thing about security groups creation is Egress rules. When you create security group for a vpc manually by default it allows all rules i.e all traffic
 * But when you create security group using aws it doesn't allow any traffic through egress rules.You need to add the below section explicitly.
 ```
 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
 ```
* For key-pair creation, we need to specify public key contents along with key name if key doesn't exist on the region where you are deploying this cluater
>**Creation of ec2 instances**
* Created 3 ec2 instances one each in 3 public subnets
* Nothing fancy here, we need to pass all the options shown in ec2.tf file which are self explanatory
