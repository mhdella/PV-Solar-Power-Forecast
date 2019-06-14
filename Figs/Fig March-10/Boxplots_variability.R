Sl_pw <- read.csv("../pvinhokkaidodatadistribution/Solar_PV_PW_2yrs.csv", header=T)
Sl_pw<-na.omit(Sl_pw) 
# ##### Normalization
# Sl_pw$S1=round(Sl_pw$S1/max(Sl_pw$S1), digits=2)
# Sl_pw$S2=round(Sl_pw$S2/max(Sl_pw$S2), digits=2)

dftime<-format(strptime(Sl_pw$TIME,"%H:%M"),'%H:%M')
Sl_pw$TIME<-dftime


Date = seq(from=as.POSIXct("2016-01-01 00:00"), 
           to=as.POSIXct("2017-12-31 23:30"), length=35063)

Locations <- rep(c('S1 Area'), each=35063)
Final <- data.frame(loc=Locations,
                    Doy = as.numeric(format(Date,format = "%j")),
                    Tod = as.numeric(format(Date,format = "%H")),
                    Power = Sl_pw$S1)
library(ggplot2)
ggplot(Final, aes(x = Tod, y = Power)) + geom_boxplot() 

require(lattice)
xyplot(Power~Tod|loc, data = Final, col="green", lwd = 2)
xyplot(Power~Doy|loc, data = Final, col="black", type = 'l')


Sl_pw_hr=Sl_pw[ ! Sl_pw$TIME %in% c('00:30','01:30','02:30','03:30','04:30','05:30','06:30','07:30', 
                                    '08:30', '09:30','10:30','11:30','12:30','13:30','14:30','15:30',
                                    '16:30','17:30','18:30','19:30','20:30','21:30','22:30','23:30'), ]

############ Boxplots of Hourly Solar Power ###############
library(reshape2)

ggplot(Sl_pw_hr, aes(x = TIME, y = S1+S2)) + 
  geom_boxplot()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  xlab("Hours") +ylab("Solar Power (MW)")+
  ggtitle("Variability of Output Solar Power in Both Areas (S1+S2)")


summary(Sl_pw_hr)


######################
# for (i in 1:24){
#   hr=HR[i]
#   
#   df_h <- Sl_pw[grep(hr, Sl_pw$TIME), ]
#   }
#   
# 
# 
# hr4="04:00"
# hr5="05:00"
# hr6="06:00"
# hr7="07:00"
# hr8="08:00"
# hr9="09:00"
# hr10="10:00"
# hr11="11:00"
# hr12="12:30"
# hr13="13:00"
# hr14="14:00"
# hr15="15:00"
# hr16="16:00"
# hr17="17:00"
# hr18="18:00"
# hr19="19:00"
# 
# 
# HR<- c("00:00","00:01", "00:02", "00:03","00:04", "05:00", "06:00",
#        "07:00","08:00", "09:00", "10:00","11:00" ,"12:00", "13:00", 
#        "14:00","15:00", "16:00", "17:00","18:00", "19:00", "20:00", 
#        "21:00", "22:00", "23:00")
