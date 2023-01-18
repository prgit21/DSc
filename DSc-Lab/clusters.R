install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggfortify")
library("ggplot2")
library("dplyr")
library("ggfortify")
summary(iris)
head(iris)
data <- select(iris, c(1:4))

wss <- (nrow(data)-1)*sum(apply(data,2,var))
for (i in 2:15)
{
  wss[i] <- sum(kmeans(data, centers=i)$withinss)
}
plot(1:15, wss, type="b", xlab="Number of Clusters",ylab="Within groups sum of squares")

kmean <- kmeans(data, 2)
kmean$centers
autoplot(kmean, data, frame = TRUE)
kmean <- kmeans(data, 3)
kmean$centers
