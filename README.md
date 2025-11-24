# Secure Serverless SaaS Platform on AWS (Terraform Project)

This project provisions a fully serverless, secure, and scalable SaaS-style backend application using AWS and Terraform.

## 🎯 Architecture Overview

The application follows a modern, fully serverless architecture:

- **API Gateway (HTTP API)** – Public API endpoint
- **AWS Lambda** – Compute layer (Python)
- **DynamoDB** – Encrypted NoSQL database
- **AWS Secrets Manager** – Secure config storage
- **AWS KMS** – Customer-managed key for encryption
- **CloudWatch Logs** – Centralized logging
- **IAM** – Strict least-privilege permissions
- **Terraform** – Full IaC for reproducible deployments

## 🔐 Security Features

- Customer-managed **KMS CMK** with key rotation
- DynamoDB **encrypted using CMK**
- Lambda uses **least privilege IAM role**
- Secrets stored in **Secrets Manager** (never hard-coded)
- API Gateway secured with IAM-based invocations
- All logs streamed to **CloudWatch**

## 📦 Project Structure

