# https://jason-doug-climate.blogspot.com/2014/12/mapping-typhoon-haiyanyolanda-with.html
library(rNOMADS) 
library(GEOmap)
library(aqfig)
library(rgdal)
levels <- c("surface", "2 m above ground", "10 m above ground", "300 mb")

# Define variables - temperature and wind

variables <- c("TMP", "UGRD", "VGRD")

# Define additional model inputs

abbrev <- "gfsanl"
model.date <- 20141029
model.run <- 06
pred <- 3
# Get the data

grib.info <- ArchiveGribGrab(abbrev, model.date,model.run, pred, file.type = "grib2")

# Read data into R

# grib.data <- ReadGrib(grib.info$file.name, levels, variables)
grib.data <- ReadGrib("gfs.t06z.pgrb2full.0p50.f006.grb", levels, variables)


resolution <- c(0.5, 0.5) #Resolution of the model

# Make an array for easier manipulation

atmos <- ModelGrid(grib.data, resolution)

# Set up display

# Plot temperature at 2 m above ground

li <- which(atmos$levels == "2 m above ground")
vi <- which(atmos$variables == "TMP")
colormap <- rev(rainbow(500, start = 0 , end = 5/6))

# Read world boundaries

world <- readOGR(dsn="D:/Data/ne_10m_admin_0_countries", layer="ne_10m_admin_0_countries")

png(file = "world_surface_temp.png", width = 9, height = 6, res=400, type="cairo-png",units="in", bg="white",restoreConsole = TRUE)

image(atmos$x , sort(atmos$y), atmos$z[li,vi,,], col = colormap,
      xlab = "Longitude", ylab = "Latitude",
      main = paste("World Temperature at Ground Level (deg C):", atmos$fcst.date ,"GMT"))

# Plot coastlines

plot(world, border = "black", add = TRUE, MAPcol = NA)

# Plot legend, convert to Celsius

vertical.image.legend(col=colormap, zlim = range(atmos$z[li,vi,,] - 273.15))
dev.off()

# Plot wind magnitude at 10 m above ground

li <- which(atmos$levels == "10 m above ground")
vi.zonal <- which(atmos$variables == "UGRD") # East-West wind
vi.merid <- which(atmos$variables == "VGRD") # North-South wind

wind.mag <- sqrt(atmos$z[li,vi.zonal,,]^(2) + atmos$z[li,vi.merid,,]^(2))
colormap <- rev(rainbow(500, start = 0 , end = 5/6))

png(file = "world_surface_wind.png", width = 9, height = 6, res=400, type="cairo-png",units="in", bg="white",restoreConsole = TRUE)

image(atmos$x, sort(atmos$y), wind.mag, col = colormap,
      xlab = "Longitude", ylab = "Latitude",xlim=c(100,150),ylim=c(-5,20),
      main = paste("World Winds at Ground Level (km/hr):", atmos$fcst.date, "GMT"))

# Plot coastlines

plot(world, border = "black", add = TRUE, MAPcol = NA)

# Plot legend, convert to km/hr

vertical.image.legend(col=colormap, zlim = range(wind.mag * 3.6))

dev.off()