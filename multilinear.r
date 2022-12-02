#multiple linear regression
# importing the dataset
dataset=read.csv("50_Startups.csv")
str(dataset)
View(dataset)
# checking for null values
sum(is.na(dataset))
#handling categorical data
dataset$State=factor(dataset$State,levels=c('New York','Florida','California'),
                     labels=c(1,2,3))
View(dataset)
library(caTools)

#splitting the dataset
split=sample.split(dataset$Profit,SplitRatio=0.8)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

#fitting multiple linear regression model
regressor=lm(formula = Profit ~ R.D.Spend+Administration+Marketing.Spend,
             data=training_set)
y_pred=predict(regressor,newdata=test_set)
y_pred

#prediction
df <- data.frame(R.D.Spend = 165349.2,Administration=136897.80,Marketing.Spend= 471784.1)
result <- predict(regressor,df)
print(result)

library(ggplot2)
ggplot(training_set, aes(Administration, Profit)) +
  geom_smooth(method="lm") +
  geom_point(size=3) +
  theme_bw() +
  xlab("Administration") +
  ylab("Profit") +
  ggtitle("Administration vs Profit")