
library(MASS)
View(Boston)
library(randomForest)
attach(Boston)
#
train=sample(1:nrow(Boston),nrow(Boston)/2)
y=Boston[-train,"medv"]
bag.boston=randomForest(medv~.,data=Boston,subset = train,mtry=13,importance=TRUE)#danh gia do quan trong importance
#du doan cac gia tri
yhat.bag=predict(bag.boston,newdata=Boston[-train,])
mse1=mean((yhat.bag-y)^2)
mse1
plot(yhat.bag,y)#neu cac diem tap trung tren duong thang thi mse =0
abline(0,1)
#tinh gia tri do quan trong cua bien lib(Ivalue)
importance(bag.boston)
#bieu dien do quan trong cua bien tren bieu do
varImpPlot(bag.boston)
#vong lap
for(variable in 1:12)
{
  bag.boston=randomForest(medv~.,data=Boston,subset = train, importance=TRUE)#danh gia do quan trong importance
  #du doan cac gia tri
  yhat.bag=predict(bag.boston,newdata=Boston[-train,])
  mse1=mean((yhat.bag-y)^2)
  print(mse1) 
}
#gia nha va so phong
liner_moudel=lm(medv~rm)
summary(liner_moudel)
liner_moudel$coefficients
plot(medv~rm)
abline(liner_moudel,col="blue")
#gia nha voi 3 thuoc tinh khac
liner3=lm(medv~nox+rad+rm)
summary(liner3)

plot(medv~nox+rad+rm)

#gia nha vs ham bac 3 cua kc
#danh gia sai so
train=sample(1:nrow(Boston),0.8*nrow(Boston))
train_data=Boston[train,]
test_data=Boston[-train,]
model1=lm(medv~rm,data = train_data)
summary(model1)
plot(medv~rm,data=train_data)
y=test_data$medv
Xtest=data.frame(test_data[,-14])
y_hat=predict(model1,Xtest)
#tinh sai so
mse=mean((y-y_hat)^2)
View(mse)
#3 bien
model3=lm(medv~rm+tax+age+rad,data=train_data)
x_3=test_data$medv
x_3=data.frame(test_data[,-14])
y_hat_3=predict(model3,Xtest)
mse_3=mean((y_hat-y_hat_3)^2)
mse_3
