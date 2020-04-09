f<-readRDS("summarySCC_PM25.rds")
f2<-readRDS("Source_Classification_Code.rds")

a<-f
a2<-f2

b<-a[a$type=="ON-ROAD" & a$fips =="24510", ]


df<-fun(b,"Baltimore")

library(ggplot2)


g<-ggplot(df,aes(yr,ems)) + 
  geom_point(color="red") +
  geom_line(color="red") + 
  labs(title = "emissions from Motor Vehicle sources (1999-2008)" , x="Year", y="Emissions(tons)" )

g

ggsave("plot5.png")

fun=function(a, ch)
{
  x<-tapply(a$Emissions,a$year,sum)
  
  df<-data.frame(ems=numeric() , yr=numeric() , cty=character(), stringsAsFactors = FALSE)
  for(i in 1:length(x) )
  {
    df[nrow(df)+1,]<-data.frame(ems=x[[i]],yr=as.numeric(names(x)[i]), cty=ch , stringsAsFactors=FALSE)
  }
  df
}