#!/bin/bash

BUCKET_NAME="mandel-terraform-state"
REGION="us-west-1"

# Verify if the bucket already exists
if ! aws s3 ls "s3://$BUCKET_NAME" 2>/dev/null; then
    echo "Bucket não encontrado. Criando..."
    aws s3api create-bucket --bucket $BUCKET_NAME --region $REGION --create-bucket-configuration LocationConstraint=$REGION
else
    echo "Bucket já existe."
fi

# Initialize Terraform
terraform init