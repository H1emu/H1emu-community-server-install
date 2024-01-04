#!/bin/bash

# Root permission check
if (( $EUID == 1 )); then
echo "Please use root user or sudo ./communityinstall.sh under your non-root account"
exit
else

# Settings
hash -r
systemctl stop mongod
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.conf.lo.disable_ipv6=1
clear
echo "Welcome to the installation script for h1emu-server"
echo "Continue at your own risk or use ctl-c to cancel the installation"
echo ""
echo "You can request your WORLD_ID on the discord. If you do not know what WORLD_ID is cancel the installation with ctl-c"
echo -n "please enter your WORLD_ID : "
read ID

# Installing Dependencies
echo "Running H1emu.com Community Server installer"
sleep 2
apt update && apt upgrade -y
apt install nodejs npm git net-tools software-properties-common nano node-typescript -y
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 160D26BB1785BA38
add-apt-repository 'deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/7.0 multiverse' -y
apt install mongodb-org -y
clear

# Installing pm2-Dependencies
echo "Installing MongoDB Web GUI"
sleep 2
systemctl start mongod
systemctl enable mongod
npm i pm2 -g
pm2 kill
pm2 install pm2-logrotate
npm i -g mongo-gui@0.0.18
pm2 start mongo-gui
npm cache clean -f
npm install -g n
n stable
hash -r
clear

# Installing h1z1-server
echo "Downloading and building h1z1-server"
sleep 2
git clone https://github.com/H1emu/h1z1-server
cd h1z1-server
npm install
export DEBUG="ZoneServer"
export CLIENT_SIXTEEN="true"
# H1emu LOGINSERVER IS REQUIRED FOR COMMUNITY SERVERS CONTACT @ADMIN & change your WORLD_ID={Provided by h1emu admin}
export WORLD_ID="$ID"
export MONGO_URL="mongodb://localhost:27017/"
pm2 start docker/2016/zoneServer.js --watch
pm2 startup
clear


# Creating start script
echo "export WORLD_ID="$ID"" > start.sh
echo '# Settings' >> start.sh
echo 'sysctl -w net.ipv6.conf.all.disable_ipv6=1' >> start.sh
echo 'sysctl -w net.ipv6.conf.default.disable_ipv6=1' >> start.sh
echo 'sysctl -w net.ipv6.conf.lo.disable_ipv6=1' >> start.sh
echo 'echo "stopping old session"' >> start.sh
echo 'sleep 2' >> start.sh
echo 'pm2 kill' >> start.sh
echo 'systemctl stop mongod' >> start.sh
echo 'clear' >> start.sh
echo '' >> start.sh
echo '# Starting server' >> start.sh
echo 'echo "Starting server"' >> start.sh
echo 'sleep 2' >> start.sh
echo 'systemctl start mongod' >> start.sh
echo 'export DEBUG="ZoneServer"' >> start.sh
echo 'export CLIENT_SIXTEEN="true"' >> start.sh
echo '#remove LOGINSERVER if you want to use h1emu community list' >> start.sh
echo 'export MONGO_URL="mongodb://localhost:27017/"' >> start.sh
echo 'pm2 start mongo-gui' >> start.sh
echo 'pm2 start docker/2016/zoneServer.js --watch' >> start.sh
echo 'export DEBUG="*"' >> start.sh
echo 'pm2 startup' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "****************██╗░░██╗░░███╗░░███████╗███╗░░░███╗██╗░░░██╗**********************************" ' >> start.sh
echo 'echo "****************██║░░██║░████║░░██╔════╝████╗░████║██║░░░██║**********************************" ' >> start.sh
echo 'echo "****************███████║██╔██║░░█████╗░░██╔████╔██║██║░░░██║**********************************" ' >> start.sh
echo 'echo "****************██╔══██║╚═╝██║░░██╔══╝░░██║╚██╔╝██║██║░░░██║**********************************" ' >> start.sh
echo 'echo "****************██║░░██║███████╗███████╗██║░╚═╝░██║╚██████╔╝**********************************" ' >> start.sh
echo 'echo "****************╚═╝░░╚═╝╚══════╝╚══════╝╚═╝░░░░░╚═╝░╚═════╝░**********************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "****************Access your MongoDB with http://SERVERIP:4321/ *******************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "****************Use (pm2 log) to monitor******************************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "****************Use (pm2 kill) to stop server*************************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "****************Use (./start.sh) to start server**********************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "****************Your H1emu Server Should now be running***************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
echo 'echo "**********************************************************************************************" ' >> start.sh
chmod +x start.sh

echo "**********************************************************************************************" 
echo "**********************************************************************************************" 
echo "**********************************************************************************************" 
echo "**********************************************************************************************" 
echo "**********************************************************************************************" 
echo "**********************************************************************************************" 
echo "**********************************************************************************************" 
echo "**********************************************************************************************" 
echo "****************██╗░░██╗░░███╗░░███████╗███╗░░░███╗██╗░░░██╗**********************************" 
echo "****************██║░░██║░████║░░██╔════╝████╗░████║██║░░░██║**********************************" 
echo "****************███████║██╔██║░░█████╗░░██╔████╔██║██║░░░██║**********************************" 
echo "****************██╔══██║╚═╝██║░░██╔══╝░░██║╚██╔╝██║██║░░░██║**********************************" 
echo "****************██║░░██║███████╗███████╗██║░╚═╝░██║╚██████╔╝**********************************" 
echo "****************╚═╝░░╚═╝╚══════╝╚══════╝╚═╝░░░░░╚═╝░╚═════╝░**********************************" 
echo "**********************************************************************************************" 
echo "**********************************************************************************************" 
echo "**********************************************************************************************" 
echo "****************Access your MongoDB with http://SERVERIP:4321/ *******************************" 
echo "**********************************************************************************************" 
echo "****************Use (pm2 log) to monitor******************************************************" 
echo "**********************************************************************************************" 
echo "****************Use (pm2 kill) to stop server*************************************************" 
echo "**********************************************************************************************" 
echo "****************Use (./start.sh) to start server**********************************************" 
echo "**********************************************************************************************" 
echo "****************Your H1emu Server Should now be running***************************************" 
echo "**********************************************************************************************" 
echo "**********************************************************************************************" 
echo "**********************************************************************************************" 
fi
