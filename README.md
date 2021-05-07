# aws-terraform-demo

This is a simple demo for AWS with Terraform managed state. In this example, we'll walk through
setting up AWS and Terraform, building infrastructure with it, refactoring and finally destroying it.

For this demo, you'll need
* A computer running macOS, Linux or Windows
* An AWS account

## 1. Prerequisities

### Installing Terraform

Install Terraform. I suggest using [tfenv](https://github.com/tfutils/tfenv) - Terraform version manager.

### Configure AWS

Install AWS CLI, as per [Amazon's docs](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).

Create an Access Key if you don't have one. You can create one on [this page](https://console.aws.amazon.com/iam/home?#/security_credentials).

Configure AWS CLI with your Access Key.
```
aws configure
```

## 2. Initialize the Terraform project.

### Set up a new directory for the project

Initialize a new Terraform project in a new directory.
```
mkdir terraform-demo && cd terraform-demo
```

### Add an AWS provider

Create a `main.tf` file, and add the following.
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-north-1" # stockholm
}
```

Then initialize your prodect to install the provider.
```
terraform init
```

## 3. Build AWS infrastructure

Now we are ready to build AWS infrastructure using Terraform.
In this example, we'll be creating an EC2-instance and allowing SSH-access to it.

Let's create EC2-instance module for a nice low verbosity way to launch ec2-instances.

Create a new directory `modules/ec2-instance` and in that directory a new file `modules/ec2-instance/main.tf`.
Add the following into the new file.
```hcl
variable "ami" {
  description = "Amazon Machine Image for the instance. Default: Ubuntu 20.04."
  default     = "ami-06982ac8da9099c13"
}

variable "instance_type" {
  description = "Instance type for the machine."
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Name for the instance."
}

resource "aws_instance" "instance" {
  ami            = var.ami
  instance_type  = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
```

Add module initialization into the root `main.tf` file.
```hcl
module "example_instane" {
  source        = "./modules/ec2-instance"
  instance_name = "ExampleInstance"
}
```

Now we can fire up the shiny new instance. The new module definition requires us to rerun `terraform init`.
After the init, we can apply our changes. Run `terraform apply`, read through the changes and type `yes`.
```
terraform init
terraform apply
```

Now we have succesfully created our first Terraform managed AWS infrastructure. 🥳
This is the furthest our demo project continues, but you're very much welcome to fiddle with
the infrastrcuture yourself at this point.

## 4. Destroy infrastructure

To avoid unnecessary costs, we'll destroy our infrastructure after we're done with it.
```
terraform destroy
```