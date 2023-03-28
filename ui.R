library(shinythemes)
library(shinycssloaders)
library(magrittr)
library(DT)
library(bslib)

yr_choices <- seq(2016, 2023, by = 1)

theme <- bslib::bs_theme(
  bg = "#f4f7f9", fg = "#252e3c",
  primary = "#7da0c1", secondary = "#7da0c1",
  base_font = font_google("Roboto Serif", local = TRUE),
  code_font = c("Courier", "monospace"),
  heading_font = font_google("Roboto Serif", local = TRUE),
  "input-border-color" = "#f1ebdd"
)

fluidPage(
  theme = theme,
  titlePanel('YYZ Outbreaks by snowoflondon',
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
             plotOutput(outputId = 'Plot6') %>%
               shinycssloaders::withSpinner(color = "#0dc5c1")
           ))
  ),
  fluidRow(
    column(width = 12,
           DT::dataTableOutput(outputId = 'Table') %>%
             shinycssloaders::withSpinner(color = "#0dc5c1"))
  )
)