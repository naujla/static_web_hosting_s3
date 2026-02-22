
---

# Static Website Hosting on AWS S3 Using Terraform

This project demonstrates how to deploy a **static website** (HTML + CSS) to an **Amazon S3 bucket** using Terraform.  
You only need to update three components before deployment:

1. **Terraform variables**  
2. **index.html**  
3. **styles.css**

---

## 📌 Overview

- Creates an S3 bucket configured for **static website hosting**
- Uploads your `index.html` and `styles.css` files
- Bucket policy allows public read access (optional based on your setup)
- All custom values are managed through the **variables file**

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
  description = "Name of the S3 bucket for static hosting"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
```

Be sure to update:

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
    <h1>Hello from S3 Static Hosting!</h1>
</body>
</html>
```

---

### 3. Update `styles.css`

Customize your website’s styling.

Example:

```css
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    text-align: center;
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

Once applied, Terraform will output the **S3 website endpoint URL** where your static site is hosted.

---


