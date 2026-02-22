
---

# Static Website Hosting on AWS S3 Using Terraform

This project demonstrates how to deploy a **static website** (HTML + CSS) to an **Amazon S3 bucket** using Terraform.  
Before deploying, you will need to update:

1. **Terraform variables**  
2. **index.html**  
3. **styles.css**

For AWS website hosting permissions, refer to the official documentation:  
https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteAccessPermissionsReqd.html

If you need to convert an IAM JSON policy into Terraform HCL format, you can use this tool:  
https://flosell.github.io/iam-policy-json-to-terraform/

---

## 📌 Overview

- Creates an S3 bucket configured for **static website hosting**
- Uploads your HTML and CSS files to the bucket
- Applies a bucket policy to allow public read access (optional based on your requirements)
- All custom values are controlled through the **variables file**

---

## 🔧 Required Changes

### 1. Update `variables.tf`

Modify the variables to match your environment:

```hcl
variable "region" {
  description = "AWS region"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name for static website hosting"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
```

You must update:

- **region**
- **bucket_name**
- **tags** (optional)

---

### 2. Update `index.html`

Replace the placeholder HTML with your website content.

Example:

```html
<!DOCTYPE html>
<html>
<head>
    <title>My Static Website</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Welcome to My S3 Static Website</h1>
</body>
</html>
```

---

### 3. Update `styles.css`

Customize the styling for your website.

Example:

```css
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    text-align: center;
    padding-top: 50px;
}
```

---

## ▶️ Deploying the Website

Run the following Terraform commands:

```bash
terraform validate
terraform plan
terraform apply
```

After deployment, Terraform will output the **S3 website endpoint URL** where your static site is hosted.

---

