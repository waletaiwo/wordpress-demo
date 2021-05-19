# wordpress-demo
 
 ## Description 
 This is a Terraform configuration template for a wordpress website built with high availability in mind.
 I achieved high availability by attaching an Elastic load balancer to my Auto Scaling group to distributes incoming application traffic across all healthy EC2 instances that are running and scalability as need arises.

 ## Installation
Run
 ```terraform
terraform init
```
Run
``` terraform
terraform apply
``` 

 ## Usage
Add aws credentials to providers block in main.tf for code to run on your infrastructure.
```terraform
provider "aws" {
  region = var.region
  secret_key = "add secret key here"
  access_key = "add access key here"
}
```
or Set secrets via environment variables in your cli

```bash
export TF_VAR_AWS_ACCESS_KEY_ID= add access key value here
export TF_VAR_SECRET_ACCESS_KEY= add secret key value here
```