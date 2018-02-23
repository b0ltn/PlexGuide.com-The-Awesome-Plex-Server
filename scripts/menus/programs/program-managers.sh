#!/bin/bash

## point to variable file for ipv4 and domain.com
source <(grep '^ .*='  /opt/appdata/plexguide/var.sh)
echo $ipv4
echo $domain


clear

while [ 1 ]
do
CHOICE=$(
whiptail --title "Program Categories" --menu "Make your choice" 14 27 7 \
    "1)" "Couchpotato"   \
    "2)" "Lidarr"   \
    "3)" "Medusa"   \
    "4)" "Mylar"    \
    "5)" "Radarr"   \
    "6)" "Sickrage"   \
    "7)" "Sonarr"   \
    "8)" "Exit"  3>&2 2>&1 1>&3
)

result=$(whoami)
case $CHOICE in
    "1)")
    ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags couchpotato
    echo "Couchpotato: http://$ipv4:5050"
    echo "For Subdomain https://couchpotato.$domain"
    echo "For Domain http://$domain:5050"
    echo ""
    read -n 1 -s -r -p "Press any key to continue "
     ;;

    "2)")
    ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags lidarr
    echo "Lidarr: http://$ipv4:8686"
    echo "For Subdomain https://lidarr.$domain"
    echo "For Domain http://$domain:8686"
    echo ""
    read -n 1 -s -r -p "Press any key to continue "
     ;;

    "3)")
    ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags medusa
    echo "MEDUSA: http://$ipv4:8081"
    echo "For Subdomain https://medusa.$domain"
    echo "For Domain http://$domain:8081"
    echo ""
    read -n 1 -s -r -p "Press any key to continue "
    ;;

    "4)")
    ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags mylar
    echo "Mylar: http://$ipv4:8090"
    echo "For Subdomain https://mylar.$domain"
    echo "For Domain http://$domain:8090"
    echo ""
    read -n 1 -s -r -p "Press any key to continue "
     ;;

    "5)")
    ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags radarr
    echo "Radarr: http://$ipv4:7878"
    echo "For Subdomain https://radarr.$domain"
    echo "For Domain http://$domain:7878"
    echo ""
    read -n 1 -s -r -p "Press any key to continue "
    ;;

    "6)")
    ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags sickrage
    echo "Radarr: http://$ipv4:8082"
    echo "For Subdomain https://sickrage.$domain"
    echo "For Domain http://$domain:8082"
    echo ""
    read -n 1 -s -r -p "Press any key to continue "
     ;;

  "7)")
   ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags sonarr
   echo "Sonarr: http://$ipv4:8989"
   echo "For Subdomain https://sonarr.$domain"
   echo "For Domain http://$domain:8989"
   echo ""
   read -n 1 -s -r -p "Press any key to continue "
   ;;

     "8)")
      clear
      exit 0
      ;;
esac
done
exit
