Sl_pw <- read.csv("../pvinhokkaidodatadistribution/Solar_PV_PW_2yrs.csv", header=T)
Sl_pw<-na.omit(Sl_pw) 
##### Normalization
# Sl_pw$S1=round(Sl_pw$S1/max(Sl_pw$S1), digits=2) 
# Sl_pw$S2=round(Sl_pw$S2/max(Sl_pw$S2), digits=2)

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

plot(x,df_h_orig$S1,main="Clear-Sky Output", type="l", col = "green",
     lwd = 2, xlab="Date", ylab="Solar Power" )
lines(predict(lowpass.spline, x), col = "red", lwd = 2)
# lines(predict(lowpass.loess, x), col = "blue", lwd = 2)

# axis(1, df_h_orig$Date, format(df_h_orig$Date, "%b %y"), cex.axis = .7)


