#resource "aws_iam_role" "ecs_role" {
#  name               = "ecs_role"
#  assume_role_policy = "${file("policies/ecs-role.json")}"
#}

#resource "aws_iam_role_policy" "ecs_service_role_policy" {
#  name     = "ecs_service_role_policy"
#  policy   = "${template_file.ecs_service_role_policy.rendered}"
#  role     = "${aws_iam_role.ecs_role.id}"
#}

#resource "aws_iam_role_policy" "ecs_instance_role_policy" {
#  name     = "ecs_instance_role_policy"
#  policy   = "${file("policies/ecs-instance-role-policy.json")}"
#  role     = "${aws_iam_role.ecs_role.id}"
#}

#resource "aws_iam_instance_profile" "ecs" {
#  name = "ecs-instance-profile"
#  path = "/"
# roles = ["${aws_iam_role.ecs_role.name}"]
#}





###### INSTANCE role : #######
resource "aws_iam_role" "ecs-instance-role" {
    name                = "ecs-instance-role"
    path                = "/"
    assume_role_policy  = "${data.aws_iam_policy_document.ecs-instance-policy.json}"
}

data "aws_iam_policy_document" "ecs-instance-policy" {
    statement {
        actions = ["sts:AssumeRole"]

        principals {
            type        = "Service"
            identifiers = ["ec2.amazonaws.com"]
        }
    }
}

resource "aws_iam_role_policy_attachment" "ecs-instance-role-attachment" {
    role       = "${aws_iam_role.ecs-instance-role.name}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecs-instance-profile" {
    name = "ecs-instance-profile"
    path = "/"
    roles = ["${aws_iam_role.ecs-instance-role.id}"]
    provisioner "local-exec" {
      command = "sleep 10"
    }
}


##### ECS Role ##### 
resource "aws_iam_role" "ecs-service-role" {
    name                = "ecs-service-role"
    path                = "/"
    assume_role_policy  = "${data.aws_iam_policy_document.ecs-service-policy.json}"
}

resource "aws_iam_role_policy_attachment" "ecs-service-role-attachment" {
    role       = "${aws_iam_role.ecs-service-role.name}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

data "aws_iam_policy_document" "ecs-service-policy" {
    statement {
        actions = ["sts:AssumeRole"]

        principals {
            type        = "Service"
            identifiers = ["ecs.amazonaws.com"]
        }
    }
}
