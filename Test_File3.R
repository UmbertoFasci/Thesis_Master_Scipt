colnames(An_Mn_Tmp_full_mxst) <- c("(2011-2040) ssp126", "(2011-2040) ssp585",
                                   "(2041-2070) ssp126", "(2041-2070) ssp585")

An_Mn_Tmp_full_mxst <- An_Mn_Tmp_full_mxst %>%
  pivot_longer(everything(), names_to = "Variable", values_to = "Value")

An_Mn_Tmp_full_mxst_boxplot <- An_Mn_Tmp_full_mxst %>% 
  ggboxplot(x = "Variable",
  y = "Value",
  xlab = "Annual Mean Temp Variables",
  ylab = "Annual Mean Temperature Values",
  fill = "Variable",
  palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = list(c('(2011-2040) ssp126',
                                          '(2011-2040) ssp585'),
                                        c('(2011-2040) ssp585',
                                          '(2041-2070) ssp126'),
                                        c('(2041-2070) ssp126',
                                          '(2041-2070) ssp585'),
                                        c('(2011-2040) ssp126',
                                          '(2041-2070) ssp126'),
                                        c('(2011-2040) ssp585',
                                          '(2041-2070) ssp585'),
                                        c('(2011-2040) ssp126',
                                          '(2041-2070) ssp585')),
                     label = "p.signif", hide.ns = FALSE) +
  stat_compare_means(label.y = 50)