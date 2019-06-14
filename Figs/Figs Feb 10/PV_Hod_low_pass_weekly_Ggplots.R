Sl_pw <- read.csv("../pvinhokkaidodatadistribution/Solar_PV_PW_2yrs.csv", header=T)
Sl_pw<-na.omit(Sl_pw) 
##### Normalization
# Sl_pw$S1=round(Sl_pw$S1/max(Sl_pw$S1), digits=2) 
# Sl_pw$S2=round(Sl_pw$S2/max(Sl_pw$S2), digits=2)

dftime<-format(strptime(Sl_pw$TIME,"%H:%M"),'%H:%M')
Sl_pw$TIME<-dftime

hr="06:00"
# hr="07:00"
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

df_h$S1=runmax(df_h$S1,7)
df_h$S2=runmax(df_h$S2,7)
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
# lowpass.loess <- loess(y ~ x, data = data.frame(x = x, y = y), span = 0.3) ## control span to define the amount of smoothing

yp<-predict(lowpass.spline, x)
yp=data.frame(yp)
yp[yp<0]<- 0
yp$x=df_h_orig$Date
df_h_orig$Date <- as.Date(df_h_orig$DATE, '%m/%d/%Y')

############ X-axis of time series with date instead numerical series
library(ggplot2)
library(lubridate)
ggplot(df_h_orig, aes(Date, S1)) + geom_line(color='green') +
geom_line(aes(y=yp$y, col=yp$x), color='red', lwd = 1)+
  labs(title="Time Series of PV Solar Power",
       subtitle="PW-S1",
       caption="",
       y="Solar Power (MW)",
       color=NULL)

# +  # line color
#   theme(axis.text.x = element_text(angle = 0, vjust=0.5, size = 8),  # rotate x axis text
#         panel.grid.minor = element_blank())
# 
# +scale_color_manual(labels = c("Clear Sky", "Measured"), 
# values = c("yp"="#00ba38", "S1"="#f8766d"))
#   # turn off minor grid
# 
# 
