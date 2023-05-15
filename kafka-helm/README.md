# Kafka Instance

## Type

helm

## Description

This extension creates a kafka instance on kubernetes using a helm chart

## Version

Version: 1.0.0

## Author

Author: manav@humalect.com

## Inputs

- **release_name<sup>\*</sup>**: Name of the application
- **namespace**: Number of replicas (default: 4)

## Example

```
heoctl install kafka-helm --input release_name=kafka-release,namespace=kafka
```

## Acknowledgments

- I wanna thank myself for creating this extension
