terraform-lambda-project/
│
└── lambda/
   └──lambda_function.py
   └── build.sh


├── layers/
   └── layer1/
      └── python/
         └── requests/
      └── build.sh
   
   └── layer2/
      └── python/
         └── numpy/
      └── build.sh


└── terraform/
   └──lambda.tf
   └── layers.tf
   └── s3.tf
   └── iam.tf
   └── provider.tf
   
terraform/
├── eventbridge.tf   ✅ (new file)

layer.zip
└── python

    └── <libraries> 
---------------------------------------------------------------------------------------------------------------------------

<img width="1078" height="578" alt="image" src="https://github.com/user-attachments/assets/b093db3b-b367-4cad-84c8-e1dd616a263d" />

