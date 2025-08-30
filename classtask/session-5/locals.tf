// Note: Terraform doesn't let us call a variable within the variable instead we would use locals

locals {
    // Naming Standard
    name = "${var.env}-${var.cloud_provider}-${var.cloud_region}-${var.business_unit}-${var.project}-${var.tier}-rtype"

    // Common Tags
    common_tags = {
        Environment = var.env
        Tier = var.tier
        Business_Unit = var.business_unit
        Project_Name = var.project
        Team = var.team
        Managed_By = var.managed_by
        Owner = var.owner
    }
}


# "${var.env}-${var.cloud_provider}-${var.cloud_region}-${var.business_unit}-${var.project}-${var.tier}-sqs"

// name = alb, sg, tg, ig, ngw, sub, pub-1
// Naming Convention / Standard

# 1. Project Name = "jerry" = done
# 2. Resource Type = alb, asg, tg, igw, sg
# 3. Environment Name = dev, qa, stg, prod = done
# 4. Region = use1, usw1, use2, usw2 
# 5. Tier = frontend, backend, db
# 6. Business Unit = orders, payments, streaming = done
# 7. Provider Name = aws, azure, gcp, do, alibaba = done

# Name example: dev-aws-usw2-orders-jerry-db-alb

// Tagging Convention / Standard: Common Tags

# 1. Environment = dev, qa, stg, prod
# 2. Tier = frontend, backend, db
# 3. Business_Unit = orders, payments, streaming
# 4. Project_Name = jerry, tom
# 5. Team = DevOps, Cloud, Development, QA 
# 6. Managed_By = Terraform, Cloudformantion, Manual, Python, Go, Plumni
# 7. Owner = kris@akumosolutions.io 