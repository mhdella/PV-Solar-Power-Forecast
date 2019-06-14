# https://stackoverflow.com/questions/15418295/automatically-update-graph-title-with-parameter
library(ggplot2)
xval <- rep(0:20,10)
lambda <- rep(1:10,21)
yval <- exp(- lambda)*lambda**xval/gamma(xval+1)
the_new_data_frame <- data.frame(cbind(xval,lambda,yval))

plot1 <- ggplot(the_new_data_frame, aes(xval, yval)) + geom_line(aes(colour=factor(lambda)))
plot1
# plot1 + facet_grid(~lambda)