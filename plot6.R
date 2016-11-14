
##download data file
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl,destfile="./emissiondata.zip")

#unzip file
dir.create("./unzip_emissiondata")
unzip("emissiondata.zip",exdir = "unzip_emissiondata")

##read in two data tables

NEI <- tbl_df(readRDS("./unzip_emissiondata/summarySCC_PM25.rds"))
SCC <- tbl_df(("./unzip_emissiondata/Source_Classification_Code.rds"))

##look at only baltimore city, fips = 24510 or 06037
BCLA<-c("24510","06037")
PM25_BC_LA_MV<-tbl_df(filter(NEI,fips%in%BCLA,type=="ON-ROAD"))

#use group and summarize functions to find sum of emissions by year and type
grouped<-group_by(PM25_BC_LA_MV,year,fips)
PM25_BC_LA_MV_byyear<-summarize(grouped,sum=sum(Emissions))

PM25_BC_LA_MV_byyear<- transform(PM25_BC_LA_MV_byyear,city = ifelse(fips == "24510","Baltimore City","Los Angeles"))


##create line plot to see trend over time and save to PNG file
png(filename="./unzip_emissiondata/plot6.png",height=480,width=480)

qplot(year,sum,data=PM25_BC_LA_MV_byyear,ylab="Motor Vehicle Emissions",main="Motor Vehicle PM25 Emissions by Year",color=city)+geom_line()

dev.off()