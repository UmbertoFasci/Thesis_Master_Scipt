# Create Stat Dataframe with all predictors and binned avg projections
# Separate by year range and GCM projection

# Load Libraries
library(tidyverse)
library(ggspatial)
library(patchwork)
library(raster)
library(ggpubr)

# Prepare Variables for stat plots

# 2011-2040 ssp126

Annual_Mean_Temp_2011_2040_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20112040/chelsa_bio10_01_aus.asc")
Mean_Diurnal_Range_2011_2040_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20112040/chelsa_bio10_02_aus.asc")
Isothermality_2011_2040_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20112040/chelsa_bio10_03_aus.asc")
Mean_Temp_Driest_Qtr_2011_2040_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20112040/chelsa_bio10_09_aus.asc")
Prec_of_Wettest_Month_2011_2040_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20112040/chelsa_bio10_13_aus.asc")

# 2011-2040 ssp585

Annual_Mean_Temp_2011_2040_585 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp585_20112040/chelsa_bio10_01_aus.asc")
Mean_Diurnal_Range_2011_2040_585 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp585_20112040/chelsa_bio10_02_aus.asc")
Isothermality_2011_2040_585 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp585_20112040/chelsa_bio10_03_aus.asc")
Mean_Temp_Driest_Qtr_2011_2040_585 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp585_20112040/chelsa_bio10_09_aus.asc")
Prec_of_Wettest_Month_2011_2040_585 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp585_20112040/chelsa_bio10_13_aus.asc")

# 2041-2070 ssp126

Annual_Mean_Temp_2041_2070_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20412070/chelsa_bio10_01_aus.asc")
Mean_Diurnal_Range_2041_2070_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20412070/chelsa_bio10_02_aus.asc")
Isothermality_2041_2070_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20412070/chelsa_bio10_03_aus.asc")
Mean_Temp_Driest_Qtr_2041_2070_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20412070/chelsa_bio10_09_aus.asc")
Prec_of_Wettest_Month_2041_2070_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20412070/chelsa_bio10_13_aus.asc")

# 2041-2070 ssp585

Annual_Mean_Temp_2041_2070_585 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp585_20412070/chelsa_bio10_01_aus.asc")
Mean_Diurnal_Range_2041_2070_585 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp585_20412070/chelsa_bio10_02_aus.asc")
Isothermality_2041_2070_585 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp585_20412070/chelsa_bio10_03_aus.asc")
Mean_Temp_Driest_Qtr_2041_2070_585 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp585_20412070/chelsa_bio10_09_aus.asc")
Prec_of_Wettest_Month_2041_2070_585 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp585_20412070/chelsa_bio10_13_aus.asc")

# Convert variable rasters to points (Over 10 million points each)

# 2011-2040 ssp126

Annual_Mean_Temp_2011_2040_126.p <- rasterToPoints(Annual_Mean_Temp_2011_2040_126)
Mean_Diurnal_Range_2011_2040_126.p <- rasterToPoints(Mean_Diurnal_Range_2011_2040_126)
Isothermality_2011_2040_126.p <- rasterToPoints(Isothermality_2011_2040_126)
Mean_Temp_Driest_Qtr_2011_2040_126.p <- rasterToPoints(Mean_Temp_Driest_Qtr_2011_2040_126)
Prec_of_Wettest_Month_2011_2040_126.p <- rasterToPoints(Prec_of_Wettest_Month_2011_2040_126)

# 2011-2040 ssp585

Annual_Mean_Temp_2011_2040_585.p <- rasterToPoints(Annual_Mean_Temp_2011_2040_585)
Mean_Diurnal_Range_2011_2040_585.p <- rasterToPoints(Mean_Diurnal_Range_2011_2040_585)
Isothermality_2011_2040_585.p <- rasterToPoints(Isothermality_2011_2040_585)
Mean_Temp_Driest_Qtr_2011_2040_585.p <- rasterToPoints(Mean_Temp_Driest_Qtr_2011_2040_585)
Prec_of_Wettest_Month_2011_2040_585.p <- rasterToPoints(Prec_of_Wettest_Month_2011_2040_585)

# 2041-2070 ssp126

Annual_Mean_Temp_2041_2070_126.p <- rasterToPoints(Annual_Mean_Temp_2041_2070_126)
Mean_Diurnal_Range_2041_2070_126.p <- rasterToPoints(Mean_Diurnal_Range_2041_2070_126)
Isothermality_2041_2070_126.p <- rasterToPoints(Isothermality_2041_2070_126)
Mean_Temp_Driest_Qtr_2041_2070_126.p <- rasterToPoints(Mean_Temp_Driest_Qtr_2041_2070_126)
Prec_of_Wettest_Month_2041_2070_126.p <- rasterToPoints(Prec_of_Wettest_Month_2041_2070_126)

# 2041-2070 ssp585

Annual_Mean_Temp_2041_2070_585.p <- rasterToPoints(Annual_Mean_Temp_2041_2070_585)
Mean_Diurnal_Range_2041_2070_585.p <- rasterToPoints(Mean_Diurnal_Range_2041_2070_585)
Isothermality_2041_2070_585.p <- rasterToPoints(Isothermality_2041_2070_585)
Mean_Temp_Driest_Qtr_2041_2070_585.p <- rasterToPoints(Mean_Temp_Driest_Qtr_2041_2070_585)
Prec_of_Wettest_Month_2041_2070_585.p <- rasterToPoints(Prec_of_Wettest_Month_2041_2070_585)

# Transform variable raster points into usable dataframes.

# 2011-2040 ssp126

