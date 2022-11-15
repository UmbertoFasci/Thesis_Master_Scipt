library(tidyverse)
library(ggpubr)


AUC_Results <- read.csv("~/Thesis_Master_Final/Thesis_Master_Script/Scripts/AUC_Results.csv")
TSS_Results <- read.csv("~/Thesis_Master_Final/Thesis_Master_Script/Scripts/TSS_Results.csv")

AUC_Results <- data.frame(AUC_Results)
TSS_Results <- data.frame(TSS_Results)

AUC_Plot <- ggplot(data = AUC_Results, aes(x = as.character(Variable.Group), y = Test.AUC)) +
    geom_point(aes(color = Year.Range, shape = Background.Points, size = 1)) +
    facet_wrap(~Projection) +
    geom_hline(yintercept = 0.8, linetype = 'dashed', color = 'red') +
    xlab("Variable Group") +
    ylab("Test AUC")


TSS_Plot <- ggplot(data = TSS_Results, aes(x = as.character(Variable.Group), y = TSS)) +
    geom_point(aes(color = Year.Range, shape = Background.Points, size = 1)) +
    facet_wrap(~Projection) +
    geom_hline(yintercept = 0.4, linetype = 'dashed', color = 'red') +
    xlab("Variable Group") +
    ylab("TSS")

AUC_TSS_Plot <- ggarrange(AUC_Plot, TSS_Plot, ncol = 1, nrow = 2, common.legend = TRUE, legend = "bottom")