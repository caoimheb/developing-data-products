#
# This is the user-interface definition for the movie budget investigator app
#

library(shiny)

shinyUI(
      navbarPage("Movie Budget Investigator",
            tabPanel("App",  
                  sidebarPanel(
                        h4("Investigate by Year and Genre"),
                        sliderInput("year", 
                                    "Year:", 
                                    min = 1890, 
                                    max = 2015, 
                                    value = c(1800, 2015),
                                    format="####"),
                        uiOutput("genres"),
                        actionButton(inputId = "clearAll", 
                                     label = "Clear selection", 
                                     icon = icon("square-o")),
                        actionButton(inputId = "selectAll", 
                                     label = "Select all", 
                                     icon = icon("check-square-o"))
                  ),
                  
                    
                  mainPanel(  
                        tabsetPanel(
                           
                              # Data results somehow - something
                              tabPanel("Results / Visualisations",                                        
                                    plotOutput("ratingByBudget", width = "100%"),
                                    plotOutput("budgetByYear", width = "100%")
                                                                     
                              ),
                                 
                              # Data 
                              tabPanel(p(icon("table"), "Data"),
                                    mainPanel(
                                          dataTableOutput("movies_data")
                                    )
                              )
                        )    
                  )
            ),
                 
            tabPanel("Documentation", 
                  mainPanel(
                        includeMarkdown("docs.md")
                  )
            )
      )
)