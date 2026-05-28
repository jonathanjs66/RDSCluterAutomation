# Serverless RDS Cluster Automation

This repository implements a junior DevOps assignment for automating RDS database creation via AWS Serverless and GitHub workflows.

## Repo layout

- `sam/`: AWS SAM template and deployment support files.
- `lambda/`: Python Lambda source code.
- `terraform/`: Terraform module and root config for creating an RDS instance.
- `.circleci/`: CircleCI pipeline configuration for Terraform validation and apply.
- `scripts/`: optional helpers for local testing / deployment.

## Next step

We will start by building the Terraform module to create a simple RDS instance.
