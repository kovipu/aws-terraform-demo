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