Annual_Mean_Temp_2011_2040_126_df <- data.frame(Annual_Mean_Temp_2011_2040_126.p)
Mean_Diurnal_Range_2011_2040_126_df <- data.frame(Mean_Diurnal_Range_2011_2040_126.p)
Isothermality_2011_2040_126_df <- data.frame(Isothermality_2011_2040_126.p)
Mean_Temp_Driest_Qtr_2011_2040_126_df <- data.frame(Mean_Temp_Driest_Qtr_2011_2040_126.p)
Prec_of_Wettest_Month_2011_2040_126_df <- data.frame(Prec_of_Wettest_Month_2011_2040_126.p)

# 2011-2040 ssp585

Annual_Mean_Temp_2011_2040_585_df <- data.frame(Annual_Mean_Temp_2011_2040_585.p)
Mean_Diurnal_Range_2011_2040_585_df <- data.frame(Mean_Diurnal_Range_2011_2040_585.p)
Isothermality_2011_2040_585_df <- data.frame(Isothermality_2011_2040_585.p)
Mean_Temp_Driest_Qtr_2011_2040_585_df <- data.frame(Mean_Temp_Driest_Qtr_2011_2040_585.p)
Prec_of_Wettest_Month_2011_2040_585_df <- data.frame(Prec_of_Wettest_Month_2011_2040_585.p)

# 2041-2070 ssp126

Annual_Mean_Temp_2041_2070_126_df <- data.frame(Annual_Mean_Temp_2041_2070_126.p)
Mean_Diurnal_Range_2041_2070_126_df <- data.frame(Mean_Diurnal_Range_2041_2070_126.p)
Isothermality_2041_2070_126_df <- data.frame(Isothermality_2041_2070_126.p)
Mean_Temp_Driest_Qtr_2041_2070_126_df <- data.frame(Mean_Temp_Driest_Qtr_2041_2070_126.p)
Prec_of_Wettest_Month_2041_2070_126_df <- data.frame(Prec_of_Wettest_Month_2041_2070_126.p)

# 2041-2070 ssp585

Annual_Mean_Temp_2041_2070_585_df <- data.frame(Annual_Mean_Temp_2041_2070_585.p)
Mean_Diurnal_Range_2041_2070_585_df <- data.frame(Mean_Diurnal_Range_2041_2070_585.p)
Isothermality_2041_2070_585_df <- data.frame(Isothermality_2041_2070_585.p)
Mean_Temp_Driest_Qtr_2041_2070_585_df <- data.frame(Mean_Temp_Driest_Qtr_2041_2070_585.p)
Prec_of_Wettest_Month_2041_2070_585_df <- data.frame(Prec_of_Wettest_Month_2041_2070_585.p)

# Update Columns names of each

# 2011-2040 ssp126

colnames(Annual_Mean_Temp_2011_2040_126_df) <- c("Longitude", "Latitude", "Annual_Mean_Temp_2011_2040_126")
colnames(Mean_Diurnal_Range_2011_2040_126_df) <- c("Longitude", "Latitude", "Mean_Diurnal_Range_2011_2040_126")
colnames(Isothermality_2011_2040_126_df) <- c("Longitude", "Latitude", "Isothermality_2011_2040_126")
colnames(Mean_Temp_Driest_Qtr_2011_2040_126_df) <- c("Longitude", "Latitude", "Mean_Temp_Driest_Qtr_2011_2040_126")
colnames(Prec_of_Wettest_Month_2011_2040_126_df) <- c("Longitude", "Latitude", "Prec_of_Wettest_Month_2011_2040_126")

# 2011-2040 ssp585

colnames(Annual_Mean_Temp_2011_2040_585_df) <- c("Longitude", "Latitude", "Annual_Mean_Temp_2011_2040_585")
colnames(Mean_Diurnal_Range_2011_2040_585_df) <- c("Longitude", "Latitude", "Mean_Diurnal_Range_2011_2040_585")
colnames(Isothermality_2011_2040_585_df) <- c("Longitude", "Latitude", "Isothermality_2011_2040_585")
colnames(Mean_Temp_Driest_Qtr_2011_2040_585_df) <- c("Longitude", "Latitude", "Mean_Temp_Driest_Qtr_2011_2040_585")
colnames(Prec_of_Wettest_Month_2011_2040_585_df) <- c("Longitude", "Latitude", "Prec_of_Wettest_Month_2011_2040_585")

# 2041-2070 ssp126

colnames(Annual_Mean_Temp_2041_2070_126_df) <- c("Longitude", "Latitude", "Annual_Mean_Temp_2041_2070_126")
colnames(Mean_Diurnal_Range_2041_2070_126_df) <- c("Longitude", "Latitude", "Mean_Diurnal_Range_2041_2070_126")
colnames(Isothermality_2041_2070_126_df) <- c("Longitude", "Latitude", "Isothermality_2041_2070_126")
colnames(Mean_Temp_Driest_Qtr_2041_2070_126_df) <- c("Longitude", "Latitude", "Mean_Temp_Driest_Qtr_2041_2070_126")
colnames(Prec_of_Wettest_Month_2041_2070_126_df) <- c("Longitude", "Latitude", "Prec_of_Wettest_Month_2041_2070_126")

# 2041-2070 ssp585

colnames(Annual_Mean_Temp_2041_2070_585_df) <- c("Longitude", "Latitude", "Annual_Mean_Temp_2041_2070_585")
colnames(Mean_Diurnal_Range_2041_2070_585_df) <- c("Longitude", "Latitude", "Mean_Diurnal_Range_2041_2070_585")
colnames(Isothermality_2041_2070_585_df) <- c("Longitude", "Latitude", "Isothermality_2041_2070_585")
colnames(Mean_Temp_Driest_Qtr_2041_2070_585_df) <- c("Longitude", "Latitude", "Mean_Temp_Driest_Qtr_2041_2070_585")
colnames(Prec_of_Wettest_Month_2041_2070_585_df) <- c("Longitude", "Latitude", "Prec_of_Wettest_Month_2041_2070_585")

