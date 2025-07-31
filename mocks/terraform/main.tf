# Define the Terraform configuration
terraform {
  required_version = ">= 1.6.0"
}

# Create a local file resource
resource "local_file" "example" {
  content  = var.file_content
  filename = "${path.module}/example.txt"
}
