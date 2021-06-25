#! /bin/bash
MY_PUB_IP=`curl ifconfig.me`
sudo cat > /etc/ipsec.secrets << EOF
# ipsec.secrets - strongSwan IPsec secrets file - sfr ip 109.22.80.19
$MY_PUB_IP $1 : PSK "W+XhKhK89tHgLfuoa7L+gDyXA/2jDHW2"
EOF

sudo cat > /etc/ipsec.conf << EOF
config setup
        charondebug="all"
        uniqueids = yes
        strictcrlpolicy=no
        
conn lan-to-aws
        type=tunnel
        auto=start
        keyexchange=ikev2
        authby=secret
        left=%defaultroute
        leftid=$MY_PUB_IP
        leftsubnet=192.168.100.0/24
        right=$1
        rightsubnet=10.0.30.0/24
        ike=aes256-sha1-modp1024!
        esp=aes256-sha1!
        aggressive=no
        keyingtries=%forever
        ikelifetime=28800s
        lifetime=3600s
        dpddelay=30s
        dpdtimeout=120s
        dpdaction=restart
EOF

sudo ipsec restart