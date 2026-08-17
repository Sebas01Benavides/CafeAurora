# Seguridad y Privacidad - Café Aurora S.R.L.

## 1. Clasificación de Datos
- **Público:** Catálogo de productos y precios.
- **Interno:** Registros de inventario y logs de observabilidad.
- **Confidencial/Restringido:** Número de identidad de clientes (cifrado simétrico en reposo).

## 2. Modelo de Amenazas (STRIDE) y Hardening
- **Spoofing / Tampering:** TLS autofirmado con redirección HTTP->HTTPS forzada en Nginx.
- **Information Disclosure:** Cifrado de identidad en PostgreSQL con clave gestionada en Secret de Kubernetes.
- **Hardening:** Puertos filtrados, limits/requests en pods y aislamiento de procesos.