# Add these new columns to the predicted distribution Avgs for Bd in the same time range and projection.

# 2011-2040 ssp126
MRIESM2_1140_126_Stats <- MRIESM2_1140_126_Avg_df
MRIESM2_1140_126_Stats$Annual_Mean_Temp_2011_2040_126 <- Annual_Mean_Temp_2011_2040_126_df$Annual_Mean_Temp_2011_2040_126
MRIESM2_1140_126_Stats$Mean_Diurnal_Range_2011_2040_126 <- Mean_Diurnal_Range_2011_2040_126_df$Mean_Diurnal_Range_2011_2040_126
MRIESM2_1140_126_Stats$Isothermality_2011_2040_126 <- Isothermality_2011_2040_126_df$Isothermality_2011_2040_126
MRIESM2_1140_126_Stats$Mean_Temp_Driest_Qtr_2011_2040_126 <- Mean_Temp_Driest_Qtr_2011_2040_126_df$Mean_Temp_Driest_Qtr_2011_2040_126
MRIESM2_1140_126_Stats$Prec_of_Wettest_Month_2011_2040_126 <- Prec_of_Wettest_Month_2011_2040_126_df$Prec_of_Wettest_Month_2011_2040_126

# Rename
rename(MRIESM2_1140_126_Stats, 'Predicted_Bd_Suitability' = 'Predicted Bd Suitability')

# 2011-2040 ssp585
MRIESM2_1140_585_Stats <- MRIESM2_1140_585_Avg_df
MRIESM2_1140_585_Stats$Annual_Mean_Temp_2011_2040_585 <- Annual_Mean_Temp_2011_2040_585_df$Annual_Mean_Temp_2011_2040_585
MRIESM2_1140_585_Stats$Mean_Diurnal_Range_2011_2040_585 <- Mean_Diurnal_Range_2011_2040_585_df$Mean_Diurnal_Range_2011_2040_585
MRIESM2_1140_585_Stats$Isothermality_2011_2040_585 <- Isothermality_2011_2040_585_df$Isothermality_2011_2040_585
MRIESM2_1140_585_Stats$Mean_Temp_Driest_Qtr_2011_2040_585 <- Mean_Temp_Driest_Qtr_2011_2040_585_df$Mean_Temp_Driest_Qtr_2011_2040_585
MRIESM2_1140_585_Stats$Prec_of_Wettest_Month_2011_2040_585 <- Prec_of_Wettest_Month_2011_2040_585_df$Prec_of_Wettest_Month_2011_2040_585

# Rename
rename(MRIESM2_1140_585_Stats, 'Predicted_Bd_Suitability' = 'Predicted Bd Suitability')

# 2041-2070 ssp126
MRIESM2_4170_126_Stats <- MRIESM2_4170_126_Avg_df
MRIESM2_4170_126_Stats$Annual_Mean_Temp_2041_2070_126 <- Annual_Mean_Temp_2041_2070_126_df$Annual_Mean_Temp_2041_2070_126
MRIESM2_4170_126_Stats$Mean_Diurnal_Range_2041_2070_126 <- Mean_Diurnal_Range_2041_2070_126_df$Mean_Diurnal_Range_2041_2070_126
MRIESM2_4170_126_Stats$Isothermality_2041_2070_126 <- Isothermality_2041_2070_126_df$Isothermality_2041_2070_126
MRIESM2_4170_126_Stats$Mean_Temp_Driest_Qtr_2041_2070_126 <- Mean_Temp_Driest_Qtr_2041_2070_126_df$Mean_Temp_Driest_Qtr_2041_2070_126
MRIESM2_4170_126_Stats$Prec_of_Wettest_Month_2041_2070_126 <- Prec_of_Wettest_Month_2041_2070_126_df$Prec_of_Wettest_Month_2041_2070_126

# Rename
rename(MRIESM2_4170_126_Stats, 'Predicted_Bd_Suitability' = 'Predicted Bd Suitability')

# 2041-2070 ssp585
MRIESM2_4170_585_Stats <- MRIESM2_4170_585_Avg_df
MRIESM2_4170_585_Stats$Annual_Mean_Temp_2041_2070_585 <- Annual_Mean_Temp_2041_2070_585_df$Annual_Mean_Temp_2041_2070_585
MRIESM2_4170_585_Stats$Mean_Diurnal_Range_2041_2070_585 <- Mean_Diurnal_Range_2041_2070_585_df$Mean_Diurnal_Range_2041_2070_585
MRIESM2_4170_585_Stats$Isothermality_2041_2070_585 <- Isothermality_2041_2070_585_df$Isothermality_2041_2070_585
MRIESM2_4170_585_Stats$Mean_Temp_Driest_Qtr_2041_2070_585 <- Mean_Temp_Driest_Qtr_2041_2070_585_df$Mean_Temp_Driest_Qtr_2041_2070_585
MRIESM2_4170_585_Stats$Prec_of_Wettest_Month_2041_2070_585 <- Prec_of_Wettest_Month_2041_2070_585_df$Prec_of_Wettest_Month_2041_2070_585

# Rename
rename(MRIESM2_4170_585_Stats, 'Predicted_Bd_Suitability' = 'Predicted Bd Suitability')


# Create Suitability Levels of Predicted_Bd_Suitability (4)

