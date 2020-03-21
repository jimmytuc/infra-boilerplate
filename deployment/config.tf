terraform {
  backend "s3" {
    bucket = "store-states-terraform"
    region = "us-east-1"
    acl    = "private"
  }
}
