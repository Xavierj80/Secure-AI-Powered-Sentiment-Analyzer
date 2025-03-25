output "api_endpoint_url" {
  description = "The invoke URL for the Sentiment Analyzer API"
  value       = aws_api_gateway_deployment.api_deployment.invoke_url
}