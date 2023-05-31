# Jenkins Instance

## Type

helm

## Description

This extension creates a Jenkins instance on kubernetes using a helm chart

## Version

Version: 1.0.0

## Author

Author: 

## Inputs

- **release_name<sup>\*</sup>**: Name of the application
- **namespace**: Namespace

## Example

```
heoctl install jenkins-helm --input release_name=jenkins-release,namespace=jenkins
```

## Acknowledgments

- I wanna thank myself for creating this extension
