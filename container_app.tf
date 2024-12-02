resource "azurerm_container_app_environment" "example" {
  name                = "example-env"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_container_app" "example" {
  name                      = "example-app"
  container_app_environment_id = azurerm_container_app_environment.example.id
  resource_group_name        = azurerm_resource_group.example.name
  revision_mode              = "Single" # Specify the revision mode here

  template {
    container {
      name   = "example-container"
      image  = "nginx:latest"
      cpu    = 0.25
      memory = "0.5Gi"
      env {
        name  = "EXAMPLE_ENV_VAR"
        value = "example"
      }
    }
  }
}
