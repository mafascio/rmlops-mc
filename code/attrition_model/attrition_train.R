#' Copyright(c) Microsoft Corporation.
#' Licensed under the MIT license.

library(azuremlsdk)
library(optparse)
library(caret)
library(data.table)
#library(kernlab)

options <- list(
  make_option(c("-d", "--data_folder"), default='./code/attrition_model/IBM-Employee-Attrition.csv')
)


opt_parser <- OptionParser(option_list = options)
opt <- parse_args(opt_parser)
paste(opt$data_folder)


all_data <- fread(file.path(opt$data_folder),stringsAsFactors = TRUE)
# remove useless fields 
all_data = within(all_data, rm(EmployeeCount, Over18, StandardHours, EmployeeNumber))
# make sure attrition is a factor
#for (col in c('Attrition')) 
#  set(all_data, j=col, value=as.factor(all_data[[col]]))
all_data$Attrition = as.factor(all_data$Attrition)
summary(all_data)


in_train <- createDataPartition(y = all_data$Attrition, p = .8, list = FALSE)
train_data <- all_data[in_train, ]
test_data <- all_data[-in_train, ]

TrainingParameters <- trainControl(method = "repeatedcv", number = 10, repeats=3)
SVModel <- train(Attrition ~ ., data = train_data,
                 method = "svmPoly",
                 trControl= TrainingParameters,
                 tuneGrid = data.frame(degree = 1,
                                       scale = 1,
                                       C = 1),
                 preProcess = c("pca","scale","center"),
                 na.action = na.omit
)

SVModel




predictions <- predict(SVModel, test_data)
conf_matrix <- confusionMatrix(predictions, test_data$Attrition)
conf_matrix



current_run <- get_current_run()
log_metric_to_run('Accuracy', conf_matrix$overall["Accuracy"], current_run)



output_dir = "outputs"
if (!dir.exists(output_dir)){
  dir.create(output_dir)
}
#saveRDS(mod, file = "./outputs/model.rds")
saveRDS(SVModel, file = "./outputs/model.rds")
message("Model saved")






