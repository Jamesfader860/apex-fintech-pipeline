resource "aws_ecr_repository" "apex_api" {
  name                 = "apex-fintech-api"
  image_tag_mutability = "MUTABLE"

  # DevSecOps Security: Enable automatic vulnerability scanning on every push
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "apex-fintech-api-ecr"
    Environment = "dev"
  }
}

output "ecr_repository_url" {
  value       = aws_ecr_repository.apex_api.repository_url
  description = "The URL of the ECR repository"
}