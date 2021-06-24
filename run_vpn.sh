#! /bin/bash
sudo cat > /etc/ipsec.secrets << EOF
# ipsec.secrets - strongSwan IPsec secrets file - sfr ip 109.22.80.19
109.22.80.19 $1 : PSK "W+XhKhK89tHgLfuoa7L+gDyXA/2jDHW2"
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
        leftid=109.22.80.19
        leftsubnet=0.0.0.0/0
        right=$1
        rightsubnet=0.0.0.0/0
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