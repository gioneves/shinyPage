library(shiny)
library(webr)

ui <- fluidPage(

  sliderInput(
    inputId = "slider1",
    label = "Drag:",
    value = 50,
    min = 0,
    max = 100
  ),

  htmlOutput(outputId = "test"),

  HTML(
    "<head>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/echarts/5.5.0/echarts.min.js'></script>
    </head>

    <div id='myChartDiv' style='width: 550px; height: 600px;'></div>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
    const myChartUse = echarts.init(document.getElementById('myChartDiv'));
    const option = {
      series:[{
      type: 'gauge',
      min: 0,
      max: 100,
      splitNumber: 10,
      data: [{value: 20}, {value: 78}]
      }]
    };
    myChartUse.setOption(option);
    })
    </script>"
  )

)

server <- function(input, output, session) {

  output$test <- renderText({

    HTML(paste0("<div style='color: red;'>", input$slider1, "</div>"))

  })

}

shinyApp(ui, server)
