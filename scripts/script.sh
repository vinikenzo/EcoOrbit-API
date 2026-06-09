#!/bin/bash

RG="rg-EcoOrbit"
LOCATION="brazilsouth"
ACR_NAME="acrecorbit$RANDOM"
PLAN_NAME="planACRWebApp"

#az group create \
#  --name $RG \
#  --location $LOCATION

# az acr create \
#  --resource-group $RG \
# --name $ACR_NAME \
#  --sku Basic \
#  --admin-enabled true

az appservice plan create \
  --name $PLAN_NAME \
  --resource-group $RG \
  --is-linux \
  --sku B1

az webapp create \
  --resource-group $RG \
  --plan $PLAN_NAME \
  --name ecoorbit-api-server \
  --deployment-container-image-name nginx:latest

az webapp create \
  --resource-group $RG \
  --plan $PLAN_NAME \
  --name ecoorbit-api-usuario \
  --deployment-container-image-name nginx:latest

az webapp create \
  --resource-group $RG \
  --plan $PLAN_NAME \
  --name ecoorbit-api-ia \
  --deployment-container-image-name nginx:latest

az webapp create \
  --resource-group $RG \
  --plan $PLAN_NAME \
  --name ecoorbit-api-predict \
  --deployment-container-image-name nginx:latest