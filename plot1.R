f<-readRDS("summarySCC_PM25.rds")
f2<-readRDS("Source_Classification_Code.rds")


x<-tapply(f$Emissions,f$year,sum)

png("plot1.png")
plot(as.numeric(names(x)) , x , 
     type="o" , 
     pch=20 , 
     col="red",
     main="Total emissions by year (1999-2008)",
     xlab="Year",
     ylab="Total emissions(tons)")
dev.off()