Technical assignment: 

we assume a docker container is pre mad an d contain the application to be deployed, 
this will only deploy the infrastructure (VPV, Security groups, ALB, Redis, ECS(Fargate) ) .

git clone https://github.com/nicohouillon/terraform_ecs  
cd infastructure 
run 
terraform init

to deploy the first part of the infrastructure (VPC,subnet,Security groups,redis 
cluster,  Application load balancer)

terraform plan  

to deploy ECS cluster: 
cd ../ecs and re run terraform plan  (that part is sending errors on task definitions that I couldn't solve) .

***

Once ecs cluster is deployed, docker image can be push to ECR this way :
aws ecr get-login --region <your region> --no-include-email