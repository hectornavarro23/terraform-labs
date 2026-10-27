output "subnets" {
  value = { for nombre, subnet in azurerm_subnet.lab5 : nombre => subnet.address_prefixes[0] }
}