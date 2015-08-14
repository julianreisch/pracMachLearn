#Load the caret package
library(caret)

#Set the seed
set.seed(200)

#Clear Data, i.e. delete columns that have almost all values NA
clearedTraining<-training[, colSums(is.na(testing)) <= nrow(testing)-10]
clearedTesting<-testing[, colSums(is.na(testing)) <= nrow(testing)-10]

#Forget about ids
clearedTraining<-clearedTraining[,-1]
clearedTesting<-clearedTesting[,-1]

#Create Sample to train with
samp<-sort(sample(1:nrow(clearedTraining),size=5000,replace=F))
insamp<-sort(sample(samp,size=3000,replace=F))
insampleClearedTraining<-clearedTraining[insamp,]

#Create Sample to test the training set in order to get an estimate of the out of sample error
outsamp<-sort(samp[is.na(pmatch(samp,insamp))])
outsampleClearedTraining<-clearedTraining[outsamp,]

#train the model
modelFit<-train(classe~.,data=insampleClearedTraining,method="rf",trControl = trainControl(method = "cv"),model=FALSE)

#predict values of new testing set in order to check the estimated out of sample error
predInSamp<-predict(modelFit,outsampleClearedTraining)
summary(predInSamp==outsampleClearedTraining$classe)

#predict test values classe
predict(modelFit,clearedTesting[,-ncol(clearedTesting)])
