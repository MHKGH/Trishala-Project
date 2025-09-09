output "jenkins_server_instance_id" {
  value = aws_instance.jenkins_server.id
}

output "jenkins_server_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}
