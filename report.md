# Machine Learning - Report
##Description of my Code
###1. Clear Data
Kick out the columns in both training and testing sets where testing set has almost only NAs.
Also, forget about the first column that is only ids and shall not be included in my analysis.

###2. Create Sample within training set
Take 5000 random datasets from the training set and split them into a new testing set of 2000 and a new training set of 3000 observations. 

###3. Train your model
Train a model using the train function from the caret package. Include every column as predictor for the "classe" variable. I decided to take random forest as method because it was so much praised in the lectures ;)
Use the trControl command to make the function apply crossvalidation.

###4. Check the out of sample error
Use the predict function to predict the "classe" values of the new testing set and compare how often you predicted the right class. This is the out of sample error.

###5. Apply Model to the testing set
Use the predict function to predict the unknown "classe" values of the actual testing set.

##Outcome
###1. Out of sample error
This is the accuracy of my prediction on the new testing set.
Setting the seet to 200, I get an accuracy of roundabout 99%. 

###2. Predction of the classes in the testing set
I get the prediction: 
[1] B A B A A E D B A A B C B A E E A B B B
which is all right (accuracy 100%) if we believe in the Project Submission Exercise.
