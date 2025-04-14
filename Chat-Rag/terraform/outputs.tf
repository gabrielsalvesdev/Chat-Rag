# Outputs em Português para Rastreabilidade e Monitoramento

output "nome_grupo_recursos" {
  description = "Nome do grupo de recursos criado para o projeto Chat-RAG"
  value       = azurerm_resource_group.chat_rag_rg.name
}

output "nome_servico_aplicativo" {
  description = "Nome do serviço de aplicativo web Linux para Chat-RAG"
  value       = azurerm_linux_web_app.chat_rag_app_service.name
}

output "url_aplicacao" {
  description = "URL do serviço de aplicativo web para acesso à aplicação"
  value       = azurerm_linux_web_app.chat_rag_app_service.default_hostname
}

output "nome_conta_armazenamento" {
  description = "Nome da conta de armazenamento para recursos do Chat-RAG"
  value       = azurerm_storage_account.chat_rag_storage_account.name
}

output "nome_plano_servico" {
  description = "Nome do plano de serviço Azure para hospedagem da aplicação"
  value       = azurerm_service_plan.chat_rag_service_plan.name
}
