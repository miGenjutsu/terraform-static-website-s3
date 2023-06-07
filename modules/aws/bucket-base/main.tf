#----------------------------------------------#
# bucket-base: main                            #
# ./modules/aws/bucket-base/main.tf            #
#----------------------------------------------#


resource "aws_s3_bucket" "s3_web_bucket" {
  bucket = var.s3w_bucket_name

  # website {
  #   index_document = "index.html"
  #   error_document = "error.html"
  # }

  tags = {
    Name = var.s3w_bucket_tag
  }
}

resource "aws_s3_bucket_website_configuration" "s3_web_config" {
  bucket = aws_s3_bucket.s3_web_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
  
}

resource "aws_s3_bucket_policy" "s3_bucket_acl" { # -> s3_bucket_policy -- personal name
  bucket = aws_s3_bucket.s3_web_bucket.id

policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "${aws_s3_bucket.s3_web_bucket.arn}/*"
    }
  ]
}
EOF


  # policy = jsonencode({
  #   Version = "2012-10-17"
  #   Statement = [
  #     {
  #       Sid       = "PublicReadGetObject"
  #       Effect    = "Allow"
  #       Principal = "*"
  #       Action    = "s3:GetObject"
  #       Resource = [
  #         aws_s3_bucket.s3_web_bucket.arn,
  #         "${aws_s3_bucket.s3_web_bucket.arn}/*",
  #       ]
  #     },
  #   ]
  # })
}

resource "aws_s3_bucket_website_configuration" "static_web_config" {
  bucket = aws_s3_bucket.s3_web_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# resource "aws_s3_object" "object_index" {
#   bucket = aws_s3_bucket.s3_web_bucket.id
#   key    = "index.html"
#   source = "./static/index.html"

#   # The filemd5() function is available in Terraform 0.11.12 and later
#   # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
#   # etag = "${md5(file("path/to/file"))}"
#   # etag = filemd5("./static/index.html")
#   acl = "public-read"
# }


# resource "aws_s3_object" "object_error" {
#   bucket = aws_s3_bucket.s3_web_bucket.id
#   key    = "error.html"
#   source = "./static/error.html"
#   content_type = "text/html"

#   # The filemd5() function is available in Terraform 0.11.12 and later
#   # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
#   # etag = filemd5("./static/error.html")
#   acl = "public-read"
# }

# resource "aws_s3_bucket_policy" "s3_web_policy" {
#   bucket = aws_s3_bucket.s3_web_bucket.id

#   # policy = data.aws_iam_policy_document.s3_read_permissions

#   policy = jsondecode({
#     "Version" : "2012-10-17",
#     "Id" : "Policy1645724938586",
#     "Statement" : [
#       {
#         "Sid" : "Stmt1645724933619",
#         "Effect" : "Allow",
#         "Principal" : "*",
#         "Action" : "s3:GetObject",
#         "Resource" : "${aws_s3_bucket.s3_web_bucket.arn}/*"
#       }
#     ]
#   })
# }





# ------------------
# BELOW MAY BE UNEEDED

# resource "aws_s3_bucket_ownership_controls" "s3_bucket_control" {
#   bucket = aws_s3_bucket.s3_web_bucket.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access" {
#   bucket = aws_s3_bucket.s3_web_bucket.id

#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }

# data "aws_iam_policy_document" "s3_read_permissions" {
#   statement {
#     effect = "Allow"

#     actions = [
#       "s3:GetObject"
#     ]

#     resources = ["arn:aws:s3:::my-bucket-1",
#                   "arn:aws:s3:::my-bucket-1/*",
#                   "arn:aws:s3:::my-bucket-2",
#                   "arn:aws:s3:::mybucket-2/*",
#     ]
#   }
# }