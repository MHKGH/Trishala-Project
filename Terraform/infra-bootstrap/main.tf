provider "aws" {
  region  = "ap-south-1"
  profile = "prasanna"

}

resource "aws_s3_bucket" "trishala_dev_terraform_state_bucket" {
  bucket = "trishala-dev-6010"
  tags = {
    Environment = "dev"
    Project     = "Trishala"
    Owner       = "Hemanth"
  }
}


resource "aws_s3_bucket_versioning" "trishala_dev_terraform_state_versioning" {
  bucket = aws_s3_bucket.trishala_dev_terraform_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "trishala_dev_terraform_state_encryption" {
  bucket = aws_s3_bucket.trishala_dev_terraform_state_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "trishala_dev_terraform_state_ownership_controls" {
  bucket = aws_s3_bucket.trishala_dev_terraform_state_bucket.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }

}


resource "aws_s3_bucket_public_access_block" "trishala_dev_terraform_state_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.trishala_dev_terraform_state_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_dynamodb_table" "trishala_dev_terraform_state_dynamo_db_table" {
  name         = "trishala-dev-terraform-state-dynamo-db-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Environment = "dev"
    Project     = "Trishala"
    Owner       = "Hemanth"
  }
}
