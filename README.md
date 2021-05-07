# aws-terraform-demo

A simple AWS + Terraform demo.

For this demo, you'll need
* A computer running macOS, Linux or Windows
* An AWS account

### 1. Prerequisities

#### Installing Terraform

Install Terraform. I suggest using [tfenv](https://github.com/tfutils/tfenv) - Terraform version manager.

#### Configure AWS

Install AWS CLI, as per [Amazon's docs](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).

Create an Access Key if you don't have one. You can create one on [this page](https://console.aws.amazon.com/iam/home?#/security_credentials).

Configure AWS CLI with your Access Key.
```
aws configure
```

### 2. Initialize the Terraform project.

#### Set up a new directory for the project

Initialize a new Terraform project in a new directory.
```
mkdir terraform-demo && cd terraform-demo
```

#### Add an AWS provider

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