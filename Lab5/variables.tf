variable "location" {
  type    = string
  default = "mexicocentral"
}

variable "vnet_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnets" {
  type = map(number)
  default = {
    web = 0
    app = 1
    db  = 2
  }
}
  variable "subscription_id" {
  type        = string
  description = "ID de la suscripción de Azure"
  sensitive   = true
}
