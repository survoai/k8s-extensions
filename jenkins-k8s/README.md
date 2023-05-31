# < Extension Name >

## Type

k8s

## Description

This extension creates a jenkins master and jenkins agent pod on a kubernetes cluster. Application includes a **deployment**, **service** of type NodePort,**serviceAccount** and **volume**.

## Version

Version: 1.0.0

## Author

Author: Vandit Singh

## Inputs

- **appname<sup>\*</sup>**: Name of the application
- **namespace<sup>\*</sup>**: Namespace for the application (default: default)
- **replicas**: Number of replicas (default: 4)

## Example

```
heoctl install jenkins-k8s --input appname=jenkins-deployment,namespace=jenkins-ns,replicas=1
```


## Post installation

Jenkins will ask for the initial Admin password when you access the dashboard for the first time.

You can get that from the pod logs either from the Kubernetes dashboard or CLI. You can get the pod details using the following CLI command.

`kubectl get pods --namespace=<namespace>`

With the pod name, you can get the logs as shown below. Replace the pod name with your pod's name.

`kubectl logs <pod-name> --namespace=<namespace>`

The password can be found at the end of the log.

Alternatively, you can run the exec command to get the password directly from the location as shown below.

`kubectl exec -it <pod-name> cat /var/jenkins_home/secrets/initialAdminPassword -n <namespace>`

Once you enter the password, proceed to install the suggested plugin and create an admin user. All of these steps are self-explanatory from the Jenkins dashboard.

## Acknowledgments

- I wanna thank myself for creating this extension
