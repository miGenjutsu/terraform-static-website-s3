# Terraform Static Website S3

## Structure
```sh
.
├── README.md
├── modules
│   └── aws
│       ├── bucket-base
│       │   ├── README.md
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   ├── policy.json
│       │   ├── static
│       │   │   ├── error.html
│       │   │   └── index.html
│       │   └── variables.tf
│       └── network-base
│           ├── README.md
│           ├── main.tf
│           ├── outputs.tf
│           └── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfstate
├── terraform.tfstate.backup
└── variables.tf
```

## tfvars files

```sh
s3w_bucket_name = "website-host-acg-clx-0601231559"
s3w_bucket_tag  = "website_host"
```