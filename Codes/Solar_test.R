Sl_pw <- read.csv("../pvinhokkaidodatadistribution/Solar_PV_PW_1Month.csv", header=T)
# head(Sl_pw)
summary(Sl_pw)


Sl_pw <- read.csv("../pvinhokkaidodatadistribution/Solar_PV_PW_1Month.csv", header=T)


# Sl_pw.ts<- as.ts(Sl_pw)
# Sl_pw.ts<- as.ts(Sl_pw.S2.MW.)
# Sl_pw.df<- as.data.frame(Sl_pw)
# Sl_pw.ts2<- as.ts(Sl_pw.df)
Sl_pw.ts3 <- ts(Sl_pw[, c("S2.MW.")])

plot(Sl_pw)
plot(Sl_pw.ts3)

# plot(stl(Sl_pw.ts, "periodic"))
# plot(stl(Sl_pw.S2.MW., "periodic"))
# plot(stl(Sl_pw.df, "periodic"))
# plot(stl(Sl_pw.ts2, "periodic"))
plot(stl(Sl_pw.ts3, "periodic"))

load("../../data/week2/maunaloa.RData")
summary(loadata)
plot(stl(loadata, "periodic"))

Sl_pw <- read.csv("../pvinhokkaidodatadistribution/Solar_PV_PW_1Month.csv", header=T)
