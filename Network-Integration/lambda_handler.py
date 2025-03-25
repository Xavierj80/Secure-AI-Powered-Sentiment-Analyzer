import json
import boto3

# Initialize the Comprehend client
comprehend = boto3.client('comprehend')

def lambda_handler(event, context):
    try:
        #1. Get the text from the API Gateway event
        body = json.loads(event["body"])
        text = body.get("text")

        #2. Input Validation (Basic)
        if not text:
            return {
                "statusCode": 400,
                "body": json.dumps({"error": "Missing 'text' in the request body"})
            }
        if len(text) > 5000:  # Comprehend has a limit
            return {
                "statusCode": 400,
                "body": json.dumps({"error": "Text is too long"})
            }
        
        #3. Analyze the sentiment using Amazon Comprehend
        response = comprehend.detect_sentiment(Text=text, LanguageCode="en")

        #4. Return the sentiment analysis result
        return {
            "statusCode": 200,
            "headers": {
                "Content-Type": "application/json"
            },
            "body": json.dumps(response)
        }

    except json.JSONDecodeError:
        return {
            "statusCode": 400,
            "body": json.dumps({"error": "Invalid JSON in the request body"})
        }
    except Exception as e:
        #5. Handle any other unexpected errors
        print(f"Error processing request: {e}")
        return {
            "statusCode": 500,
            "body": json.dumps({"error": "Internal Server Error"})
        }
