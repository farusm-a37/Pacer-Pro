# PacerPro SRE Coding Test

## Overview

This project addresses intermittent web application performance issues by:
- Monitoring logs for slow `/api/data` requests using Sumo Logic
- Triggering alerts when >5 slow requests (over 3 seconds) occur in 10 minutes
- Auto-remediating the issue via an AWS Lambda function that restarts an EC2 instance
- Sending notifications through Amazon SNS
- Deploying infrastructure via Terraform

---

## File Structure

/
├── README.md
├── sumo_logic_query.txt
├── lambda_function/
│ └── lambda_handler.py
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
└── recordings/
└── [Links to screen/audio recordings]

yaml
Copy
Edit

---

## Assumptions

- Log entries have a `response_time` field in seconds (e.g. `response_time=4.2s`)
- EC2 instance is safe to restart during performance degradation
- IAM roles and permissions use AWS managed policies for simplicity

---

## Setup Instructions

### 1. Run Terraform

```bash
cd terraform
terraform init
terraform apply
