variable "website_bucket_name" {
  type = "string"
}
variable "index_file" {
  type = "map"
  default = {
    key = "index.html"
    source = "index.html"
  }
}

variable "error_file" {
  type = "map"
  default = {
    key = "error.html"
    source = "error.html"
  }
}