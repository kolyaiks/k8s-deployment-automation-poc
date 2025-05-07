variable "region" {
  description = "Enter the AWS region."
  default     = "us-east-2"
}

variable "company_name" {
  description = "Enter the company name."
  default     = "kolyaiks"
}

#variable "env" {
#  description = "Please, choose between dev and prod environment."
#  type        = string
#  default     = "dev"
#
#  validation {
#    condition     = (var.env == "dev") || (var.env == "prod")
#    error_message = "Must be \"dev\" or \"prod\" only."
#  }
#}

variable "hosted_zone_name" {
  description = "Enter the hosted zone name."
  default     = "test.com"
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
  default     = "1.31"
}

variable "cluster_endpoint_public_access" {
  description = "If EKS cluster API endpoint should be public"
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of ranges that's allowed to work with EKS cluster API endpoint"
  type        = list(string)
}

variable "notifications_email" {
  description = "Email to send alarms to"
  type        = string
  default     = "nikolay.iks@gmail.com"
}

variable "error_patter_to_look_for" {
  description = "Error pattern to look for in cloudwatch logs"
  type        = string
  default     = "\"reset\""
}

variable "node_instance_type" {
  description = "Node instance type to use"
  type        = string
  default     = "t3.medium"
}

variable "public_key_for_ec2_key_pair" {
  description = "Public key to create ec2 key pair"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAgLEgG6NFBI3vtX0srfdVNjcGbet9/6U7jApLhBT8YV+XEQ/Y19jxlPl3JDr9QA6RzhMUf8mqJsjUSqip/HZxzrKvwCF0w94o6zxYwikF4Ky8gDycqIObwk6FISF6fCPJC7JgYCGnMvsLACZFQvz89++9JKzp3UGoyF2ngHj8z9cOZT9a1i975wfcSAOXolFMZyMW8JQCUAFkUDohIPE5SyxU+KgnGFudjphzqsR3ZNw2d/GBlTCp1KVo0cSiyb2PRvWM96EoiLrEhpS3AErJ/+00Lx8ZUH/OMEOCIgG8DIF6Ls+oR1nPCaafVGX8Zbpsw06QCnk2lbGDEEDU4jbvcw== rsa-key-20250507"
}

#variable "nat_image_id" {
#  description = "Image for NAT instance"
#}