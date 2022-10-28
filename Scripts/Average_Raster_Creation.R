library(raster)
library(tidyverse)

# 2011-2040 ssp126
MRIESM2_1140_126_10k_var6_ras <- raster("~/umbertofasci/B_Dendrobatidis_Models/MRIESM2_1140/ssp126/MRIESM2_1140_ssp126_10k_vargroup6/Batrachochytrium_dendrobatidis.asc")
MRIESM2_1140_126_1k_var1_ras <- raster("~/umbertofasci/B_Dendrobatidis_Models/MRIESM2_1140/ssp126/MRIESM2_1140_ssp126_1k_vargroup1/Batrachochytrium_dendrobatidis.asc")
MRIESM2_1140_126_1k_var5_ras <- raster("~/umbertofasci/B_Dendrobatidis_Models/MRIESM2_1140/ssp126/MRIESM2_1140_ssp126_1k_vargroup5/Batrachochytrium_dendrobatidis.asc")

# 2011-2040 ssp858
MRIESM2_1140_585_10k_var6_ras <- raster("~/umbertofasci/B_Dendrobatidis_Models/MRIESM2_1140/ssp585/MRIESM2_1140_ssp585_10k_vargroup6/Batrachochytrium_dendrobatidis.asc")
MRIESM2_1140_585_1k_var1_ras <- raster("~/umbertofasci/B_Dendrobatidis_Models/MRIESM2_1140/ssp585/MRIESM2_1140_ssp585_1k_vargroup1/Batrachochytrium_dendrobatidis.asc")
MRIESM2_1140_585_1k_var5_ras <- raster("~/umbertofasci/B_Dendrobatidis_Models/MRIESM2_1140/ssp585/MRIESM2_1140_ssp585_1k_vargroup5/Batrachochytrium_dendrobatidis.asc")

# 2041-2070 ssp126
MRIESM2_4170_126_1k_var1_ras <- raster("~/umbertofasci/B_Dendrobatidis_Models/MRIESM2_4170/ssp126/MRIESM2_4170_ssp126_1k_vargroup1/Batrachochytrium_dendrobatidis.asc")

# 2041-2070 ssp858
MRIESM2_4170_585_10k_var6_ras <- raster("~/umbertofasci/B_Dendrobatidis_Models/MRIESM2_4170/ssp585/MRIESM2_4170_ssp585_10k_vargroup6/Batrachochytrium_dendrobatidis.asc")
MRIESM2_4170_585_1k_var1_ras <- raster("~/umbertofasci/B_Dendrobatidis_Models/MRIESM2_4170/ssp585/MRIESM2_4170_ssp585_1k_vargroup1/Batrachochytrium_dendrobatidis.asc")

# Average raster groups

# 2011-2040 ssp126
MRIESM2_1140_126_Avg <- (MRIESM2_1140_126_10k_var6_ras + MRIESM2_1140_126_1k_var1_ras + MRIESM2_1140_126_1k_var5_ras) / 3

# 2011-2040 ssp585
MRIESM2_1140_585_Avg <- (MRIESM2_1140_585_10k_var6_ras + MRIESM2_1140_585_1k_var1_ras + MRIESM2_1140_585_1k_var5_ras) / 3

# 2041-2070 ssp126
MRIESM2_4170_126_Avg <- MRIESM2_4170_126_1k_var1_ras

# 2041-2070 ssp585
MRIESM2_4170_585_Avg <- (MRIESM2_4170_585_10k_var6_ras + MRIESM2_4170_585_1k_var1_ras) / 2

# Prepare averaged rasters for ggplot2

# Raster to points
MRIESM2_1140_126_Avg.p <- rasterToPoints(MRIESM2_1140_126_Avg)
MRIESM2_1140_585_Avg.p <- rasterToPoints(MRIESM2_1140_585_Avg)
MRIESM2_4170_126_Avg.p <- rasterToPoints(MRIESM2_4170_126_Avg)
MRIESM2_4170_585_Avg.p <- rasterToPoints(MRIESM2_4170_585_Avg)

# Points to dataframe
MRIESM2_1140_126_Avg_df <- data.frame(MRIESM2_1140_126_Avg.p)
MRIESM2_1140_585_Avg_df <- data.frame(MRIESM2_1140_585_Avg.p)
MRIESM2_4170_126_Avg_df <- data.frame(MRIESM2_4170_126_Avg.p)
MRIESM2_4170_585_Avg_df <- data.frame(MRIESM2_4170_585_Avg.p)

# Update column names
colnames(MRIESM2_1140_126_Avg_df) <- c("Longitude", "Latitude", "Predicted_Bd_Suitability")
colnames(MRIESM2_1140_585_Avg_df) <- c("Longitude", "Latitude", "Predicted_Bd_Suitability")
colnames(MRIESM2_4170_126_Avg_df) <- c("Longitude", "Latitude", "Predicted_Bd_Suitability")
colnames(MRIESM2_4170_585_Avg_df) <- c("Longitude", "Latitude", "Predicted_Bd_Suitability")