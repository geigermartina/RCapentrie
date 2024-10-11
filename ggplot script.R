library(gapminder) #loading an example dataset
library(dplyr)
library(ggplot2) 

ggplot(data = gapminder)

gapminder %>% 
  ggplot(aes(x=gdpPercap,
             y=lifeExp, color  = continent)) + 
  geom_point()

#challenge sort by year

gapminder %>% 
  ggplot(aes(x=year,
             y=lifeExp, color  = continent)) + 
  geom_points()

#challenge show lines and points
gapminder %>% 
  ggplot(aes(x= year,
             y=lifeExp, color  = continent,
             group= country)) + 
  geom_line() + geom_point(color ="black")

# order line and point matters
gapminder %>% 
  ggplot(aes(x= year,
             y=lifeExp, color  = continent,
             group= country)) + 
  geom_point(color ="black") + geom_line() 

# adjusting lables and title of figure 

gapminder_image <- gapminder %>% 
  filter(continent == "Americas") %>% 
  ggplot(aes(x=year, y=lifeExp, group = country)) + 
  geom_line() +
  facet_wrap(~ country)+
  labs(x="Year", y= "Life Expactancy", title = "Figure1") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0))

#saving images in high resultion
ggsave(filename= "resultimage.png", 
       plot = gapminder_image, 
       width = 12, 
       height= 10, 
       dpi = 500, 
       units = ("cm"))

#challenge5

gapminder  %>%
    ggplot(aes(x=continent, y=lifeExp, fill = continent)) +
    facet_wrap(~ year)+
    geom_boxplot(show.legend = FALSE)+
  labs(x="Continent", y= "Life Expactancy", title = "Figure1") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0))




    
  