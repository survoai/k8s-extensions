apiVersion: v1
kind: Service
metadata:
  name: jenkins
  namespace: '{{.namespace}}'
spec:
  type: NodePort
  ports:
  - port: 8080
    targetPort: 8080
  selector:
    app: jenkins