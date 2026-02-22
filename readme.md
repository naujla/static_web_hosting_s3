
---

# Terraform – Create S3 Bucket with `random_id`

This Terraform configuration provisions an **AWS S3 bucket** and uses the `random_id` resource to ensure the bucket name remains globally unique.  
A few small updates are required in the variables and main configuration files before deployment.

---

## 📁 What This Code Does

- Generates a unique suffix using `random_id`
- Creates an S3 bucket using the generated suffix
- Allows customization of:
  - AWS region
  - Tags
  - Bucket name prefix (optional)

---

## 🔧 Required Changes Before Running

### 1. Update `variables.tf`
Modify the following variables based on your environment:

- **`region`** – Set your desired AWS region  
- **`tags`** – Add or update tags as needed for your organization

Example:

```hcl
variable "region" {
  description = "AWS region"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
```

---

### 2. Update `main.tf` (Optional)
If you want a custom bucket name prefix, update the bucket name in `main.tf`.

Example:

```hcl
bucket = "mybucket-${random_id.bucket_id.hex}"
```

You may change `"mybucket"` to any prefix you prefer.

---

## ▶️ How to Use

```bash
terraform init
terraform plan
terraform apply
```

---


