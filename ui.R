library(shiny)
library(ggplot2)



shinyUI(pageWithSidebar(
      
      #dataset <- women,
      
      headerPanel("Compare Your Weight to the Average"),
      
      sidebarPanel(
            p("Enter Height"),
            textInput('height', '(between 58 and 72 inches):'),
            textInput('weight', 'Enter Weight:', NULL),
            actionButton("Sub", "Submit"),
            br(),
            br(),
            br(),
            h4("User Documentation:"),
            p("This application uses the Women Data Set that comes with R.  This data set gives the average heights and weights of women in America between the ages of 30-39."),
            h5("Step 1: Enter your height in inches"),
            p("Note: The range of acceptable heights is from 58 to 72 inches."),
            br(),
            h5("Step 2: Enter your current weight"),
            p("Note: Your weight must be entered in lbs."),
            br(),
            h5("Step 3: Click the Submit button"),
            p("The application does the comparison."),
            br(),
            h5("Step 4: View the results"),
            p("The application  will tell you whether you are below, equal to or above the average weight for a women of your height."),
            p("The application displays a plot of the data set.  If your weight is in the range of weights on the plot, then a point is displayed showing where your weight compares.")
      ),
      
      mainPanel(

            textOutput('conclusion'),
            plotOutput('base')
            
      

      )
))