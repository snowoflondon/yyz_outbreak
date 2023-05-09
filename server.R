library(tidyverse)
library(htmltools)
library(DT)
library(RColorBrewer)
library(plotly)

url_list <- list(
  'https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/80ce0bd7-adb2-4568-b9d7-712f6ba38e4e/resource/04e2a0e8-364e-4853-be7c-108771616800/download/ob_report_2016.csv',
  'https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/80ce0bd7-adb2-4568-b9d7-712f6ba38e4e/resource/651987a6-0d9b-460c-bdb1-ae84bf4f382f/download/ob_report_2017.csv',
  'https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/80ce0bd7-adb2-4568-b9d7-712f6ba38e4e/resource/aefb2244-b9f1-417a-b4a9-dd197d89c5b2/download/ob_report_2018.csv',
  'https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/80ce0bd7-adb2-4568-b9d7-712f6ba38e4e/resource/e810c8ab-3bea-469f-97ae-c8d238938b21/download/ob_report_2019.csv',
  'https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/80ce0bd7-adb2-4568-b9d7-712f6ba38e4e/resource/8a3d830f-7783-4b9b-9011-3d78b9125194/download/ob_report_2020.csv',
  'https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/80ce0bd7-adb2-4568-b9d7-712f6ba38e4e/resource/6b805d0c-9c8d-486e-914f-d789edd4e59a/download/ob_report_2021.csv',
  'https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/80ce0bd7-adb2-4568-b9d7-712f6ba38e4e/resource/be1d2d2d-579b-4abb-931c-5a233ecdff49/download/ob_report_2022.csv',
  'https://ckan0.cf.opendata.inter.prod-toronto.ca/dataset/80ce0bd7-adb2-4568-b9d7-712f6ba38e4e/resource/663292d2-3690-4007-96c3-a4a0d308dec3/download/ob_report_2023.csv'
)

mycols <- colorRampPalette(brewer.pal(4, 'Set2'))

