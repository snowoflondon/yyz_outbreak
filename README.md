# YYZ Outbreaks
This repository contains the source code for the shiny app `YYZ Outbreaks`, which is hosted on the `shinyapps` server here: https://brianjmpark.shinyapps.io/yyz_outbreaks/.

This app pulls publicly available data posted by Toronto Public Health, hosted on the City of Toronto's data portal: https://open.toronto.ca/dataset/outbreaks-in-toronto-healthcare-institutions/. As per data documentation, the available data range from the years 2016 to present, with features including information on the types of outbreaks, causative agents, health institution names, and the date interval of outbreaks. 

## App

The Shiny app `YYZ Outbreaks` produces a high-level visual summary of the outbreak data as per Toronto Public Health. User can select the year corresponding to the data of interest from 2016 to present in the sidebar's dropdown menu. Upon running the app, it produces 5 visualizations summarizing the duration of the outbreaks, types of outbreaks, causes of outbreaks, and the institutions. It produces a sortable data table which contains key features corresponding to the user-selected year data.

## R dependencies 

* `dplyr`
* `magrittr`
* `lubridate`
* `RColorBrewer`
* `htmltools`
* `DT`
* `shinycssloaders`
* `bslib`
* `plotly`

## R session info
```{r}
R version 4.0.5 (2021-03-31)
Platform: x86_64-apple-darwin17.0 (64-bit)
Running under: macOS Big Sur 11.2.3

Matrix products: default
LAPACK: /Library/Frameworks/R.framework/Versions/4.0/Resources/lib/libRlapack.dylib

locale:
[1] en_CA.UTF-8/en_CA.UTF-8/en_CA.UTF-8/C/en_CA.UTF-8/en_CA.UTF-8

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] rsconnect_0.8.25      RColorBrewer_1.1-2    htmltools_0.5.5      
 [4] forcats_0.5.1         stringr_1.5.0         dplyr_1.1.0          
 [7] purrr_1.0.1           readr_1.4.0           tidyr_1.3.0          
[10] tibble_3.2.0          ggplot2_3.4.1         tidyverse_1.3.1      
[13] bslib_0.4.2           DT_0.26               magrittr_2.0.3       
[16] shinycssloaders_1.0.0 shinythemes_1.2.0     shiny_1.7.4          

loaded via a namespace (and not attached):
 [1] httr_1.4.2          sass_0.4.2          jsonlite_1.7.2     
 [4] modelr_0.1.8        assertthat_0.2.1    askpass_1.1        
 [7] BiocManager_1.30.12 cellranger_1.1.0    yaml_2.2.1         
[10] pillar_1.8.1        backports_1.2.1     glue_1.6.2         
[13] digest_0.6.27       promises_1.2.0.1    rvest_1.0.3        
[16] colorspace_2.0-0    httpuv_1.6.0        pkgconfig_2.0.3    
[19] broom_1.0.3         haven_2.4.1         xtable_1.8-4       
[22] scales_1.2.1        later_1.2.0         openssl_1.4.3      
[25] generics_0.1.0      farver_2.1.0        ellipsis_0.3.1     
[28] cachem_1.0.4        withr_2.5.0         cli_3.6.0          
[31] crayon_1.4.1        readxl_1.3.1        mime_0.10          
[34] memoise_2.0.1       fs_1.6.1            fansi_0.4.2        
[37] xml2_1.3.3          textshaping_0.3.6   tools_4.0.5        
[40] hms_1.0.0           lifecycle_1.0.3     munsell_0.5.0      
[43] reprex_2.0.0        packrat_0.7.0       compiler_4.0.5     
[46] jquerylib_0.1.4     systemfonts_1.0.3   rlang_1.0.6        
[49] grid_4.0.5          rstudioapi_0.13     htmlwidgets_1.5.4  
[52] crosstalk_1.1.1     labeling_0.4.2      gtable_0.3.0       
[55] DBI_1.1.1           curl_4.3            R6_2.5.0           
[58] lubridate_1.8.0     fastmap_1.1.0       utf8_1.2.1         
[61] ragg_1.2.0          stringi_1.5.3       Rcpp_1.0.6         
[64] vctrs_0.5.2         dbplyr_2.1.1        tidyselect_1.2.0 
```

## Data availability

Data is openly available as per the City of Toronto's Open Government License [here](https://open.toronto.ca/dataset/outbreaks-in-toronto-healthcare-institutions/)

## App hosting

This app was deployed to `shinayapps` server using the R package `rsconnect`
