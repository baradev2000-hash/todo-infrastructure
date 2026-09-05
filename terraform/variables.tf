variable "aws_region" {
  description = "Région AWS de déploiement."
  type        = string
  default     = "eu-west-3"
}

variable "project_name" {
  description = "Préfixe appliqué aux ressources AWS."
  type        = string
  default     = "todo"
}

variable "environment" {
  description = "Environnement de gestion des ressources Terraform."
  type        = string
  default     = "shared"
}

variable "key_name" {
  description = "Nom d'une EC2 Key Pair existante, utilisée par Ansible pour SSH."
  type        = string

  validation {
    condition     = length(trimspace(var.key_name)) > 0
    error_message = "key_name doit référencer une EC2 Key Pair existante."
  }
}

variable "admin_cidr" {
  description = "Adresse CIDR autorisée à se connecter en SSH (exemple : 203.0.113.10/32)."
  type        = string

  validation {
    condition     = can(cidrhost(var.admin_cidr, 0))
    error_message = "admin_cidr doit être une adresse CIDR valide."
  }
}

variable "instance_type" {
  description = "Type des instances EC2. t3.micro convient à un environnement de démonstration."
  type        = string
  default     = "t3.micro"
}

variable "vpc_cidr" {
  description = "Plage CIDR du VPC."
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Deux plages CIDR publiques, respectivement dev et prod."
  type        = list(string)
  default     = ["10.20.10.0/24", "10.20.20.0/24"]

  validation {
    condition     = length(var.public_subnet_cidrs) == 2
    error_message = "Deux subnets sont requis : dev et prod."
  }
}
