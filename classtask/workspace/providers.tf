provider "aws" {
  region = "us-west-2"
}

// Primary

provider "aws" {
  region = "us-east-1"
  alias = "oregon"
}