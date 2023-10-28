output "aws_s3_bucket_arn" {
  value = aws_s3_bucket.terraform_state.arn
  description = "value of the bucket arn"
}

output "dynamic_table_name" {
  value = aws_dynamodb_table.terraform_locks.name
  description = "value of the dynamodb table name"
}