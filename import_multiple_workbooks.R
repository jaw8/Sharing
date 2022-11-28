# Libraries ----
library(readxl)
library(tidyverse)

# Import ----
file_list <- gsub('.xlsx', '',
                       list.files('<path to workbooks>',
                                  pattern = '.xlsx'))

df <- map(file_list,
                 ~ pmap(
                   list(file.path('<path to workbooks>', paste0(.x, '.xlsx')),
                        excel_sheets(file.path('<path to workbooks>', paste0(.x, '.xlsx')
                        ))),
                   ~ read_xlsx(
                     path = ..1,
                     sheet = ..2,
                     col_names = T # set any other desired options
                   )
                 ) %>%
                   `names<-`(excel_sheets(file.path('<path to workbooks>', paste0(.x, '.xlsx')
                   )))) %>%
  `names<-`(file_list)
