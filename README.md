### Table of Contents
***
1. [General Info](#general-info)
2. [Technologies](#technologies)
3. [Installation](#installation)
4. [License](#License)
5. [Ressources](#Ressources)

### General Info
***
Hello World!

My name is Mickaël alias sodbaveka.
I created this repository as a lab to discover wordpress, docker, aws infrastructure and services.

My project as a learner is to create a wordpress website using docker, on aws infrastructure.

The purpose of the yaml file 'sodbaveka_aws_infrastructure.yaml' is to build the infrastructure using AWS CloudFormation.
It takes care of :
 * Create VPC
 * Create subnets in new VPC
 * Create internet gateway
 * Attach internet gateway to VPC
 * Create elastic IPs for NAT gateways
 * Create NAT gateways
 * Create route tables
 * Create route tables associations
 * Create routes for the public subnet of Availability Zone A
 * Create routes for the public subnet of Availability Zone B
 * Create routes for the public subnet of Availability Zone C
 * Create routes for the private subnet of Availability Zone A
 * Create routes for the private subnet of Availability Zone B
 * Create routes for the private subnet of Availability Zone C

Please feel free to message me if you have any questions.

Bye ;-)

### Technologies
***
A list of technologies used within the project :
* aws EC2
* aws RDS
* aws S3
* aws CloudFormation
* Docker

### Installation
***
* Download :
```
$  git clone https://github.com/sodbaveka/wp_website_on_aws_infrastructure.git
```

* Launch :
```
AWS CloudFormation --> Create a CloudFormation stack
```

### License
***
* Copyright: (c) 2021, Mickaël Duchet <sodbaveka@gmail.com>
* GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

### Ressources
***
* 'docker and aws for dummies’ :-p 
