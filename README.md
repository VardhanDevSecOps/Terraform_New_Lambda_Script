terraform-lambda-project/
│
├── lambda/
│   ├── lambda_function.py
│   └── build.sh
│
├── layers/
│   ├── layer1/
│   │   ├── python/
│   │   │   └── requests/
│   │   └── build.sh
│   │
│   ├── layer2/
│   │   ├── python/
│   │   │   └── numpy/
│   │   └── build.sh
│
├── terraform/
│   ├── lambda.tf
│   ├── layers.tf
│   ├── s3.tf
│   ├── iam.tf
│   └── provider.tf
