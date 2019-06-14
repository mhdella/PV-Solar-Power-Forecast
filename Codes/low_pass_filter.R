number_of_cycles = 2
max_y = 40
x = 1:500
a = number_of_cycles*2*pi/length(x)

y = max_y * sin(x*a)
noise1 = max_y * 1/10 * sin(x*a*10)

plot(x, y, type="l", col="red", ylim=range(-1.5*max_y,1.5*max_y,5))
points(x, y + noise1, col="green", pch=20)
points(x, noise1, col="yellow", pch=20)


#################

bf <- butter(2, 1/50, type="low")
b <- filter(bf, y+noise1)
points(x, b, col="black", pch=20)

bf <- butter(2, 1/25, type="high")
b <- filter(bf, y+noise1)
points(x, b, col="black", pch=20)