#install SQL packages
install.packages("sqldf")

#load SQL package
library(sqldf)

#load the xlsx package
library(xlsx)

#read in Cavs Data, be sure this file is in the same location as this R program
cavs <- read.xlsx("Cavs1.xlsx", sheetName="Sheet1")

#Select all columns from the CAVS table
sqldf("SELECT * from cavs")

#Select specific columns such as the player and the school the player went to
sqldf("SELECT player, school from cavs")

#Select all players whose name start with ‘I’
sqldf("SELECT player FROM cavs where player like 'I%'")


#Select LeBron James , his age and weight
sqldf("SELECT player, age, weight FROM cavs WHERE player = 'LeBron James'")

#Count the number of ages on the team roster
sqldf("SELECT  age, count(age) FROM cavs group by age")

#Count the number of ages on the team roster that have a count greater than or equal to 2.
sqldf("SELECT  age, count(age) FROM cavs group by age having count(age) >= 2")

#Select the players and their age from the Cavs roster by age from oldest to youngest
sqldf("SELECT player, age FROM cavs ORDER BY age DESC")


#Select all players with position guard A.K.A ‘G’ from the cavs table who is older than 28.
sqldf("SELECT player, pos, age FROM cavs WHERE pos ='G' and age > 28")