MRIESM2_1140_126_Stats <- MRIESM2_1140_126_Stats %>% mutate('Suitability_Levels' = ntile('Predicted_Bd_Suitability', 4))
MRIESM2_1140_585_Stats <- MRIESM2_1140_585_Stats %>% mutate('Suitability_Levels' = ntile('Predicted_Bd_Suitability', 4))
MRIESM2_4170_126_Stats <- MRIESM2_4170_126_Stats %>% mutate('Suitability_Levels' = ntile('Predicted_Bd_Suitability', 4))
MRIESM2_4170_585_Stats <- MRIESM2_4170_585_Stats %>% mutate('Suitability_Levels' = ntile('Predicted_Bd_Suitability', 4))

# Bin Comparisons for Kruskal-Wallis Test
bin_comparisons <- list( c("1", "2"),
                         c("2", "3"),
                         c("3", "4"),
                         c("1", "3"),
                         c("2", "4"),
                         c("1", "4"))

# Boxplots

# Annual Mean Temp Full Extent

Annual_Mean_Temp_2011_2040_126_Boxplot <- MRIESM2_1140_126_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                               y = "Annual_Mean_Temp_2011_2040_126",
                                                                               xlab = "Predicted Bd Distribution",
                                                                               ylab = "Annual Mean Temp. (2011-2040) ssp126",
                                                                               fill = "Suitability_Levels",
                                                                               palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 55)

Annual_Mean_Temp_2011_2040_585_Boxplot <- MRIESM2_1140_585_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                               y = "Annual_Mean_Temp_2011_2040_585",
                                                                               xlab = "Predicted Bd Distribution",
                                                                               ylab = "Annual Mean Temp. (2011-2040) ssp585",
                                                                               fill = "Suitability_Levels",
                                                                               palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 55)

Annual_Mean_Temp_2041_2070_126_Boxplot <- MRIESM2_4170_126_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                               y = "Annual_Mean_Temp_2041_2070_126",
                                                                               xlab = "Predicted Bd Distribution",
                                                                               ylab = "Annual Mean Temp. (2041-2070) ssp126",
                                                                               fill = "Suitability_Levels",
                                                                               palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 55)

Annual_Mean_Temp_2041_2070_585_Boxplot <- MRIESM2_4170_585_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                               y = "Annual_Mean_Temp_2041_2070_585",
                                                                               xlab = "Predicted Bd Distribution",
                                                                               ylab = "Annual Mean Temp. (2041-2070) ssp585",
                                                                               fill = "Suitability_Levels",
                                                                               palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 55)

# Mean Diurnal Range

Mean_Diurnal_Range_2011_2040_126_Boxplot <- MRIESM2_1140_126_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                 y = "Mean_Diurnal_Range_2011_2040_126",
                                                                                 xlab = "Predicted Bd Distribution",
                                                                                 ylab = "Mean Diurnal Range (2011-2040) ssp126",
                                                                                 fill = "Suitability_Levels",
                                                                                 palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 35)

Mean_Diurnal_Range_2011_2040_585_Boxplot <- MRIESM2_1140_585_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                 y = "Mean_Diurnal_Range_2011_2040_585",
                                                                                 xlab = "Predicted Bd Distribution",
                                                                                 ylab = "Mean Diurnal Range (2011-2040) ssp585",
                                                                                 fill = "Suitability_Levels",
                                                                                 palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 35)

Mean_Diurnal_Range_2041_2070_126_Boxplot <- MRIESM2_4170_126_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                 y = "Mean_Diurnal_Range_2041_2070_126",
                                                                                 xlab = "Predicted Bd Distribution",
                                                                                 ylab = "Mean Diurnal Range (2041-2070) ssp126",
                                                                                 fill = "Suitability_Levels",
                                                                                 palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 35)

Mean_Diurnal_Range_2041_2070_585_Boxplot <- MRIESM2_4170_585_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                 y = "Mean_Diurnal_Range_2041_2070_585",
                                                                                 xlab = "Predicted Bd Distribution",
                                                                                 ylab = "Mean Diurnal Range (2041-2070) ssp585",
                                                                                 fill = "Suitability_Levels",
                                                                                 palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 35)

# Isothermality

Isothermality_2011_2040_126_Boxplot <- MRIESM2_1140_126_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                            y = "Isothermality_2011_2040_126",
                                                                            xlab = "Predicted Bd Distribution",
                                                                            ylab = "Isothermality (2011-2040) ssp126",
                                                                            fill = "Suitability_Levels",
                                                                            palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 3)

Isothermality_2011_2040_585_Boxplot <- MRIESM2_1140_585_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                            y = "Isothermality_2011_2040_585",
                                                                            xlab = "Predicted Bd Distribution",
                                                                            ylab = "Isothermality (2011-2040) ssp585",
                                                                            fill = "Suitability_Levels",
                                                                            palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 3)

Isothermality_2041_2070_126_Boxplot <- MRIESM2_4170_126_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                            y = "Isothermality_2041_2070_126",
                                                                            xlab = "Predicted Bd Distribution",
                                                                            ylab = "Isothermality (2041-2070) ssp126",
                                                                            fill = "Suitability_Levels",
                                                                            palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 3)

Isothermality_2041_2070_585_Boxplot <- MRIESM2_4170_585_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                            y = "Isothermality_2041_2070_585",
                                                                            xlab = "Predicted Bd Distribution",
                                                                            ylab = "Isothermality (2041-2070) ssp585",
                                                                            fill = "Suitability_Levels",
                                                                            palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 3)

# Mean Temperature of The Driest Quarter

