---
title: "BIS 15L Practice Midterm"
author: "Lily Chen"
date: "2/8/2020"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---



## `gapminder`
For this assignment, we are going to use the dataset [gapminder](https://cran.r-project.org/web/packages/gapminder/index.html). Gapminder includes information about economics, population, and life expectancy from countries all over the world. You will need to install it before use.

```r
install.packages("gapminder", repos = "http://cran.us.r-project.org")
```

```
## 
## The downloaded binary packages are in
## 	/var/folders/m4/s77txng10gn2r8wd35sy85ww0000gn/T//Rtmp1uyiXx/downloaded_packages
```

## Load the libraries

```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.0 ──
```

```
## ✓ ggplot2 3.2.1     ✓ purrr   0.3.3
## ✓ tibble  2.1.3     ✓ dplyr   0.8.4
## ✓ tidyr   1.0.2     ✓ stringr 1.4.0
## ✓ readr   1.3.1     ✓ forcats 0.4.0
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(gapminder)
options(scipen=999) #disables scientific notation when printing
```

## Data structure
**1. Use the function(s) of your choice to get an idea of the overall structure of the data frame, including its dimensions, column names, variable classes, etc.**


```r
glimpse(gapminder)
```

```
## Observations: 1,704
## Variables: 6
## $ country   <fct> Afghanistan, Afghanistan, Afghanistan, Afghanistan, Afghani…
## $ continent <fct> Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia,…
## $ year      <int> 1952, 1957, 1962, 1967, 1972, 1977, 1982, 1987, 1992, 1997,…
## $ lifeExp   <dbl> 28.801, 30.332, 31.997, 34.020, 36.088, 38.438, 39.854, 40.…
## $ pop       <int> 8425333, 9240934, 10267083, 11537966, 13079460, 14880372, 1…
## $ gdpPercap <dbl> 779.4453, 820.8530, 853.1007, 836.1971, 739.9811, 786.1134,…
```


```r
names(gapminder)
```

```
## [1] "country"   "continent" "year"      "lifeExp"   "pop"       "gdpPercap"
```


```r
dim(gapminder)
```

```
## [1] 1704    6
```


**2. Are there any NA's in the data?**


```r
gapminder %>% 
  summarize(number_nas = sum(is.na(gapminder)))
```

```
## # A tibble: 1 x 1
##   number_nas
##        <int>
## 1          0
```

There is no NA's in the data.


## Three versions of the `gampminder` data  
We will use three versions of the `gapminder` data to perform analyses and (eventually) make plots. For now, make the following long and wide versions of `gapminder`.

## `gapminder`
Notice that `gapminder` has one row for each country and year, and one column for each measurement (lifeExp, pop, gdpPercap).

```r
gapminder <- gapminder
gapminder
```

```
## # A tibble: 1,704 x 6
##    country     continent  year lifeExp      pop gdpPercap
##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan Asia       1952    28.8  8425333      779.
##  2 Afghanistan Asia       1957    30.3  9240934      821.
##  3 Afghanistan Asia       1962    32.0 10267083      853.
##  4 Afghanistan Asia       1967    34.0 11537966      836.
##  5 Afghanistan Asia       1972    36.1 13079460      740.
##  6 Afghanistan Asia       1977    38.4 14880372      786.
##  7 Afghanistan Asia       1982    39.9 12881816      978.
##  8 Afghanistan Asia       1987    40.8 13867957      852.
##  9 Afghanistan Asia       1992    41.7 16317921      649.
## 10 Afghanistan Asia       1997    41.8 22227415      635.
## # … with 1,694 more rows
```


## Long `gapminder`
**3. Make a new data frame `gapminder_long` that combines the three measured values (lifeExp, pop, gdpPercap) into a single column associated with a country and year.**


```r
gapminder_long <-
  gapminder %>% 
  pivot_longer(lifeExp:gdpPercap,
               names_to = "category",
               values_to = "measure")
gapminder_long
```

```
## # A tibble: 5,112 x 5
##    country     continent  year category     measure
##    <fct>       <fct>     <int> <chr>          <dbl>
##  1 Afghanistan Asia       1952 lifeExp         28.8
##  2 Afghanistan Asia       1952 pop        8425333  
##  3 Afghanistan Asia       1952 gdpPercap      779. 
##  4 Afghanistan Asia       1957 lifeExp         30.3
##  5 Afghanistan Asia       1957 pop        9240934  
##  6 Afghanistan Asia       1957 gdpPercap      821. 
##  7 Afghanistan Asia       1962 lifeExp         32.0
##  8 Afghanistan Asia       1962 pop       10267083  
##  9 Afghanistan Asia       1962 gdpPercap      853. 
## 10 Afghanistan Asia       1967 lifeExp         34.0
## # … with 5,102 more rows
```


**4. For practice, use `pivot_wider()` to put the data back into the original `gapminder` format.**


```r
gapminder_long %>%
  pivot_wider(names_from = "category",
              values_from = "measure")
```

```
## # A tibble: 1,704 x 6
##    country     continent  year lifeExp      pop gdpPercap
##    <fct>       <fct>     <int>   <dbl>    <dbl>     <dbl>
##  1 Afghanistan Asia       1952    28.8  8425333      779.
##  2 Afghanistan Asia       1957    30.3  9240934      821.
##  3 Afghanistan Asia       1962    32.0 10267083      853.
##  4 Afghanistan Asia       1967    34.0 11537966      836.
##  5 Afghanistan Asia       1972    36.1 13079460      740.
##  6 Afghanistan Asia       1977    38.4 14880372      786.
##  7 Afghanistan Asia       1982    39.9 12881816      978.
##  8 Afghanistan Asia       1987    40.8 13867957      852.
##  9 Afghanistan Asia       1992    41.7 16317921      649.
## 10 Afghanistan Asia       1997    41.8 22227415      635.
## # … with 1,694 more rows
```


## Wide `gapminder`
**5. Make a new data frame `gapminder_wide` that has all observations for each country in a single row. The column names should be named as "observation_year". Arrange them sequentially by year.**


```r
gapminder_wide <- 
  gapminder %>% 
  pivot_wider(names_from = "year",
              values_from = lifeExp:gdpPercap)
gapminder_wide
```

```
## # A tibble: 142 x 38
##    country continent lifeExp_1952 lifeExp_1957 lifeExp_1962 lifeExp_1967
##    <fct>   <fct>            <dbl>        <dbl>        <dbl>        <dbl>
##  1 Afghan… Asia              28.8         30.3         32.0         34.0
##  2 Albania Europe            55.2         59.3         64.8         66.2
##  3 Algeria Africa            43.1         45.7         48.3         51.4
##  4 Angola  Africa            30.0         32.0         34           36.0
##  5 Argent… Americas          62.5         64.4         65.1         65.6
##  6 Austra… Oceania           69.1         70.3         70.9         71.1
##  7 Austria Europe            66.8         67.5         69.5         70.1
##  8 Bahrain Asia              50.9         53.8         56.9         59.9
##  9 Bangla… Asia              37.5         39.3         41.2         43.5
## 10 Belgium Europe            68           69.2         70.2         70.9
## # … with 132 more rows, and 32 more variables: lifeExp_1972 <dbl>,
## #   lifeExp_1977 <dbl>, lifeExp_1982 <dbl>, lifeExp_1987 <dbl>,
## #   lifeExp_1992 <dbl>, lifeExp_1997 <dbl>, lifeExp_2002 <dbl>,
## #   lifeExp_2007 <dbl>, pop_1952 <int>, pop_1957 <int>, pop_1962 <int>,
## #   pop_1967 <int>, pop_1972 <int>, pop_1977 <int>, pop_1982 <int>,
## #   pop_1987 <int>, pop_1992 <int>, pop_1997 <int>, pop_2002 <int>,
## #   pop_2007 <int>, gdpPercap_1952 <dbl>, gdpPercap_1957 <dbl>,
## #   gdpPercap_1962 <dbl>, gdpPercap_1967 <dbl>, gdpPercap_1972 <dbl>,
## #   gdpPercap_1977 <dbl>, gdpPercap_1982 <dbl>, gdpPercap_1987 <dbl>,
## #   gdpPercap_1992 <dbl>, gdpPercap_1997 <dbl>, gdpPercap_2002 <dbl>,
## #   gdpPercap_2007 <dbl>
```


**6. For practice, use `pivot_longer()` to put the data back into the original `gapminder` format. Hint: you can't do this in one step!**


```r
gapminder_wide %>%
  pivot_longer(lifeExp_1952:gdpPercap_2007,
               names_to = "category_year",
               values_to = "observation") %>% 
  separate(category_year, into= c("category", "year"), sep = "_") %>% 
  pivot_wider(names_from = "category",
              values_from = "observation")
```

```
## # A tibble: 1,704 x 6
##    country     continent year  lifeExp      pop gdpPercap
##    <fct>       <fct>     <chr>   <dbl>    <dbl>     <dbl>
##  1 Afghanistan Asia      1952     28.8  8425333      779.
##  2 Afghanistan Asia      1957     30.3  9240934      821.
##  3 Afghanistan Asia      1962     32.0 10267083      853.
##  4 Afghanistan Asia      1967     34.0 11537966      836.
##  5 Afghanistan Asia      1972     36.1 13079460      740.
##  6 Afghanistan Asia      1977     38.4 14880372      786.
##  7 Afghanistan Asia      1982     39.9 12881816      978.
##  8 Afghanistan Asia      1987     40.8 13867957      852.
##  9 Afghanistan Asia      1992     41.7 16317921      649.
## 10 Afghanistan Asia      1997     41.8 22227415      635.
## # … with 1,694 more rows
```


## Data summaries
**7. How many different continents and countries are represented in the data? Provide the total number and their names.**


```r
nlevels(gapminder$country)
```

```
## [1] 142
```


```r
levels(gapminder$country)
```

```
##   [1] "Afghanistan"              "Albania"                 
##   [3] "Algeria"                  "Angola"                  
##   [5] "Argentina"                "Australia"               
##   [7] "Austria"                  "Bahrain"                 
##   [9] "Bangladesh"               "Belgium"                 
##  [11] "Benin"                    "Bolivia"                 
##  [13] "Bosnia and Herzegovina"   "Botswana"                
##  [15] "Brazil"                   "Bulgaria"                
##  [17] "Burkina Faso"             "Burundi"                 
##  [19] "Cambodia"                 "Cameroon"                
##  [21] "Canada"                   "Central African Republic"
##  [23] "Chad"                     "Chile"                   
##  [25] "China"                    "Colombia"                
##  [27] "Comoros"                  "Congo, Dem. Rep."        
##  [29] "Congo, Rep."              "Costa Rica"              
##  [31] "Cote d'Ivoire"            "Croatia"                 
##  [33] "Cuba"                     "Czech Republic"          
##  [35] "Denmark"                  "Djibouti"                
##  [37] "Dominican Republic"       "Ecuador"                 
##  [39] "Egypt"                    "El Salvador"             
##  [41] "Equatorial Guinea"        "Eritrea"                 
##  [43] "Ethiopia"                 "Finland"                 
##  [45] "France"                   "Gabon"                   
##  [47] "Gambia"                   "Germany"                 
##  [49] "Ghana"                    "Greece"                  
##  [51] "Guatemala"                "Guinea"                  
##  [53] "Guinea-Bissau"            "Haiti"                   
##  [55] "Honduras"                 "Hong Kong, China"        
##  [57] "Hungary"                  "Iceland"                 
##  [59] "India"                    "Indonesia"               
##  [61] "Iran"                     "Iraq"                    
##  [63] "Ireland"                  "Israel"                  
##  [65] "Italy"                    "Jamaica"                 
##  [67] "Japan"                    "Jordan"                  
##  [69] "Kenya"                    "Korea, Dem. Rep."        
##  [71] "Korea, Rep."              "Kuwait"                  
##  [73] "Lebanon"                  "Lesotho"                 
##  [75] "Liberia"                  "Libya"                   
##  [77] "Madagascar"               "Malawi"                  
##  [79] "Malaysia"                 "Mali"                    
##  [81] "Mauritania"               "Mauritius"               
##  [83] "Mexico"                   "Mongolia"                
##  [85] "Montenegro"               "Morocco"                 
##  [87] "Mozambique"               "Myanmar"                 
##  [89] "Namibia"                  "Nepal"                   
##  [91] "Netherlands"              "New Zealand"             
##  [93] "Nicaragua"                "Niger"                   
##  [95] "Nigeria"                  "Norway"                  
##  [97] "Oman"                     "Pakistan"                
##  [99] "Panama"                   "Paraguay"                
## [101] "Peru"                     "Philippines"             
## [103] "Poland"                   "Portugal"                
## [105] "Puerto Rico"              "Reunion"                 
## [107] "Romania"                  "Rwanda"                  
## [109] "Sao Tome and Principe"    "Saudi Arabia"            
## [111] "Senegal"                  "Serbia"                  
## [113] "Sierra Leone"             "Singapore"               
## [115] "Slovak Republic"          "Slovenia"                
## [117] "Somalia"                  "South Africa"            
## [119] "Spain"                    "Sri Lanka"               
## [121] "Sudan"                    "Swaziland"               
## [123] "Sweden"                   "Switzerland"             
## [125] "Syria"                    "Taiwan"                  
## [127] "Tanzania"                 "Thailand"                
## [129] "Togo"                     "Trinidad and Tobago"     
## [131] "Tunisia"                  "Turkey"                  
## [133] "Uganda"                   "United Kingdom"          
## [135] "United States"            "Uruguay"                 
## [137] "Venezuela"                "Vietnam"                 
## [139] "West Bank and Gaza"       "Yemen, Rep."             
## [141] "Zambia"                   "Zimbabwe"
```


```r
nlevels(gapminder$continent)
```

```
## [1] 5
```


```r
levels(gapminder$continent)
```

```
## [1] "Africa"   "Americas" "Asia"     "Europe"   "Oceania"
```


**8. How many countries are represented on each continent?**


```r
gapminder %>% 
  group_by(continent) %>%
  summarize(country_number = n_distinct(country))
```

```
## # A tibble: 5 x 2
##   continent country_number
##   <fct>              <int>
## 1 Africa                52
## 2 Americas              25
## 3 Asia                  33
## 4 Europe                30
## 5 Oceania                2
```


**9. For the years included in the data, what is the mean life expectancy by continent? Arrange the results in descending order.**


```r
gapminder %>% 
  group_by(continent) %>%
  summarize(mean_lifeExp = mean(lifeExp)) %>% 
  arrange(desc(mean_lifeExp))
```

```
## # A tibble: 5 x 2
##   continent mean_lifeExp
##   <fct>            <dbl>
## 1 Oceania           74.3
## 2 Europe            71.9
## 3 Americas          64.7
## 4 Asia              60.1
## 5 Africa            48.9
```


**10. For the years included in the data, how has life expectancy changed in each country between 1952-2007? How does this look in the USA only?**


```r
gapminder %>% 
  group_by(country) %>%
  select(country, year, lifeExp) %>% 
  pivot_wider(names_from = "year",
              values_from = "lifeExp")
```

```
## # A tibble: 142 x 13
## # Groups:   country [142]
##    country `1952` `1957` `1962` `1967` `1972` `1977` `1982` `1987` `1992` `1997`
##    <fct>    <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
##  1 Afghan…   28.8   30.3   32.0   34.0   36.1   38.4   39.9   40.8   41.7   41.8
##  2 Albania   55.2   59.3   64.8   66.2   67.7   68.9   70.4   72     71.6   73.0
##  3 Algeria   43.1   45.7   48.3   51.4   54.5   58.0   61.4   65.8   67.7   69.2
##  4 Angola    30.0   32.0   34     36.0   37.9   39.5   39.9   39.9   40.6   41.0
##  5 Argent…   62.5   64.4   65.1   65.6   67.1   68.5   69.9   70.8   71.9   73.3
##  6 Austra…   69.1   70.3   70.9   71.1   71.9   73.5   74.7   76.3   77.6   78.8
##  7 Austria   66.8   67.5   69.5   70.1   70.6   72.2   73.2   74.9   76.0   77.5
##  8 Bahrain   50.9   53.8   56.9   59.9   63.3   65.6   69.1   70.8   72.6   73.9
##  9 Bangla…   37.5   39.3   41.2   43.5   45.3   46.9   50.0   52.8   56.0   59.4
## 10 Belgium   68     69.2   70.2   70.9   71.4   72.8   73.9   75.4   76.5   77.5
## # … with 132 more rows, and 2 more variables: `2002` <dbl>, `2007` <dbl>
```


```r
gapminder %>% 
  group_by(country) %>%
  select(country, year, lifeExp) %>% 
  filter(country == "United States") %>% 
  pivot_wider(names_from = "year",
              values_from = "lifeExp")
```

```
## # A tibble: 1 x 13
## # Groups:   country [142]
##   country `1952` `1957` `1962` `1967` `1972` `1977` `1982` `1987` `1992` `1997`
##   <fct>    <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
## 1 United…   68.4   69.5   70.2   70.8   71.3   73.4   74.6   75.0   76.1   76.8
## # … with 2 more variables: `2002` <dbl>, `2007` <dbl>
```


**11. In the year 2007, which countries had a life expectancy between 70 and 75 years?**


```r
gapminder %>% 
  group_by(country) %>%
  select(country, year, lifeExp) %>% 
  filter(year == "2007", (between(lifeExp, 70, 75)))
```

```
## # A tibble: 39 x 3
## # Groups:   country [39]
##    country                 year lifeExp
##    <fct>                  <int>   <dbl>
##  1 Algeria                 2007    72.3
##  2 Bosnia and Herzegovina  2007    74.9
##  3 Brazil                  2007    72.4
##  4 Bulgaria                2007    73.0
##  5 China                   2007    73.0
##  6 Colombia                2007    72.9
##  7 Dominican Republic      2007    72.2
##  8 Ecuador                 2007    75.0
##  9 Egypt                   2007    71.3
## 10 El Salvador             2007    71.9
## # … with 29 more rows
```


**10. In 1997, what are the minimum, maximum, and mean life expectancies of the Americas and Europe?**


```r
gapminder %>% 
  filter(continent == "Americas" | continent == "Europe", year == "1997") %>% 
  group_by(continent) %>% 
  summarize(min_lifeExp = min(lifeExp), max_lifeExp = max(lifeExp), mean_lifeExp = mean(lifeExp))
```

```
## # A tibble: 2 x 4
##   continent min_lifeExp max_lifeExp mean_lifeExp
##   <fct>           <dbl>       <dbl>        <dbl>
## 1 Americas         56.7        78.6         71.2
## 2 Europe           68.8        79.4         75.5
```


**12. Which countries had the smallest populations in 1952? How about in 2007?**  


```r
gapminder %>% 
  group_by(country) %>% 
  filter(year == "1952") %>% 
  summarize(min_pop = min(pop)) %>% 
  top_n(-1)
```

```
## Selecting by min_pop
```

```
## # A tibble: 1 x 2
##   country               min_pop
##   <fct>                   <int>
## 1 Sao Tome and Principe   60011
```


```r
gapminder %>% 
  group_by(country) %>% 
  filter(year == "2007") %>% 
  summarize(min_pop = min(pop)) %>% 
  top_n(-1)
```

```
## Selecting by min_pop
```

```
## # A tibble: 1 x 2
##   country               min_pop
##   <fct>                   <int>
## 1 Sao Tome and Principe  199579
```


**13. We are interested in the GDP for countries in the Middle East including all years in the data. First, separate all of the countries on the "Asia" continent. How many countries are listed and what are their names?**


```r
gapminder %>% 
  filter(continent == "Asia") %>% 
  summarize(country_number = n_distinct(country))
```

```
## # A tibble: 1 x 1
##   country_number
##            <int>
## 1             33
```


```r
gapminder_Asia<-
  gapminder %>% 
  filter(continent == "Asia")
gapminder_Asia
```

```
## # A tibble: 396 x 6
##    country     continent  year lifeExp      pop gdpPercap
##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
##  1 Afghanistan Asia       1952    28.8  8425333      779.
##  2 Afghanistan Asia       1957    30.3  9240934      821.
##  3 Afghanistan Asia       1962    32.0 10267083      853.
##  4 Afghanistan Asia       1967    34.0 11537966      836.
##  5 Afghanistan Asia       1972    36.1 13079460      740.
##  6 Afghanistan Asia       1977    38.4 14880372      786.
##  7 Afghanistan Asia       1982    39.9 12881816      978.
##  8 Afghanistan Asia       1987    40.8 13867957      852.
##  9 Afghanistan Asia       1992    41.7 16317921      649.
## 10 Afghanistan Asia       1997    41.8 22227415      635.
## # … with 386 more rows
```


```r
gapminder_Asia %>% 
  count(country, sort = T)
```

```
## # A tibble: 33 x 2
##    country              n
##    <fct>            <int>
##  1 Afghanistan         12
##  2 Bahrain             12
##  3 Bangladesh          12
##  4 Cambodia            12
##  5 China               12
##  6 Hong Kong, China    12
##  7 India               12
##  8 Indonesia           12
##  9 Iran                12
## 10 Iraq                12
## # … with 23 more rows
```


**14. Next, remove all of the countries from this list that are part of the Middle East and put them into a new object `gapminder_middleEast`. Add a new column to the data called "region" and make sure "Middle East" is specified for these countries.**


```r
gapminder_middleEast <-
  gapminder_Asia %>% 
  filter(country %in% c("Bahrain", "Iran", "Iraq", "Israel", "Jordan", "Kuwait", "Lebanon", "Oman", "Saudi Arabia", "Syria", "Yemen, Rep."))%>% 
  mutate(region = "Middle East")
gapminder_middleEast
```

```
## # A tibble: 132 x 7
##    country continent  year lifeExp    pop gdpPercap region     
##    <fct>   <fct>     <int>   <dbl>  <int>     <dbl> <chr>      
##  1 Bahrain Asia       1952    50.9 120447     9867. Middle East
##  2 Bahrain Asia       1957    53.8 138655    11636. Middle East
##  3 Bahrain Asia       1962    56.9 171863    12753. Middle East
##  4 Bahrain Asia       1967    59.9 202182    14805. Middle East
##  5 Bahrain Asia       1972    63.3 230800    18269. Middle East
##  6 Bahrain Asia       1977    65.6 297410    19340. Middle East
##  7 Bahrain Asia       1982    69.1 377967    19211. Middle East
##  8 Bahrain Asia       1987    70.8 454612    18524. Middle East
##  9 Bahrain Asia       1992    72.6 529491    19036. Middle East
## 10 Bahrain Asia       1997    73.9 598561    20292. Middle East
## # … with 122 more rows
```


**15. Now show the gdpPercap for each country with the years as column names; i.e. one row per country.**

```r
gapminder_middleEast %>% 
  select(country, year, gdpPercap) %>% 
  pivot_wider(names_from = "year",
              values_from = "gdpPercap")
```

```
## # A tibble: 11 x 13
##    country `1952` `1957` `1962` `1967` `1972` `1977` `1982` `1987` `1992` `1997`
##    <fct>    <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>  <dbl>
##  1 Bahrain 9.87e3 1.16e4 12753. 14805. 1.83e4 19340. 19211. 18524. 19036. 20292.
##  2 Iran    3.04e3 3.29e3  4187.  5907. 9.61e3 11889.  7608.  6643.  7236.  8264.
##  3 Iraq    4.13e3 6.23e3  8342.  8931. 9.58e3 14688. 14518. 11644.  3746.  3076.
##  4 Israel  4.09e3 5.39e3  7106.  8394. 1.28e4 13307. 15367. 17122. 18052. 20897.
##  5 Jordan  1.55e3 1.89e3  2348.  2742. 2.11e3  2852.  4161.  4449.  3432.  3645.
##  6 Kuwait  1.08e5 1.14e5 95458. 80895. 1.09e5 59265. 31354. 28118. 34933. 40301.
##  7 Lebanon 4.83e3 6.09e3  5715.  6007. 7.49e3  8660.  7641.  5377.  6891.  8755.
##  8 Oman    1.83e3 2.24e3  2925.  4721. 1.06e4 11848. 12955. 18115. 18617. 19702.
##  9 Saudi … 6.46e3 8.16e3 11626. 16903. 2.48e4 34168. 33693. 21198. 24842. 20587.
## 10 Syria   1.64e3 2.12e3  2193.  1882. 2.57e3  3195.  3762.  3117.  3341.  4014.
## 11 Yemen,… 7.82e2 8.05e2   826.   862. 1.27e3  1830.  1978.  1972.  1879.  2117.
## # … with 2 more variables: `2002` <dbl>, `2007` <dbl>
```

