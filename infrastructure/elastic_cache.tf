resource "aws_elasticache_cluster" "redis" {
  cluster_id = "${var.project_name}-${var.elasticache_cache_name}"
  engine = "redis"
  engine_version = "${var.elasticache_engine_version}"
  maintenance_window = "${var.elasticache_maintenance_window}"
  node_type = "${var.elasticache_instance_type}"
  num_cache_nodes = "1"
  parameter_group_name = "default.redis2.8"
  port = "6379"
  subnet_group_name = "${aws_elasticache_subnet_group.default.name}"
  security_group_ids = ["${aws_security_group.elasticache.id}"]

  tags {
    Name = "${var.project_name}-redis"
  }
}

resource "aws_elasticache_subnet_group" "default" {
  name = "${var.elasticache_cache_name}-elasticache-subnet-group"
  description = "Private subnets for the ElastiCache instances"
  subnet_ids = [
    "${aws_subnet.public.*.id}"
  ]
}
