output "dev_public_ip" {
  description = "IP publique du serveur de développement."
  value       = aws_instance.app[0].public_ip
}

output "prod_public_ip" {
  description = "IP publique du serveur de production."
  value       = aws_instance.app[1].public_ip
}

output "ansible_hosts" {
  description = "Hôtes à utiliser dans l'inventaire Ansible."
  value = {
    dev = {
      ansible_host = aws_instance.app[0].public_ip
      ansible_user = "ec2-user"
    }
    prod = {
      ansible_host = aws_instance.app[1].public_ip
      ansible_user = "ec2-user"
    }
  }
}
