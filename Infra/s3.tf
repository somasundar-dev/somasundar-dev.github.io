resource "null_resource" "upload_angular_app" {
  provisioner "local-exec" {
    command = "aws s3 sync ./Docs/ s3://${data.aws_s3_bucket.website_bucket.id}/artifacts/${var.app_name}/${var.environment}/${var.current_version}/"
  }

  triggers = {
    version = var.current_version
  }
}

# Set up a redirect or "current" pointer using an S3 object
resource "aws_s3_object" "current_redirect" {
  bucket = data.aws_s3_bucket.website_bucket.id
  key    = "artifacts/${var.app_name}/${var.environment}/${var.current_version}/index.html"

  source       = "./Docs/index.html"
  etag         = filemd5("./Docs/index.html")
  content_type = "text/html"

  depends_on = [null_resource.upload_angular_app]
}
