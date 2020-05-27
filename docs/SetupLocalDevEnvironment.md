# Setup  Local Dev Environment
 This can be your local machine or Datascience VM in Azure:

1. Fork the MLOps project: visit the MLOps [github project](https://github.com/rsethur/MLOps) and click `Fork` on top right.

    Now you can save your changes to your github.This step is optional but recommended. 

2. Clone the project to your local directory: Click on the "Clone" button in github and copy the https url (like https://github.com/rsethur/MLOps.git)

3. If you have [Git](https://git-scm.com/downloads) installed in your machine, go to command prompt to a project directory and execute
`git clone <URL>`

    Optionally you click the "Clone or Download" button in github to download zip file & extract it.
    
4. In your local machine if you do not have Anaconda or __Miniconda__, please [install](https://docs.conda.io/en/latest/miniconda.html). Alternatively __if you do not want to use your local machine__, please provision a Datascience VM - [Ubuntu](https://docs.microsoft.com/en-us/azure/machine-learning/data-science-virtual-machine/dsvm-ubuntu-intro) or [Windows](https://docs.microsoft.com/en-us/azure/machine-learning/data-science-virtual-machine/provision-vm) VM

5. Create conda environment: Via command prompt, navigate to project root folder and execute:
`conda env create -f "code/train/train_conda_env.yml"`

6. [Install](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) the Azure CLI

7. Install the Azure ML CLI extension by executing:
<BR>`az extension add -n azure-cli-ml`
<BR>Incase you already have it, you can upgrade it:
<BR>`az extension update -n azure-cli-ml`

8. Setup the environment variables to be used by python-dotenv
    1. Rename the .envtemplate to .env
    2. Fill in the values: BASE_NAME (if applicable), WORKSPACE_NAME, RESOURCE_GROUP, SUBSCRIPTION_ID, SP_APP_ID, SP_APP_SECRET, TENANT_ID

9. (Optional) Install [postman](https://www.getpostman.com/downloads/) tool. This will give an easy way to inspect the deployed ML service