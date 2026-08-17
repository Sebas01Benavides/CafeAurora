#!/bin/bash
POD_PG=$(kubectl get pod -l app=postgres -o jsonpath='{.items[0].metadata.name}')

echo "=== Realizando Backup de PostgreSQL ==="
kubectl exec -i $POD_PG -- pg_dump -U postgres aurora_db > ~/cafe-aurora/deploy/backup_aurora.sql
echo "Backup guardado en deploy/backup_aurora.sql"

echo "=== Probando Restauracion ==="
kubectl exec -i $POD_PG -- psql -U postgres -d aurora_db < ~/cafe-aurora/deploy/backup_aurora.sql
echo "Restauracion completada con exito."
