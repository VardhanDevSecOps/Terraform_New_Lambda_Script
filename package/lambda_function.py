#def lambda_handler(event, context):
#    return {
#        "statusCode": 200,
#        "body": "Hello from Terraform Lambda "
#    }

def lambda_handler(event, context):
    print("Event received:", event)

    return {
        "statusCode": 200,
        "body": "Triggered by EventBridge 🚀"
    }