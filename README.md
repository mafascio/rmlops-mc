# MLOps Recipes - mc

Basic RMLOps - Basic E2E CI/CD pipelines for Machine Learning with R


__Technologies__: Azure Machine Learning & Azure Devops

__Get Started__
[Setup the environment](docs/Setup.md)
[Run an end to end MLOps pipeline](docs/StartBaseScenario.md)

_Note: Automated builds based on code/asset changes have been disabled by setting `triggers: none` in the pipelines. The reason is to avoid triggering accidental builds during a preliminary learning phase._

<BR><br>__Notes:__
1. Directory Structure
    1. `Docker` directory contains the pipeline to create and register a Docker image with all pre-installed packages
    2. `MLOPS` contains the devops individual pipelines for each of the two models, accident and attrition models
    3. `code` directory has the source code for the individual models (training, scoring etc) as well as the data (csv files)
   