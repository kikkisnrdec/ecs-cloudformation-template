## How to run ECS by AWS CloudFormation

![ECS](https://github.com/kikkisnrdec/ecs-cloudformation-template/blob/images/ECS.png)

```
# Role
$ aws cloudformation create-stack --stack-name role --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/01_role.yml --parameters ParameterKey=EnvironmentName,ParameterValue=qa

# ECS Cluster
$ aws cloudformation create-stack --stack-name ecsCluster --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/02_ecs-cluster.yml --parameters ParameterKey=EnvironmentName,ParameterValue=qa

# VPC
$ aws cloudformation create-stack --stack-name vpc --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/03_vpc.yml --parameters ParameterKey=EnvironmentName,ParameterValue=qa

# Security Group
$ aws cloudformation create-stack --stack-name securityGroup --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/04_security-groups.yml --parameters ParameterKey=EnvironmentName,ParameterValue=qa

# Load Balancer
$ aws cloudformation create-stack --stack-name loadBalancer --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/05_load-balancers.yml --parameters ParameterKey=EnvironmentName,ParameterValue=qa

# Log Group
$ aws cloudformation create-stack --stack-name logGroup --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/06_log-group.yml --parameters ParameterKey=EnvironmentName,ParameterValue=qa

# Service Discovery
$ aws cloudformation create-stack --stack-name serviceDiscovery --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/07_service-discovery.yml --parameters ParameterKey=EnvironmentName,ParameterValue=qa

# MySQL Service
$ aws cloudformation create-stack --stack-name mysql --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/11_mysql.yml --parameters ParameterKey=EnvironmentName,ParameterValue=qa

# Redis Service
$ aws cloudformation create-stack --stack-name redis --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/12_redis.yml --parameters ParameterKey=EnvironmentName,ParameterValue=qa

# Tomcat
$ aws cloudformation create-stack --stack-name tomcat --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/21_tomcat.yml --parameters ParameterKey=EnvironmentName,ParameterValue=qa

# Nginx
$ aws cloudformation create-stack --stack-name nginx --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/22_nginx.yml --parameters ParameterKey=EnvironmentName,ParameterValue=qa

# URL of Load Balancer
$ aws cloudformation describe-stacks --stack-name loadBalancer | jq -r '.Stacks[].Outputs[] | select(.OutputKey=="LoadBalancerUrl") | .OutputValue'
```