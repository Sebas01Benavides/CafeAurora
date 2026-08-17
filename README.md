# Proyecto Integral - Café Aurora S.R.L.
**Curso:** ITI-522 Computación en la Nube  
**Institución:** Universidad Técnica Nacional (UTN)

## Estructura del Repositorio
- `source/`: Código fuente de microservicios, módulo legado y frontend.
- `deploy/`: Manifiestos YAML de K8s, configuración Nginx y scripts de backup.
- `docs/`: Arquitectura, RunBook, SLA, Threat Model y Documentación Técnica (formato APA).
- `evidence/`: Reportes de pruebas hey, ab, kubectl y consultas SQL cifradas.

## Instrucciones de Arranque
1. Clonar el repositorio: `git clone <URL_REPO> && cd cafe-aurora`
2. Desplegar stack K8s: `kubectl apply -f deploy/k8s-full-stack.yaml`
3. Configurar Nginx: `sudo cp deploy/nginx.conf /etc/nginx/sites-available/default && sudo systemctl restart nginx`
4. Iniciar Observabilidad: `sudo docker compose -f deploy/docker-compose-observability.yaml up -d`
5. Acceso web: `https://localhost/`
