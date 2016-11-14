
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
PM25_BC<-filter(NEI,fips==24510)


#sum emissions by year, using tapply 

PM25_BC_byyear<- tapply(PM25_BC$Emissions,PM25_BC$year,sum)

##create line plot to see trend over time and save to PNG file
png(filename="./unzip_emissiondata/plot2.png",height=480,width=480)

plot(names(PM25_BC_byyear),PM25_BC_byyear,type="l",xlab="Year",ylab="Total Emissions",main="Baltimore City Total PM25 Emissions by Year")

dev.off()
