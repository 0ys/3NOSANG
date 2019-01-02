install.packages("dplyr")
install.packages("ggplot2")
install.packages("readxl")
library(readxl)
search2 <- read_excel("03.Search2.xlsx", sheet=1, col_names = T)
custom <- read_excel("04.Custom.xlsx", sheet=1, col_names = T)
library(dplyr)
library(ggplot2)
#search2 결측치확인
head(search2)
table(is.na(search2$SESS_DT))
table(is.na(search2$KWD_NM))
table(is.na(search2$SEARCH_CNT))
#search2 이상치확인 
boxplot(search2$SESS_DT)$stats
boxplot(search2$SEARCH_CNT)$stats #이상치해결안함: 검색건수이기 때문에 이상치가 중요한 데이터
table(search2$SEARCH_CNT)
#custom 결측치확인 
head(custom)
table(is.na(custom$CLNT_ID))
table(is.na(custom$CLNT_GENDER))
table(is.na(custom$CLNT_AGE))
#custom 이상치확인 
boxplot(custom$CLNT_ID)$stats
table(custom$CLNT_GENDER)
boxplot(custom$CLNT_AGE)$stats
#custom의 CLNT_AGE 이상치를 결측치로 바꿈 
custom$CLNT_AGE <- ifelse(custom$CLNT_AGE<20|custom$CLNT_AGE>50, NA, custom$CLNT_AGE)
boxplot(custom$CLNT_AGE)$stats
table(is.na(custom$CLNT_AGE))
