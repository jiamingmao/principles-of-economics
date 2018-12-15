setwd("E:/Rstudy/Rcode") 
getwd() #查看工作目录
rm(list=ls()) #清楚缓存的数据
data=read.csv('auto.csv')  #数据要位于工作目录下
income=read.csv("E:/Rstudy/income.csv")

#作图
x=income$score
y=income$income
plot(x,type="p",main="得分散点图")
lines(x)
plot(x,y,xlab="分数",ylab="收入",type = "p",col="red",
     xlim=c(50,100),ylim=c(0,200),main = "the ralationship between x and y")
abline(lm(y~x),col="green")
a=1:100
b=2*a-2
plot(a,b,type="l",xlim=c(1,100),ylim = c(0,200),col="red")
b=1.5*a-1
lines(a,b,col="blue")
legend("topleft",legend=c('b=2a-2','b=1.5a-1'),lty=1,col=c('red','blue'))

