kind: Namespace
apiVersion: v1
metadata:
  name: '{{.namespace}}'
  labels:
    name: '{{.namespace}}'
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: '{{.appname}}'
  namespace: '{{.namespace}}'
spec:
  replicas: {{.replicas}}
  selector:
    matchLabels:
      app: jenkins
  template:
    metadata:
      labels:
        app: jenkins
    spec:
      containers:
      - name: jenkins
        image: jenkins/jenkins:lts-jdk11
        ports:
        - containerPort: 8080
        volumeMounts:
        - name: jenkins-home
          mountPath: /var/jenkins_home
      volumes:
      - name: jenkins-home
        emptyDir: { }