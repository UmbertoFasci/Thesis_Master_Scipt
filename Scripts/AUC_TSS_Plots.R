library(tidyverse)

AUC_Results <- read.csv("~/Thesis_Master_Final/Thesis_Master_Script/Scripts/AUC_Results.csv")
TSS_Results <- read.csv("~/Thesis_Master_Final/Thesis_Master_Script/Scripts/TSS_Results.csv")

AUC_Results <- data.frame(AUC_Results)
TSS_Results <- data.frame(TSS_Results)

AUC_Plot <- ggplot(data = AUC_Results, aes(x = as.character(Variable.Group), y = Test.AUC)) +
    geom_point(aes(size = Year.Range, shape = Background.Points)) +
    facet_wrap(~Projection) +
    geom_hline(yintercept = 0.8, linetype = 'dashed', color = 'red') +
    geom_jitter()


TSS_Plot <- ggplot(data = TSS_Results, aes(x = as.character(Variable.Group), y = TSS)) +
    geom_point(aes(size = Year.Range, shape = Background.Points)) +
    facet_wrap(~Projection) +
    geom_hline(yintercept = 0.4, linetype = 'dashed', color = 'red') +
    geom_jitter()