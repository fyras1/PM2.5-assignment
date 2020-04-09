f<-readRDS("summarySCC_PM25.rds")
f2<-readRDS("Source_Classification_Code.rds")

library(dplyr)
a<-subset(f,fips=="24510")
x<-tapply(a$Emissions,a$year,sum)

png("plot2.png")
plot(as.numeric(names(x)) , x , 
     type="o" , 
     pch=20 , 
     col="red",
     main="Total emissions in Baltimore City by year",
     xlab="Year",
     ylab="Total emissions(tons)")
dev.off()
