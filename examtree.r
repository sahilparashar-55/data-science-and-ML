
dataset = read.csv('titanic_data.csv')
View(dataset)
dataset = dataset[1:3]
View(dataset)
dataset$Survived = factor(dataset$survived, levels = c(0, 1))


library(caTools)
set.seed(123)
split = sample.split(dataset$Survived, SplitRatio = 0.75)
train = subset(dataset, split == TRUE)
test = subset(dataset, split == FALSE)
library(rpart)

library(party)

tree<-ctree(Survived~.,data=train)


tree<-ctree(Survived~.,data=train, controls=ctree_control
            (mincriterion=0.99, minsplit=500))

tree
plot(tree)

predict(tree,test,type="prob")


predict(tree,test)

library(rpart)

treel<-rpart(Survived~., train)


library(rpart.plot)


rpart.plot(treel)

predict(treel,test)

table<-table(predict(tree),train$diagnosis)
table
1-sum(diag(table)/sum(table))

predtest<-predict(tree,test)
table<-table(predtest,test$diagnosis)
table
1-sum(diag(table)/sum(table))