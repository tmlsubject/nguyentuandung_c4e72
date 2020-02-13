dotuoi = c (46,20,52,30,57,25,28,36,22,43,57,33,22,63,40,48,28,49)
bmi = c(25.4,20.6,26.2,22.6,25.1,23.1,22.7,24.9,79.8,25.3,23.2,21.8,20.9,26.7,26.4,21.2,21.2,22.8)
chol = c(3.5,1.9,4.0,2.6,4.5,3.0,3.9,3.8,2.1,3.8,4.1,3.0,2.5,4.6,3.2,4.2,2.3,4.0)
td=data.frame(dotuoi,bmi,chol)
liner_model=lm(chol~dotuoi)
summary(liner_model)
plot(chol~dotuoi)
abline(liner_model,col="blue",lwd=0.5)
liner_model$coefficients
pairs(td)

#mlh giua chol vs dotuoi
mul_ln=lm(chol~dotuoi+bmi)
summary(mul_ln)
mul_ln1=lm(chol~.,data=td)
mul_ln$coefficients
mul_ln1$coefficients

#mlh theo da thuc bac 2
poly_re=lm(chol~poly(dotuoi,2))
poly_re$coefficients

#chol vs logarit do tuoi va bmi
loga_re=lm(chol~log(dotuoi)+bmi)
loga_re$coefficients
summary(loga_re)
