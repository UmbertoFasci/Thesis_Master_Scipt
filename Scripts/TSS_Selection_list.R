# TSS dataframe lists

TSS_list_1140_ssp126 <- c(TSS_1140_126_1k_var1, TSS_1140_126_10k_var1, TSS_1140_126_1k_var2, TSS_1140_126_10k_var2, TSS_1140_126_1k_var3, TSS_1140_126_10k_var3, TSS_1140_126_1k_var4, TSS_1140_126_10k_var4, TSS_1140_126_1k_var5, TSS_1140_126_10k_var5, TSS_1140_126_1k_var6, TSS_1140_126_10k_var6, TSS_1140_126_1k_var7, TSS_1140_126_10k_var7)
TSS_list_1140_ssp585 <- c(TSS_1140_585_1k_var1, TSS_1140_585_10k_var1, TSS_1140_585_1k_var2, TSS_1140_585_10k_var2, TSS_1140_585_1k_var3, TSS_1140_585_10k_var3, TSS_1140_585_1k_var4, TSS_1140_585_10k_var4, TSS_1140_585_1k_var5, TSS_1140_585_10k_var5, TSS_1140_585_1k_var6, TSS_1140_585_10k_var6, TSS_1140_585_1k_var7, TSS_1140_585_10k_var7)
TSS_list_4170_ssp126 <- c(TSS_4170_126_1k_var1, TSS_4170_126_10k_var1, TSS_4170_126_1k_var2, TSS_4170_126_10k_var2, TSS_4170_126_1k_var3, TSS_4170_126_10k_var3, TSS_4170_126_1k_var4, TSS_4170_126_10k_var4, TSS_4170_126_1k_var5, TSS_4170_126_10k_var5, TSS_4170_126_1k_var6, TSS_4170_126_10k_var6, TSS_4170_126_1k_var7, TSS_4170_126_10k_var7)
TSS_list_4170_ssp585 <- c(TSS_4170_585_1k_var1, TSS_4170_585_10k_var1, TSS_4170_585_1k_var2, TSS_4170_585_10k_var2, TSS_4170_585_1k_var3, TSS_4170_585_10k_var3, TSS_4170_585_1k_var4, TSS_4170_585_10k_var4, TSS_4170_585_1k_var5, TSS_4170_585_10k_var5, TSS_4170_585_1k_var6, TSS_4170_585_10k_var6, TSS_4170_585_1k_var7, TSS_4170_585_10k_var7)


# TSS selection function, select TSS values over 0.4

tss_select <- function(x){
  x %>%
  filter(. >= 0.4)
  return(x)
}

# Map function to all lists

library(purrr)
TSS_Select_1140_ssp126 <- map(TSS_list_1140_ssp126, ~tss_select(.))
TSS_Select_1140_ssp585 <- map(TSS_list_1140_ssp585, ~tss_select(.))
TSS_Select_4170_ssp126 <- map(TSS_list_4170_ssp126, ~tss_select(.))
TSS_Select_4170_ssp585 <- map(TSS_list_4170_ssp585, ~tss_select(.))