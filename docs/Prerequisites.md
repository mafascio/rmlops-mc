# Prerequisites
1. Have/Create an Azure Machine Learning workspace
2. Check if ACI(Azure Container Instance) service is registered in your subscription: Try executing the command from the Cloud Shell in the portal. Instructions [here](https://docs.microsoft.com/en-us/azure/cloud-shell/quickstart).
    If you dont have access, ask your __admin__.

    `az provider show -n Microsoft.ContainerInstance -o table`

    if not registered, run the below command (you need to be the subscription owner in order to execute this command successfully)

    `az provider register -n Microsoft.ContainerInstance`
    
    If you dont have access, ask your __admin__.

3. Have/Create an Azure DevOps account, [create](https://dev.azure.com)



