data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

resource "aws_launch_configuration" "config" {
  name          = "scaling-config"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "ASG" {
  name                      = "ASG_Test"
  max_size                  = 2
  min_size                  = 2
  desired_capacity          = 2
  launch_configuration      = aws_launch_configuration.config.name
  vpc_zone_identifier       = [var.subnet]


}

resource "aws_autoscaling_schedule" "scale-down" {
  scheduled_action_name  = "scale-down"
  min_size               = 0
  max_size               = 0
  desired_capacity       = 0
  recurrence             = "0 0 8 ? * * *"
  autoscaling_group_name = aws_autoscaling_group.foobar.name
}

resource "aws_autoscaling_schedule" "scale-up" {
  scheduled_action_name  = "scale-up"
  min_size               = 0
  max_size               = 0
  desired_capacity       = 0
  recurrence             = "0 0 18 ? * * *"
  autoscaling_group_name = aws_autoscaling_group.foobar.name
}