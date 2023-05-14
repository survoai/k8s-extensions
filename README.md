# Humalect Extensions

## Introduction

The `extensions` repository is a collection of custom Kubernetes extensions designed to enhance and extend the capabilities of a Kubernetes cluster. These extensions include custom resources, controllers, operators, and other tools that can be easily installed and managed using the `heoctl` utility. This can be found at [Humalect Extensions Orchestrator](https://github.com/Humalect/k8s-extension-installer)

## Documentation

### Extensions

The `extensions` repository contains several extensions, organized in directories. Each directory contains the necessary manifest files and templates required to install and configure the extension in a Kubernetes cluster.

### Installation

To install an extension, use the `heoctl` tool to apply the manifest files and templates:

```
./heoctl install <extension_name> --inputs <input_variables>

# Example
./heoctl install nginx-k8s --input appname=nginx-deploy,replicas=1,author=authorName
```

### Deletion

To delete an extension, use the `heoctl` tool to remove the Kubernetes resources associated with the extension:

```
./heoctl uninstall <extension_name> --inputs <input_variables>
```

### Configuration

Each extension in the `extensions` repository can be customized using input variables. These variables are defined in the manifest files and can be set when using the `heoctl` tool to install or delete an extension.

Make sure to replace `<extension_name>` and `<input_variables>` with the appropriate values when running the `heoctl`.

---

## Creating an Extension

This guide explains how to create an extension for the Humalect Extensions Orchestrator. An extension consists of a manifest file and a folder named k8s, helm, or terraform, depending on the type of extension.

### **Extension Structure:**

An extension consists of the following components:

1. **Manifest file:** A YAML file containing metadata and input parameters for the extension.
2. **Configuration folder:** A folder named k8s, helm, or terraform containing the necessary files and templates for the specific configuration management tool. Please use `terraform` as the name of folder to store tf files and that folder should be paraller to manifest file.

### **Manifest file:**

The manifest file is a YAML file that includes the following information:

1. name: The name of the extension.
2. description: A brief description of the extension.
3. type: The type of extension (either k8s, helm, or terraform).
4. version: The version of the extension.
5. author: The author of the extension.
6. inputs: A list of input parameters for the extension.

#### **Input Parameters:**

Each input parameter in the manifest file has the following attributes:

1. name: The name of the input parameter.
2. type: The data type of the input parameter (either string or integer).
3. required: Whether the input parameter is required or not.
4. description: A description of the input parameter.
5. default: The default value for the input parameter, if not provided by the user (optional).

#### **Example Manifest File**

Here's an example of a manifest file:

```
name: nginx
description: A brief description of the extension
type: k8s
version: 1.0.0
author: Vishal Saugat
inputs:
  - name: appname
    type: string
    required: true
    description: Name of the application
  - name: author
    type: string
    required: true
    description: Author of the application
  - name: replicas
    type: integer
    required: false
    default: 4
    description: Number of replicas
```

### **Configuration Folder**

Create a folder named **k8s**, **helm**, or **terraform** based on the type of extension specified in the manifest file. This folder should contain the necessary files and templates for the chosen configuration management tool.

For example, for a Kubernetes extension, the **k8s** folder might contain YAML files for creating deployments, services, and other Kubernetes resources.

#### **Example Template File**

Here's a sample template file that can be located in the k8s folder if the extension type is k8s:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: '{{.appname}}'
  namespace: default
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 2
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
          resources: {}

---

apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpd-deployment
  namespace: httpd
spec:
  selector:
    matchLabels:
      app: httpd
  replicas: {{.replicas}}
  template:
    metadata:
      labels:
        app: httpd
    spec:
      containers:
        - name: httpd-containers
          image: httpd
          ports:
            - containerPort: 80

```
