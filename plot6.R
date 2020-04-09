f<-readRDS("summarySCC_PM25.rds")
f2<-readRDS("Source_Classification_Code.rds")

a<-f
a2<-f2


b<-a[a$type=="ON-ROAD" & a$fips =="24510", ]
c<-a[a$type=="ON-ROAD" & a$fips =="06037", ]


df<-fun(b,"Baltimore")
df2<-fun(c,"LA")

df<-rbind(df,df2)
library(ggplot2)

 
g<-ggplot(df,aes(yr,ems, group=cty)) + 
  geom_point(aes(color=cty)) +
  geom_line(aes(color=cty)) + 
  labs(title = "emissions from Motor Vehicle sources (1999-2008)" , x="Year", y="Emissions(tons)", colour="City")

g

ggsave("plot6.png")

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