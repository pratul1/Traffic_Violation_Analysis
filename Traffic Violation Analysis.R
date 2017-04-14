# Distribution of number of violation in different area at different time-period


Code:

rxViolations <- read.csv(file.choose())
head(rxViolations)

rxViolations$hour_of_day <- substr(rxViolations$Time.Of.Stop,1,regexpr(":",rxViolations$Time.Of.Stop)-1)
head(rxViolations$hour_of_day)
class(rxViolations$hour_of_day)
rxViolations$hour_of_day <- as.numeric(rxViolations$hour_of_day)

violation_hour <- as.data.frame(table(rxViolations$hour_of_day))
View(violation_hour)

write.csv(violation_hour, file = "violation_hour.csv")

rxViolations$SubAgency <- as.character(rxViolations$SubAgency)

rxViolations$SubAgency <- substr(rxViolations$SubAgency, regexpr(",",rxViolations$SubAgency)+2, nchar(rxViolations$SubAgency)) 

head(rxViolations$SubAgency)

violation_area_hour <- as.data.frame(table(rxViolations$SubAgency, rxViolations$hour_of_day))
View(violation_area_hour)

write.csv(violation_area_hour, file = "violation_area_hour.csv")










# During which month, most of the violations are found in Maryland.


Code: 
rxViolations <- read.csv(file.choose())

rxViolations$month_of_year <- substr(rxViolations$Date.of.Stop, 1, regexpr("/",rxViolations$Date.of.Stop)-1)
head(rxViolations$month_of_year)
class(rxViolations$month_of_year)
rxViolations$month_of_year <- as.numeric(rxViolations$month_of_year)

rxViolations$Date.of.Stop <- as.character(rxViolations$Date.of.Stop)

rxViolations$year <- substr(rxViolations$Date.of.Stop, nchar(rxViolations$Date.of.Stop)-3, nchar(rxViolations$Date.of.Stop))
head(rxViolations$year)

violations_year_ts <- ts(violation_year$Freq)
plot(violations_year_ts)

violation_month <- as.data.frame(table(rxViolations$month_of_year, rxViolations$year))
View(violation_month)

write.csv(violation_month, file = "violation_month.csv”)







# The trend in a number of violations and type of violations over the year.


Code:
rxViolations <- read.csv(file.choose())
head(rxViolations)

rxViolations$Date.of.Stop <- as.character(rxViolations$Date.of.Stop)

rxViolations$year <- substr(rxViolations$Date.of.Stop, nchar(rxViolations$Date.of.Stop)-3, nchar(rxViolations$Date.of.Stop))
head(rxViolations$year)

violation_year <- as.data.frame(table(rxViolations$year))
View(violation_year)

write.csv(violation_year, file = "violation_year.csv")

violations_year_ts <- ts(violation_year$Freq)

plot(violations_year_ts)







# Which area is most dangerous in Maryland


rxViolations <- read.csv(file.choose())
head(rxViolations)


rxViolations$SubAgency <- as.character(rxViolations$SubAgency)

rxViolations$SubAgency <- substr(rxViolations$SubAgency, regexpr(",",rxViolations$SubAgency)+2, nchar(rxViolations$SubAgency)) 

head(rxViolations$SubAgency)

violation_area <- as.data.frame(table(rxViolations$SubAgency))
View(violation_area)

write.csv(violation_area, file = "violation_area.csv")







# Number of violations by each race in different areas


rxViolations <- read.csv(file.choose())
head(rxViolations)

rxViolations$SubAgency <- as.character(rxViolations$SubAgency)

rxViolations$SubAgency <- substr(rxViolations$SubAgency, regexpr(",",rxViolations$SubAgency)+2, nchar(rxViolations$SubAgency)) 

head(rxViolations$SubAgency)

violations_area_race <- as.data.frame(table(rxViolations$SubAgency, rxViolations$Race))
View(violations_area_race)

write.csv(violations_area_race, file = "violations_area_race.csv")



