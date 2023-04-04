# Wordpress-demo
 
 ## Description 
 This is an infrastructure as a code project for a highly available wordpress application deployed using Terraform.
 High availability was achieved by attaching an Elastic load balancer to my Auto Scaling group to distributes incoming application traffic across all healthy EC2 instances that are running and scalability as need arises.

 ## Installation
To download the provider we need to run the following command
 ```terraform
terraform init
```
After this, we have to check what kind of resources are going to deploy. We can check this using
``` terraform
terraform plan
```  

Now we are going to apply these settings using

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
Use either of the two options above not the two. 



# wordpress-demo
This is a Terraform configuration template for a wordpress website. 
