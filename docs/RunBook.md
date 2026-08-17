# 1. RunBook de Operación
cat << 'EOF' > ~/cafe-aurora/docs/RunBook.md
# RunBook de Operación - Café Aurora S.R.L.

## 1. Arranque de Servicios
- k3s: `sudo systemctl restart k3s`
- Nginx: `sudo systemctl restart nginx`
- Apache: `sudo systemctl restart apache2`
- Observabilidad: `sudo docker compose -f deploy/docker-compose-observability.yaml up -d`

## 2. Health Checks
- Cluster: `kubectl get pods`
- Catalog API: `curl -k https://localhost/api/catalog`
- Customers API: `curl -k https://localhost/api/customers`
- Orders API: `curl -k https://localhost/api/orders`
- Legacy: `curl -k https://localhost/legacy/inventory`

## 3. Backup y Restauración
- Ejecutar: `./deploy/backup_restore.sh`
