resource "aws_s3_bucket_object" "upload_data" {
  bucket = aws_s3_bucket.piotr-testbucket.id
  key    = "customers/customers.csv"
  source = "data/customers.csv"
}

resource "aws_s3_bucket_object" "upload_GlueJob" {
  bucket = aws_s3_bucket.piotr-testbucket.id
  key    = "scripts/GlueJob.py"
  source = "src/glue/GlueJob.py"
}
