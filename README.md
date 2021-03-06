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
Wordpress website take advantage of aws services like S3, RDS ans EFS.
I realized a VPN between on-premise private subnet and aws private subnet too.

The purpose of the yaml file 'sodbaveka_aws_full_infrastructure.yaml' is to build the infrastructure using AWS CloudFormation...from scratch.

Code takes care of :
 * Create network
     * Create VPC
     * Create subnets in new VPC
     * Create internet gateway
     * Attach internet gateway to VPC
     * Create elastic IPs for NAT gateway
     * Create NAT gateway
     * Create route tables
     * Create route tables associations
     * Create routes for the public subnet of Availability Zone A
     * Create routes for the public subnet of Availability Zone B
     * Create routes for the public subnet of Availability Zone C
     * Create routes for the private subnet of Availability Zone A
     * Create routes for the private subnet of Availability Zone B
     * Create routes for the private subnet of Availability Zone C
 * Create infrastructure
     * Create RDS Security Group
     * Create DB subnet group
     * Create RDS instance 
     * Create EFS Security Group
     * Create EFS file system
     * Create Mount Targets
     * Create EC2 Security Group
     * Create Launch Configuration
        * OS update
        * Docker installation
        * Mysql-client installation
        * stress package installation
        * Mounting aws efs
        * Writing in fstab
        * Running wordpress docker
        * Wordpress website installation
        * Logs
     * Create Auto Scaling Group
     * Create Target Group
     * Create Load Balancer
     * Create CloudWatch Alarm to check CPU usage
     * Create Scale Up Policy
     * Create topic to send notification by mail
     * Create S3 public bucket
     * Create VPN Security Group
     * Create VPN EC2 instance
     * Create Security Group for intranet ec2 instance
     * Create Intranet EC2 instance
     * Create Network Access Control List (NACL) for public subnets in VPC
     * Create entries (rules) in network ACL with specified rule numbers
     * Associate subnets with network ACL
     * ...In progress...;-p

Do not forget to fill your iam 'access-key-id' and 'secret-access-key' in the 'UserData' of Launch Configuration (l.382).
Please feel free to message me if you have any questions.

Bye ;-)

### Technologies
***
A list of technologies used within the project :
* aws CloudFormation
* aws EC2
* aws RDS
* aws S3
* aws EFS
* aws Simple Notification Service
* aws VPC
* aws CloudWatch
* Docker
* Wordpress
* Strongswan
* Debian/Ubuntu OS
* Amazon Linux 2 OS
* AlmaLinux OS

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
* https://docs.aws.amazon.com/
* https://docs.docker.com/
* https://deliciousbrains.com/wp-offload-media/
* https://wp-cli.org/fr/
* 'aws and docker for dummies’ :-p 
