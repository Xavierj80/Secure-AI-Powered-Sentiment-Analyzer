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
    -Terraform (~> 5.0)
    -Python 3.12
    -AWS CLI configured with credentials
    -PowerShell 7.0 or later [1]

#Quick Start
    git clone [repository-url]
    Set-Location secure-serverless-sentiment-analyzer

#Create lambda deployment package 
    Compress-Archive -Path .\lambda_function.py -DestinationPath .\lambda_function.zip -Force

#Deploy Infrastructure
    terraform init
    terraform plan
    terraform apply

#Key Security Features
    -Private Network Isolation : Lambda function operates within private subnets, mitigating attack vectors from the public internet

    -Secure Comprehend Access : Utilization of a VPC Endpoint ensures all communication with the Comprehend service remains within the AWS network

    -Network Segmentation : Security Groups are configured to restrict traffic flow

    -Least Privilege IAM : IAM roles and policies grant only minimum required permissions

Testing the API
# Get the API endpoint
    $ApiEndpoint = terraform output -raw api_endpoint

# Test the sentiment analysis
    $Body = @{
    text = "This is a wonderful example!"
} | ConvertTo-Json
    $Response = Invoke-RestMethod -Uri $ApiEndpoint -Method Post -Body $Body -ContentType 'application/json'
    $Response | ConvertTo-Json -Depth 10

#Repository Structure
.
├── main.tf                 # Core infrastructure definition
├── variables.tf           # Configurable parameters
├── lambda_function.py     # Sentiment analysis code
├── lambda_function.zip    # Lambda deployment package
└── README.md             # Documentation

#Troubleshooting Guide
    Common Issues
        -Terraform Deployment Failures
            Check VPC resource dependencies
            Verify CIDR block configurations
            Ensure Lambda zip file exists

# Verify zip file exists
    Test-Path .\lambda_function.zip

# Check zip file contents
    Get-ChildItem .\lambda_function.zip

#Lambda Function Errors
        Review CloudWatch Logs using AWS Tools for PowerShell
# Get recent log events
        $LogGroupName = "/aws/lambda/sentiment-analyzer-lambda"
    Get-CWLLogEvents -LogGroupName $LogGroupName -Limit 10
        Verify IAM permissions
        Check VPC connectivity

API Gateway Issues
    Test API endpoint   
# Test API connectivity
$TestResponse = Invoke-WebRequest -Uri $ApiEndpoint -Method Get
$TestResponse.StatusCode
        Check Lambda integration
        Review CORS settings if applicable

AWS PowerShell Module Commands
    Install AWS.Tools modules if needed
    Install-Module -Name AWS.Tools.Installer
    Install-AWSToolsModule AWS.Tools.Common, AWS.Tools.Lambda, AWS.Tools.APIGateway
# View Lambda function configuration
    Get-LMFunction -FunctionName "sentiment-analyzer-lambda"
# View recent CloudWatch logs
Get-CWLLogStream -LogGroupName "/aws/lambda/sentiment-analyzer-lambda" | 
    Select-Object -First 1 | 
    Get-CWLLogEvents

Cleanup
    #Remove all created resources:
        terraform destroy

Maintenance Tasks
    Updating Lambda Code
# Update Lambda function code
        Remove-Item .\lambda_function.zip -Force
        Compress-Archive -Path .\lambda_function.py -DestinationPath .\lambda_function.zip -Force
        terraform apply

Checking Resource Status
    # Get VPC status
        Get-EC2Vpc -Filter @{Name="tag:Name";Values="sentiment-analyzer-vpc"}
    # List subnets
        Get-EC2Subnet -Filter @{Name="vpc-id";Values="vpc-xxxxxx"}
    # Check Lambda function configuration
        Get-LMFunction -FunctionName "sentiment-analyzer-lambda"

Demonstrated Skills
    Secure Cloud Architecture
    AWS Networking (VPC, subnets, security groups)
    Serverless Technologies (Lambda, API Gateway)
    Infrastructure as Code (Terraform)
    Security Best Practices
    Python Development
    PowerShell Automation

License
Your chosen license

Note on PowerShell Execution Policy
If you encounter execution policy restrictions, you may need to adjust your PowerShell execution policy: [2]

# Check current execution policy
Get-ExecutionPolicy

# Set execution policy to allow scripts (run as administrator)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Current Status

**Note:** The project currently experiences an "Internal server error" when the API endpoint is accessed. This is under investigation. See the troubleshooting steps below for details on what has been tried so far.

# Troubleshooting

The following steps have been taken to diagnose the "Internal server error":
 List the troubleshooting steps you've tried

Further investigation is needed to resolve this issue.