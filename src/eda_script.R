# author: Flora Ouedraogo
# date: 2021-11-26

"Performs EDA on the data (from https://www.kaggle.com/rohanrao/formula-1-world-championship-1950-2020?select=pit_stops.csv).

Usage: src/eda_script.R --input=<input> --out_dir=<out_dir>
  
Options:
--input=<input>       Path (including filename) to raw data (feather file)
--out_dir=<out_dir>   Path to directory where the processed data should be written
" -> doc

library(docopt)
library(tidyverse)

opt <- docopt(doc)

main <- function(input, out_dir){
  # This will read the file
  df <- read_csv(filepath)
  
  # Barplot
  df  %>%
    ggplot(aes(x=lap, fill=milliseconds))+
    geom_bar(stat="count", position = "dodge")+
    labs(x = "lap number", y = "Count", title = "Stop time per lap") +
    scale_fill_discrete(name="lap") + # This changes the legend title
    theme_bw(18) + # Change the theme and set the font size
  
  
  ### Save the barplot
  ggsave(filename = "images/barplot.png", device = 'png')
  
  # Proportional bar chart
  df%>% 
    ggplot()+
    geom_bar(mapping = aes(x= stop, fill = milliseconds),
             position = "fill")+
    ylab("Time in milliseconds")+
    xlab("Stop number")+
    ggtitle("Bar plot of stop number along with the time in the pit") +
    theme_bw(20)
  
  ## Save the chart
  ggsave(filename = "images/propbarplot.png", device = 'png')
  
  
}

main(opt[["--input"]], opt[["--out_dir"]])