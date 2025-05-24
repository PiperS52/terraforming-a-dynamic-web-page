terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.98.0"
    }
  }

  required_version = ">= 1.10.5"
}

provider "aws" {
  region = "eu-west-2"
}

output "invoke_url" {
  value = aws_apigatewayv2_api.api.api_endpoint
}