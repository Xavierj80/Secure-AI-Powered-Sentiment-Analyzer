variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1" # Replace with your desired region
}

variable "project_name" {
  description = "A name to prefix resources for identification"
  type        = string
  default     = "sentiment-analyzer"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"] # Example for two Availability Zones
}

variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"] # Example for two Availability Zones
}

variable "lambda_function_runtime" {
  description = "Runtime for the Lambda function"
  type        = string
  default     = "python3.12"
}

variable "lambda_function_handler" {
  description = "Handler for the Lambda function"
  type        = string
  default     = "lambda_function.lambda_handler"
}

# You'll need to create a ZIP file named 'lambda_function.zip' containing your Python code.
variable "lambda_function_zip_path" {
  description = "Path to the Lambda function ZIP file"
  type        = string
  default     = "lambda_function.zip"
}