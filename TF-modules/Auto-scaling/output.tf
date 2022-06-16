output "aws_ami" {
  value = data.aws_ami.ubuntu
}

output "asg_id" {
  value = aws_autoscaling_group.ASG.id
}