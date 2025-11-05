# 🌍 Multi-Environment Infrastructure on AWS with Terraform

This project demonstrates how to create **separate Development and Production environments** on AWS using **Terraform modules** — following professional infrastructure-as-code (IaC) practices.

---

## 🚀 Project Overview

You will deploy and manage two fully isolated environments (**dev** and **prod**) using reusable Terraform modules.

Each environment has:
- Its own EC2 instance
- Custom CPU/memory configuration
- Separate state and resource isolation
- Automatic naming and tagging

---

## ⚙️ What’s Inside

### **Module (`modules/webapp`)**
Creates:
- AWS EC2 Instance (Amazon Linux)
- Security Group allowing HTTP (port 80)
- User data script that serves environment-specific HTML message:
  - `dev environment running on AWS EC2`
  - `prod environment running on AWS EC2`

### **Environments**
Each environment reuses the module with different parameters:

| Environment | Instance Type | Message Displayed | Purpose |
|--------------|----------------|-------------------|----------|
| **dev** | t2.micro | `dev environment running on AWS EC2` | Testing |
| **prod** | t3.medium | `prod environment running on AWS EC2` | Production |

---

## 🧩 Terraform Workflow

### **1️⃣ Initialize**
```bash
terraform init
2️⃣ Plan

terraform plan
3️⃣ Apply

terraform apply
4️⃣ Output

terraform output
You’ll get the public IP of your environment.
Open it in your browser to see the running web server.

🌎 Example Results
Dev Environment:
http://54.175.94.226
Shows → dev environment running on AWS EC2

Prod Environment:
http://44.220.135.76
Shows → prod environment running on AWS EC2

🔒 Isolation Benefits
✅ Development and Production resources are fully separated
✅ Different performance levels for different needs
✅ Safe experimentation in dev without impacting prod
✅ Cost optimization for non-production resources

🧰 Tech Stack
AWS EC2 — Compute resources

Terraform — Infrastructure as Code

Modules — DRY principle for reusable components

User Data — Dynamic HTML messages per environment

💡 Key Learnings
Built reusable Terraform module for EC2 infrastructure

Implemented multi-environment separation (dev/prod)

Practiced DRY principle for modular infrastructure

Learned environment isolation, tagging, and scaling

🧹 Cleanup
When done, destroy environments to avoid charges:


cd environments/prod
terraform destroy

cd ../dev
terraform destroy
