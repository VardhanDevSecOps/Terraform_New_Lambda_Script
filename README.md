```
Terraform_New_Lambda_Script/
│
├── lambda_function.py
├── lambda.zip
├── build.sh
├── README.md
├── Note.txt
│
├── layers/
│   ├── layer1/
│   │   ├── python/
│   │   └── build.sh
│   │
│   └── layer2/
│       ├── python/
│       └── build.sh
│
├── provider.tf
├── variables.tf
├── iam.tf
├── lambda.tf
├── layers.tf
├── s3.tf
├── SQS.tf
├── eventbridge.tf
├── outputs.tf
│
├── terraform.tfstate
├── terraform.tfstate.backup
└── .terraform.lock.hcl
```
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
**Layer 2 — numpy Package**

**Navigate**
```
cd layers/layer2/python
```
**Install Package**
```
pip install numpy -t .
```
**Create ZIP**
```
cd ..
zip -r numpy_layer.zip python
```
----------------------------------------------------------------------------------------------------------------------
**Terraform Files Explanation**
----------------------------------------------------------------------------------------------------------------------
**provider.tf**

**Defines:**

* **AWS Provider**
* **AWS Region**

**Example:**
```
provider "aws" {
  region = "ap-south-1"
}
```

----------------------------------------------------------------------------------------------------------------------
**iam.tf**

Creates:

  * Lambda IAM Role
  * CloudWatch Permissions
  * SQS Permissions

----------------------------------------------------------------------------------------------------------------------
**s3.tf**

Creates:

  * S3 Bucket
  * Uploads Lambda ZIP package

----------------------------------------------------------------------------------------------------------------------
**lambda.tf**

Creates:

AWS Lambda Function
Connects Lambda Layers
IAM Role attachment

----------------------------------------------------------------------------------------------------------------------
**layers.tf**

Creates:

  * Lambda Layer resources

----------------------------------------------------------------------------------------------------------------------
**SQS.tf**

Creates:

  * Amazon SQS Queue

----------------------------------------------------------------------------------------------------------------------
**eventbridge.tf**

Creates:

  * EventBridge Rule
  * EventBridge Target
  * Lambda Permission

Example Flow:
```
EventBridge → Lambda → SQS
```
----------------------------------------------------------------------------------------------------------------------
**outputs.tf**

Displays:

  * Lambda ARN
  * Queue URL
  * S3 Bucket Name

----------------------------------------------------------------------------------------------------------------------

**Terraform Deployment Steps**
----------------------------------------------------------------------------------------------------------------------
**Step 1 — Initialize Terraform**
```
terraform init
```
**Expected Output:**
```
Terraform has been successfully initialized!
```
----------------------------------------------------------------------------------------------------------------------
**Step 2 — Validate Terraform**
```
terraform fmt; terraform validate
```
**Expected Output:**
```
Success! The configuration is valid.
```
----------------------------------------------------------------------------------------------------------------------
**Step 3 — Check Terraform Plan**
```
terraform plan
```
Terraform shows all AWS resources that will be created.

----------------------------------------------------------------------------------------------------------------------
**Step 4 — Deploy Infrastructure**
```
terraform apply
```
**Type:**

yes

**Terraform creates:**

   * Lambda
   * Lambda Layers
   * EventBridge Rule
   * SQS Queue
   * IAM Role
   * S3 Bucket
----------------------------------------------------------------------------------------------------------------------
**Verify in AWS Console**
After deployment verify in AWS Console:
----------------------------------------------------------------------------------------------------------------------
**1. Lambda**

Open:

Amazon Web Services Lambda Console

Verify:

   * Function created
   * Layers attached
   * Monitoring logs available
----------------------------------------------------------------------------------------------------------------------
**2. EventBridge**

Open:

Amazon Web Services EventBridge Console

Verify:

   * Scheduled rule created
   * Lambda target attached
----------------------------------------------------------------------------------------------------------------------
**3. SQS**

Open:

Amazon Web Services SQS Console

Verify:

   * Queue created successfully

----------------------------------------------------------------------------------------------------------------------
**4. CloudWatch Logs**

Open:

Amazon Web Services CloudWatch

Verify Lambda logs:
```
  /aws/lambda/<lambda-function-name>
```
----------------------------------------------------------------------------------------------------------------------
**Test Lambda Manually
Invoke Lambda**
```
  aws lambda invoke \
    --function-name terraform-lambda-function \
  response.json
```
Check response:
```
  cat response.json
```
----------------------------------------------------------------------------------------------------------------------
**Trigger EventBridge Manually
Put Custom Event**
```
    aws events put-events --entries file://event.json
```
----------------------------------------------------------------------------------------------------------------------
**Destroy Infrastructure**

To remove all AWS resources:
```
     terraform destroy
```
Type: 
```
     Yes
```
**Note:** Don't give --auto-approve while destroying the resources.

----------------------------------------------------------------------------------------------------------------------
**Common Errors & Fixes**
----------------------------------------------------------------------------------------------------------------------
**1. ZIP File Too Large
Fix**

Use Lambda Layers for dependencies instead of adding everything into lambda.zip.

----------------------------------------------------------------------------------------------------------------------
**2. Access Denied Error
Fix**

Verify:
```
    aws configure
```
Check IAM permissions.

----------------------------------------------------------------------------------------------------------------------
**3. EventBridge Rule Not Visible
Fix**

Check correct AWS Region:
```
    aws configure get region
```
Also verify:

   * EventBridge Console
   * Rules Section
   * Same deployment region
----------------------------------------------------------------------------------------------------------------------
**4. Terraform State Issues
Fix**

Refresh Terraform state:
```
    terraform refresh
```
----------------------------------------------------------------------------------------------------------------------
**5. Lambda Layer Import Error
Fix**

Verify layer structure:
```
    python/package_name
```
Correct example:
```
   python/requests
   python/numpy 
```
----------------------------------------------------------------------------------------------------------------------
**Useful Terraform Commands**
```
   Command                      Purpose
                                      
 terraform init              Initialize Terraform     
 terraform fmt               Format files             
 terraform validate          Validate syntax          
 terraform plan              Preview resources        
 terraform apply             Deploy resources         
 terraform destroy           Delete resources         
 terraform state list        Show Terraform resources 

```
----------------------------------------------------------------------------------------------------------------------
Example Terraform State Check
```
      terraform state list
```
Example Output:
```
aws_lambda_function.lambda_function
aws_lambda_layer_version.requests_layer
aws_lambda_layer_version.numpy_layer
aws_sqs_queue.eventbridge_queue
aws_cloudwatch_event_rule.lambda_schedule
```
----------------------------------------------------------------------------------------------------------------------
**Author**

GitHub Repository:
Terraform_New_Lambda_Script

Maintained by:
**Vardhan Kandregula**























