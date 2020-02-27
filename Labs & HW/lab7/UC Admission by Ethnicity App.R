

if (!require("tidyverse")) install.packages('tidyverse')
if (!require("shiny")) install.packages('shiny')
if (!require("shinydashboard")) install.packages('shinydashboard')

library("tidyverse")
library("shiny")
library("shinydashboard")

UC_admit <- readr::read_csv("data/UC_admit.csv")


ui <- dashboardPage(
  dashboardHeader(title = "Plot UC Admissions by Ethnicity App"),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(title = "Plot Options", width = 3,
          selectInput("fill", "Select Fill", choices = c("Campus", "Academic_Yr", "Category"), 
                      selected = "Campus"),
      ), 
      box(title = "Plot of UC Admissions by Ethnicity Data", width = 10,
          plotOutput("plot", width = "1000px", height = "400px")
      ) 
    ) 
  ) 
) 

server <- function(input, output, session) { 
  
  
  output$plot <- renderPlot({
    ggplot(UC_admit, aes_string(x = "Ethnicity", y = "FilteredCountFR", fill = input$fill)) + 
      geom_col(position = "dodge") +
      theme(axis.text = element_text(size = 13),
            axis.title = element_text(size = 15, face = "bold"),
            legend.key.size = unit(2,"line")) +
      labs( y = "Count")
    
    
  })
  
  
  session$onSessionEnded(stopApp)
  
}

shinyApp(ui, server)
