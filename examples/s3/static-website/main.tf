provider "aws" {
  #access_key = "..."
  #secret_key = "..."
  region = "eu-central-1"
}

module "s3-static-website" {
  source = "../../../modules/s3/static-website"
  website_bucket_name = "www.random-mfkdknv-example-bucket.com"
  index_file = {
    key = "index.html"
    source = "index.html"
  }
  error_file = {
    key = "error.html"
    source = "error.html"
  }
}