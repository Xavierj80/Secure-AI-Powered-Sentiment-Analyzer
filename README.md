Secure Serverless Sentiment Analyzer with Private Network Integration

#Overview
    This project implements a secure and scalable serverless sentiment analyzer leveraging AWS Lambda, API Gateway, and Amazon Comprehend. A key architectural focus is security, achieved by deploying the Lambda function within a private Virtual Private Cloud (VPC) and accessing AWS Comprehend through a VPC endpoint. This ensures network isolation and prevents direct internet access for the Lambda function, adhering to security best practices.

#Architecture
    The architecture comprises the following AWS services, emphasizing the secure network design:
	
        -AWS Lambda : Executes the Python-based sentiment analysis logic. Deployed within private subnets for enhanced security.
        -AWS API Gateway : Serves as the secure entry point, handling incoming requests and routing them to the Lambda function.
        -Amazon Comprehend : Provides the sentiment analysis functionality, accessed securely via a VPC Endpoint.
        -Amazon VPC : Establishes a private network environment, isolating the Lambda function. Key components include:
            Private Subnets: Host the Lambda function, preventing direct internet exposure
            Public Subnets: Host the API Gateway, allowing public access
            VPC Endpoint for Comprehend: Enables private communication with the Comprehend service
            Security Groups: Control network traffic at the instance level
            Route Tables: Manage network traffic routing within the VPC
        -AWS IAM : Manages permissions, ensuring the Lambda function has only the necessary access to Comprehend and CloudWatch Logs
        -AWS CloudWatch Logs : Facilitates monitoring and debugging of the Lambda function

#Prerequisites

    -AWS Account with appropriate permissions
    -Terraform (5.0)
    -Python 3.12
    -AWS CLI configured with credentials
    -PowerShell 7.0 

#Key Security Features
    -Private Network Isolation: Lambda function operates within private subnets, mitigating attack vectors from the public internet

    -Secure Comprehend Access : Utilization of a VPC Endpoint ensures all communication with the Comprehend service remains within the AWS network

    -Network Segmentation : Security Groups are configured to restrict traffic flow

    -Least Privilege IAM : IAM roles and policies grant only minimum required permissions

Demonstrated Skills

    Secure Cloud Architecture
    AWS Networking (VPC, subnets, security groups)
    Serverless Technologies (Lambda, API Gateway)
    Infrastructure as Code (Terraform)
    Security Best Practices
    Python Development
    PowerShell Automation

# Current Status

**Note:** The project currently experiences an "Internal server error" when the API endpoint is accessed. This is under investigation. See the troubleshooting steps below for details on what has been tried so far.

# Troubleshooting

The following steps have been taken to diagnose the "Internal server error":
 List the troubleshooting steps you've tried

Further investigation is needed to resolve this issue.
