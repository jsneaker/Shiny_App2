library(shiny)
library(ggplot2)

shinyServer(
function(input, output) {
      
      #Loads the women data set into the variable dataset
      dataset <- women
     
      #create a vector of acceptable heights 
      v <- c('58', '59', '60', '61', '62','63','64','65','66','67','68','69','70','71','72')
      
      #reactive function to filter the data set based on the input.
      finalDataset <- reactive({
            
                  dataset <- dataset[dataset$height == input$height, ]
                  
      })
            
      #Send the height entered back to the UI
      output$height <- renderText({
            input$Sub
            isolate(paste(input$height))
      })
            
      #Sends the weight entered back to the UI
      output$inputValueW <- renderText({
            input$Sub
            isolate(input$weight)
      })

      #Prepare the conclusion
      output$conclusion <- renderText({
            if(input$Sub > 0 ) {
                  if ((input$height %in% v)) {           
                        if((theWeight() > as.integer(input$weight)) & (!(input$weight == ""))){
                              fs <- paste("Your weight is less than the average of ", theWeight(), " lbs. for your height.")
                        }  else if((theWeight() == as.integer(input$weight)) & (!(input$weight == ""))){
                              fs <- paste("Your weight is exactly the average of ", theWeight(), " lbs. for your height.")
                        } else if((theWeight() < as.integer(input$weight)) & (!(input$weight == ""))){
                              fs <- paste("Your weight is more than the average of ", theWeight(), " lbs. for your height.")
                        }   
                  } else (fs <- "Error: Please enter a height value between 58 and 72.")     
                  
            }      
      })
      
      #Reactive function to get the average weight based on what was entered
      theWeight <- reactive({
            pt <- finalDataset()
            finalWeight <- pt$weight
      })
       
      #Sends the final weight back to the UI
      output$finalWeight <- renderText({
            if(input$Sub > 0) {
            isolate(
                  #w <- theWeight()
                  x <- "ttttttt"
            )
            }      
      })
      
      output$base <- renderPlot({
            
            if(input$Sub > 0) 
                  pl <- plot(women)
                  pl <- points(input$height, input$weight, col = "red")
                  print(pl)
            
      })
#       
#       output$test <- renderText({
#             if(input$Sub > 0) {
#             
#                   tf <- is.integer(theWeight())
#             }  
#             
#       })
#       
#             finalStatement1 <- reactive({
# 
#                   if(is.integer(input$height)){
#                        
#                               if(theWeight() > input$weight){
#                                     fs <- "Your weight is less than the average."
#                               } else {
#                                     fs <- "Your weight exceeds the average for your height."
#                               } 
#                   }else {
#                         fs <- "jgjgjgjg"
#                         #print("jbjb")
#                   }
# 
#             })
#             
#       
#             output$finalStatement <- renderText({
#                   input$Sub
#                   isolate(
#                         fs1 <- finalStatement1()
#                   )      
#             })
#             
#             
#             output$myDataTable <- renderDataTable({
#                   input$Sub
#                   if(is.integer(input$height)){
#                         isolate(
#                         finalDataset()
#                         )
#                   }      
#             })

      
}
)