output "bucket_name" {
  value = aws_s3_bucket.trishala_dev_terraform_state_bucket.bucket

}

output "bucket_id" {
  value = aws_s3_bucket.trishala_dev_terraform_state_bucket.id

}

output "bucket_arn" {
  value = aws_s3_bucket.trishala_dev_terraform_state_bucket.arn

}

output "dynamo_db_table_name" {
  value = aws_dynamodb_table.trishala_dev_terraform_state_dynamo_db_table.name

}