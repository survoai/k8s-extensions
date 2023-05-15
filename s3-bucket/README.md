# S3 Bucket

## Type

terraform

## Description

This extension creates a s3 bucket in the AWS cloud. User has to input the `aws_region` and `bucket_name`.

## Version

Version: 1.0.0

## Author

Author: manav@humalect.com

## Inputs

- **bucket_name<sup>*</sup>**:  Name of the bucket to be created
- **aws_region<sup>*</sup>**:  AWS region where bucket is created

## Example

```
heoctl install s3-bucket --input bucket_name=my-bucket,aws_region=ap-south-1
```

## Acknowledgments

- I wanna thank myself for creating this extension