# Exploratory-Data-Analysis-Project
Project for the Exploratory Data Analysis Course through Coursera


This repo contains 6 R scripts and 6 associated plots that are created when those scripts are run.

The data looks at PM25 emissions data across the US, and the scripts looks to answer a series of 6 questions:

1) Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?

2) Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 

3) Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008?

4) Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

5) How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

6) Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?


Info about the files:

The zip file contains two files:
PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. 

The SCC files, shows the source assoicated with each source code - variable SCC below.

A description of each variable in summarySCC_PM25.rds

fips: A five-digit number (represented as a string) indicating the U.S. county
SCC: The name of the source as indicated by a digit string (see source code classification table)
Pollutant: A string indicating the pollutant
Emissions: Amount of PM2.5 emitted, in tons
type: The type of source (point, non-point, on-road, or non-road)
year: The year of emissions recorded

