// Create 2 S3 buckets with same resource block:
// Call the buckets: terraform-session-apr2025-yourname-1, terraform-session-apr2025-yourname-2
// Tags: Name = bucket-1, Name = bucket-2

resource "aws_s3_bucket" "main" {
  for_each = var.buckets
  bucket = each.value.name
  tags = {
    Name = each.key
    Environment = each.value.env
  }
  lifecycle {
    create_before_destroy = false
  }
}

variable "buckets" {
   description = "This is a map for buckets"
   type = map(any)
   default = {
    bucket-1 = { name = "terraform-session-apr2025-kris-1", env = "dev" }
    bucket-2 = { name = "terraform-session-apr2025-kris-2", env = "dev" }
   }
}

// count = main[0], main[1]
// for_each = main["bucket-1"], main["bucket-2"]

// Let's 2 buckets, but let's have 2 tags
// Name = bucket-1, bucket-2
// Environment = dev, qa