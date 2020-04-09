f<-readRDS("summarySCC_PM25.rds")
f2<-readRDS("Source_Classification_Code.rds")

a<-f
a2<-f2

nm<-a2[,c("SCC","Short.Name")]
nm<-nm[grepl("[Cc]oal",nm$Short.Name),]
a<-a[a$SCC %in% nm$SCC , ]

x<-tapply(a$Emissions,a$year,sum)

df<-data.frame(ems=numeric() , yr=numeric())
 for(i in 1:length(x) )
 {
   df[nrow(df)+1,]<-list(ems=x[[i]],yr=as.numeric(names(x)[i]))
 }

library(ggplot2)

g<-ggplot(df,aes(yr,ems)) + 
   geom_point(color="Red") + 
   geom_line(color="Red"  ) + 
   labs(title = "emissions from coal related sources (1999-2008)" , x="Year", y="Emissions(tons)")

g

ggsave("plot4.png")