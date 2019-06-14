#Operational Forecast Data Extraction
#NCEP output is always in GRIB2 format - this makes things easy for us
#An example for the Global Forecast System 0.5 degree model

# install.packages("rNOMADS")
library(rNOMADS)

#Get the latest model url
## Not run: 
urls.out <- CrawlModels(abbrev = "gfs_0p50", depth = 1)

#Get a list of forecasts, variables and levels
model.parameters <- ParseModelPage(urls.out[1])

#Figure out which one is the 6 hour forecast
#provided by the latest model run
#(will be the forecast from 6-12 hours from the current date) 

my.pred <- model.parameters$pred[grep("06$", model.parameters$pred)]

#What region of the atmosphere to get data for
levels <- c("2 m above ground", "800 mb")

#What data to return
variables <- c("TMP", "RH") #Temperature and relative humidity

#Get the data
model.info <- GribGrab(urls.out[1], my.pred, levels, variables)

# model.info
# model.info[[1]]
# model.info[[1]]$file.name

#Extract the data
model.data <- ReadGrib(model.info[[1]]$file.name, levels, variables)
# model.data <- ReadGrib('gfs.t18z.pgrb2full.0p50.f006.grb', levels, variables)