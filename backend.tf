terraform {
  backend "s3" {
    bucket         = "terraform-state-nitin-001"
    key            = "iac-lab/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
