# Infrastructure Todo

Ce dépôt contiendra l'infrastructure AWS et la configuration des serveurs de l'application Todo.

- `terraform/` : création des ressources AWS, dont les environnements `dev` et `prod`.
- `ansible/` : installation et configuration de Docker, Traefik, Prometheus et Grafana.

Les secrets, les clés privées, les fichiers d'inventaire générés et les états Terraform ne sont pas versionnés.

## Terraform

1. Créez une EC2 Key Pair dans la région AWS choisie et conservez sa clé privée localement.
2. Copiez `terraform/terraform.tfvars.example` vers `terraform/terraform.tfvars`.
3. Remplacez `VOTRE_IP_PUBLIQUE/32` par votre adresse IP publique, par exemple avec `curl https://checkip.amazonaws.com`.
4. Lancez les commandes suivantes :

   ```bash
   cd terraform
   terraform init
   terraform plan
   terraform apply
   ```

Les adresses IP sont affichées après l'application : `terraform output ansible_hosts`.
