
##download data file
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl,destfile="./emissiondata.zip")

#unzip file
dir.create("./unzip_emissiondata")
unzip("emissiondata.zip",exdir = "unzip_emissiondata")

##read in two data tables

NEI <- tbl_df(readRDS("./unzip_emissiondata/summarySCC_PM25.rds"))
SCC <- tbl_df(("./unzip_emissiondata/Source_Classification_Code.rds"))

##look at only baltimore city, fips = 24510
PM25_BC<-tbl_df(filter(NEI,fips==24510))

#use group and summarize functions to find sum of emissions by year and type
grouped<-group_by(PM25_BC,year,type)
PM25_BC_byyear_bytype<-summarize(grouped,sum=sum(Emissions))


##create line plot to see trend over time and save to PNG file
png(filename="./unzip_emissiondata/plot3.png",height=480,width=480)

qplot(year,sum,data=PM25_BC_byyear_bytype,color=type,ylab="Total Emissions",main="Baltimore City Total PM25 Emissions by Year by type")+geom_line()

dev.off()