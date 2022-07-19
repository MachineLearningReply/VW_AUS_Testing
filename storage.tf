resource "aws_s3_bucket" "piotr-testbucket" {
  bucket = "piotr-testbucket-terraform"
}

resource "aws_s3_bucket_object" "folder_customers" {
    bucket = "piotr-testbucket-terraform"
    key = "customers/"
    depends_on = [
      aws_s3_bucket.piotr-testbucket
    ]
}

resource "aws_s3_bucket_object" "folder_scripts" {
    bucket = "piotr-testbucket-terraform"
    key = "scripts/"
    depends_on = [
      aws_s3_bucket.piotr-testbucket
    ]
}

resource "aws_s3_bucket_object" "folder_target" {
    bucket = "piotr-testbucket-terraform"
    key = "target/"
    depends_on = [
      aws_s3_bucket.piotr-testbucket
    ]
}