terraform {
  required_version = "~> 1.13.0" // Terraform Version
  required_providers { // Provider Version
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.10.0"
    }
  }
}

// Semantic Versioning = 3.24.0
// 3 = Major (Upgrade) = 
// 24 = Minor (Update) = features 
// 0 = Patch (Patching) = fix vulnerabilities

// ">= 0.13, < 0.14" = 0.13.x
// "~> 0.13"  = 0.13.x
// ~> = lazy constraints 