Mean_Temp_Driest_Qtr_2011_2040_126_Boxplot <- MRIESM2_1140_126_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                   y = "Mean_Temp_Driest_Qtr_2011_2040_126",
                                                                                   xlab = "Predicted Bd Distribution",
                                                                                   ylab = "Mean Temp. Driest Qtr. (2011-2040) ssp126",
                                                                                   fill = "Suitability_Levels",
                                                                                   palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 55)

Mean_Temp_Driest_Qtr_2011_2040_585_Boxplot <- MRIESM2_1140_585_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                   y = "Mean_Temp_Driest_Qtr_2011_2040_585",
                                                                                   xlab = "Predicted Bd Distribution",
                                                                                   ylab = "Mean Temp. Driest Qtr. (2011-2040) ssp585",
                                                                                   fill = "Suitability_Levels",
                                                                                   palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 55)

Mean_Temp_Driest_Qtr_2041_2070_126_Boxplot <- MRIESM2_4170_126_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                   y = "Mean_Temp_Driest_Qtr_2041_2070_126",
                                                                                   xlab = "Predicted Bd Distribution",
                                                                                   ylab = "Mean Temp. Driest Qtr. (2041-2070) ssp126",
                                                                                   fill = "Suitability_Levels",
                                                                                   palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 55)

Mean_Temp_Driest_Qtr_2041_2070_585_Boxplot <- MRIESM2_4170_585_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                   y = "Mean_Temp_Driest_Qtr_2041_2070_585",
                                                                                   xlab = "Predicted Bd Distribution",
                                                                                   ylab = "Mean Temp. Driest Qtr. (2041-2070) ssp585",
                                                                                   fill = "Suitability_Levels",
                                                                                   palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 55)

# Precipitation of The Wettest Month

Prec_of_Wettest_Month_2011_2040_126_Boxplot <- MRIESM2_1140_126_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                    y = "Prec_of_Wettest_Month_2011_2040_126",
                                                                                    xlab = "Predicted Bd Distribution",
                                                                                    ylab = "Prec. of Wettest Month (2011-2040) ssp126",
                                                                                    fill = "Suitability_Levels",
                                                                                    palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 855)

Prec_of_Wettest_Month_2011_2040_585_Boxplot <- MRIESM2_1140_585_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                    y = "Prec_of_Wettest_Month_2011_2040_585",
                                                                                    xlab = "Predicted Bd Distribution",
                                                                                    ylab = "Prec. of Wettest Month (2011-2040) ssp585",
                                                                                    fill = "Suitability_Levels",
                                                                                    palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 855)

Prec_of_Wettest_Month_2041_2070_126_Boxplot <- MRIESM2_4170_126_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                    y = "Prec_of_Wettest_Month_2041_2070_126",
                                                                                    xlab = "Predicted Bd Distribution",
                                                                                    ylab = "Prec. of Wettest Month (2041-2070) ssp126",
                                                                                    fill = "Suitability_Levels",
                                                                                    palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 855)

Prec_of_Wettest_Month_2041_2070_585_Boxplot <- MRIESM2_4170_585_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                    y = "Prec_of_Wettest_Month_2041_2070_585",
                                                                                    xlab = "Predicted Bd Distribution",
                                                                                    ylab = "Prec. of Wettest Month (2041-2070) ssp585",
                                                                                    fill = "Suitability_Levels",
                                                                                    palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058")) +
  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
  stat_compare_means(label.y = 855)

# Histograms

# Annual Mean Temp Full Extent

Annual_Mean_Temp_2011_2040_126_Histogram <- MRIESM2_1140_126_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                   add = "mean",
                                                                                   rug = TRUE,
                                                                                   color = "Suitability_Levels",
                                                                                   fill = "Suitability_Levels",
                                                                                   xlab = "Predicted Bd Suitability",
                                                                                   ylab = "Count",
                                                                                   palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                   bins = 20)

Annual_Mean_Temp_2011_2040_585_Histogram <- MRIESM2_1140_585_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                   add = "mean",
                                                                                   rug = TRUE,
                                                                                   color = "Suitability_Levels",
                                                                                   fill = "Suitability_Levels",
                                                                                   xlab = "Predicted Bd Suitability",
                                                                                   ylab = "Count",
                                                                                   palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                   bins = 20)

Annual_Mean_Temp_2041_2070_126_Histogram <- MRIESM2_4170_126_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                   add = "mean",
                                                                                   rug = TRUE,
                                                                                   color = "Suitability_Levels",
                                                                                   fill = "Suitability_Levels",
                                                                                   xlab = "Predicted Bd Suitability",
                                                                                   ylab = "Count",
                                                                                   palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                   bins = 20)

Annual_Mean_Temp_2041_2070_585_Histogram <- MRIESM2_4170_585_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                   add = "mean",
                                                                                   rug = TRUE,
                                                                                   color = "Suitability_Levels",
                                                                                   fill = "Suitability_Levels",
                                                                                   xlab = "Predicted Bd Suitability",
                                                                                   ylab = "Count",
                                                                                   palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                   bins = 20)

# Mean Diurnal Range

Mean_Diurnal_Range_2011_2040_126_Histogram <- MRIESM2_1140_126_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                     add = "mean",
                                                                                     rug = TRUE,
                                                                                     color = "Suitability_Levels",
                                                                                     fill = "Suitability_Levels",
                                                                                     xlab = "Predicted Bd Suitability",
                                                                                     ylab = "Count",
                                                                                     palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                     bins = 20)

Mean_Diurnal_Range_2011_2040_585_Histogram <- MRIESM2_1140_585_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                     add = "mean",
                                                                                     rug = TRUE,
                                                                                     color = "Suitability_Levels",
                                                                                     fill = "Suitability_Levels",
                                                                                     xlab = "Predicted Bd Suitability",
                                                                                     ylab = "Count",
                                                                                     palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                     bins = 20)

