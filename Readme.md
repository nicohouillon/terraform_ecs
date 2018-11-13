***
Technical assignment: 

run 
terraform init
# to deploy the first part of the infrastructure (VPC,subnet,Security groups,redis 
cluster,  Application load balancer)

terraform plan  

# to deploy ECS cluster, cd ../ecs and re run terraform plan  (that part is sedngin erros on task definiation I couldn't solve)
.

***

Once ecs cluster is deployed, docker image can be push to ECR this way :
aws ecr get-login --region <your region> --no-include-email
