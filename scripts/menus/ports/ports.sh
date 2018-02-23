 #!/bin/bash
clear

################# Virtual Machine Check
if (whiptail --title "Virutal Machine Question" --yesno "Do You Want To Keep Your Ports Open?" 8 56) then

    whiptail --title "Virutal Machine - Yes" --msgbox "Your Ports are now/still Open.  If they were closed, you need to redeploy each container!" 9 66
    rm -r /opt/appdata/plexguide/ports-no 1>/dev/null 2>&1
    ansible-playbook /opt/plexguide/ansible/config.yml --tags ports
    read -n 1 -s -r -p "Press any key to continue "
    exit
else
    whiptail --title "Virutal Machine - No" --msgbox "Your Ports are now/still Closed. If they were open, you need to redeploy each container!" 9 66
    touch /opt/appdata/plexguide/ports-no 1>/dev/null 2>&1
    ansible-playbook /opt/plexguide/ansible/config.yml --tags ports
    read -n 1 -s -r -p "Press any key to continue "
fi

exit
