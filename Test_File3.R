An_Mn_Tmp_full_mxst_boxplot <- An_Mn_Tmp_full_mxst %>% 
  ggboxplot(x = "Variable",
  y = "Value",
  xlab = "Annual Mean Temp Variables",
  ylab = "Annual Mean Temperature Values",
  fill = "Variable",
  palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 55)