#!bin/bash

PublicKey=$(cat ~/.ssh/id_rsa.pub)
templatePath=~/Documents/GiftigDos1/GiftigDos1/ArmTemplate.json
RG=blobbenbob
vmName=("BastionHost" "WebServer" "AppServer")
deployName=("BastionDeployScript" "WebServerDeployScript" "AppServerDeployScript")
destinationPortRange=("22" "80" "5000")
privateIPadress=("10.0.0.4" "10.0.0.8" "10.0.0.9")
assignPublicIP=("true" "true" "false")

for i in 0 1 2
do
    az deployment group create  --name ${deployName[i]} --resource-group $RG --template-file $templatePath --parameters vmName=${vmName[i]} destinationPortRange=${destinationPortRange[i]} privateIPadress=${privateIPadress[i]} adminPublicKey="$PublicKey" assignPublicIP=${assignPublicIP[i]}
done