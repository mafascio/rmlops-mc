# Setup Devops Project

1. Login to Azure Devops 
2. Create a project from the devops portal (top right of the portal)
3. Create Service Identity:
        * Create Service Principal. Instructions [here](CreateServiceIdentity.md). 
4.  Create a variable group:
    1. In Azure Devops leftnav, navigate to `Pipeline` -> `Library`. Create a new `Variable group` by clicking `+ Variable`. Name it `MLOPSVG`
    2. Open the group and select `Allow access to all pipelines`
    3. Add the following  variables (You can click the `Lock` icon in the value to mark some of them `Secret`.
     1. AML_ACC_MODEL 
        "r_accident_mlops"
     2. AML_ATTRITION_MODEL "r_attrition_mlops"
     3. AML_CLUSTER "cpu"
     4. AML_RESOURCE_GROUP "your RG"
     5. AML_SUBSCRIPTION_ID "your Subscription Id"
     6. AML_WORKSPACE "youw AML WS"
     7. SERVICE_PRINCIPAL_ID "your SP Id"
     8. SERVICE_PRINCIPAL_PASSWORD "your SP secret"
     9. TENANT_ID "your Tenent Id"
<BR>`Save` the changes to the Variable group
    
