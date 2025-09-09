resource "aws_security_group" "jenkins_sg" {
    name        = "${var.env}-jenkins-sg"
    vpc_id = var.vpc_id
    description = "Security group for Jenkins Server"
    tags = merge(
        var.tags,
        {
            Name = "${var.env}-jenkins-sg"
        }
    )
}

# SSH Access
resource "aws_security_group_rule" "allow_ssh" {
    type        = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
    security_group_id = aws_security_group.jenkins_sg.id
}

# Jenkins Web UI (8080)
resource "aws_security_group_rule" "allow_jenkins" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.jenkins_sg.id
}

resource "aws_security_group_rule" "all_egress" {
    type        = "egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.jenkins_sg.id
}