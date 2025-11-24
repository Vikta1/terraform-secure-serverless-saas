import json
import os
import uuid
import boto3
from datetime import datetime

dynamodb = boto3.resource("dynamodb")
table_name = os.environ.get("TABLE_NAME")
table = dynamodb.Table(table_name)

secretsmanager = boto3.client("secretsmanager")
secret_name = os.environ.get("SECRET_NAME")


def handler(event, context):
    """
    Simple Lambda handler that writes a record to DynamoDB and returns it.
    """

    # Fetch app configuration from Secrets Manager (demo use)
    secret_value = secretsmanager.get_secret_value(SecretId=secret_name)
    secret_json = json.loads(secret_value["SecretString"])
    tier = secret_json.get("tier", "unknown")

    # Generate a simple item
    item_id = str(uuid.uuid4())
    now = datetime.utcnow().isoformat()

    item = {
        "id": item_id,
        "created_at": now,
        "message": "Hello from secure serverless SaaS Lambda!",
        "tier": tier,
    }

    # Put item into DynamoDB
    table.put_item(Item=item)

    # Return a JSON response
    return {
        "statusCode": 200,
        "body": json.dumps(
            {
                "success": True,
                "item": item,
            }
        ),
        "headers": {
            "Content-Type": "application/json",
        },
    }
