#!/bin/bash

#1. Base 64 encode for csproot:csproot

csp_b64=$(perl -MMIME::Base64 -e "print encode_base64(\"csproot:csproot\")")

#2. Get vEPC API key

csp_API=$(curl -s -k -H "X-Nuage-Organization: csp" -H "Authorization: XREST $csp_b64" https://192.168.180.10:8443/nuage/api/v5_0/me | python -m json.tool | grep '"APIKey": ' | awk -F ": " '{print $2}' | awk -F '"' '{print $2}')

#3. Use API Key for admin:APIKey base64 to create auth token

csp_authtoken=$(perl -MMIME::Base64 -e "print encode_base64(\"csproot:$csp_API\")")

#4. Read the input from stat routes inputs file "subs_cr_inpv2.csv"

while read -r line; do
  domain=$(echo $line | awk -F , '{print $1}')
  zone=$(echo $line | awk -F , '{print $2}')
  subnet=$(echo $line | awk -F , '{print $3}')
  prefix=$(echo $line | awk -F , '{print $4}')
  mask=$(echo $line | awk -F , '{print $5}')
  gw=$(echo $line | awk -F , '{print $6}')
  ipv6=$(echo $line | awk -F , '{print $7}')
  ipv6Mask=$(echo $line | awk -F , '{print $8}')
  ipv6Gw=$(echo $line | awk -F , '{print $9}')

#5. Get the domain id for the current $domain variable

  domain_id=$(mysql -D vsddb -e "select id from DOMAIN where name=$domain;")
  domain_id=$(echo $domain_id | awk -F " " '{print $2}')

#6. Create zones in current $domain with other varibales from "subs_cr_inpv2.csv"

  curl -k --header "X-Nuage-Organization: csp" -H "Authorization: XREST $csp_authtoken" -H "Content-Type:application/json" \
   -X POST -d '{"name":'$zone',"description":'$zone'}' \
  https://192.168.180.10:8443/nuage/api/v5_0/domains/$domain_id/zones/?responseChoice=1

#7. Get the zone id for the current $domain variable

  zone_id=$(mysql -D vsddb -e "select id from ZONE where name=$zone;")
  zone_id=$(echo $zone_id | awk -F " " '{print $2}')

#8. Create subnets in current $domain with other varibales from "subs_cr_inpv2.csv"

  if [[ ! -z $ipv6 ]];
  
    then
   
    curl -k --header "X-Nuage-Organization: csp" -H "Authorization: XREST $csp_authtoken" -H "Content-Type:application/json" \
     -X POST -d '{"name":'$subnet',"description":'$subnet',"address":'$prefix',"netmask":'$mask',"gateway":'$gw',"IPType":1,"IPv6Address":'$ipv6',"IPv6Gateway":'$ipv6Gw'}' \
    https://192.168.180.10:8443/nuage/api/v5_0/zones/$zone_id/subnets/?responseChoice=1

    elif

    curl -k --header "X-Nuage-Organization: csp" -H "Authorization: XREST $csp_authtoken" -H "Content-Type:application/json" \
     -X POST -d '{"name":'$subnet',"description":'$subnet',"address":'$prefix',"netmask":'$mask',"gateway":'$gw'}' \
    https://192.168.180.10:8443/nuage/api/v5_0/zones/$zone_id/subnets/?responseChoice=1

  fi

done < Resv2.csv
