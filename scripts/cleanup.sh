#!/bin/bash
# Run this when you are done with the assignment to avoid AWS charges.

set -e

echo "=== Step 1: Destroying RDS instances (Terraform) ==="
for dir in terraform/live/*/; do
  if [ -f "$dir/main.tf" ]; then
    echo "Destroying $dir ..."
    cd "$dir"
    terraform destroy -auto-approve
    cd - > /dev/null
  fi
done

echo ""
echo "=== Step 2: Deleting SAM stack (API Gateway, SNS, SQS, Lambda) ==="
cd sam
sam delete --no-prompts
cd ..

echo ""
echo "All resources deleted."
