# 🆓 Azure Free-Tier Automation with Terraform

[![Terraform Version](https://img.shields.io/badge/terraform-≥1.3-blue?logo=terraform)](https://www.terraform.io/)
[![Azure Free Tier](https://img.shields.io/badge/azure-free_tier-0089D6?logo=microsoft-azure)](https://azure.microsoft.com/free/)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

**Network Engineer → Cloud Automation Specialist**  
*From Cisco CLI to Azure ARM templates - building cloud-native infrastructure*

## 🌟 Features Deployed
✅ **Zero-Cost Architecture**  
✅ **Infrastructure as Code** (Terraform)  
✅ **Auto-Generated Resource Names**  
✅ **Cost Monitoring Ready**

```hcl
# Free Linux App Service
resource "azurerm_linux_web_app" "free_app" {
  name                = "free-app-${random_id.suffix.hex}"
  location            = "westus" # Free-tier supported region
  service_plan_id     = azurerm_service_plan.free_plan.id
  site_config { 
    always_on = false # Free-tier requirement
  }
}

📊 Resource Diagram
graph TD
  A[Resource Group] --> B[Storage Account]
  A --> C[App Service Plan]
  C --> D[Linux Web App]

🛠️ Technical Highlights
100% Free Azure Services (Within monthly limits)

Unique Naming Convention (Prevents conflicts)

Terraform Best Practices (State management, outputs)
