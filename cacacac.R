library(ISLR)
sum(is.na(Hitters$Salary))
dim(Hitters)
Hitters=na.omit(Hitters)
dim(Hitters)

install.packages("glmnet")
install.packages("Matrix")
library(glmnet)
x=model.matrix(Salary~.,Hitters)[,-1]
y=Hitters$Salary
grid=10^seq(10,-2,length=100)
lasso.mod=glmnet(x,y,alpha = 1,lambda=grid)
#lambda la bo he so
lasso.mod$lambda[50]
#du doan he so cua lasso vs gt lambda khg co grid
predict(lasso.mod,s=50,type="coefficients")[1:20,]
#chia du lieu thanh train va test
train=sample(1:nrow(x),nrow(x)/2)
test=(-train)
y.test=y[test]
#dung cross de tim labda min
set.seed(1)
cv.out=cv.glmnet(x[train,],y[train],alpha=1)
plot(cv.out)
bestlam=cv.out$lambda.min
bestlam
#dung kq lamb de tinh y prediction

lasso.pred=predict(lasso.mod,s=bestlam,newx = x[test,])
mse_lasso=mean((lasso.pred-y.test)^2)
mse_lasso
#tim bo du lieu
out=glmnet(x,y,alpha=1)
lasso.coef=predict(out,type="coefficients",s=bestlam)[1:20,]
lasso.coef
lasso.coef[lasso.coef!=0]
#mo hinh ridge
ridge.mod=glmnet(x[train,],y[train],alpha = 0,lambda = grid)
cv.out2=cv.glmnet(x[train,],y[train],alpha=1)
bestlam2=cv.out2$lambda.min
bestlam2
lasso.pred2=predict(ridge.mod,s=bestlam2,newx = x[test,])
mse_lasso2=mean((lasso.pred2-y.test)^2)
mse_lasso2
#cay phan loai va hoi quy
attach(iris)
intrain=sample(1:nrow(iris),0.7*nrow(iris))
train_set=iris[intrain,]
test_set=iris[-intrain,]
install.packages("rpart")
library(rpart)
tree1<-rpart(Species~Sepal.Width+Petal.Width,data=train_set)
tree1
plot(tree1)
text(tree1)
tree1.pred=predict(tree1,test_set)
#moi 1 dong , xac suat moi mau do thuoc vao tung lop
tail(tree1.pred)
#tim gtln
gtri_max=function(arr){return((which(arr==max(arr))))}
chi_so=apply(tree1.pred,c(1),gtri_max)
chi_so
chi_so2=apply(tree1.pred,c(2),gtri_max)
chi_so2
prediction=c('setosa','versicolor','virginica')[chi_so]
prediction
getwd()
``