Mean_Diurnal_Range_2041_2070_126_Histogram <- MRIESM2_4170_126_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                     add = "mean",
                                                                                     rug = TRUE,
                                                                                     color = "Suitability_Levels",
                                                                                     fill = "Suitability_Levels",
                                                                                     xlab = "Predicted Bd Suitability",
                                                                                     ylab = "Count",
                                                                                     palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                     bins = 20)

Mean_Diurnal_Range_2041_2070_585_Histogram <- MRIESM2_4170_585_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                     add = "mean",
                                                                                     rug = TRUE,
                                                                                     color = "Suitability_Levels",
                                                                                     fill = "Suitability_Levels",
                                                                                     xlab = "Predicted Bd Suitability",
                                                                                     ylab = "Count",
                                                                                     palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                     bins = 20)

# Isothermality

Isothermality_2011_2040_126_Histogram <- MRIESM2_1140_126_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                add = "mean",
                                                                                rug = TRUE,
                                                                                color = "Suitability_Levels",
                                                                                fill = "Suitability_Levels",
                                                                                xlab = "Predicted Bd Suitability",
                                                                                ylab = "Count",
                                                                                palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                bins = 20)

Isothermality_2011_2040_585_Histogram <- MRIESM2_1140_585_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                add = "mean",
                                                                                rug = TRUE,
                                                                                color = "Suitability_Levels",
                                                                                fill = "Suitability_Levels",
                                                                                xlab = "Predicted Bd Suitability",
                                                                                ylab = "Count",
                                                                                palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                bins = 20)

Isothermality_2041_2070_126_Histogram <- MRIESM2_4170_126_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                add = "mean",
                                                                                rug = TRUE,
                                                                                color = "Suitability_Levels",
                                                                                fill = "Suitability_Levels",
                                                                                xlab = "Predicted Bd Suitability",
                                                                                ylab = "Count",
                                                                                palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                bins = 20)

Isothermality_2041_2070_585_Histogram <- MRIESM2_4170_585_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                add = "mean",
                                                                                rug = TRUE,
                                                                                color = "Suitability_Levels",
                                                                                fill = "Suitability_Levels",
                                                                                xlab = "Predicted Bd Suitability",
                                                                                ylab = "Count",
                                                                                palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                bins = 20)

# Mean Temperature of The Driest Quarter

Mean_Temp_Driest_Qtr_2011_2040_126_Histogram <- MRIESM2_1140_126_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                       add = "mean",
                                                                                       rug = TRUE,
                                                                                       color = "Suitability_Levels",
                                                                                       fill = "Suitability_Levels",
                                                                                       xlab = "Predicted Bd Suitability",
                                                                                       ylab = "Count",
                                                                                       palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                       bins = 20)

Mean_Temp_Driest_Qtr_2011_2040_585_Histogram <- MRIESM2_1140_585_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                       add = "mean",
                                                                                       rug = TRUE,
                                                                                       color = "Suitability_Levels",
                                                                                       fill = "Suitability_Levels",
                                                                                       xlab = "Predicted Bd Suitability",
                                                                                       ylab = "Count",
                                                                                       palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                       bins = 20)

Mean_Temp_Driest_Qtr_2041_2070_126_Histogram <- MRIESM2_4170_126_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                       add = "mean",
                                                                                       rug = TRUE,
                                                                                       color = "Suitability_Levels",
                                                                                       fill = "Suitability_Levels",
                                                                                       xlab = "Predicted Bd Suitability",
                                                                                       ylab = "Count",
                                                                                       palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                       bins = 20)

Mean_Temp_Driest_Qtr_2041_2070_585_Histogram <- MRIESM2_4170_585_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                       add = "mean",
                                                                                       rug = TRUE,
                                                                                       color = "Suitability_Levels",
                                                                                       fill = "Suitability_Levels",
                                                                                       xlab = "Predicted Bd Suitability",
                                                                                       ylab = "Count",
                                                                                       palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                       bins = 20)

# Precipitation of The Wettest Month

Prec_of_Wettest_Month_2011_2040_126_Histogram <- MRIESM2_1140_126_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                        add = "mean",
                                                                                        rug = TRUE,
                                                                                        color = "Suitability_Levels",
                                                                                        fill = "Suitability_Levels",
                                                                                        xlab = "Predicted Bd Suitability",
                                                                                        ylab = "Count",
                                                                                        palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                        bins = 20)

Prec_of_Wettest_Month_2011_2040_585_Histogram <- MRIESM2_1140_585_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                        add = "mean",
                                                                                        rug = TRUE,
                                                                                        color = "Suitability_Levels",
                                                                                        fill = "Suitability_Levels",
                                                                                        xlab = "Predicted Bd Suitability",
                                                                                        ylab = "Count",
                                                                                        palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                        bins = 20)

Prec_of_Wettest_Month_2041_2070_126_Histogram <- MRIESM2_4170_126_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                        add = "mean",
                                                                                        rug = TRUE,
                                                                                        color = "Suitability_Levels",
                                                                                        fill = "Suitability_Levels",
                                                                                        xlab = "Predicted Bd Suitability",
                                                                                        ylab = "Count",
                                                                                        palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                        bins = 20)

Prec_of_Wettest_Month_2041_2070_585_Histogram <- MRIESM2_4170_585_Stats %>% gghistogram(x = "Predicted_Bd_Suitability",
                                                                                        add = "mean",
                                                                                        rug = TRUE,
                                                                                        color = "Suitability_Levels",
                                                                                        fill = "Suitability_Levels",
                                                                                        xlab = "Predicted Bd Suitability",
                                                                                        ylab = "Count",
                                                                                        palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"),
                                                                                        bins = 20)

