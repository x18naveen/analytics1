#Title Data structures in R

#Vectors----
cv = c('Dhiraj','a','Arun')
nv=c(12,45,26)
lv=c(T,F,T)
cv
lv
nv

(x=1:100000)
set.seed(100)      #helps generate same pattern in R before using rnorm
(x = trunc(rnorm(100000,mean=60,sd=15)))

(x1=sort(x))
x1

#Values between 60 and 70
x[x>=60 & x<=70]
#Count

length(x[x>=60 & x<=70])

x2=rnorm(1000,mean=10,sd=2)
plot(density(x2))
abline(v=10,h=.1)    #draw vertical and horizontal lines

x3=seq(1,100,by=2)
x3

mean(x)             
median(x)
(xt=table(x)) #Gives frequency

sort(xt,decreasing=T )[1:2] #sort decreasing and print the 1st two nos
summary(x)
quantile(x)
quantile(x,c(.1,.2,.3))
quantile(x,seq(0,1,.1))
seq(0,1,.01)

#box plot - 5 no summary

boxplot(x)

x3=rnorm(50,mean=20,sd=3)
stem(x3)
hist(x3,breaks=12,col=1:5)
hist(x3, freq=F)
lines(density(x3))



#standard normal - mean 0 and std deviation-1

x2=rnorm(1000,mean=10, sd=2)
plot(density(x2))
abline(v=10,h=.1)

#Sequence of nos

(x3=seq(1,100,by=2))
mean(x3)


#Matrix----

#2 dimensions #similar to vector : Character, logic, numeric
(m1=matrix(c(1:24),nrow=6))
m1[1];m1[10:14]  # index always counts down columnwise
(m2=matrix(c(1:24),nrow=6,byrow=T))
cbind(m1,m2)   #no of rows must be the same for both m1 and m2.
rbind(m1,m2)
m1
colSums(m1);rowSums(m1)

colMeans(m1); rowMeans(m1)



#Subset col/row, combination of R&C
m1
m1[1,];m1[,2]
m1[1:2,3]
m1[1:2,3:4];m1[1,2]
m1[c(1,4),c(2,3)]
m1[m1>10 & m1<15]
m1+m2
m1-m2
t(m1)

sweep(m1, MARGIN = 1, STATS = c(2,3,4,5,6,7), FUN="+" )      #rowise
sweep(m1, MARGIN = 2, STATS = c(2,3,4,5), FUN="*" ) #colwise



#Dataframe----
#every column can be of a different type
n=30
(rollno=paste('A',1:n,sep=''))
(names=paste('student',1:n,sep=''))
class(names)
set.seed(101)
(gender=sample(c('M','F'),size=n,replace=T,prob=c(.7,.3)))
table(gender)
?rnorm
set.seed(105)
(marks1=round(rnorm(n=n,mean=70,sd=7),2))
set.seed(105)
(marks2=round(rnorm(n=n,mean=65,sd=10),2))
set.seed(106)
(marks3 = sample(c('A','B','C','D'),size=n,replace=T,prob=c(.3,.2,.3,.2)))
table(marks3)

df=data.frame(rollno,names,gender,marks1,marks2,marks3,stringsAsFactors = F)
df
summary(df)
str(df)
df$gender=factor(df$gender)
(df$marks3=factor(df$marks3))
df$gender
df

#queries ??

#filter
df[1:5,1:2]
df[1:5,c('rollno','marks1')]
df[df$marks1>70 & gender=='M',c('rollno','marks1','gender')]
df$course = sample(c('MBA','BBA'),size = n, replace = T, prob = c(.6,.4))
head(df)
tail(df)
str(df)
df$marks3 = factor(df$marks3,levels = c('B','D,','C','A'))
df$course = factor(df$course)
str(df)
df
boxplot(marks2 ~ marks3, data=df)
boxplot(marks2 ~ course+gender, data=df)
boxplot(marks2 ~ course+gender+marks3, data=df)

aggregate(marks2~course+gender+marks3,data = df, FUN = mean)
install.packages("dplyr")
library(dplyr)

f(x,y)

count(df)

#group by course, mean of marks2

df %>% group_by(course,gender)%>% summarise(mean(marks2),mean(marks1))
df %>% group_by(course)%>%select(marks1)%>% top_n(2)
df %>% filter(gender=='F' & marks3=='A')%>%tally()
df %>% filter(gender=='F'  & marks3=='A')%>% summarise(n())
.rs.restartR()
df %>% sample_frac(.2)
df %>% sample_n(3)

#Factors----
