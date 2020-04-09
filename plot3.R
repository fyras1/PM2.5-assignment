f<-readRDS("summarySCC_PM25.rds")
f2<-readRDS("Source_Classification_Code.rds")

a<-split(f[f$fips==24510 , ],f[f$fips==24510 , ]$type)

x<-list(arr=array())

for(i in 1:4)
{
  x[[i]]<-tapply(a[[i]]$Emissions, a[[i]]$year,sum)
  names(x)[i]<- names(a)[[i]]
  
}

df<-data.frame(type=character() , year=numeric() , ems=numeric() , stringsAsFactors = FALSE)

for(i in 1:4)
{
  for(j in 1:4)
  {
    typ<-names(x)[i]
    yr<-as.numeric(names(x[[i]])[j])
    em<-x[[i]][[j]]
    df2<-data.frame(type=typ , year=yr, ems=em , stringsAsFactors = FALSE )
    df[nrow(df)+1 , ]<-df2
  }
}

rng<-range(df$ems)
library(ggplot2)
g<-ggplot(df,aes(year,ems , group=type))+
  geom_point(aes(color=type))+
  geom_line(aes(color=type))+
  labs(title="Emissions by type in Baltimore City (1999-2008)" , x="Year", y="Emissions(ton)")
g

ggsave("plot3.png")
