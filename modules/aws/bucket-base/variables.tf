#----------------------------------------------#
# bucket-base: variables                       #
# ./modules/aws/bucket-base/variables.tf       #
#----------------------------------------------#

variable "s3w_bucket_name" {
  description = "name of s3 bucket"
  type        = string
  # default     = "website-host-acg-clx-0601231559"
}

variable "s3w_bucket_tag" {
  description = "tag of s3 bucket"
  type        = string
  # default     = "website_host"
}

