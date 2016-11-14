
##download data file
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl,destfile="./emissiondata.zip")

#unzip file
dir.create("./unzip_emissiondata")
unzip("emissiondata.zip",exdir = "unzip_emissiondata")

##read in two data tables

NEI <- tbl_df(readRDS("./unzip_emissiondata/summarySCC_PM25.rds"))
SCC <- tbl_df(readRDS("./unzip_emissiondata/Source_Classification_Code.rds"))

##merge datasets to have source names in dataset
PM25_withsource<-tbl_df(merge(NEI,SCC))
names(PM25_withsource)<-make.names((names(PM25_withsource)))

##filter to only coal combustion related sources using EI.sector
PM25_sourceCoal<-filter(PM25_withsource,EI.Sector== "Fuel Comb - Comm/Institutional - Coal"|EI.Sector=="Fuel Comb - Industrial Boilers, ICEs - Coal"|EI.Sector=="Fuel Comb - Electric Generation - Coal")


#use group and summarize functions to find sum of emissions from coal source by year 
grouped<-group_by(PM25_sourceCoal,year)
PM25_coal_byyear<-summarize(grouped,sum=sum(Emissions))

##create line plot to see trend over time and save to PNG file
png(filename="./unzip_emissiondata/plot4.png",height=480,width=480)

qplot(year,sum,data=PM25_coal_byyear,ylab="Coal Related Emissions",main="Total PM25 Emissions by Year from Coal Cobustion")+geom_line()

dev.off()