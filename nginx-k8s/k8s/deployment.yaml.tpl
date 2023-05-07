apiVersion: apps/v1
kind: Deployment
metadata:
  name: '{{.appname}}'
  namespace: default
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: {{.replicas}}
  template:
    metadata:
      labels:
        app: nginx
        created-by: '{{.author}}'
    spec:
      containers:
        - name: nginx-containers
          image: nginx
          ports:
            - containerPort: 80
          resources:
            limits:
              cpu: 100m
              memory: 128Mi
            requests:
              cpu: 100m
              memory: 128Mi