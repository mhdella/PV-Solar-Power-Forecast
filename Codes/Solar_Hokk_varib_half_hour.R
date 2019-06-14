##I think I should deterend the data by using clear sky model
## or decmposing the data for each dayhours rather than all hour together
## but this time-consuming and sound unpractical for half-hourly resolution 


Sl_pw <- read.csv("../pvinhokkaidodatadistribution/Solar_PV_PW_2yrs.csv", header=T)
Sl_pw<-na.omit(Sl_pw) 
Sl_pw$S1=round(Sl_pw$S1/max(Sl_pw$S1), digits=2) 
Sl_pw$S2=round(Sl_pw$S2/max(Sl_pw$S2), digits=2)


dftime<-format(strptime(Sl_pw$TIME,"%H:%M"),'%H:%M')

Sl_pw$TIME<-dftime

df10 <- Sl_pw[grep("10:00", Sl_pw$TIME), ]
df11 <- Sl_pw[grep("11:00", Sl_pw$TIME), ]
df1130 <- Sl_pw[grep("11:30", Sl_pw$TIME), ]
df12 <- Sl_pw[grep("12:00", Sl_pw$TIME), ]
df1230 <- Sl_pw[grep("12:30", Sl_pw$TIME), ]
df14 <- Sl_pw[grep("14:00", Sl_pw$TIME), ] 

#############################################
#### STL for decomposition of solar power at some hours #####
###df10 is the dataset for solar power at 10:00AM

# df_h=df10
# df_h=df11
# df_h=df1130
df_h=df12
df_h=df1230
# df_h=df14

Sh_pw.ts1<- ts(df_h[, c("S1")])
Sh_pw.ts2<- ts(df_h[, c("S2")])

plot(Sh_pw.ts1)
plot(Sh_pw.ts2)

plot(stl(Sh_pw.ts1, "periodic"))
plot(stl(Sh_pw.ts2, "periodic"))

########################################
#### STL for decomposition of solar power at some hours #####
###with vlues greater than the mean of each vector 

thrsh1=mean(Sh_pw.ts1)#2nd quartile
thrsh2=mean(Sh_pw.ts2)#2nd quartile

# thrsh1=1-IQR(Sl_pw$S1) #3rd quartile
# thrsh2=1-IQR(Sl_pw$S2) #3rd quartile

Sh_gm1<-Sh_pw.ts1[Sh_pw.ts1 > thrsh1]
Sh_gm2<-Sh_pw.ts2[Sh_pw.ts2 > thrsh2]
plot(Sh_gm1)
plot(Sh_gm2)

plot(stl(Sh_gm1, "periodic"))
plot(stl(Sh_gm2, "periodic"))

