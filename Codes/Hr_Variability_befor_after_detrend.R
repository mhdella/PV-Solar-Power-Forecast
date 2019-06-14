Sl_pw <- read.csv("../pvinhokkaidodatadistribution/Solar_PV_PW_2yrs.csv", header=T)
Sl_pw<-na.omit(Sl_pw) 
##### Normalization
Sl_pw$S1=round(Sl_pw$S1/max(Sl_pw$S1), digits=2)
Sl_pw$S2=round(Sl_pw$S2/max(Sl_pw$S2), digits=2)

dftime<-format(strptime(Sl_pw$TIME,"%H:%M"),'%H:%M')
Sl_pw$TIME<-dftime

# hr="06:00"
hr="07:00"
# hr="10:00"
# hr="11:00"
# hr="11:30"
# hr="12:00"
# hr="14:00"
# hr="17:00"

df_h <- Sl_pw[grep(hr, Sl_pw$TIME), ]

################
## Runmax to find the max value of the PV vlues every week'
# install.packages('caTools')
library(caTools)

dmax <- runmax(df_h$S1,7) 
plot(runmax(df_h$S1,7), col="red", lwd = 2)

df_h_orig<-df_h

df_h$S1=runmax(df_h$S1,14)
df_h$S2=runmax(df_h$S2,14)
###############

Sh_pw.ts1<- ts(df_h[, c("S1")])
Sh_pw.ts2<- ts(df_h[, c("S2")])

plot(Sh_pw.ts1)
plot(Sh_pw.ts2)

######## Low-Pass Filter ##########
length(Sh_pw.ts1)
y=Sh_pw.ts1
# y=Sh_pw.ts2
x=1:length(y)
length(x)

lowpass.spline <- smooth.spline(x,y, spar = 0.6) ## Control spar for amount of smoothing

yp<-predict(lowpass.spline, x)
yp=data.frame(yp)
yp[yp<0]<- 0
yp$x=df_h_orig$Date
df_h_orig$Date <- as.Date(df_h_orig$DATE, '%m/%d/%Y')

############ X-axis of time series with date instead numerical series
library(ggplot2)
library(lubridate)
####Plots
ggplot(df_h_orig, aes(Date, S1)) + geom_line(color='green') +
geom_line(aes(y=yp$y, col=yp$x), color='red', lwd = 1)+
  labs(title="Time Series of PV Solar Power",
       subtitle="PW-S1",
       y="Solar Power (MW)",
       color=NULL)

################ Detrending the hourly time-series ################
######### dividion by clear sky
df_h_det=df_h_orig
df_h_det$S1<-df_h_orig$S1/yp$y

df_h_det$S1[df_h_det$S1>1]<- 1

length(df_h_det$S1)
length(yp$y)
y=df_h_det$S1
x=1:length(y)
length(x)

lowpass.spline <- smooth.spline(x,y, spar = 0.6) ## Control spar for amount of smoothing

ypd<-predict(lowpass.spline, x)
ypd=data.frame(ypd)
ypd[ypd<0]<- 0
ypd[ypd>1]<- 1
ypd$x=df_h_orig$Date
df_h_det$Date <- as.Date(df_h_det$DATE, '%m/%d/%Y')

####Plots
ggplot(df_h_det, aes(Date, S1)) + geom_line(color='green') +
  geom_line(aes(y=ypd$y, col=ypd$x), color='red', lwd = 1)+
  labs(title="Time Series of Detrended PV Solar Power",
       subtitle="PW-S1, detrernding with division by a clear sky model",
       caption="",
       y="Solar Power (MW)",
       color=NULL)

####### substracing clear sky 
df_h_det=df_h_orig
df_h_det$S1<-yp$y-df_h_orig$S1
length(df_h_det$S1)
length(yp$y)
y=df_h_det$S1
x=1:length(y)
length(x)

lowpass.spline <- smooth.spline(x,y, spar = 0.6) ## Control spar for amount of smoothing

yps<-predict(lowpass.spline, x)
yps=data.frame(yps)
yps[yps<0]<- 0
yps$x=df_h_orig$Date
df_h_det$Date <- as.Date(df_h_det$DATE, '%m/%d/%Y')

####Plots
ggplot(df_h_det, aes(Date, S1)) + geom_line(color='green') +
  geom_line(aes(y=yps$y, col=yps$x), color='red', lwd = 1)+
  labs(title="Time Series of Detrended PV Solar Power",
       subtitle="PW-S1, detrernding with substracing from Clear sky model",
       caption="",
       y="Solar Power (MW)",
       color=NULL)
 ############ Boxplots of detrending Pw by division & substracing ###############
library(reshape2)
de_div=df_h_orig$S1/yp$y
de_div[de_div>1]<- 1
de_sub=yp$y-df_h_orig$S1
de_sub[de_sub>1]<-1
R=1:length(df_h_orig$S1)
PV_dat<- data.frame(R, df_h_orig$S1, de_div, de_sub)
names(PV_dat) <- c("R", "P_orig", "P_det_div", "P_det_sub")
yy <- melt(PV_dat, id.vars = "R")

ggplot(yy, aes(x = variable, y = value)) + 
  geom_boxplot()

boxplot(value~variable, data = yy)

summary(PV_dat)

sapply(PV_dat, sd, na.rm = TRUE)
