#!/bin/bash
export DB_HOST=${DBserver001.Endpoint.Address}
export STACK_NAME=${AWS::StackName}
export EFS_IP=${MountTarget1.IpAddress}
echo "Stack name : "$STACK_NAME > /home/ec2-user/TEMOIN-001
echo "EFS ip : "$EFS_IP >> /home/ec2-user/TEMOIN-001
echo "Database host : "$DB_HOST >> /home/ec2-user/TEMOIN-001

# debug mode
set -x

echo "OS update : In progress..." >> /var/log/userdata.txt
yum update -y && echo "OS update : Completed." >> /var/log/userdata.txt

echo "Docker installation : In progress..." >> /var/log/userdata.txt
amazon-linux-extras install docker
yum install -y docker
service docker start && echo "Docker installation : Completed." >> /var/log/userdata.txt
usermod -a -G docker ec2-user

echo "Mysql-client installation : In progress..." >> /var/log/userdata.txt
yum install -y mysql && echo "Mysql-client installation : Completed." >> /var/log/userdata.txt

echo "Mounting aws efs : In progress..." >> /var/log/userdata.txt
mkdir /home/ec2-user/efs-mount-point
mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport $EFS_ID.efs.eu-west-3.amzonaws.com:/ /home/ec2-user/efs-mount-point
chmod -R 777 /home/ec2-user/efs-mount-point
cd /home/ec2-user/efs-mount-point
echo "test - `date`" > mount_log.txt && echo "Mounting aws efs : Completed." >> /var/log/userdata.txt

echo "Writing in fstab : In progress..." >> /var/log/userdata.txt
export EXIST_MOUNT=`grep -i "$EFS_ID" /etc/fstab`
if [[ -z "$EXIST_MOUNT" ]] ; then
    echo "$EFS_ID.efs.eu-west-3.amzonaws.com:/ /home/ec2-user/efs-mount-point nfs defaults,_netdev 0 0" >> /etc/fstab  
fi
echo "Writing in fstab : Completed." >> /var/log/userdata.txt

echo "Running wordpress docker : In progress..." >> /var/log/userdata.txt
docker run -d -p 80:80 --name=myWordpress -e WORDPRESS_DB_HOST=$DB_HOST:3306 -e WORDPRESS_DB_USER=theseus -e WORDPRESS_DB_PASSWORD=theseus1 -e WORDPRESS_DB_NAME=WordPress -v /home/ec2-user/efs-mount-point/:/var/www/html/ wordpress:latest

echo "wp-cli, website and S3 plugin installation in docker container : In progress..." >> /var/log/userdata.txt
docker exec -ti --tty=false myWordpress bash <<-EOF 
echo "wp-cli installation : In progress..." >> /var/log/wordpressDocker.txt
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
php wp-cli.phar --info
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp && echo "wp-cli installation : Completed." >> /var/log/wordpressDocker.txt
if [ -e /var/www/html/installOk.txt ]
then
    echo "Wordpress already installed" >> /var/log/wordpressDocker.txt
else
    echo "Wordpress installation : In progress..." >> /var/log/wordpressDocker.txt
    wp core install --url="website_ip" --title="SodbavekaWebsite" --admin_user=theseus --admin_password=theseus --admin_email=sodbaveka@gmail.com --allow-root
    wp plugin install amazon-s3-and-cloudfront --allow-root && wp plugin activate amazon-s3-and-cloudfront --allow-root
    cd /var/www/html
    sed -i "127idefine( 'AS3CF_SETTINGS', serialize( array('provider' => 'aws','access-key-id' => '*****','secret-access-key' => '*****',) ) );" wp-config.php
    chmod -R 777 /var/www/html/
    touch installOk.txt && echo "Wordpress installation : Completed." >> /var/log/wordpressDocker.txt
fi
EOF
echo "wp-cli, website and S3 plugin installation in docker container : Completed." >> /var/log/userdata.txt


