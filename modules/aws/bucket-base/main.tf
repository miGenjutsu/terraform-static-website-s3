
resource "aws_s3_bucket" "s3_web_bucket" {
  bucket = var.s3w_bucnet_name

  tags = {
    Name        = var.s3w_bucket_tag
  }
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_control" {
  bucket = aws_s3_bucket.s3_web_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.example.id
  acl    = "public-read"
}


resource "aws_s3_bucket_website_configuration" "static_web" {
  bucket = aws_s3_bucket.example.id

  index_document {
    suffix = "static/index.html"
  }

  error_document {
    key = "static/error.html"
  }

  # routing_rule {
  #   condition {
  #     key_prefix_equals = "docs/"
  #   }
  #   redirect {
  #     replace_key_prefix_with = "documents/"
  #   }
  # }
}