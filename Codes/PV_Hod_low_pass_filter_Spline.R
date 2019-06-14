Sl_pw <- read.csv("../pvinhokkaidodatadistribution/Solar_PV_PW_2yrs.csv", header=T)
Sl_pw<-na.omit(Sl_pw) 
Sl_pw$S1=round(Sl_pw$S1/max(Sl_pw$S1), digits=2) 
Sl_pw$S2=round(Sl_pw$S2/max(Sl_pw$S2), digits=2)

dftime<-format(strptime(Sl_pw$TIME,"%H:%M"),'%H:%M')
Sl_pw$TIME<-dftime

df07 <- Sl_pw[grep("07:00", Sl_pw$TIME), ]
df10 <- Sl_pw[grep("10:00", Sl_pw$TIME), ]
df11 <- Sl_pw[grep("11:00", Sl_pw$TIME), ]
df1130 <- Sl_pw[grep("11:30", Sl_pw$TIME), ]
df12 <- Sl_pw[grep("12:00", Sl_pw$TIME), ]
df1230 <- Sl_pw[grep("12:30", Sl_pw$TIME), ]
df14 <- Sl_pw[grep("14:00", Sl_pw$TIME), ]

df_h=df07
# df_h=df10
# df_h=df11
# df_h=df1130
# df_h=df12
# df_h=df1230
# df_h=df14
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

lowpass.spline <- smooth.spline(x,y, spar = 0.6) ## Control spar for amount of smoothing
# lowpass.loess <- loess(y ~ x, data = data.frame(x = x, y = y), span = 0.3) ## control span to define the amount of smoothing

plot(x,y, type="l",col = "green", lwd = 2)
# lines(ylp_spl, x, col = "red", lwd = 2)
lines(predict(lowpass.spline, x), col = "red", lwd = 2)
# lines(predict(lowpass.loess, x), col = "blue", lwd = 2)

######### High-Pass Filter ########
# highpass <- y - predict(lowpass.loess, x)
highpass <- y - predict(lowpass.spline, x)
yp=predict(lowpass.spline, x)
ypn<- as.numeric(as.character(yp))
sum(is.na(ypn))
which(!grepl('^[0-9]',ypn[[1]]))
which(is.na(as.numeric(as.character(ypn[[1]]))))
ypn[c(1)]
yp[c(1)]
y[c(1)]
length(yp)
plot(x,y, type="l",col = "green", lwd = 2)
lines(predict(lowpass.spline, x), col = "red", lwd = 2)
# lines(predict(lowpass.loess, x), col = "blue", lwd = 2)
lines(x, highpass, lwd =  2)
