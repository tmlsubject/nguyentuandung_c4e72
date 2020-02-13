#View(data1)
######## Cau a ########
data1 = read.csv("Benh_tieu_duong.csv")
attach(data1)

#them gia tri khong vao nhung o khong co gia tri
data1$phuthuocinsulin[data1$phuthuocinsulin == ''] = 'khong'

#chuyen cot gioi tinh thanh chu thuong
data1$Gioitinh[data1$Gioitinh == "Nam"] = 'nam'
data1$Gioitinh[data1$Gioitinh == "Nu"] = 'nu'

#chi lay nam trong nam sinh
data1$Namsinh = as.character(data1$Namsinh)
for (variable in 1:140) {
  #chi lay nam trong nam sinh
  data1$Namsinh[variable] = gsub("\\d\\d/","",data1$Namsinh[variable])
}
data1$Namsinh = as.integer(data1$Namsinh)


######## Cau b ########
train_data = sample(1:nrow(data1), 0.5 * nrow(data1))
train_set = data1[train_data,]
test_set = data1[-train_data,]
library(tree)
tree1 <- tree(ketluan ~ Namsinh + Gioitinh + Cannang + Chieucao + BMI + HAnguongcao + HAnguongthap + glucosemaulucdoi + phuthuocinsulin , data=train_set)
plot(tree1)
text(tree1)
y_pred=predict(tree1, test_set)#xac dinh ket qua phan loai
gtri_max=function(arr){return(which(arr==max(arr)))}#dinh nghia ham tim gia tri max trong arr
chi_so=apply(y_pred,c(1),gtri_max)##tim vi tri co gia tri lon nhat tren cac dong
#gan nhan cho cac chi so
result = c('BT', 'DTD Typ1', 'DTD Typ2', 'Tien DTD')[chi_so]
i = 0
for (variable in 1:70) {
  if(result[variable] == test_set$ketluan[variable])
    i = i + 1
}
do_chinh_xac = i / 70 * 100
do_chinh_xac

