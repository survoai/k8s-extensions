# Contributing to k8s-extensions

First of all, thank you for your interest in contributing to `k8s-extensions`! We welcome contributions from everyone and are glad you're here.

## Getting Started

1. Fork the `k8s-extensions` repository on GitHub.
2. Clone your fork locally on your machine.
3. Set up your development environment.

## Code Contributions

Here are some basic steps for code contributions:

1. Create a new branch for each feature or bug fix.
2. Write your code. (See below section on creating an extension)
3. Commit your changes. Make sure your commit messages are clear and follow the commit message conventions.
4. Push your changes to your fork.
5. Create a pull request.
6. Address any review comments.

> Note: You can take advantage of `templates` folder which contains a boilerplate to get started with building an extension.
>
> You can either run ```./generate <extensionType>``` or directly copy the desired extension type boilerplate in root directory

## Creating an Extension

This guide explains how to create an extension for the K8s Extensions Installer. An extension consists of a manifest file and a folder named k8s, helm, or terraform, depending on the type of extension.

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


## Code Contributions

Here are some basic steps for code contributions:

1. Create a new branch for each feature or bug fix.
2. Write your code.
3. Write tests that cover your changes.
4. Run tests and make sure all tests pass.
5. Commit your changes. Make sure your commit messages are clear and follow the commit message conventions.
6. Push your changes to your fork.
7. Create a pull request.
8. Address any review comments.

> Note: You can take advantage of `templates` folder which contains a boilerplate to get started with building an extension.
>
> You can either run ```./generate <extensionType>``` or directly copy the desired extension type boilerplate in root directory

## Commit Message Conventions

Please follow the [Conventional Commits](https://www.conventionalcommits.org/) specification. This leads to more readable messages and helps to follow the changes in the project.

## Reporting Bugs

Bugs can be reported by opening an issue on the GitHub repository. Please provide as much detail as possible, including steps to reproduce the issue, the expected behavior, and the observed behavior.

## Requesting Features

Feature requests can also be made by opening an issue on the GitHub repository. Describe the feature, provide use cases if possible, and explain why this feature would be valuable to the project.

## Questions

If you have any questions about contributing to the project, please open an issue and we will do our best to help.
