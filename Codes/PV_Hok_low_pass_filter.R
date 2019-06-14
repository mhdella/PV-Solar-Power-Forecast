Sl_pw <- read.csv("../pvinhokkaidodatadistribution/Solar_PV_PW_2yrs.csv", header=T)
Sl_pw<-na.omit(Sl_pw) 
Sl_pw$S1=round(Sl_pw$S1/max(Sl_pw$S1), digits=2) 
Sl_pw$S2=round(Sl_pw$S2/max(Sl_pw$S2), digits=2)

dftime<-format(strptime(Sl_pw$TIME,"%H:%M"),'%H:%M')
Sl_pw$TIME<-dftime

# hr="06:00"
# hr="07:00"
hr="10:00"
# hr="11:00"
# hr="11:30"
# hr="12:00"
# hr="14:00"
# hr="17:00"

df_h <- Sl_pw[grep(hr, Sl_pw$TIME), ]

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
# ylp_spl=predict(lowpass.spline, x)
# length(ylp_spl)

# lowpass.spline <- smooth.spline(x,y, spar = 0.6) ## Control spar for amount of smoothing
lowpass.loess <- loess(y ~ x, data = data.frame(x = x, y = y), span = 0.3) ## control span to define the amount of smoothing
# 
# plot(x,y, type="l",col = "green", lwd = 2)
# # lines(ylp_spl, x, col = "red", lwd = 2)
# # lines(predict(lowpass.spline, x), col = "blue", lwd = 2)
# lines(predict(lowpass.loess, x), col = "red", lwd = 2)

######### High-Pass Filter ########
yp<-predict(lowpass.loess, x)
# yp <-predict(lowpass.spline, x)
yp
yp[yp < 0] <- 0

highpass <- y - yp
highpass[highpass < 0] <- 0

plot(x,y, type="l",col = "green", lwd = 2)
# lines(predict(lowpass.spline, x), col = "blue", lwd = 2)
lines(x,yp, col = "red", lwd = 2)
lines(x, highpass, lwd =  2)
