variable "aws_region" {
  type        = string
  description = "The AWS region where Apex infrastructure will be deployed"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  type        = string
  description = "The IP address range for the Apex FinTech VPC"
  default     = "10.0.0.0/16"
}