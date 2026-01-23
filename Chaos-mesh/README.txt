Guía de Instalación de Chaos Mesh con Podman + kind 

Introducción 

Esta guía describe cómo instalar Chaos Mesh sobre un clúster de Kubernetes creado con kind y ejecutado usando Podman como motor de contenedores. El objetivo es tener un entorno educativo y de pruebas, por lo que se desactiva el modo de seguridad (SECURITY_MODE=false) para permitir acceso directo al dashboard. 

Requisitos Previos 

- Podman instalado 

- kind instalado 

- kubectl instalado 

- Helm instalado 

- Acceso a Internet para descargar imágenes 

- Sistema Windows, macOS o Linux 

Creación del clúster con kind usando Podman 

1. Configurar Podman como runtime por defecto. 

2. Crear el clúster con kind: 

   kind create cluster --name chaos-cluster 
 

3. Verificar acceso: 

   kubectl cluster-info 

   kubectl get nodes 


Instalación de Chaos Mesh con Helm 

1. Agregar el repositorio: 

   helm repo add chaos-mesh https://charts.chaos-mesh.org 

   helm repo update 
 

2. Crear namespace: 

   kubectl create ns chaos-mesh 
 

3. Instalar Chaos Mesh: 

   helm install chaos-mesh chaos-mesh/chaos-mesh --namespace chaos-mesh --set dashboard.create=true --set chaosDaemon.runtime=containerd --set chaosDaemon.socketPath=/run/containerd/containerd.sock 
 

Desactivar SECURITY_MODE para acceso directo 

Para este entorno educativo se desactiva la autenticación por token. 

1. Editar el deployment del dashboard: 

   kubectl -n chaos-mesh edit deploy chaos-dashboard 
 

2. Cambiar o agregar la variable de entorno: 

   - name: SECURITY_MODE 

     value: "false" 


3. Reiniciar el deployment: 

   kubectl -n chaos-mesh rollout restart deploy chaos-dashboard 


Acceso al Dashboard 

1. Port-forward: 

   kubectl -n chaos-mesh port-forward svc/chaos-dashboard 2333:2333 
 

2. Abrir en navegador: 

    http://localhost:2333 

Namespace de Pruebas 

Se creó un namespace para las pruebas: 

   kubectl create ns chaos-demo 

Ejemplo de aplicación objetivo 

Ejemplo de pods con etiqueta: 

   app=front 


Estos serán usados como targets para los experimentos de Chaos Mesh. 

Ejecutar un StressChaos 

Desde el dashboard: 

1. Create New Experiment 

2. Tipo: StressChaos 

3. Namespace: chaos-demo 

4. Label selector: app=front 

5. CPU Workers: 1 

6. CPU Load: 80 

7. Duración: 60s 

8. Submit 

 

Esto simulará carga alta de CPU en los pods seleccionados. 

Notas 

Este entorno es únicamente para pruebas y aprendizaje. 

No se recomienda desactivar SECURITY_MODE en ambientes productivos. 

 

Instalación de Prometheus y Grafana (kube-prometheus-stack) 

 

Para visualizar el impacto de los experimentos de Chaos Mesh, se instalará Prometheus y Grafana utilizando el chart kube-prometheus-stack. 

Instalación de kube-prometheus-stack con Helm 
 
1. Agregar el repositorio de Prometheus: 

   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts 

   helm repo update 

 
2. Crear namespace de monitoreo: 

   kubectl create namespace monitoring 
 
3. Instalar el stack: 

   helm install kps prometheus-community/kube-prometheus-stack -n monitoring 
 

4. Verificar que los pods estén corriendo: 

   kubectl -n monitoring get pods 
 

Acceso a Grafana 

1. Obtener el password del usuario admin: 

   kubectl -n monitoring get secret kps-grafana -o jsonpath="{.data.admin-password}" | base64 --decode 
 

2. Port-forward al servicio de Grafana: 

   kubectl -n monitoring port-forward svc/kps-grafana 3000:80 
 

3. Acceder desde el navegador: 

   http://localhost:3000 
 

   Usuario: admin 

   Password: (obtenido en el paso anterior) 

 

Creación del Dashboard para Chaos Mesh 

1. Ingresar a Grafana y seleccionar Dashboards → New Dashboard. 

2. Crear variables del dashboard: 

   - cluster 

   - namespace 

   - pod 

   - deployment 

 

3. Crear las siguientes visualizaciones: 

Panel: Pod Restarts 

Query: 

   increase(kube_pod_container_status_restarts_total{namespace="$namespace", pod=~"$pod"}[5m]) 

 
Panel: Pod Phase 

Query: 

   kube_pod_status_phase{namespace="$namespace", pod=~"$pod"} == 1 

 

Visualización recomendada: Table 

Panel: Deployment Availability 

Queries: 

   kube_deployment_status_replicas_available{namespace="$namespace", deployment=~"$deployment"} 

   kube_deployment_spec_replicas{namespace="$namespace", deployment=~"$deployment"} 

 

Panel: CPU Usage (StressChaos) 

Query: 

   sum(rate(container_cpu_usage_seconds_total{namespace="$namespace", pod=~"$pod"}[1m])) 

 
Estas visualizaciones permiten observar en tiempo real el impacto de los experimentos de Chaos Mesh y validar la resiliencia del sistema. 

Notas Finales 

- El dashboard es completamente dinámico y gobernado por variables. 

- No se utilizan valores hardcodeados. 

- Compatible con Podman + kind y entornos cloud como AKS. 

 
