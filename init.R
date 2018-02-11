# init.R
#
# Example R code to install packages if not already installed
#

my_packages = c("shinythemes","shinydashboard","lubridate","ggplot2","dygraphs","xts","data.table","DT","quanteda","LDAvis","stringr","stringi","gdata","plyr","dplyr","topicmodels","tm","wordcloud","memoise","RColorBrewer","metricsgraphics","htmlwidgets","bit64","shinyBS","tidytext")

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p, dependencies = TRUE)
  }
}

invisible(sapply(my_packages, install_if_missing))
