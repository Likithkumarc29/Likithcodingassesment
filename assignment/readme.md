****************************************Steps to follow*******************************************************

Prerequsites:

---- Terraform and aws cli
---- AWS access with secret key and access key
---- SSH key pair in aws account with name test-key
----- Take region as us-west-1


Commands:

1) aws configure
2) terraform init
3) terraform plan
4) terraform apply


#How would you make this deployment fault tolerant and highly available?

Use Availablity zone concept to make it highly available. Provision the instances in different available zone.

#How would you make this deployment more secure? 

Launch bastion host ins ome other VPC then the frontend and backend vpc like management console vpc and do the peering. For ssh we can remove the bastion host and use AWS system manager with VPN. Also, I have attached nat gateway service to access internet in private subnet which is very secure.

How would you make this deployment cloud agnostic?

This strategy of deployment can be run on any cloud , because we are running terraform which is multi cloud provisioning tool.

*****************************************END*******************************************************************************
