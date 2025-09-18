resource "aws_ecr_repository" "app_repo" {
  name                 = "${var.env}-app-repo"
  image_tag_mutability = "MUTABLE"
  tags = merge(
    var.tags,
    {
      Name = "${var.env}-app-repo"
    }
  )
}