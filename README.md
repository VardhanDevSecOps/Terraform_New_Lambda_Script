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

**1. Install AWS CLI**
   
**Ubuntu**

```bash
sudo apt update
sudo apt install awscli -y
```
Verify:
```
aws --version
```
----------------------------------------------------------------------------------------------------------------------

**2. Install Terraform**
   
**Ubuntu**
```
sudo apt update && sudo apt install -y gnupg software-properties-common curl

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository \
"deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt update && sudo apt install terraform -y
```
**Verify:**
```
terraform -version
```
---------------------------------------------------------------------------------------------------------------------

**3. Configure AWS Credentials**

**<> bash**
```
aws configure
```
**Provide:**
```
AWS Access Key ID |
AWS Secret Access Key |
Region Name |
Output Format
```
**Example:**

Region: ap-south-1 |
Output: json
----------------------------------------------------------------------------------------------------------------------

**Clone Repository**
```
git clone https://github.com/VardhanDevSecOps/Terraform_New_Lambda_Script.git
```
```
cd Terraform_New_Lambda_Script
```
----------------------------------------------------------------------------------------------------------------------

**Lambda Function**

**lambda_function.py**

This file contains the Python Lambda source code.

**Example:**

```
import json

def lambda_handler(event, context):

    print("Event Received:", event)

    return {
        'statusCode': 200,
        'body': json.dumps('Lambda Executed Successfully')
    }
```

----------------------------------------------------------------------------------------------------------------------

**Build Lambda ZIP File**
```
Method 1 — Using Existing ZIP
```
**Already available:**
```
lambda.zip
```
**Method 2 — Build Manually**
```
zip lambda.zip lambda_function.py
```
----------------------------------------------------------------------------------------------------------------------
**Lambda Layers**

Lambda Layers help reuse external Python libraries.
----------------------------------------------------------------------------------------------------------------------
**Layer 1 — requests Package**

**Navigate**
```
cd layers/layer1/python
```
**Install Package**
```
pip install requests -t .
```
**Create ZIP**
```
cd ..
zip -r requests_layer.zip python
```
----------------------------------------------------------------------------------------------------------------------





















