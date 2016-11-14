
##download data file
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl,destfile="./emissiondata.zip")

#unzip file
dir.create("./unzip_emissiondata")
unzip("emissiondata.zip",exdir = "unzip_emissiondata")

##read in two data tables

NEI <- tbl_df(readRDS("./unzip_emissiondata/summarySCC_PM25.rds"))
SCC <- tbl_df(("./unzip_emissiondata/Source_Classification_Code.rds"))

#sum emissions by year, using tapply 

PM25_byyear<- tapply(NEI$Emissions,NEI$year,sum)

## attempted this way, did not work
##PM25_byyear<-group_by(NEI,year)
##summarize(PM25_byyear,totalPM25=sum(Emissions))


##create line plot to see trend over time and save to PNG file

png(filename="./unzip_emissiondata/plot1.png",height=480,width=480)

plot(names(PM25_byyear),PM25_byyear,type="l",xlab="Year",ylab="Total Emissions",main="Total PM25 Emissions by Year")

dev.off()