server <- function(input, output){
  react_data <- eventReactive(input$buttonSelect, {
    yr_list <- as.list(seq(2016, 2023, by = 1))
    idx <- grep(input$yearSelect, yr_list)
    url <- url_list[[idx]]
    df <- read_csv(url) # fetch data
    validate(need(
      expr = nrow(df) != 0, message = 'File read error! \nCheck documentation for details.'
    )) # check valid URL and file read
    if (idx == 1){
      df <- df %>% rename(`Causative Agent-1` = `Causative Agent`) %>%
        rename(`Causative Agent-2` = `Etiological Agent2`)
    }
    if (idx == 5){
      df <- df %>% rename(`Causative Agent-1` = `Causative Agent - 1`) %>%
        rename(`Causative Agent-2` = `Causative Agent - 2`)
    }
    df <- df %>% mutate(`Duration in Days` = difftime(
      `Date Declared Over`, `Date Outbreak Began`))
    df <- df %>% filter(`Duration in Days` < 365)
    return(df)
  })
  
  output$Plot1 <- renderPlotly({
    p <- ggplot(react_data(), aes(x = fct_infreq(`Type of Outbreak`))) +
        geom_bar(stat = 'count',
                 aes(fill = `Type of Outbreak`), alpha = .8) + 
        theme_minimal() +
        theme(text = element_text(size = 14),
              legend.position = 'none',
              plot.background = element_rect(fill = '#f4f7f9', color = NA)) +
        labs(title = 'Types of Outbreaks') +
        xlab('') + ylab('# of occurrences') +
        scale_fill_manual(values = mycols(length(unique(react_data()$`Type of Outbreak`))))
    p <- ggplotly(p)
    print(p)
  })
  
  output$Plot3 <- renderPlotly({
    p <- ggplot(react_data(), aes(x = as.numeric(`Duration in Days`))) +
        geom_histogram(binwidth = 1, col = 'black') +
        theme_minimal() +
        theme(text = element_text(size = 14),
              plot.background = element_rect(fill = '#f4f7f9', color = NA)) +
        xlab('Duration in Days') +
        ylab('Frequency') +
        labs(title = 'Duration of Outbreak (Days)')
    p <- ggplotly(p)
    print(p)
  })
  
  output$Plot2 <- renderPlotly({
    p <- ggplot(react_data(), aes(x = fct_infreq(`Causative Agent-1`))) +
        geom_bar(stat = 'count', 
                 aes(fill = `Causative Agent-1`), alpha = .8) +
        theme_minimal() +
        theme(text = element_text(size = 14),
              legend.position = 'none',
              axis.text.x = element_text(angle = 90),
              plot.background = element_rect(fill = '#f4f7f9', color = NA)) +
        labs(title = 'Primary Causative Agent') +
        xlab('') + ylab('# of occurrences') +
        scale_fill_manual(values = mycols(length(unique(react_data()$`Causative Agent-1`))))
    p <- ggplotly(p)
    print(p)
  })
  
  output$Plot4 <- renderPlotly({
    p <- ggplot(react_data(), aes(x = fct_infreq(`Outbreak Setting`))) +
        geom_bar(stat = 'count',
                 aes(fill = `Outbreak Setting`), alpha = .8) +
        theme_minimal() +
        theme(text = element_text(size = 14),
              legend.position = 'none',
              axis.text.x = element_text(angle = 90),
              plot.background = element_rect(fill = '#f4f7f9', color = NA)) +
        labs(title = 'Outbreak Settings') +
        xlab('') + ylab('# of occurrences') +
        scale_fill_manual(values = mycols(length(unique(react_data()$`Outbreak Setting`))))
    p <- ggplotly(p)
    print(p)
  })
  
  output$Plot5 <- renderPlotly({
    data <- react_data() %>% group_by(`Causative Agent-1`) %>%
      summarise(avg_duration = mean(`Duration in Days`))
    p <- ggplot(data, 
                aes(x = reorder(`Causative Agent-1`, -avg_duration), y = avg_duration)) +
      geom_segment(aes(x = reorder(`Causative Agent-1`, avg_duration),
                       xend = reorder(`Causative Agent-1`, avg_duration),
                       y = 0, yend = avg_duration)) +
      geom_point(size = 5, color = 'red') + coord_flip() +
      theme_minimal() +
      theme(text = element_text(size = 14),
            plot.background = element_rect(fill = '#f4f7f9', color = NA)) +
      xlab('') + ylab('Mean duration in days') +
      scale_fill_manual(values = mycols(length(unique(data$`Causative Agent-1`))))
    p <- ggplotly(p)
    print(p)
  })
  
  output$Plot6 <- renderPlotly({
    p <- ggplot(react_data(), aes(x = `Causative Agent-1`, y = `Duration in Days`)) +
      geom_boxplot(aes(fill = `Causative Agent-1`), alpha = .6) +
      coord_flip() + geom_point(size = .5) + xlab('') +
      theme_minimal() + theme(legend.position = 'none',
                              text = element_text(size = 14),
                              plot.background = element_rect(fill = '#f4f7f9', color = NA)) +
      scale_fill_manual(values = mycols(length(unique(react_data()$`Causative Agent-1`))))
    p <- ggplotly(p)
    print(p)
  })
  
  output$Table <- DT::renderDataTable(
    caption = htmltools::tags$caption(style = 'caption-side: top;
                                              text-align: center;
                                              color:black;
                                              font-size:150% ;',
                                      'Summary Table'), {
      react_data() %>% dplyr::select(`Institution Name`, `Outbreak Setting`,
                                     `Type of Outbreak`, `Causative Agent-1`,
                                     `Causative Agent-2`, `Date Outbreak Began`,
                                     `Date Declared Over`, `Duration in Days`)
      
    }
  )
}