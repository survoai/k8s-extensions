# Nginx Application on Kubernetes

## Type

k8s

## Description

This extension creates a nginx application on a kubernetes cluster. Application includes a **deployment** and **service** of type LoadBalancer

## Version

Version: 1.0.0

## Author

Author: vishal@humalect.com

## Inputs

- **appname<sup>*</sup>**: Name of the application
- **author<sup>*</sup>**: Author of the application
- **replicas**: Number of replicas (default: 4)

## Example

```
heoctl install nginx-k8s --input appname=nginx-deployment,author=vishal
```

## Acknowledgments

- I wanna thank myself for creating this extension