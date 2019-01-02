install.packages("dplyr")
install.packages("ggplot2")
install.packages("readxl")
library(readxl)
search2 <- read_excel("03.Search2.xlsx", sheet=1, col_names = T)
custom <- read_excel("04.Custom.xlsx", sheet=1, col_names = T)
library(dplyr)
library(ggplot2)
head(search2)
table(is.na(search2$SESS_DT))
table(is.na(search2$KWD_NM))
table(is.na(search2$SEARCH_CNT))
boxplot(search2$SESS_DT)$stats
boxplot(search2$SEARCH_CNT)$stats
head(custom)
table(is.na(custom$CLNT_ID))
table(is.na(custom$CLNT_GENDER))
table(is.na(custom$CLNT_AGE))
boxplot(custom$CLNT_ID)$stats
boxplot(custom$CLNT_AGE)$stats
custom$CLNT_AGE <- ifelse(custom$CLNT_AGE<20|custom$CLNT_AGE>50, NA, custom$CLNT_AGE)
boxplot(custom$CLNT_AGE)$stats
