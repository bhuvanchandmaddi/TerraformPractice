## Dependencies

There are 2 types of dependencies.
1. implicit
2. explicit

Before understanding differnces between those 2 types, let us understand below 2 terms, which can be seen in terraform documentation of every resource type.

Eg: Refer doc of aws_internet_gateway [here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)

* Argument reference - It includes all the parameters you can set while creating resource, some are mandatory and others were optional

* Attribute reference - These includes attributes which will be available after resource creation.

Eg: If you see vpc id, you can see the id of vpc only when it is created.


>  In a short note, argument reference are the options which we can see from ui before creation of resource and attribute references are also the same but they can be seen after the creation of resource

implicit dependencies will be taken care by terraform

Eg: While creating internet gateway we defined, **vpc_id = aws_vpc.test_vpc.id**

terraform knows that id is attribute rference of vpc, so it will wait for vpc creation

Explicit dependencies, we need to define using *depends_on*


## Lab Activityies to test dpendency using depends_on:

### Activity 1:
I want to enable flow logs for a vpc and store them in s3 bucket.So i want to create all 3 resources in below order

1. Vpc
1. S3 bucket
1. Flowlogs

### Activity 2:
I want to add dependency for subnets, I wanted to create subnets after flowlogs creation 

### Activity 3:
I want to control the order of subnets creation. i.e i want to create subnet2 only after creation of subnet 1
I want to create subnet 1 after creation of internet gateway



