#K-means
coll=read.csv("C:\\Users\\Prashanthi\\Desktop\\Python\\sir_working\\Algorithms\\Kmeans Clustering\\College.csv")
names(coll)
head(coll)
nrow(coll)
ncol(coll)
dim(coll)#gives no. of rows and columns
str(coll)
summary(coll)
library(ggplot2)
ggplot(coll,aes(x=Room.Board,y=Grad.Rate))+geom_point(aes(color=Private))
ggplot(coll,aes(x=F.Undergrad,y=Grad.Rate))+geom_point(aes(color=Private))
ggplot(coll,aes(Outstate))+geom_histogram(aes(fill=Private),bins=30,size=4,alpha=0.7)
ggplot(coll,aes(Grad.Rate))+geom_histogram(aes(fill=Private),bins=30,size=4,alpha=0.7)
#In grad.rate there is a wrong entry of 118
subset(coll,coll$Grad.Rate>100)
#Replacing the Cazenovia College value to 100 as college grade should be with in or equal to 100
coll$Grad.Rate[coll$Grad.Rate==118]=100
ggplot(coll,aes(Grad.Rate))+geom_histogram(aes(fill=Private),bins=30,size=4,alpha=0.7)
#using cluster algorithm
coll2=coll[3:19]#droping columns
coll_cluster=kmeans(coll[3:19],2)#we can apply kmeans algorithm droping the textial columns 
coll_cluster
coll_cluster$size #gives the size
coll_cluster$cluster#gives the clusters
coll_cluster$centers#gives the centerised values
#TO visuvalize how the clusters are representing we need to conver the clusters in to dataframe and change the numerical values(1,2) as "Private and Non private"
coll2$cluster=coll_cluster$cluster
coll2$cluster[coll2$cluster==1]="Private"
coll2$cluster[coll2$cluster==2]="Non Private"
coll3=cbind(coll$Private,coll2$cluster)
ggplot(coll2,aes(x=Room.Board,y=Grad.Rate))+geom_point(aes(color=cluster))+theme_classic()



