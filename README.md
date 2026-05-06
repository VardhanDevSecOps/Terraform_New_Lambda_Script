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

---------------------------------------------------------------------------------------------------------------------------

Prerequisites

Install the following tools before execution:

1. Install AWS CLI
Ubuntu
sudo apt update
sudo apt install awscli -y

Verify:

aws --version
----------------------------------------------------------------------------------------------------------------------

2. Install Terraform
Ubuntu
sudo apt update && sudo apt install -y gnupg software-properties-common curl

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository \
"deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt update && sudo apt install terraform -y

Verify:

terraform -version
---------------------------------------------------------------------------------------------------------------------
