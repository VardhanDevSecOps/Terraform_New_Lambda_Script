# Upload Layer 1 to S3
resource "aws_s3_object" "layer1_zip" {
  bucket = aws_s3_bucket.lambda_bucket.id
  key    = "layers/layer1.zip"
  source = "layers/layer1/layer1.zip"

  etag = filemd5("layers/layer1/layer1.zip")
}

# Upload Layer 2 to S3
resource "aws_s3_object" "layer2_zip" {
  bucket = aws_s3_bucket.lambda_bucket.id
  key    = "layers/layer2.zip"
  source = "layers/layer2/layer2.zip"

  etag = filemd5("layers/layer2/layer2.zip")
}

# Create Layer 1
resource "aws_lambda_layer_version" "layer1" {
  layer_name = "requests_layer"

  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key    = aws_s3_object.layer1_zip.key

  compatible_runtimes = ["python3.10"]
}

# Create Layer 2
resource "aws_lambda_layer_version" "layer2" {
  layer_name = "numpy_layer"

  s3_bucket = aws_s3_bucket.lambda_bucket.id
  s3_key    = aws_s3_object.layer2_zip.key

  compatible_runtimes = ["python3.10"]
}