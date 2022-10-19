library(tidyverse)
library(ggspatial)
library(patchwork)
library(raster)
library(ggpubr)

# 2011-2040 ssp126

Annual_Mean_Temp_2011_2040_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20112040/chelsa_bio10_01_aus.asc")
Mean_Diurnal_Range_2011_2040_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20112040/chelsa_bio10_02_aus.asc")
Isothermality_2011_2040_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20112040/chelsa_bio10_03_aus.asc")
Mean_Temp_Driest_Qtr_2011_2040_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20112040/chelsa_bio10_09_aus.asc")
Prec_of_Wettest_Month_2011_2040_126 <- raster("/Users/umbertofasci/Projections_Final/MRI_ESM2/ssp126_20112040/chelsa_bio10_13_aus.asc")

Annual_Mean_Temp_2011_2040_126.p <- rasterToPoints(Annual_Mean_Temp_2011_2040_126)
Mean_Diurnal_Range_2011_2040_126.p <- rasterToPoints(Mean_Diurnal_Range_2011_2040_126)
Isothermality_2011_2040_126.p <- rasterToPoints(Isothermality_2011_2040_126)
Mean_Temp_Driest_Qtr_2011_2040_126.p <- rasterToPoints(Mean_Temp_Driest_Qtr_2011_2040_126)
Prec_of_Wettest_Month_2011_2040_126.p <- rasterToPoints(Prec_of_Wettest_Month_2011_2040_126)

Annual_Mean_Temp_2011_2040_126_df <- data.frame(Annual_Mean_Temp_2011_2040_126.p)
Mean_Diurnal_Range_2011_2040_126_df <- data.frame(Mean_Diurnal_Range_2011_2040_126.p)
Isothermality_2011_2040_126_df <- data.frame(Isothermality_2011_2040_126.p)
Mean_Temp_Driest_Qtr_2011_2040_126_df <- data.frame(Mean_Temp_Driest_Qtr_2011_2040_126.p)
Prec_of_Wettest_Month_2011_2040_126_df <- data.frame(Prec_of_Wettest_Month_2011_2040_126.p)

colnames(Annual_Mean_Temp_2011_2040_126_df) <- c("Longitude", "Latitude", "Annual_Mean_Temp_2011_2040_126")
colnames(Mean_Diurnal_Range_2011_2040_126_df) <- c("Longitude", "Latitude", "Mean_Diurnal_Range_2011_2040_126")
colnames(Isothermality_2011_2040_126_df) <- c("Longitude", "Latitude", "Isothermality_2011_2040_126")
colnames(Mean_Temp_Driest_Qtr_2011_2040_126_df) <- c("Longitude", "Latitude", "Mean_Temp_Driest_Qtr_2011_2040_126")
colnames(Prec_of_Wettest_Month_2011_2040_126_df) <- c("Longitude", "Latitude", "Prec_of_Wettest_Month_2011_2040_126")

MRIESM2_1140_126_Stats <- MRIESM2_1140_126_Avg_df
MRIESM2_1140_126_Stats$Annual_Mean_Temp_2011_2040_126 <- Annual_Mean_Temp_2011_2040_126_df$Annual_Mean_Temp_2011_2040_126
MRIESM2_1140_126_Stats$Mean_Diurnal_Range_2011_2040_126 <- Mean_Diurnal_Range_2011_2040_126_df$Mean_Diurnal_Range_2011_2040_126
MRIESM2_1140_126_Stats$Isothermality_2011_2040_126 <- Isothermality_2011_2040_126_df$Isothermality_2011_2040_126
MRIESM2_1140_126_Stats$Mean_Temp_Driest_Qtr_2011_2040_126 <- Mean_Temp_Driest_Qtr_2011_2040_126_df$Mean_Temp_Driest_Qtr_2011_2040_126
MRIESM2_1140_126_Stats$Prec_of_Wettest_Month_2011_2040_126 <- Prec_of_Wettest_Month_2011_2040_126_df$Prec_of_Wettest_Month_2011_2040_126

MRIESM2_1140_126_Stats %>% rename('Predicted_Bd_Suitability' = `Predicted Bd Suitability`)

MRIESM2_1140_126_Stats <- MRIESM2_1140_126_Stats %>% mutate('Suitability_Levels' = ntile('Predicted_Bd_Suitability', 4))

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
                                                                               palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"))# +
#  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
#  stat_compare_means(label.y = 55)

# Mean Diurnal Range

Mean_Diurnal_Range_2011_2040_126_Boxplot <- MRIESM2_1140_126_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                 y = "Mean_Diurnal_Range_2011_2040_126",
                                                                                 xlab = "Predicted Bd Distribution",
                                                                                 ylab = "Mean Diurnal Range (2011-2040) ssp126",
                                                                                 fill = "Suitability_Levels",
                                                                                 palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"))# +
#  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
#  stat_compare_means(label.y = 35)

# Isothermality

Isothermality_2011_2040_126_Boxplot <- MRIESM2_1140_126_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                            y = "Isothermality_2011_2040_126",
                                                                            xlab = "Predicted Bd Distribution",
                                                                            ylab = "Isothermality (2011-2040) ssp126",
                                                                            fill = "Suitability_Levels",
                                                                            palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"))# +
#  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
#  stat_compare_means(label.y = 3)

# Mean Temperature of The Driest Quarter

Mean_Temp_Driest_Qtr_2011_2040_126_Boxplot <- MRIESM2_1140_126_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                   y = "Mean_Temp_Driest_Qtr_2011_2040_126",
                                                                                   xlab = "Predicted Bd Distribution",
                                                                                   ylab = "Mean Temp. Driest Qtr. (2011-2040) ssp126",
                                                                                   fill = "Suitability_Levels",
                                                                                   palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"))# +
#  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
#  stat_compare_means(label.y = 55)

# Precipitation of The Wettest Month

Prec_of_Wettest_Month_2011_2040_126_Boxplot <- MRIESM2_1140_126_Stats %>% ggboxplot(x = "Suitability_Levels",
                                                                                    y = "Prec_of_Wettest_Month_2011_2040_126",
                                                                                    xlab = "Predicted Bd Distribution",
                                                                                    ylab = "Prec. of Wettest Month (2011-2040) ssp126",
                                                                                    fill = "Suitability_Levels",
                                                                                    palette = c("#2e00fa", "#a000bc", "#ca0086", "#e40058"))# +
#  stat_compare_means(comparisons = bin_comparisons, label = "p.signif") +
#  stat_compare_means(label.y = 855)
