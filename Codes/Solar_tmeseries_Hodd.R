# data<-read.table(file="my_data.csv",sep=",",row.names=1,header=TRUE)
# head(data)
##########################
Sl_pw <- read.csv("../pvinhokkaidodatadistribution/Solar_PV_PW_2yrs.csv", header=T)
Sl_pw.ts1<- ts(Sl_pw[, c("S1")])
Sl_pw.ts2<- ts(Sl_pw[, c("S2")])

# plot(Sl_pw)
plot(Sl_pw.ts1)
plot(Sl_pw.ts2)

plot(stl(Sl_pw.ts1, "periodic"))
plot(stl(Sl_pw.ts2, "periodic"))

# find missing values Nan
sum(is.na(Sl_pw.ts1))
sum(is.na(Sl_pw.ts2))

# list rows of data that have missing values
Sl_pw[!complete.cases(Sl_pw),]
# it seems there is a successive series of missing values 
# from 00:00AM to 12PM 3.14.206 so that the mean is not mutation 
# is not helpful, just exclude these missing values from training data

#Excluding Missing Values from Analyses
mean(Sl_pw.ts1) 
mean(Sl_pw.ts1, na.rm=TRUE) 

# create new dataset without missing data
newdata <- na.omit(mydata) 

#####################################
#### excluding the missing data #####

Sl_pw <- read.csv("../pvinhokkaidodatadistribution/Solar_PV_PW_2yrs.csv", header=T)
Sl_pw<-na.omit(Sl_pw) 
Sl_pw.ts1<- ts(Sl_pw[, c("S1")])
Sl_pw.ts2<- ts(Sl_pw[, c("S2")])

# Check whether the missing values Nan are excluded or not?
sum(is.na(Sl_pw.ts1))
sum(is.na(Sl_pw.ts2))

# plot(Sl_pw)
plot(Sl_pw.ts1)
plot(Sl_pw.ts2)

plot(stl(Sl_pw.ts1, "periodic"))
plot(stl(Sl_pw.ts2, "periodic"))


