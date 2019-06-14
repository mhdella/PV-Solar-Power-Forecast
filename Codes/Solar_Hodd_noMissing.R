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

# plot(stl(Sl_pw.ts2,"periodic", t.window=20000))

##I think I should deterend the data by using clear sky model
## or decmposing the data for each dayhours rather than all hour together
## but this time-consuming and sound unpractical for half-hourly resolution 


f1<-as.numeric(Sl_pw$TIME)
summary(f1)
summary(Sl_pw$TIME)
head(f1)

#df12<-dplyr::filter(Sl_pw, !grepl("12:30",TIME))


dftime<-format(strptime(Sl_pw$TIME,"%H:%M"),'%H:%M')

Sl_pw$TIME<-dftime

df10 <- Sl_pw[grep("10:00", Sl_pw$TIME), ]
df12 <- Sl_pw[grep("12:00", Sl_pw$TIME), ]
df14 <- Sl_pw[grep("14:00", Sl_pw$TIME), ] 

#############################################
#### STL for decomposition of solar power at some hours #####
###df10 is the dataset for solar power at 10:00AM

# df_h=df10
# df_h=df12
df_h=df14

Sh_pw.ts1<- ts(df_h[, c("S1")])
Sh_pw.ts2<- ts(df_h[, c("S2")])

plot(Sh_pw.ts1)
plot(Sh_pw.ts2)

plot(stl(Sh_pw.ts1, "periodic"))
plot(stl(Sh_pw.ts2, "periodic"))

