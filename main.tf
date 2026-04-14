module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}
 
module "s3" {
  source      = "./modules/s3"
  bucket_name = "terraform-iac-lab-bucket-12345"
}
 
module "ec2" {
  source         = "./modules/ec2"
  ami            = "ami-03e9fa355358e045d"   # Ubuntu AMI (change if needed)
  instance_type  = "t3.small"
  subnet_id      = module.vpc.subnet_id
}
 
