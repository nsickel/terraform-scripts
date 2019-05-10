# create bucket on AWS
resource "aws_s3_bucket" "website_bucket" {
  bucket = "${var.website_bucket_name}"
  acl    = "public-read"
  policy = <<EOF
{
  "Version": "2012-10-17",
    "Statement": [
      {
          "Sid": "PublicReadGetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": "s3:GetObject",
          "Resource": "arn:aws:s3:::${var.website_bucket_name}/*"
      }
  ]
}
EOF

  # define website index document
  website {
    index_document = "${var.index_file["key"]}",
    error_document = "${var.error_file["key"]}"
  }
}

# add index file
resource "aws_s3_bucket_object" "index_file" {
  bucket        = "${aws_s3_bucket.website_bucket.bucket}"
  key           = "${var.index_file["key"]}"
  source        = "${var.index_file["source"]}"
  acl           = "public-read"
  content_type  = "text/html"
}


# add error file
resource "aws_s3_bucket_object" "error_file" {
  bucket        = "${aws_s3_bucket.website_bucket.bucket}"
  key           = "${var.error_file["key"]}"
  source        = "${var.error_file["source"]}"
  acl           = "public-read"
  content_type  = "text/html"
}
