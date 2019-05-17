# ECS CloudFormation template
This templates can make containers to run spring applications.  

## Overall view
![ECS](https://github.com/kikkisnrdec/ecs-cloudformation-template/blob/images/ECS.png)

## How to run ECS by AWS CloudFormation
Please rewrite "EnvironmentName" value 'en'.
```
# Role
$ aws cloudformation create-stack --stack-name role --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/01_role.yml --parameters ParameterKey=EnvironmentName,ParameterValue=en

# ECS Cluster
$ aws cloudformation create-stack --stack-name ecsCluster --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/02_ecs-cluster.yml --parameters ParameterKey=EnvironmentName,ParameterValue=en

# VPC
$ aws cloudformation create-stack --stack-name vpc --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/03_vpc.yml --parameters ParameterKey=EnvironmentName,ParameterValue=en

# Security Group
$ aws cloudformation create-stack --stack-name securityGroup --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/04_security-groups.yml --parameters ParameterKey=EnvironmentName,ParameterValue=en

# Load Balancer
$ aws cloudformation create-stack --stack-name loadBalancer --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/05_load-balancers.yml --parameters ParameterKey=EnvironmentName,ParameterValue=en

# Log Group
$ aws cloudformation create-stack --stack-name logGroup --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/06_log-group.yml --parameters ParameterKey=EnvironmentName,ParameterValue=en

# Service Discovery
$ aws cloudformation create-stack --stack-name serviceDiscovery --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/07_service-discovery.yml --parameters ParameterKey=EnvironmentName,ParameterValue=en

# MySQL Service
$ aws cloudformation create-stack --stack-name mysql --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/11_mysql.yml --parameters ParameterKey=EnvironmentName,ParameterValue=en

# Redis Service
$ aws cloudformation create-stack --stack-name redis --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/12_redis.yml --parameters ParameterKey=EnvironmentName,ParameterValue=en

# Tomcat
$ aws cloudformation create-stack --stack-name tomcat --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/21_tomcat.yml --parameters ParameterKey=EnvironmentName,ParameterValue=en

# Nginx
$ aws cloudformation create-stack --stack-name nginx --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --template-body file://./infrastructure/22_nginx.yml --parameters ParameterKey=EnvironmentName,ParameterValue=en

# URL of Load Balancer
$ aws cloudformation describe-stacks --stack-name loadBalancer | jq -r '.Stacks[].Outputs[] | select(.OutputKey=="LoadBalancerUrl") | .OutputValue'
```

## Access
Please enter Load Balancer's url (loadBalancer-xxxxxxxxxxx.ap-northeast-1.elb.amazonaws.com:8080).  