install.packages("cluster")
library(cluster)
lib
??cluster
library(ggplot2)
install.packages("ggplot2")
qplot(Petal.Length,Petal.Width,data=iris,
      col=Species)
View(iris)
iris_1 = iris[, -5]
set.seed(240)
kmeans.re = kmeans(iris_1, centers = 3, nstart = 20)
?kmeans
kmeans.re$cluster
cm = table(iris$Species, kmeans.re$cluster)

cm
plot(iris_1[c("Sepal.Length", "Sepal.Width")], col = kmeans.re$cluster, main = "k-means width 3 clusters")
kmeans.re
kmeans.re$centers[, c("Sepal.Length", "Sepal.Width")]
points(kmeans.re$centers[, c("Sepal.Length", "Sepal.Width")], col = 1:3, pch = 6, cex = 1)
y_kmeans = kmeans.re$cluster
clusplot(iris_1[, c("Sepal.Length", "Sepal.Width")], y_kmeans, lines=0, shade = TRUE, color = TRUE, labels=2,
         plotchar=FALSE, span=TRUE, main = paste("Cluster iris"), xlab = "Sepal.Length", ylab = "Sepal.Width")
??svm

