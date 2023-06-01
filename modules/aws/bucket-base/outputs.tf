# output "s3_bucket_arn" {
#   description = "arn for created s3 bucket"
#   value       = aws_s3_bucket.s3_web_bucket.arn
# }

output "website_endpoint" {
    description = "public url of this website"
    value = aws_s3_bucket.s3_web_bucket.website_endpoint
}

# output "s3_bucket_name" {
#   description = "name for created s3 bucket"
#   value       = aws_s3_bucket.s3_web_bucket.bucket
# }

# output "s3_bucket_domain" {
#   description = "domain for created s3 bucket"
#   value       = aws_s3_website_configuration.static_web_config.domain
# }