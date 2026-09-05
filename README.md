# Infrastructure Todo

Ce dépôt contiendra l'infrastructure AWS et la configuration des serveurs de l'application Todo.

- `terraform/` : création des ressources AWS, dont les environnements `dev` et `prod`.
- `ansible/` : installation et configuration de Docker, Traefik, Prometheus et Grafana.

Les secrets, les clés privées, les fichiers d'inventaire générés et les états Terraform ne sont pas versionnés.
