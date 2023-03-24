library(shinythemes)
library(shinycssloaders)
library(magrittr)
library(DT)

yr_choices <- seq(2016, 2023, by = 1)

fluidPage(
  theme = shinytheme('sandstone'),
  titlePanel(div('YYZ Outbreaks by snowoflondon',
                 style = "color: #1c1c1c; font-family:'Avanta Garde"),
             windowTitle = 'YYZ Outbreaks'),
  fluidRow(
    column(width = 2,
           verticalLayout(
             selectInput(inputId = 'yearSelect',
                         label = 'Year Selection',
                         choices = as.list(yr_choices),
                         multiple = FALSE),
             actionButton(inputId = 'buttonSelect',
                          label = 'Visualize',
                          style = "margin-top:5px;")
           )),
    column(width = 5,
           verticalLayout(
             plotOutput(outputId = 'Plot1') %>%
               shinycssloaders::withSpinner(color = "#0dc5c1"),
             plotOutput(outputId = 'Plot2') %>%
               shinycssloaders::withSpinner(color = "#0dc5c1"),
             plotOutput(outputId = 'Plot3') %>%
               shinycssloaders::withSpinner(color = "#0dc5c1"))
           ),
    column(width = 5,
           verticalLayout(
             plotOutput(outputId = 'Plot4') %>%
               shinycssloaders::withSpinner(color = "#0dc5c1"),
             plotOutput(outputId = 'Plot5') %>%
               shinycssloaders::withSpinner(color = "#0dc5c1"),
             DT::dataTableOutput(outputId = 'Table') %>%
               shinycssloaders::withSpinner(color = "#0dc5c1")
           ))
  )
)