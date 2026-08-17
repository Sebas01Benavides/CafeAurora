# Documentación Técnica - Café Aurora S.R.L.
*Universidad Técnica Nacional - ITI-522 Computación en la Nube*

## 1. Matriz de Cumplimiento y Privacidad
Se implementa el principio de minimización de datos conforme a la Ley N° 8968. El número de identidad se almacena cifrado en PostgreSQL utilizando claves inyectadas mediante Kubernetes Secrets.

## 2. Catálogo de Métricas y Alertas
- **p95 Latency:** Medido vía PromQL `histogram_quantile(0.95, sum(rate(http_request_duration_seconds_bucket[5m])) by (le))`.
- **Disponibilidad:** Ratio de respuestas 2xx/3xx frente a respuestas 5xx.

## 3. Plan de Continuidad (BCP/DRP)
- **RPO:** 1 hora (Backups programados vía `pg_dump`).
- **RTO:** 10 minutos (Restauración reproducible en pod secundario).

## 4. Hoja de Ruta de Migración del Legado
Plan de corte gradual (Strangler Pattern) redirigiendo `/legacy/inventory` hacia `/api/catalog` en Nginx tras completar la sincronización.

### Bibliografía
- Kubernetes Documentation. (2026). *Production Best Practices*. https://kubernetes.io/docs/
- PostgreSQL Global Development Group. (2026). *PostgreSQL 15 Documentation*. https://www.postgresql.org/docs/
