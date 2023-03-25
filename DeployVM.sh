#!bin/bash

PublicKey=$(cat ~/.ssh/id_rsa.pub)
templatePath=~/Documents/GiftigDos1/GiftigDos1/ArmTemplate.json
RG=blobbenbob
vmName=BastionHost
deployName=BastionDeployScript
destinationPortRange=80

az deployment group create  --name $deployName --resource-group $RG --template-file $templatePath --parameters vmName=$vmName adminPublicKey="$PublicKey"