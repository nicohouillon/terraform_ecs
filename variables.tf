# main creds for AWS connection
variable "aws_access_key_id" {
  description = "AWS access key"
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
}

variable "ecs_cluster" {
  description = "ECS cluster name"
}

variable "ecs_key_pair_name" {
  description = "EC2 instance key pair name"
}

variable "project_name" {
  description = "project name"
  type = "string"
  default = "goleague"
	
}

variable "aws_region" {
  type    = "string"
  default = "ca-central-1"
}

variable "availability_zone" {
  description = "availability zone used for the demo, based on region"
  default = ""
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}
########################### app ################################

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
  default     = ""
}
variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 3000
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 3
}
########################### Autoscale Config ################################

variable "max_instance_size" {
  description = "Maximum number of instances in the cluster"
}

variable "min_instance_size" {
  description = "Minimum number of instances in the cluster"
}

variable "desired_capacity" {
  description = "Desired number of instances in the cluster"

}

####################### RDS #################################
  variable rds_allocated_storage {
  description = "Amount of storage to be initially allocated for the DB instance, in gigabytes."
  default = 5
}

variable rds_engine {
  description = "Name of the database engine to be used for this instance."
  default = "postgres"
}

variable rds_engine_version {
  description = "Version number of the database engine to use."
  default = "9.4.5"
}

variable rds_instance_class {
  description = "The compute and memory capacity of the instance"
  default = "db.t1.micro"
}

variable database_name {
  description = "The name of the database."
}

variable database_user {
  description = "The name of the master database user."
}

variable database_password {
  description = "Password for the master DB instance user"
}

variable rds_storage_type {
  description = "Specifies the storage type for the DB instance."
  default = "standard"
}

### ECS ### 

variable "ecs_autoscale_role" {
  description = "Role arn for the ecsAutocaleRole"
  default     = "YOUR_ECS_AUTOSCALE_ROLE_ARN"
}

variable "ecs_task_execution_role" {
  description = "Role arn for the ecsTaskExecutionRole"
  default     = "YOUR_ECS_TASK_EXECUTION_ROLE_ARN"
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}


#### elastic cache - redis  #####
variable "elasticache_cache_name"{
  default= "redis"
}

variable "elasticache_instance_type" {
  default = "cache.m3.medium"
}

variable "elasticache_maintenance_window" {
  # SUN 01:00AM-02:00AM ET
  default = "sun:05:00-sun:06:00"
}
variable "elasticache_engine_version" {
  default = "2.8.24"
}

