# Step-by-Step Guide to Using My GitHub Repo

This guide will walk you through the steps to set up and use my GitHub repository. It contains code for deploying AWS infrastructure using AWS CDK and running a Dockerized application. Follow the steps below to get started:

## Overview of the steps:

This setup will deploy the following AWS resources:

- VPC
- Codepipeline
- Codebuild
- CodeDeploy
- EC2 instance
- Some security groups

## How it works:

After you push to the observed github branch, the pipeline will be triggered and will create a new Docker image, push it to DockerHub and the Ec2 instance will pull the image and run it.

## Prerequisites

1. Set up an AWS account and create security credentials for that account.
2. Download the AWS CLI for Windows and configure it to use the credentials.
3. Node.js and npm installed on your machine.
4. Generata a github token and add it to the .env file inside the aws_infra folder
5. DockerFile is inside the root folder of the project

## Installation

1. Install TypeScript globally by running the following command:

```
 npm install -g typescript

```

2. Install AWS CDK globally using the following command:

```
 npm install -g aws-cdk-lib
```

3. Copy "aws_infra" folder to your project root folder.

4. use the example.env file to create a .env file inside the aws_infra folder.

## Setup AWS

1. Bootstrap the AWS environment (only once per AWS account per region) to prepare it for deploying CDK stacks:

   ```
   cdk bootstrap

   ```

2. Generate and synthesize the CloudFormation template for your AWS CDK app:

   - inside aws_infra folder run:

   ```
   cdk synth

   ```

## Deploy AWS Infrastructure

1. Deploy your AWS infrastructure using the following command:

   ```
   npm run deploy
   ```

   this command will write ec2 properties to the cdk-output.json file inside the aws_infra folder for further use.

2. If you want to check the differences between your current AWS infrastructure and what will be deployed, use the following command:

   ```
   cdk diff
   ```

## Docker Setup and Deployment

1. To verify if Docker is running on the EC2 instance, execute the following command inside your instance:

   ```
   sudo systemctl is-active docker
   ```

2. Check if CodeDeploy agent is running on the EC2 instance using the following command inside your instance:

   ```
   sudo service codedeploy-agent status
   ```

3. Ensure that the `aws_infra` (or your infrastructure folder) is added to the `.dockerignore` file to avoid unnecessary files being included in the Docker image.

## Cleanup

If you want to remove the deployed stacks and cleanup resources:

1. Delete the CDK stacks:
   cdk destroy

2. Remove the Docker container when you no longer need it.

By following these steps, you will be able to use my GitHub repository effectively and deploy AWS infrastructure along with a Dockerized application. If you have any questions or issues, feel free to refer to the repository's documentation or contact me for support. Happy coding!
