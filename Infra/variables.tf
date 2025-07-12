variable "region" {
  description = "The AWS region to deploy resources in"
}
variable "environment" {
  description = "The environment for the deployment (e.g., dev, prod)"
}
variable "bucket_name" {
  description = "The name of the S3 bucket"
}
variable "app_name" {
  description = "The name of the application"
}
variable "current_version" {
  description = "The current version of the application"
}
variable "domain_name" {
  description = "The domain name for the application"
}