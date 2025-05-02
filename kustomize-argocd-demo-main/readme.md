# Guía de Laboratorio: ArgoCD + Kubernetes con Podman + kind

Esta guía está diseñada para estudiantes que deseen crear un laboratorio GitOps usando ArgoCD y Kubernetes con Podman + kind en un entorno local.

---

## ✨ Requisitos previos

* Windows 10/11 o Linux
* Git
* PowerShell o Git Bash

---

## ὋB Paso 1: Instalar Podman Desktop

1. Descarga e instala Podman Desktop desde: [https://podman.io](https://podman.io)
2. Asegúrate de que Podman Machine esté iniciado desde Podman Desktop

---

## ⚙️ Paso 2: Instalar kind

1. Descarga kind:

   ```bash
   curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-windows-amd64
   chmod +x ./kind
   mv ./kind /usr/local/bin/kind
   ```

   En Windows, puedes usar [scoop](https://scoop.sh) o descargar el binario y agregarlo al `PATH`.

2. Verifica que funcione:

   ```bash
   kind version
   ```

---

##  configuración personalizada

Crea un archivo llamado `kind-config.yaml` con el siguiente contenido:

```yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraPortMappings:
    - containerPort: 30000
      hostPort: 30000
```

Luego crea el clúster:

```bash
kind create cluster --name argocd-demo --config kind-config.yaml
```

---

## 🔧 Paso 4: Instalar ArgoCD

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Verifica que todos los pods estén en estado `Running`:

```bash
kubectl get pods -n argocd
```

---

## 🔐 Paso 5: Obtener la contraseña de acceso

```powershell
$encoded = kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}"
[System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($encoded))
```

---

## 🚪 Paso 6: Acceder a la interfaz de ArgoCD

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

Abrir en navegador: `https://localhost:8080`

* Usuario: `admin`
* Contraseña: (la que recuperaste arriba)

---

## 🌏 Paso 7: Configurar DNS en CoreDNS

Editar el ConfigMap:

```bash
kubectl -n kube-system edit configmap coredns
```

Cambiar esta línea:

```text
forward . /etc/resolv.conf
```

por:

```text
forward . 8.8.8.8 1.1.1.1 {
    max_concurrent 1000
}
```

Reiniciar CoreDNS:

```bash
kubectl -n kube-system rollout restart deployment coredns
```

Validar DNS:

```bash
kubectl run dnscheck --rm -it --image=busybox --restart=Never -- nslookup github.com
```

---

## 🚶‍♂️ Paso 8: Crear namespace para la app nginx

```bash
kubectl create namespace nginx-app
```

---

## 📝 Paso 9: Estructura para múltiples apps

Para mantener organizadas múltiples aplicaciones en el mismo repositorio, se recomienda la siguiente estructura:

```
kustomize-argocd-demo/
├── apps/
│   ├── nginx-app/
│   │   ├── deployment.yaml
│   │   ├── service.yaml
│   │   ├── configmap.yaml
│   │   ├── ingress.yaml
│   │   └── kustomization.yaml
│   └── httpd-app/
│       ├── deployment.yaml
│       ├── service.yaml
│       ├── ingress.yaml
│       └── kustomization.yaml
```

Cada subcarpeta representa una aplicación.

---

## 🧩 Paso 10: Crear una app nueva en ArgoCD (ejemplo con `httpd-app`)

### Desde la UI de ArgoCD

1. Entra a `https://localhost:8080`
2. Haz clic en `+ NEW APP`
3. Llena los campos así:

| Campo            | Valor                                                          |
| ---------------- | -------------------------------------------------------------- |
| Application Name | `nginx-app`                                                    |
| Project          | `default`
| Sync Policy      | `Automatic`
| Prune resources  | `Check`
| Self Heal        | `Check`                                                     |
| Repository URL   | `https://github.com/Babxiluca/Garage.git` |
| Revision         | `main`                                                         |
| Path             | `kustomize-argocd-demo-main/apps/nginx-app`                                               |
| Cluster URL      | `https://kubernetes.default.svc`                               |
| Namespace        | `nginx-app`                                                    |

| Campo            | Valor                                                          |
| ---------------- | -------------------------------------------------------------- |
| Application Name | `httpd-app`                                                    |
| Project          | `default`
| Sync Policy      | `Automatic`
| Prune resources  | `Check`
| Self Heal        | `Check`                                                      |
| Repository URL   | `https://github.com/Babxiluca/Garage.git` |
| Revision         | `main`                                                         |
| Path             | `kustomize-argocd-demo-main/apps/http-app`                                               |
| Cluster URL      | `https://kubernetes.default.svc`                               |
| Namespace        | `http-app`                                                    |

4. Haz clic en **Create**

*** Antes de agregar los namespace hay que crearlos en el cluster:
kubectl create namespace nginx-app
kubectl create namespace http-app

## 🧪 Paso 11: Verifica el Ingress

Agrega al archivo hosts de tu sistema:

```
127.0.0.1 nginx.local
127.0.0.1 httpd.local
```

Verifica en navegador:

```
http://nginx.local:32530
http://httpd.local:32530
```

---

🎉 ¡Tu entorno GitOps ahora soporta múltiples aplicaciones organizadas y sincronizadas con ArgoCD!
