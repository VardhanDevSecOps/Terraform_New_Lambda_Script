#!/bin/bash

rm -rf package lambda.zip

mkdir package

# Install dependencies (if any)
pip install -r requirements.txt -t package/

# Copy code
cp lambda_function.py package/

cd package
zip -r ../lambda.zip .
cd ..

echo "Lambda package created: lambda.zip"