# Mapped Data (Environmental Variables)

# Annual Mean Temp

Annual_Mean_Temp_2011_2040_126_map <- ggplot(data = Annual_Mean_Temp_2011_2040_126_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Annual_Mean_Temp_2011_2040_126`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Annual_Mean_Temp_2011_2040_585_map <- ggplot(data = Annual_Mean_Temp_2011_2040_585_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Annual_Mean_Temp_2011_2040_585`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Annual_Mean_Temp_2041_2070_126_map <- ggplot(data = Annual_Mean_Temp_2041_2070_126_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Annual_Mean_Temp_2041_2070_126`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Annual_Mean_Temp_2041_2070_585_map <- ggplot(data = Annual_Mean_Temp_2041_2070_585_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Annual_Mean_Temp_2041_2070_585`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

# Mean Diurnal Range

Mean_Diurnal_Range_2011_2040_126_map <- ggplot(data = Mean_Diurnal_Range_2011_2040_126_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Mean_Diurnal_Range_2011_2040_126`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Mean_Diurnal_Range_2011_2040_585_map <- ggplot(data = Mean_Diurnal_Range_2011_2040_585_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Mean_Diurnal_Range_2011_2040_585`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Mean_Diurnal_Range_2041_2070_126_map <- ggplot(data = Mean_Diurnal_Range_2041_2070_126_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Mean_Diurnal_Range_2041_2070_126`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Mean_Diurnal_Range_2041_2070_585_map <- ggplot(data = Mean_Diurnal_Range_2041_2070_585_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Mean_Diurnal_Range_2041_2070_585`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

# Isothermality

Isothermality_2011_2040_126_map <- ggplot(data = Isothermality_2011_2040_126_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Isothermality_2011_2040_126`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Isothermality_2011_2040_585_map <- ggplot(data = Isothermality_2011_2040_585_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Isothermality_2011_2040_585`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Isothermality_2041_2070_126_map <- ggplot(data = Isothermality_2041_2070_126_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Isothermality_2041_2070_126`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Isothermality_2041_2070_585_map <- ggplot(data = Isothermality_2041_2070_585_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Isothermality_2041_2070_585`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

# Mean Temperature of The Driest Quarter

Mean_Temp_Driest_Qtr_2011_2040_126_map <- ggplot(data = Mean_Temp_Driest_Qtr_2011_2040_126_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Mean_Temp_Driest_Qtr_2011_2040_126`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Mean_Temp_Driest_Qtr_2011_2040_585_map <- ggplot(data = Mean_Temp_Driest_Qtr_2011_2040_585_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Mean_Temp_Driest_Qtr_2011_2040_585`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Mean_Temp_Driest_Qtr_2041_2070_126_map <- ggplot(data = Mean_Temp_Driest_Qtr_2041_2070_126_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Mean_Temp_Driest_Qtr_2041_2070_126`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Mean_Temp_Driest_Qtr_2041_2070_585_map <- ggplot(data = Mean_Temp_Driest_Qtr_2041_2070_585_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Mean_Temp_Driest_Qtr_2041_2070_585`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

# Precipitation of The Wettest Month

Prec_of_Wettest_Month_2011_2040_126_map <- ggplot(data = Prec_of_Wettest_Month_2011_2040_126_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Prec_of_Wettest_Month_2011_2040_126`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Prec_of_Wettest_Month_2011_2040_585_map <- ggplot(data = Prec_of_Wettest_Month_2011_2040_585_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Prec_of_Wettest_Month_2011_2040_585`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Prec_of_Wettest_Month_2041_2070_126_map <- ggplot(data = Prec_of_Wettest_Month_2041_2070_126_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Prec_of_Wettest_Month_2041_2070_126`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Prec_of_Wettest_Month_2041_2070_585_map <- ggplot(data = Prec_of_Wettest_Month_2041_2070_585_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Prec_of_Wettest_Month_2041_2070_585`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

# Human Influence

Human_Influence_2011_2040_126_map <- ggplot(data = Human_Influence_2011_2040_126_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Human_Influence_2011_2040_126`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Human_Influence_2011_2040_585_map <- ggplot(data = Human_Influence_2011_2040_585_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Human_Influence_2011_2040_585`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Human_Influence_2041_2070_126_map <- ggplot(data = Human_Influence_2041_2070_126_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Human_Influence_2041_2070_126`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

Human_Influence_2041_2070_585_map <- ggplot(data = Human_Influence_2041_2070_585_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Human_Influence_2041_2070_585`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

# Average Bd Suitability Prediction

MRIESM2_1140_126_Avg_preds <- ggplot(data = MRIESM2_1140_126_Avg_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Predicted Bd Suitability`)) +
  scale_fill_distiller(palette = "RdGy", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

MRIESM2_1140_585_Avg_preds <- ggplot(data = MRIESM2_1140_585_Avg_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Predicted Bd Suitability`)) +
  scale_fill_distiller(palette = "RdGy", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

MRIESM2_4170_126_Avg_preds <- ggplot(data = MRIESM2_4170_126_Avg_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Predicted Bd Suitability`)) +
  scale_fill_distiller(palette = "RdGy", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

MRIESM2_4170_585_Avg_preds <- ggplot(data = MRIESM2_4170_585_Avg_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Predicted Bd Suitability`)) +
  scale_fill_distiller(palette = "RdGy", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

# Layout Groups using pathwork

# Annual Mean Temp

(Annual_Mean_Temp_2011_2040_126_map + Annual_Mean_Temp_2011_2040_126_Boxplot) / (MRIESM2_1140_126_Avg_preds + Annual_Mean_Temp_2011_2040_126_Histogram)

(Annual_Mean_Temp_2011_2040_585_map + Annual_Mean_Temp_2011_2040_585_Boxplot) / (MRIESM2_1140_585_Avg_preds + Annual_Mean_Temp_2011_2040_585_Histogram)

(Annual_Mean_Temp_2041_2070_126_map + Annual_Mean_Temp_2041_2070_126_Boxplot) / (MRIESM2_4170_126_Avg_preds + Annual_Mean_Temp_2041_2070_126_Histogram)

(Annual_Mean_Temp_2041_2070_585_map + Annual_Mean_Temp_2041_2070_585_Boxplot) / (MRIESM2_4170_585_Avg_preds + Annual_Mean_Temp_2041_2070_585_Histogram)

# Mean Diurnal Range

(Mean_Diurnal_Range_2011_2040_126_map + Mean_Diurnal_Range_2011_2040_126_Boxplot) / (MRIESM2_1140_126_Avg_preds + Mean_Diurnal_Range_2011_2040_126_Histogram)

(Mean_Diurnal_Range_2011_2040_585_map + Mean_Diurnal_Range_2011_2040_585_Boxplot) / (MRIESM2_1140_585_Avg_preds + Mean_Diurnal_Range_2011_2040_585_Histogram)

(Mean_Diurnal_Range_2041_2070_126_map + Mean_Diurnal_Range_2041_2070_126_Boxplot) / (MRIESM2_4170_126_Avg_preds + Mean_Diurnal_Range_2041_2070_126_Histogram)

(Mean_Diurnal_Range_2041_2070_585_map + Mean_Diurnal_Range_2041_2070_585_Boxplot) / (MRIESM2_4170_585_Avg_preds + Mean_Diurnal_Range_2041_2070_585_Histogram)

# Isothermality

(Isothermality_2011_2040_126_map + Isothermality_2011_2040_126_Boxplot) / (MRIESM2_1140_126_Avg_preds + Isothermality_2011_2040_126_Histogram)

(Isothermality_2011_2040_585_map + Isothermality_2011_2040_585_Boxplot) / (MRIESM2_1140_585_Avg_preds + Isothermality_2011_2040_585_Histogram)

(Isothermality_2041_2070_126_map + Isothermality_2041_2070_126_Boxplot) / (MRIESM2_4170_126_Avg_preds + Isothermality_2041_2070_126_Histogram)

(Isothermality_2041_2070_585_map + Isothermality_2041_2070_585_Boxplot) / (MRIESM2_4170_585_Avg_preds + Isothermality_2041_2070_585_Histogram)

# Mean Tempurature of Driest Quarter

(Mean_Temp_Driest_Qtr_2011_2040_126_map + Mean_Temp_Driest_Qtr_2011_2040_126_Boxplot) / (MRIESM2_1140_126_Avg_preds + Mean_Temp_Driest_Qtr_2011_2040_126_Histogram)

(Mean_Temp_Driest_Qtr_2011_2040_585_map + Mean_Temp_Driest_Qtr_2011_2040_585_Boxplot) / (MRIESM2_1140_585_Avg_preds + Mean_Temp_Driest_Qtr_2011_2040_585_Histogram)

(Mean_Temp_Driest_Qtr_2041_2070_126_map + Mean_Temp_Driest_Qtr_2041_2070_126_Boxplot) / (MRIESM2_4170_126_Avg_preds + Mean_Temp_Driest_Qtr_2041_2070_126_Histogram)

(Mean_Temp_Driest_Qtr_2041_2070_585_map + Mean_Temp_Driest_Qtr_2041_2070_585_Boxplot) / (MRIESM2_4170_585_Avg_preds + Mean_Temp_Driest_Qtr_2041_2070_585_Histogram)

# Precipitation of The Wettest Month

(Prec_of_Wettest_Month_2011_2040_126_map + Prec_of_Wettest_Month_2011_2040_126_Boxplot) / (MRIESM2_1140_126_Avg_preds + Prec_of_Wettest_Month_2011_2040_126_Histogram)

(Prec_of_Wettest_Month_2011_2040_585_map + Prec_of_Wettest_Month_2011_2040_585_Boxplot) / (MRIESM2_1140_585_Avg_preds + Prec_of_Wettest_Month_2011_2040_585_Histogram)

(Prec_of_Wettest_Month_2041_2070_126_map + Prec_of_Wettest_Month_2041_2070_126_Boxplot) / (MRIESM2_4170_126_Avg_preds + Prec_of_Wettest_Month_2041_2070_126_Histogram)

(Prec_of_Wettest_Month_2041_2070_585_map + Prec_of_Wettest_Month_2041_2070_585_Boxplot) / (MRIESM2_4170_585_Avg_preds + Prec_of_Wettest_Month_2041_2070_585_Histogram)

# Human Influence

(Human_Influence_2011_2040_126_map + Human_Influence_2011_2040_126_Boxplot) / (MRIESM2_1140_126_Avg_preds + Human_Influence_2011_2040_126_Histogram)

(Human_Influence_2011_2040_585_map + Human_Influence_2011_2040_585_Boxplot) / (MRIESM2_1140_585_Avg_preds + Human_Influence_2011_2040_585_Histogram)

(Human_Influence_2041_2070_126_map + Human_Influence_2041_2070_126_Boxplot) / (MRIESM2_4170_126_Avg_preds + Human_Influence_2041_2070_126_Histogram)

(Human_Influence_2041_2070_585_map + Human_Influence_2041_2070_585_Boxplot) / (MRIESM2_4170_585_Avg_preds + Human_Influence_2041_2070_585_Histogram)
