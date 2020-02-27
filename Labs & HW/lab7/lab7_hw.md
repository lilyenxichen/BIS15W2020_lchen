---
title: "Lab 7 Homework"
author: "Lily Chen"
date: "`2/21/2020`"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for any included code chunks to run.  

## Libraries

```r
library(tidyverse)
library(shiny)
#install.packages("shinydashboard")
library(shinydashboard)
```

## Data
The data for this assignment come from the [University of California Information Center](https://www.universityofcalifornia.edu/infocenter). Admissions data were collected for the years 2010-2019 for each UC campus. Admissions are broken down into three categories: applications, admits, and enrollees. The number of individuals in each category are presented by demographic.  

```r
UC_admit <- readr::read_csv("data/UC_admit.csv")
```

```
## Parsed with column specification:
## cols(
##   Campus = col_character(),
##   Academic_Yr = col_double(),
##   Category = col_character(),
##   Ethnicity = col_character(),
##   `Perc FR` = col_character(),
##   FilteredCountFR = col_double()
## )
```

**1. Use the function(s) of your choice to get an idea of the overall structure of the data frame, including its dimensions, column names, variable classes, etc. As part of this, determine if there are NA's and how they are treated.**  


```r
glimpse(UC_admit)
```

```
## Observations: 2,160
## Variables: 6
## $ Campus          <chr> "Davis", "Davis", "Davis", "Davis", "Davis", "Davis",…
## $ Academic_Yr     <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2018,…
## $ Category        <chr> "Applicants", "Applicants", "Applicants", "Applicants…
## $ Ethnicity       <chr> "International", "Unknown", "White", "Asian", "Chican…
## $ `Perc FR`       <chr> "21.16%", "2.51%", "18.39%", "30.76%", "22.44%", "0.3…
## $ FilteredCountFR <dbl> 16522, 1959, 14360, 24024, 17526, 277, 3425, 78093, 1…
```


```r
UC_admit$Academic_Yr <- as.factor(UC_admit$Academic_Yr)
```



```r
anyNA(UC_admit)
```

```
## [1] TRUE
```


```r
UC_admit %>%
  purrr::map_df(~ sum(is.na(.)))
```

```
## # A tibble: 1 x 6
##   Campus Academic_Yr Category Ethnicity `Perc FR` FilteredCountFR
##    <int>       <int>    <int>     <int>     <int>           <int>
## 1      0           0        0         0         1               1
```


**2. The president of UC has asked you to build a shiny app that shows admissions by ethnicity across all UC campuses. Your app should allow users to explore year, campus, and admit category as interactive variables. Use shiny dashboard and try to incorporate the aesthetics you have learned in ggplot to make the app neat and clean.**


```r
ui <- dashboardPage(
  dashboardHeader(title = "Plot UC Admissions by Ethnicity App"),
  dashboardSidebar(),
  dashboardBody(
  fluidRow(
  box(title = "Plot Options", width = 3,
  selectInput("fill", "Select Fill", choices = c("Campus", "Academic_Yr", "Category"), 
              selected = "Campus"),
  ), # close the first box
  box(title = "Plot of UC Admissions by Ethnicity Data", width = 10,
  plotOutput("plot", width = "1000px", height = "400px")
  ) # close the second box
  ) # close the row
  ) # close the dashboard body
) # close the ui

server <- function(input, output, session) { 
  
  # the code to make the plot of iris data grouped by species
  output$plot <- renderPlot({
      ggplot(UC_admit, aes_string(x = "Ethnicity", y = "FilteredCountFR", fill = input$fill)) + 
      geom_col(position = "dodge") +
      theme(axis.text = element_text(size = 13),
            axis.title = element_text(size = 15, face = "bold"),
            legend.key.size = unit(2,"line")) +
      labs( y = "Count")
      
    
 })
  
  # stop the app when we close it
  session$onSessionEnded(stopApp)
  
  }

shinyApp(ui, server)
```

```
## PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.
```

<!--html_preserve--><div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div><!--/html_preserve-->




**3. Make alternate version of your app above by tracking enrollment at a campus over all of the represented years while allowing users to interact with campus, category, and ethnicity.**


```r
ui <- dashboardPage(
  dashboardHeader(title = "Plot UC Enrollment by Year App"),
  dashboardSidebar(),
  dashboardBody(
  fluidRow(
  box(title = "Plot Options", width = 3,
  selectInput("fill", "Select Fill", choices = c("Campus", "Category", "Ethnicity"), 
              selected = "Campus"),
  ), # close the first box
  box(title = "Plot of UC Enrollment by Year Data", width = 10,
  plotOutput("plot", width = "1200px", height = "400px")
  ) # close the second box
  ) # close the row
  ) # close the dashboard body
) # close the ui

server <- function(input, output, session) { 
  
  # the code to make the plot of iris data grouped by species
  output$plot <- renderPlot({
      ggplot(UC_admit, aes_string(x = "Academic_Yr", y = "FilteredCountFR", fill = input$fill)) + 
      geom_col(position = "dodge") +
      theme(axis.text = element_text(size = 13),
            axis.title = element_text(size = 15, face = "bold"),
            legend.key.size = unit(2,"line")) +
      labs( x = "Academic Year", y = "Count")
    
 })
  
  # stop the app when we close it
  session$onSessionEnded(stopApp)
  
  }

shinyApp(ui, server)
```

<!--html_preserve--><div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div><!--/html_preserve-->




## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences. 
