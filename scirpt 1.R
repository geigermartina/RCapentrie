library(ggplot2)
library(dplyr)
library(gapminder)

#Download data from internet
download.file(url="https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv", destfile = "gapminder_data.csv" )
#Read the data
gapminder_data <- read.csv("gapminder_data.csv")


head(gapminder_data)

str(gapminder_data)

#Number of Columns and Rows
ncol(gapminder_data)
nrow(gapminder_data)

#Names of the Columns
colnames(gapminder_data)

#Basic Summary of my Data
summary(gapminder_data)

#Dplyr Package makes apperance
 
#Select some columns: year, country and gdpPercap

select(gapminder_data, year, country, gdpPercap)

select(gapminder_data, - lifeExp)

#This Command select(gapminder_data, year, country, gdpPercap) with pipes
#Shortcut for Pipe Strg + Shift + M

gapminder_data %>% 
  select(year, country, gdpPercap) %>% 
  head()

#This Command select(gapminder_data, - lifeExp) with pipes

gapminder_data %>% 
  select(-lifeExp) %>% 
  head()

# Filtering overservations 

gap_eu <- gapminder_data %>% 
  filter(continent=="Europe")

head(gap_eu)

# Check that there is only Europ in our new object
gap_eu %>% 
  distinct(continent)

#compare to original
gapminder_data %>% 
  distinct(continent)

head(gap_eu)

#Filter: continent is Europ & year is 2002

gapminder_data %>%
  filter(continent == "Europe", year == 2002)

# komma = und ; oder = |
gapminder_data %>% 
  filter(year == 2002 | year == 2007)

# doing the same but using a vector
gapminder_data %>% 
  filter(year %in% c(2002, 2007))

# order matters! this does not work 

gapminder_data %>% 
  select(continent, year, lifeExp) %>% 
  filter(country == "Germany")

gapminder_data %>% 
  filter (country != "Germany") %>% #Country is not Germany 
  distinct(country) #Show which Country are available 


#Challenge 

gapminder_data %>% 
  filter (continent == "Africa") %>% 
  select(lifeExp, country, year) %>% 
  nrow()

#Summarize

gapminder_data %>% 
  summarise(mean_gpd = mean(gdpPercap), media_gdp = median(gdpPercap), min_gdp= min(gdpPercap))

#Lets get better, group observation 

summary_table <- gapminder_data %>% 
  group_by(continent, year) %>% 
  summarise(mean_gdp=mean(gdpPercap),median_gdp = median(gdpPercap), min_gdp = min(gdpPercap))

distinct(summary_table)


# Challenge

gapminder_data %>% 
  group_by(country)
  summarise(mean_lifeexp = mean(LifeEx))