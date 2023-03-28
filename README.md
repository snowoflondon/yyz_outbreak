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
 [1] rsconnect_0.8.25      htmltools_0.5.3       RColorBrewer_1.1-2   
 [4] DT_0.26               plotly_4.9.3          magrittr_2.0.3       
 [7] shinycssloaders_1.0.0 shinythemes_1.2.0     shiny_1.6.0          
[10] rvest_1.0.3           forcats_0.5.1         stringr_1.5.0        
[13] dplyr_1.1.0           purrr_1.0.1           readr_1.4.0          
[16] tidyr_1.3.0           tibble_3.2.0          ggplot2_3.4.1        
[19] tidyverse_1.3.1      

loaded via a namespace (and not attached):
 [1] httr_1.4.2          sass_0.4.2          jsonlite_1.7.2      viridisLite_0.4.0  
 [5] modelr_0.1.8        bslib_0.4.0         assertthat_0.2.1    askpass_1.1        
 [9] BiocManager_1.30.12 cellranger_1.1.0    yaml_2.2.1          pillar_1.8.1       
[13] backports_1.2.1     glue_1.6.2          digest_0.6.27       promises_1.2.0.1   
[17] colorspace_2.0-0    httpuv_1.6.0        pkgconfig_2.0.3     broom_1.0.3        
[21] haven_2.4.1         xtable_1.8-4        scales_1.2.1        later_1.2.0        
[25] openssl_1.4.3       farver_2.1.0        generics_0.1.0      ellipsis_0.3.1     
[29] cachem_1.0.4        withr_2.5.0         lazyeval_0.2.2      cli_3.6.0          
[33] crayon_1.4.1        readxl_1.3.1        mime_0.10           memoise_2.0.0      
[37] evaluate_0.20       fs_1.6.1            fansi_0.4.2         xml2_1.3.3         
[41] tools_4.0.5         data.table_1.14.0   hms_1.0.0           lifecycle_1.0.3    
[45] munsell_0.5.0       reprex_2.0.0        packrat_0.7.0       compiler_4.0.5     
[49] jquerylib_0.1.4     rlang_1.0.6         grid_4.0.5          rstudioapi_0.13    
[53] htmlwidgets_1.5.4   crosstalk_1.1.1     labeling_0.4.2      rmarkdown_2.16     
[57] gtable_0.3.0        DBI_1.1.1           curl_4.3            R6_2.5.0           
[61] lubridate_1.8.0     knitr_1.42          fastmap_1.1.0       utf8_1.2.1         
[65] stringi_1.5.3       Rcpp_1.0.6          vctrs_0.5.2         dbplyr_2.1.1       
[69] tidyselect_1.2.0    xfun_0.37     
```

## Data availability

Data is openly available as per the City of Toronto's Open Government License [here](https://open.toronto.ca/dataset/outbreaks-in-toronto-healthcare-institutions/)

## App hosting

This app was deployed to `shinayapps` server using the R package `rsconnect`
