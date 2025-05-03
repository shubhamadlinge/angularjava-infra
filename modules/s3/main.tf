# Create an S3 bucket
resource "aws_s3_bucket" "cbz_bucket" {
  bucket = "angular-frontend-project-unique123" # Must be globally unique
  force_destroy = true
  tags = {
    Name = "StaticWebsiteBucket"
    env  = "dev"
  }

}
resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.cbz_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}

# Disable Block Public Access
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.cbz_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Set the bucket policy to allow public read access (use cautiously!)
resource "aws_s3_bucket_policy" "static_website_policy" {
  bucket = aws_s3_bucket.cbz_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.cbz_bucket.arn}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.example]
}

# # S3 Bucket for Terraform State
# resource "aws_s3_bucket" "terraform_state_bucket" {
#   bucket = "my-terraform-state-bucket"  # The S3 bucket name for Terraform state
#   lifecycle {
#     prevent_destroy = true  # Prevent accidental deletion of the state bucket
#   }
  

#   tags = {
#     Name = "TerraformStateBucket"
#     env  = "prod"
#   }
# }
# resource "aws_s3_bucket_public_access_block" "statefile" {
#   bucket = aws_s3_bucket.terraform_state_bucket.id

#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }

# # DynamoDB Table for State Locking
# resource "aws_dynamodb_table" "terraform_lock_table" {
#   name           = "terraform-lock-table"
#   hash_key       = "LockID"
#   billing_mode   = "PAY_PER_REQUEST"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

# # Terraform Backend Configuration (using S3 and DynamoDB)
# terraform {
#   backend "s3" {
#     bucket         = aws_s3_bucket.terraform_state_bucket.bucket  # Reference the state bucket
#     key            = "terraform/state/my-state.tfstate"  # Path in the S3 bucket
#     region         = "us-east-1"  # AWS region
#     dynamodb_table = aws_dynamodb_table.terraform_lock_table.name # Reference DynamoDB table
#     encrypt        = true  # Enable encryption for the state file
#   }
# }