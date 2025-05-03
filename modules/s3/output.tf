output "website_url" {
  value = "http://${aws_s3_bucket.cbz_bucket.bucket_domain_name}"
}
