# SLAs y Comparativa de Arquitectura

## 1. Métricas de SLA/SLO
- **Disponibilidad:** SLO 99.5% (Presupuesto de error mensual: ~3.6 horas).
- **Latencia p95:** < 150 ms en endpoints `/api/*`.
- **MTTR:** < 15 minutos ante reinicio de pods.

## 2. Comparativa Técnica y Económica para MiPyME
| Modelo | Costo Mensual Estimado | Mantenimiento | Escalabilidad |
|---|---|---|---|
| **On-Premise (VM Local)** | Bajo (hardware existente) | Alto (administración manual) | Limitada |
| **IaaS (EC2 / Compute Engine)** | Medio ($40 - $80/mes) | Medio (parcheo de SO) | Alta |
| **PaaS / Contenedores Administrados** | Óptimo para MiPyME ($30 - $60/mes) | Mínimo | Automática |

**Conclusión:** Para Café Aurora S.R.L., el modelo PaaS/híbrido ofrece el mejor balance entre costo y alta disponibilidad.
