library(plyr)

if(!file.exists("./UCI HAR Dataset")){stop("UCI HAR Dataset does not exists")}
tx<-read.table("./UCI HAR Dataset/train/X_train.txt")
ts<-read.table("./UCI HAR Dataset/train/subject_train.txt")
ty<-read.table("./UCI HAR Dataset/train/y_train.txt")
t<-cbind(ts,ty,tx)

tex<-read.table("./UCI HAR Dataset/test/X_test.txt")
tes<-read.table("./UCI HAR Dataset/test/subject_test.txt")
tey<-read.table("./UCI HAR Dataset/test/y_test.txt")
te<-cbind(tes,tey,tex)

c<-rbind(t,te)

c2<-c[,c(1:8,43:48,83:88,123:128,163:168,203,204,216,217,229,230,242,243,255,256,268:273,347:352,
         426:431,505,506,518,519,531,532,544,545)]

f<-read.table("./UCI HAR Dataset/features.txt")
fs<-f[c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,
        424:429,503,504,516,517,529,530,542,543),]
fs2<-as.character(fs[,2])
cn<-c("subject","activity_label",fs2)
colnames(c2)<-cn
a<-factor(c2$activity_label,labels=c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying"))
c2$activity_label<-a

itd<-ddply(c2,.(subject,activity_label),colwise(mean))
