terraform {
    backend "s3" {
        bucket = "trishala-dev-6010"
        key = "bootstrap/terraform.tfstate"
        region = "ap-south-1"
        encrypt = true
        dynamodb_table = "trishala-dev-terraform-state-dynamo-db-locks"

    }
}