---
title: "Lab 4 Homework"
author: "Lily Chen"
date: "1/31/2020"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove any `#` for included code chunks to run.  

## Load the tidyverse

```r
library(tidyverse)
```

For this assignment we are going to work with a large dataset from the [United Nations Food and Agriculture Organization](http://www.fao.org/about/en/) on world fisheries. First, load the data.  

1. Load the data `FAO_1950to2012_111914.csv` as a new object titled `fisheries`.


```r
fisheries <- readr::read_csv("data/FAO_1950to2012_111914.csv")
```

```
## Parsed with column specification:
## cols(
##   .default = col_character(),
##   `ISSCAAP group#` = col_double(),
##   `FAO major fishing area` = col_double()
## )
```

```
## See spec(...) for full column specifications.
```


2. What are the names of the columns? Do you see any potential problems with the column names?

```r
names(fisheries)
```

```
##  [1] "Country"                 "Common name"            
##  [3] "ISSCAAP group#"          "ISSCAAP taxonomic group"
##  [5] "ASFIS species#"          "ASFIS species name"     
##  [7] "FAO major fishing area"  "Measure"                
##  [9] "1950"                    "1951"                   
## [11] "1952"                    "1953"                   
## [13] "1954"                    "1955"                   
## [15] "1956"                    "1957"                   
## [17] "1958"                    "1959"                   
## [19] "1960"                    "1961"                   
## [21] "1962"                    "1963"                   
## [23] "1964"                    "1965"                   
## [25] "1966"                    "1967"                   
## [27] "1968"                    "1969"                   
## [29] "1970"                    "1971"                   
## [31] "1972"                    "1973"                   
## [33] "1974"                    "1975"                   
## [35] "1976"                    "1977"                   
## [37] "1978"                    "1979"                   
## [39] "1980"                    "1981"                   
## [41] "1982"                    "1983"                   
## [43] "1984"                    "1985"                   
## [45] "1986"                    "1987"                   
## [47] "1988"                    "1989"                   
## [49] "1990"                    "1991"                   
## [51] "1992"                    "1993"                   
## [53] "1994"                    "1995"                   
## [55] "1996"                    "1997"                   
## [57] "1998"                    "1999"                   
## [59] "2000"                    "2001"                   
## [61] "2002"                    "2003"                   
## [63] "2004"                    "2005"                   
## [65] "2006"                    "2007"                   
## [67] "2008"                    "2009"                   
## [69] "2010"                    "2011"                   
## [71] "2012"
```

There are values in the names.

3. What is the structure of the data? Show the classes of each variable.

```r
sapply(fisheries, class)
```

```
##                 Country             Common name          ISSCAAP group# 
##             "character"             "character"               "numeric" 
## ISSCAAP taxonomic group          ASFIS species#      ASFIS species name 
##             "character"             "character"             "character" 
##  FAO major fishing area                 Measure                    1950 
##               "numeric"             "character"             "character" 
##                    1951                    1952                    1953 
##             "character"             "character"             "character" 
##                    1954                    1955                    1956 
##             "character"             "character"             "character" 
##                    1957                    1958                    1959 
##             "character"             "character"             "character" 
##                    1960                    1961                    1962 
##             "character"             "character"             "character" 
##                    1963                    1964                    1965 
##             "character"             "character"             "character" 
##                    1966                    1967                    1968 
##             "character"             "character"             "character" 
##                    1969                    1970                    1971 
##             "character"             "character"             "character" 
##                    1972                    1973                    1974 
##             "character"             "character"             "character" 
##                    1975                    1976                    1977 
##             "character"             "character"             "character" 
##                    1978                    1979                    1980 
##             "character"             "character"             "character" 
##                    1981                    1982                    1983 
##             "character"             "character"             "character" 
##                    1984                    1985                    1986 
##             "character"             "character"             "character" 
##                    1987                    1988                    1989 
##             "character"             "character"             "character" 
##                    1990                    1991                    1992 
##             "character"             "character"             "character" 
##                    1993                    1994                    1995 
##             "character"             "character"             "character" 
##                    1996                    1997                    1998 
##             "character"             "character"             "character" 
##                    1999                    2000                    2001 
##             "character"             "character"             "character" 
##                    2002                    2003                    2004 
##             "character"             "character"             "character" 
##                    2005                    2006                    2007 
##             "character"             "character"             "character" 
##                    2008                    2009                    2010 
##             "character"             "character"             "character" 
##                    2011                    2012 
##             "character"             "character"
```



4. Think about the classes. Will any present problems? Make any changes you think are necessary below.

```r
fisheries <- fisheries %>% 
  mutate_at(vars(starts_with("19")), as.numeric) %>% 
  mutate_at(vars(starts_with("2")), as.numeric) %>% 
  mutate_if(is.character, as.factor)
```

```
## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion

## Warning: NAs introduced by coercion
```



```r
sapply(fisheries, class)
```

```
##                 Country             Common name          ISSCAAP group# 
##                "factor"                "factor"               "numeric" 
## ISSCAAP taxonomic group          ASFIS species#      ASFIS species name 
##                "factor"                "factor"                "factor" 
##  FAO major fishing area                 Measure                    1950 
##               "numeric"                "factor"               "numeric" 
##                    1951                    1952                    1953 
##               "numeric"               "numeric"               "numeric" 
##                    1954                    1955                    1956 
##               "numeric"               "numeric"               "numeric" 
##                    1957                    1958                    1959 
##               "numeric"               "numeric"               "numeric" 
##                    1960                    1961                    1962 
##               "numeric"               "numeric"               "numeric" 
##                    1963                    1964                    1965 
##               "numeric"               "numeric"               "numeric" 
##                    1966                    1967                    1968 
##               "numeric"               "numeric"               "numeric" 
##                    1969                    1970                    1971 
##               "numeric"               "numeric"               "numeric" 
##                    1972                    1973                    1974 
##               "numeric"               "numeric"               "numeric" 
##                    1975                    1976                    1977 
##               "numeric"               "numeric"               "numeric" 
##                    1978                    1979                    1980 
##               "numeric"               "numeric"               "numeric" 
##                    1981                    1982                    1983 
##               "numeric"               "numeric"               "numeric" 
##                    1984                    1985                    1986 
##               "numeric"               "numeric"               "numeric" 
##                    1987                    1988                    1989 
##               "numeric"               "numeric"               "numeric" 
##                    1990                    1991                    1992 
##               "numeric"               "numeric"               "numeric" 
##                    1993                    1994                    1995 
##               "numeric"               "numeric"               "numeric" 
##                    1996                    1997                    1998 
##               "numeric"               "numeric"               "numeric" 
##                    1999                    2000                    2001 
##               "numeric"               "numeric"               "numeric" 
##                    2002                    2003                    2004 
##               "numeric"               "numeric"               "numeric" 
##                    2005                    2006                    2007 
##               "numeric"               "numeric"               "numeric" 
##                    2008                    2009                    2010 
##               "numeric"               "numeric"               "numeric" 
##                    2011                    2012 
##               "numeric"               "numeric"
```

5. How many countries are represented in the data? Provide a count.

```r
fisheries %>% 
  summarise(n_Country = n_distinct(Country))
```

```
## # A tibble: 1 x 1
##   n_Country
##       <int>
## 1       204
```


6. What are the names of the countries?

```r
levels(fisheries$Country)
```

```
##   [1] "Albania"                   "Algeria"                  
##   [3] "American Samoa"            "Angola"                   
##   [5] "Anguilla"                  "Antigua and Barbuda"      
##   [7] "Argentina"                 "Aruba"                    
##   [9] "Australia"                 "Bahamas"                  
##  [11] "Bahrain"                   "Bangladesh"               
##  [13] "Barbados"                  "Belgium"                  
##  [15] "Belize"                    "Benin"                    
##  [17] "Bermuda"                   "Bonaire/S.Eustatius/Saba" 
##  [19] "Bosnia and Herzegovina"    "Brazil"                   
##  [21] "British Indian Ocean Ter"  "British Virgin Islands"   
##  [23] "Brunei Darussalam"         "Bulgaria"                 
##  [25] "Cabo Verde"                "Cambodia"                 
##  [27] "Cameroon"                  "Canada"                   
##  [29] "Cayman Islands"            "Channel Islands"          
##  [31] "Chile"                     "China"                    
##  [33] "China, Hong Kong SAR"      "China, Macao SAR"         
##  [35] "Colombia"                  "Comoros"                  
##  [37] "Congo, Dem. Rep. of the"   "Congo, Republic of"       
##  [39] "Cook Islands"              "Costa Rica"               
##  [41] "Croatia"                   "Cuba"                     
##  [43] "Cura\xe7ao"                "Cyprus"                   
##  [45] "C\xf4te d'Ivoire"          "Denmark"                  
##  [47] "Djibouti"                  "Dominica"                 
##  [49] "Dominican Republic"        "Ecuador"                  
##  [51] "Egypt"                     "El Salvador"              
##  [53] "Equatorial Guinea"         "Eritrea"                  
##  [55] "Estonia"                   "Ethiopia"                 
##  [57] "Falkland Is.(Malvinas)"    "Faroe Islands"            
##  [59] "Fiji, Republic of"         "Finland"                  
##  [61] "France"                    "French Guiana"            
##  [63] "French Polynesia"          "French Southern Terr"     
##  [65] "Gabon"                     "Gambia"                   
##  [67] "Georgia"                   "Germany"                  
##  [69] "Ghana"                     "Gibraltar"                
##  [71] "Greece"                    "Greenland"                
##  [73] "Grenada"                   "Guadeloupe"               
##  [75] "Guam"                      "Guatemala"                
##  [77] "Guinea"                    "GuineaBissau"             
##  [79] "Guyana"                    "Haiti"                    
##  [81] "Honduras"                  "Iceland"                  
##  [83] "India"                     "Indonesia"                
##  [85] "Iran (Islamic Rep. of)"    "Iraq"                     
##  [87] "Ireland"                   "Isle of Man"              
##  [89] "Israel"                    "Italy"                    
##  [91] "Jamaica"                   "Japan"                    
##  [93] "Jordan"                    "Kenya"                    
##  [95] "Kiribati"                  "Korea, Dem. People's Rep" 
##  [97] "Korea, Republic of"        "Kuwait"                   
##  [99] "Latvia"                    "Lebanon"                  
## [101] "Liberia"                   "Libya"                    
## [103] "Lithuania"                 "Madagascar"               
## [105] "Malaysia"                  "Maldives"                 
## [107] "Malta"                     "Marshall Islands"         
## [109] "Martinique"                "Mauritania"               
## [111] "Mauritius"                 "Mayotte"                  
## [113] "Mexico"                    "Micronesia, Fed.States of"
## [115] "Monaco"                    "Montenegro"               
## [117] "Montserrat"                "Morocco"                  
## [119] "Mozambique"                "Myanmar"                  
## [121] "Namibia"                   "Nauru"                    
## [123] "Netherlands"               "Netherlands Antilles"     
## [125] "New Caledonia"             "New Zealand"              
## [127] "Nicaragua"                 "Nigeria"                  
## [129] "Niue"                      "Norfolk Island"           
## [131] "Northern Mariana Is."      "Norway"                   
## [133] "Oman"                      "Other nei"                
## [135] "Pakistan"                  "Palau"                    
## [137] "Palestine, Occupied Tr."   "Panama"                   
## [139] "Papua New Guinea"          "Peru"                     
## [141] "Philippines"               "Pitcairn Islands"         
## [143] "Poland"                    "Portugal"                 
## [145] "Puerto Rico"               "Qatar"                    
## [147] "Romania"                   "Russian Federation"       
## [149] "R\xe9union"                "Saint Barth\xe9lemy"      
## [151] "Saint Helena"              "Saint Kitts and Nevis"    
## [153] "Saint Lucia"               "Saint Vincent/Grenadines" 
## [155] "SaintMartin"               "Samoa"                    
## [157] "Sao Tome and Principe"     "Saudi Arabia"             
## [159] "Senegal"                   "Serbia and Montenegro"    
## [161] "Seychelles"                "Sierra Leone"             
## [163] "Singapore"                 "Sint Maarten"             
## [165] "Slovenia"                  "Solomon Islands"          
## [167] "Somalia"                   "South Africa"             
## [169] "Spain"                     "Sri Lanka"                
## [171] "St. Pierre and Miquelon"   "Sudan"                    
## [173] "Sudan (former)"            "Suriname"                 
## [175] "Svalbard and Jan Mayen"    "Sweden"                   
## [177] "Syrian Arab Republic"      "Taiwan Province of China" 
## [179] "Tanzania, United Rep. of"  "Thailand"                 
## [181] "TimorLeste"                "Togo"                     
## [183] "Tokelau"                   "Tonga"                    
## [185] "Trinidad and Tobago"       "Tunisia"                  
## [187] "Turkey"                    "Turks and Caicos Is."     
## [189] "Tuvalu"                    "Ukraine"                  
## [191] "Un. Sov. Soc. Rep."        "United Arab Emirates"     
## [193] "United Kingdom"            "United States of America" 
## [195] "Uruguay"                   "US Virgin Islands"        
## [197] "Vanuatu"                   "Venezuela, Boliv Rep of"  
## [199] "Viet Nam"                  "Wallis and Futuna Is."    
## [201] "Western Sahara"            "Yemen"                    
## [203] "Yugoslavia SFR"            "Zanzibar"
```


7. Use `rename()` to rename the columns and make them easier to use. The new column names should be:  
+ country
+ commname
+ ASFIS_sciname
+ ASFIS_spcode
+ ISSCAAP_spgroup
+ ISSCAAP_spgroupname
+ FAO_area
+ unit

```r
names(fisheries) <- str_replace_all(names(fisheries), c(" " = "_", "#" = "n"))
```


```r
fisheries2 <-
fisheries %>% 
  dplyr::rename(
    country=Country,
    commname=Common_name,
    ASFIS_sciname=ASFIS_species_name,
    ASFIS_spcode=ASFIS_speciesn,
    ISSCAAP_sbgroup=ISSCAAP_groupn,
    ISSCAAP_spgroupname=ISSCAAP_taxonomic_group,     
    FAO_area=FAO_major_fishing_area,
    unit=Measure
  )
```

8. Are these data tidy? Why or why not, and, how do you know? Use the appropriate pivot function to tidy the data. Remove the NA's. Put the tidy data frame into a new object `fisheries_tidy`. 

Measurements of years are values, which are not supposed to be in the coloumn. 


```r
fisheries_tidy <-
  fisheries2 %>% 
  pivot_longer(
    '1950':'2012',
    names_to = "year",
    values_to = "catch",
    values_drop_na = "TRUE"
  )
```


9. Refocus the data only to include country, ISSCAAP_spgroupname, ASFIS_spcode, ASFIS_sciname, year, and catch.

```r
fisheries_tidy2 <-
  fisheries_tidy %>%
  select(country, ISSCAAP_spgroupname, ASFIS_spcode, ASFIS_sciname, year, catch)
```


10. Re-check the classes of `fisheries_tidy2`. Notice that "catch" is shown as a character! This is a problem because we will want to treat it as a numeric. How will you deal with this?

```r
sapply(fisheries_tidy2, class)
```

```
##             country ISSCAAP_spgroupname        ASFIS_spcode       ASFIS_sciname 
##            "factor"            "factor"            "factor"            "factor" 
##                year               catch 
##         "character"           "numeric"
```



```r
fisheries_tidy2$catch <- as.numeric(fisheries_tidy2$catch)
class(fisheries_tidy2$catch)
```

```
## [1] "numeric"
```


```r
fisheries_tidy2$year <- as.numeric(fisheries_tidy2$year)
class(fisheries_tidy2$year)
```

```
## [1] "numeric"
```


11. Based on the ASFIS_spcode, how many distinct taxa were caught as part of these data?

```r
fisheries_tidy2 %>% 
  summarise(n_taxa=n_distinct(ASFIS_spcode))
```

```
## # A tibble: 1 x 1
##   n_taxa
##    <int>
## 1   1530
```



12. Which country had the largest overall catch in the year 2000?

```r
fisheries_tidy2 %>% 
  filter(year == "2000") %>%
  group_by(country) %>% 
  summarise(overall_catch = sum(catch, na.rm = TRUE)) %>% 
  arrange(desc(overall_catch))
```

```
## # A tibble: 173 x 2
##    country                  overall_catch
##    <fct>                            <dbl>
##  1 Peru                          10625010
##  2 Japan                          4921013
##  3 United States of America       4692229
##  4 Chile                          4297928
##  5 Indonesia                      3761769
##  6 Russian Federation             3678828
##  7 Thailand                       2795719
##  8 India                          2760632
##  9 Norway                         2698506
## 10 Iceland                        1982369
## # … with 163 more rows
```

Peru has the largest overall catch in 2000.


13. Which country caught the most sardines (_Sardina_) between the years 1990-2000?

```r
fisheries_tidy2 %>% 
  filter(between(year, 1990, 2000), grepl('Sardina', ASFIS_sciname)) %>% 
  group_by(country) %>% 
  summarise(max_sarines = max(catch)) %>% 
  arrange(desc(max_sarines))
```

```
## # A tibble: 36 x 2
##    country            max_sarines
##    <fct>                    <dbl>
##  1 Morocco                 556152
##  2 Russian Federation      356203
##  3 Ukraine                 185261
##  4 Spain                   132912
##  5 Portugal                 94468
##  6 Algeria                  58989
##  7 Denmark                  53394
##  8 Lithuania                47569
##  9 Latvia                   45442
## 10 Italy                    42169
## # … with 26 more rows
```

Morocco caught the most sardines.

14. Which five countries caught the most cephalopods between 2008-2012?

```r
fisheries_tidy2 %>% 
  filter(between(year, 2008, 2012), ASFIS_sciname == "Cephalopoda") %>% 
  group_by(country) %>% 
  summarise(overall_catch3 = sum(catch, na.rm = TRUE)) %>% 
  arrange(desc(overall_catch3)) %>% 
  top_n(5)
```

```
## Selecting by overall_catch3
```

```
## # A tibble: 5 x 2
##   country    overall_catch3
##   <fct>               <dbl>
## 1 India              429670
## 2 China              268557
## 3 Cambodia            15505
## 4 Madagascar           7971
## 5 Mozambique           6511
```


15. Given the top five countries from question 12 above, which species was the highest catch total? The lowest?

```r
fisheries_tidy2 %>% 
  filter(country %in% c("Peru", "Japan", "United States of America", "Chile",	"Indonesia")) %>% 
  group_by(ASFIS_sciname) %>% 
  summarise(highest_catch = sum(catch, na.rm = TRUE)) %>% 
  arrange(desc(highest_catch))
```

```
## # A tibble: 610 x 2
##    ASFIS_sciname           highest_catch
##    <fct>                           <dbl>
##  1 Engraulis ringens           324345771
##  2 Theragra chalcogramma        93211535
##  3 Sardinops sagax              70819587
##  4 Trachurus murphyi            69379782
##  5 Sardinops melanostictus      62013941
##  6 Osteichthyes                 51000628
##  7 Scomber japonicus            49791275
##  8 Brevoortia patronus          33511931
##  9 Katsuwonus pelamis           28740322
## 10 Brevoortia tyrannus          20632049
## # … with 600 more rows
```

Engraulis ringens have the highest catch total.


```r
fisheries_tidy2 %>% 
  filter(country %in% c("Peru", "Japan", "United States of America", "Chile",	"Indonesia")) %>% 
  group_by(ASFIS_sciname) %>% 
  summarise(highest_catch = sum(catch)) %>% 
  arrange(highest_catch)
```

```
## # A tibble: 610 x 2
##    ASFIS_sciname              highest_catch
##    <fct>                              <dbl>
##  1 Merluccius polli                       1
##  2 Muraenolepis spp                       1
##  3 Thyrsitops lepidopoides                1
##  4 Carcharhinus falciformis               2
##  5 Chionodraco rastrospinosus             2
##  6 Epinephelus guttatus                   2
##  7 Notothenia neglecta                    2
##  8 Salmo salar                            2
##  9 Hydrolagus colliei                     3
## 10 Peprilus spp                           3
## # … with 600 more rows
```

Merluccius polli, Muraenolepis spp qnd Thyrsitops lepidopoides have the lowest catch.

16. In some cases, the taxonomy of the fish being caught is unclear. Make a new data frame called `coastal_fish` that shows the taxonomic composition of "Miscellaneous coastal fishes" within the ISSCAAP_spgroupname column.

```r
coastal_fish <-
  fisheries_tidy2 %>% 
  filter(ISSCAAP_spgroupname == "Miscellaneous coastal fishes")
```


17. Use the data to do at least one exploratory analysis of your choice. What can you learn?

```r
fisheries_tidy2 %>% 
  group_by(year) %>% 
  summarise(yr_catch = sum(catch, na.rm = TRUE)) %>% 
  arrange(desc(yr_catch))
```

```
## # A tibble: 63 x 2
##     year yr_catch
##    <dbl>    <dbl>
##  1  1996 85704181
##  2  1995 83937823
##  3  1994 83577812
##  4  2011 80330815
##  5  1989 79990457
##  6  2007 79670914
##  7  1988 79146785
##  8  2008 78411013
##  9  2009 77932780
## 10  1993 77749960
## # … with 53 more rows
```

I learn that the the world's annual catch amount is the highest in 1996 comparing to other year.

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   
