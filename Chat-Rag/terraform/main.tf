# Configure o Provedor Azure
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"  # Use a versão mais recente que você precisa
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# Defina as Variáveis
variable "subscription_id" {
  description = "O ID da assinatura do Azure"
  type        = string
}

variable "client_id" {
  description = "O ID do cliente do Azure"
  type        = string
}

variable "client_secret" {
  description = "A chave secreta do cliente do Azure"
  type        = string
  sensitive   = true  # Adicione sensitive = true para proteger o segredo
}

variable "tenant_id" {
  description = "O ID do locatário do Azure"
  type        = string
}

variable "resource_group_name" {
  description = "O nome do grupo de recursos"
  type        = string
  default     = "ChatRagResourceGroup"  # Valor padrão
}

variable "location" {
  description = "A região do Azure para implantar recursos"
  type        = string
  default     = "brazilsouth"  # Valor padrão
}

variable "app_service_plan_sku_name" {
  description = "The SKU for the App Service Plan"
  type        = string
  default     = "B1"  # Valor padrão
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "chatragstorageaccount"
}

# Declare o Grupo de Recursos
resource "azurerm_resource_group" "chat_rag_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Declare o Plano de Serviço
resource "azurerm_service_plan" "chat_rag_service_plan" {
  name                = "ChatRagAppServicePlan"  # Pode usar uma variável aqui também
  location            = azurerm_resource_group.chat_rag_rg.location
  resource_group_name = azurerm_resource_group.chat_rag_rg.name
  os_type             = "Linux"
  sku_name            = var.app_service_plan_sku_name  # Use a variável aqui
}

# Declare o Aplicativo Web Linux
resource "azurerm_linux_web_app" "chat_rag_app_service" {
  name                = "ChatRagAppService"  # Pode usar uma variável aqui também
  location            = azurerm_resource_group.chat_rag_rg.location
  resource_group_name = azurerm_resource_group.chat_rag_rg.name
  service_plan_id     = azurerm_service_plan.chat_rag_service_plan.id

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }

  site_config {  # Adicione o bloco site_config aqui
  }
}

# Declare a Conta de Armazenamento
resource "azurerm_storage_account" "chat_rag_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.chat_rag_rg.name
  location                 = azurerm_resource_group.chat_rag_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  min_tls_version          = "TLS1_2"
}
