library(tidyverse)
library(ggpubr)
# Filter out the max suitability levels return only rows that have suitability_level == 4.

Current_maxSuit <- Current_Stats %>% filter(Suitability_Levels == 4)
MRIESM2_1140_126_maxSuit <- MRIESM2_1140_126_Stats %>% filter(Suitability_Levels == 4)
MRIESM2_1140_585_maxSuit <- MRIESM2_1140_585_Stats %>% filter(Suitability_Levels == 4)
MRIESM2_4170_126_maxSuit <- MRIESM2_4170_126_Stats %>% filter(Suitability_Levels == 4)
MRIESM2_4170_585_maxSuit <- MRIESM2_4170_585_Stats %>% filter(Suitability_Levels == 4)

# Plot map data for the highest suitability level (4)

Current_maxSuit_map <- ggplot(data = Current_maxSuit, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `Predicted_Bd_Suitability`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

MRIESM2_1140_126_maxSuit_map <- ggplot(data = MRIESM2_1140_126_maxSuit, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `Predicted_Bd_Suitability`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

MRIESM2_1140_585_maxSuit_map <- ggplot(data = MRIESM2_1140_585_maxSuit, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `Predicted_Bd_Suitability`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

MRIESM2_4170_126_maxSuit_map <- ggplot(data = MRIESM2_4170_126_maxSuit, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `Predicted_Bd_Suitability`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

MRIESM2_4170_585_maxSuit_map <- ggplot(data = MRIESM2_4170_585_maxSuit, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `Predicted_Bd_Suitability`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

# Plot binary plots

# Create Binary data (add columns full of 1)

Current_maxSuit <- Current_maxSuit %>% mutate(binary = 1)
MRIESM2_1140_126_maxSuit <- MRIESM2_1140_126_maxSuit %>% mutate(binary = 1)
MRIESM2_1140_585_maxSuit <- MRIESM2_1140_585_maxSuit %>% mutate(binary = 1)
MRIESM2_4170_126_maxSuit <- MRIESM2_4170_126_maxSuit %>% mutate(binary = 1)
MRIESM2_4170_585_maxSuit <- MRIESM2_4170_585_maxSuit %>% mutate(binary = 1)

Current_maxSuit_binary_map <- ggplot(data = Current_maxSuit, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `binary`, colour = "white", alpha = 0.3), show.legend = FALSE) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

MRIESM2_1140_126_maxSuit_binary_map <- ggplot(data = MRIESM2_1140_126_maxSuit, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `binary`, colour = "white", alpha = 0.3), show.legend = FALSE) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

MRIESM2_1140_585_maxSuit_binary_map <- ggplot(data = MRIESM2_1140_585_maxSuit, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `binary`, colour = "white", alpha = 0.3), show.legend = FALSE) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

MRIESM2_4170_126_maxSuit_binary_map <- ggplot(data = MRIESM2_4170_126_maxSuit, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `binary`, colour = "white", alpha = 0.3), show.legend = FALSE) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

MRIESM2_4170_585_maxSuit_binary_map <- ggplot(data = MRIESM2_4170_585_maxSuit, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `binary`, colour = "white", alpha = 0.3), show.legend = FALSE) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))


# Full Predictions with binary map

Current_Avg_preds_binary <- ggplot(data = Current_Avg_df, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `Predicted_Bd_Suitability`)) +
  scale_fill_distiller(palette = "RdGy", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5)) + 
  geom_tile(data = Current_maxSuit, aes(fill = `binary`, alpha = 0.3))

MRIESM2_1140_126_Avg_preds_binary <- ggplot(data = MRIESM2_1140_126_Avg_df, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `Predicted_Bd_Suitability`)) +
  scale_fill_distiller(palette = "RdGy", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5)) +
  geom_tile(data = MRIESM2_1140_126_maxSuit, aes(fill = `binary`, alpha = 0.3))

MRIESM2_1140_585_Avg_preds_binary <- ggplot(data = MRIESM2_1140_585_Avg_df, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `Predicted_Bd_Suitability`)) +
  scale_fill_distiller(palette = "RdGy", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5)) +
  geom_tile(data = MRIESM2_1140_585_maxSuit, aes(fill = `binary`, alpha = 0.3))

MRIESM2_4170_126_Avg_preds_binary <- ggplot(data = MRIESM2_4170_126_Avg_df, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `Predicted_Bd_Suitability`)) +
  scale_fill_distiller(palette = "RdGy", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5)) +
  geom_tile(data = MRIESM2_4170_126_maxSuit, aes(fill = `binary`, alpha = 0.3))

MRIESM2_4170_585_Avg_preds_binary <- ggplot(data = MRIESM2_4170_585_Avg_df, aes(x=Longitude, y=Latitude)) +
  geom_tile(aes(fill = `Predicted_Bd_Suitability`)) +
  scale_fill_distiller(palette = "RdGy", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5)) +
  geom_tile(data = MRIESM2_4170_585_maxSuit, aes(fill = `binary`, alpha = 0.3))
  
# Compile all env vars from each year range and projection type for comparison.

# First Select columns individually and create an instance of their record in order to compile them together in future code.

# Annual Mean Temperature
An_Mn_Tmp_Curr_mxst <- Current_maxSuit %>%
  select(Annual_Mean_Temperature_Current)
An_Mn_Tmp_1140_126_mxst <- MRIESM2_1140_126_maxSuit %>%
  select(Annual_Mean_Temp_2011_2040_126)
An_Mn_Tmp_1140_585_mxst <- MRIESM2_1140_585_maxSuit %>%
  select(Annual_Mean_Temp_2011_2040_585)
An_Mn_Tmp_4170_126_mxst <- MRIESM2_4170_126_maxSuit %>%
  select(Annual_Mean_Temp_2041_2070_126)
An_Mn_Tmp_4170_585_mxst <- MRIESM2_4170_585_maxSuit %>%
  select(Annual_Mean_Temp_2041_2070_585)

# Combine

An_Mn_Tmp_full_mxst <- bind_cols(list(An_Mn_Tmp_Curr_mxst,
                                      An_Mn_Tmp_1140_126_mxst,
                                      An_Mn_Tmp_1140_585_mxst,
                                      An_Mn_Tmp_4170_126_mxst,
                                      An_Mn_Tmp_4170_585_mxst))

# Configure

colnames(An_Mn_Tmp_full_mxst) <- c('Current',
                                   '(2011-2040) ssp126',
                                   '(2011-2040) ssp585',
                                   '(2041-2070) ssp126',
                                   '(2041-2070) ssp585')

An_Mn_Tmp_full_mxst <- An_Mn_Tmp_full_mxst %>%
  pivot_longer(everything(), names_to = "Variable", values_to = "Value")

An_Mn_Tmp_full_mxst_boxplot <- An_Mn_Tmp_full_mxst %>%
  ggboxplot(x = "Variable",
            y = "Value",
            xlab = "Projection and Year Range",
            ylab = "Annual Mean Temperature \n Highest Bd Suitability",
            fill = "Variable",
            palette = c("#003f5c", "#58508d", "#bc5090", "#ff6361", "#ffa600")) +
stat_compare_means(comparisons = list(c('Current',
                                        '(2011-2040) ssp126'),
                                      c('(2011-2040) ssp126',
                                        '(2011-2040) ssp585'),
                                      c('Current',
                                        '(2011-2040) ssp585'),
                                      c('(2011-2040) ssp585',
                                        '(2041-2070) ssp126'),
                                      c('Current',
                                        '(2041-2070) ssp126'),
                                      c('(2041-2070) ssp126',
                                        '(2041-2070) ssp585'),
                                      c('Current',
                                        '(2041-2070) ssp585'),
                                      c('(2011-2040) ssp126',
                                        '(2041-2070) ssp126'),
                                      c('(2011-2040) ssp585',
                                        '(2041-2070) ssp585'),
                                      c('(2011-2040) ssp126',
                                        '(2041-2070) ssp585')),
                   label = "p.signif", hide.ns = FALSE) +
stat_compare_means(label.y = 50)


# Mean Diurnal Range

Mn_Dnl_Rng_Curr_mxst <- Current_maxSuit %>%
  select(Mean_Diurnal_Range_Current)
Mn_Dnl_Rng_1140_126_mxst <- MRIESM2_1140_126_maxSuit %>%
  select(Mean_Diurnal_Range_2011_2040_126)
Mn_Dnl_Rng_1140_585_mxst <- MRIESM2_1140_585_maxSuit %>%
  select(Mean_Diurnal_Range_2011_2040_585)
Mn_Dnl_Rng_4170_126_mxst <- MRIESM2_4170_126_maxSuit %>%
  select(Mean_Diurnal_Range_2041_2070_126)
Mn_Dnl_Rng_4170_585_mxst <- MRIESM2_4170_585_maxSuit %>%
  select(Mean_Diurnal_Range_2041_2070_585)

# Combine

Mn_Dnl_Rng_full_mxst <- bind_cols(list(Mn_Dnl_Rng_Curr_mxst,
                                       Mn_Dnl_Rng_1140_126_mxst,
                                       Mn_Dnl_Rng_1140_585_mxst,
                                       Mn_Dnl_Rng_4170_126_mxst,
                                       Mn_Dnl_Rng_4170_585_mxst))

# Configure

colnames(Mn_Dnl_Rng_full_mxst) <- c('Current',
                                    '(2011-2040) ssp126',
                                    '(2011-2040) ssp585',
                                    '(2041-2070) ssp126',
                                    '(2041-2070) ssp585')

Mn_Dnl_Rng_full_mxst <- Mn_Dnl_Rng_full_mxst %>%
  pivot_longer(everything(), names_to = "Variable", values_to = "Value")

Mn_Dnl_Rng_full_mxst_boxplot <- Mn_Dnl_Rng_full_mxst %>%
  ggboxplot(x = "Variable",
            y = "Value",
            xlab = "Projection and Year Range",
            ylab = "Mean Diurnal Range \n Highest Bd Suitability",
            fill = "Variable",
            palette = c("#003f5c", "#58508d", "#bc5090", "#ff6361", "#ffa600")) +
stat_compare_means(comparisons = list(c('Current',
                                        '(2011-2040) ssp126'),
                                      c('(2011-2040) ssp126',
                                        '(2011-2040) ssp585'),
                                      c('Current',
                                        '(2011-2040) ssp585'),
                                      c('(2011-2040) ssp585',
                                        '(2041-2070) ssp126'),
                                      c('Current',
                                        '(2041-2070) ssp126'),
                                      c('(2041-2070) ssp126',
                                        '(2041-2070) ssp585'),
                                      c('Current',
                                        '(2041-2070) ssp585'),
                                      c('(2011-2040) ssp126',
                                        '(2041-2070) ssp126'),
                                      c('(2011-2040) ssp585',
                                        '(2041-2070) ssp585'),
                                      c('(2011-2040) ssp126',
                                        '(2041-2070) ssp585')),
                  label = "p.signif", hide.ns = FALSE) +
stat_compare_means(label.y = 35)


# Isothermality

Iso_Curr_mxst <- Current_maxSuit %>%
  select(Isothermality_Current)
Iso_1140_126_mxst <- MRIESM2_1140_126_maxSuit %>%
  select(Isothermality_2011_2040_126)
Iso_1140_585_mxst <- MRIESM2_1140_585_maxSuit %>%
  select(Isothermality_2011_2040_585)
Iso_4170_126_mxst <- MRIESM2_4170_126_maxSuit %>%
  select(Isothermality_2041_2070_126)
Iso_4170_585_mxst <- MRIESM2_4170_585_maxSuit %>%
  select(Isothermality_2041_2070_585)

# Combine

Iso_full_mxst <- bind_cols(list(Iso_Curr_mxst,
                                Iso_1140_126_mxst,
                                Iso_1140_585_mxst,
                                Iso_4170_126_mxst,
                                Iso_4170_585_mxst))

# Configure

colnames(Iso_full_mxst) <- c('Current',
                             '(2011-2040) ssp126',
                             '(2011-2040) ssp585',
                             '(2041-2070) ssp126',
                             '(2041-2070) ssp585')

Iso_full_mxst <- Iso_full_mxst %>%
  pivot_longer(everything(), names_to = "Variable", values_to = "Value")

Iso_full_mxst_boxplot <- Iso_full_mxst %>%
  ggboxplot(x = "Variable",
            y = "Value",
            xlab = "Projection and Year Range",
            ylab = "Isothermality \n Highest Bd Suitability",
            fill = "Variable",
            palette = c("#003f5c", "#58508d", "#bc5090", "#ff6361", "#ffa600")) +
stat_compare_means(comparisons = list(c('Current',
                                        '(2011-2040) ssp126'),
                                      c('(2011-2040) ssp126',
                                        '(2011-2040) ssp585'),
                                      c('Current',
                                        '(2011-2040) ssp585'),
                                      c('(2011-2040) ssp585',
                                        '(2041-2070) ssp126'),
                                      c('Current',
                                        '(2041-2070) ssp126'),
                                      c('(2041-2070) ssp126',
                                        '(2041-2070) ssp585'),
                                      c('Current',
                                        '(2041-2070) ssp585'),
                                      c('(2011-2040) ssp126',
                                        '(2041-2070) ssp126'),
                                      c('(2011-2040) ssp585',
                                        '(2041-2070) ssp585'),
                                      c('(2011-2040) ssp126',
                                        '(2041-2070) ssp585')),
                  label = "p.signif", hide.ns = FALSE) +
stat_compare_means(label.y = 1.5)

# Mean Temperature of the Driest Quarter

Mn_Tmp_Dst_Qtr_Curr_mxst <- Current_maxSuit %>%
  select(Mean_Temp_Driest_Qtr_Current)
Mn_Tmp_Dst_Qtr_1140_126_mxst <- MRIESM2_1140_126_maxSuit %>%
  select(Mean_Temp_Driest_Qtr_2011_2040_126)
Mn_Tmp_Dst_Qtr_1140_585_mxst <- MRIESM2_1140_585_maxSuit %>%
  select(Mean_Temp_Driest_Qtr_2011_2040_585)
Mn_Tmp_Dst_Qtr_4170_126_mxst <- MRIESM2_4170_126_maxSuit %>%
  select(Mean_Temp_Driest_Qtr_2041_2070_126)
Mn_Tmp_Dst_Qtr_4170_585_mxst <- MRIESM2_4170_585_maxSuit %>%
  select(Mean_Temp_Driest_Qtr_2041_2070_585)

# Combine

Mn_Tmp_Dst_Qtr_full_mxst <- bind_cols(list(Mn_Tmp_Dst_Qtr_Curr_mxst,
                                           Mn_Tmp_Dst_Qtr_1140_126_mxst,
                                           Mn_Tmp_Dst_Qtr_1140_585_mxst,
                                           Mn_Tmp_Dst_Qtr_4170_126_mxst,
                                           Mn_Tmp_Dst_Qtr_4170_585_mxst))

# Configure

colnames(Mn_Tmp_Dst_Qtr_full_mxst) <- c('Current',
                                        '(2011-2040) ssp126',
                                        '(2011-2040) ssp585',
                                        '(2041-2070) ssp126',
                                        '(2041-2070) ssp585')

Mn_Tmp_Dst_Qtr_full_mxst <- Mn_Tmp_Dst_Qtr_full_mxst %>%
  pivot_longer(everything(), names_to = "Variable", values_to = "Value")

Mn_Tmp_Dst_Qtr_full_mxst_boxplot <- Mn_Tmp_Dst_Qtr_full_mxst %>%
  ggboxplot(x = "Variable",
            y = "Value",
            xlab = "Projection and Year Range",
            ylab = "Mean Temp. of the Driest Qtr \n Highest Bd Suitability",
            fill = "Variable",
            palette = c("#003f5c", "#58508d", "#bc5090", "#ff6361", "#ffa600")) +
stat_compare_means(comparisons = list(c('Current',
                                        '(2011-2040) ssp126'),
                                      c('(2011-2040) ssp126',
                                        '(2011-2040) ssp585'),
                                      c('Current',
                                        '(2011-2040) ssp585'),
                                      c('(2011-2040) ssp585',
                                        '(2041-2070) ssp126'),
                                      c('Current',
                                        '(2041-2070) ssp126'),
                                      c('(2041-2070) ssp126',
                                        '(2041-2070) ssp585'),
                                      c('Current',
                                        '(2041-2070) ssp585'),
                                      c('(2011-2040) ssp126',
                                        '(2041-2070) ssp126'),
                                      c('(2011-2040) ssp585',
                                        '(2041-2070) ssp585'),
                                      c('(2011-2040) ssp126',
                                        '(2041-2070) ssp585')),
                  label = "p.signif", hide.ns = FALSE) +
stat_compare_means(label.y = 50)


# Precipitation of the Wettest Month

Prc_Wst_Mnth_Curr_mxst <- Current_maxSuit %>%
  select(Prec_of_Wettest_Month_Current)
Prc_Wst_Mnth_1140_126_mxst <- MRIESM2_1140_126_maxSuit %>%
  select(Prec_of_Wettest_Month_2011_2040_126)
Prc_Wst_Mnth_1140_585_mxst <- MRIESM2_1140_585_maxSuit %>%
  select(Prec_of_Wettest_Month_2011_2040_585)
Prc_Wst_Mnth_4170_126_mxst <- MRIESM2_4170_126_maxSuit %>%
  select(Prec_of_Wettest_Month_2041_2070_126)
Prc_Wst_Mnth_4170_585_mxst <- MRIESM2_4170_585_maxSuit %>%
  select(Prec_of_Wettest_Month_2041_2070_585)

# Combine

Prc_Wst_Mnth_full_mxst <- bind_cols(list(Prc_Wst_Mnth_Curr_mxst,
                                         Prc_Wst_Mnth_1140_126_mxst,
                                         Prc_Wst_Mnth_1140_585_mxst,
                                         Prc_Wst_Mnth_4170_126_mxst,
                                         Prc_Wst_Mnth_4170_585_mxst))

# Configure

colnames(Prc_Wst_Mnth_full_mxst) <- c('Current',
                                      '(2011-2040) ssp126',
                                      '(2011-2040) ssp585',
                                      '(2041-2070) ssp126',
                                      '(2041-2070) ssp585')

Prc_Wst_Mnth_full_mxst <- Prc_Wst_Mnth_full_mxst %>%
  pivot_longer(everything(), names_to = "Variable", values_to = "Value")

Prc_Wst_Mnth_full_mxst_boxplot <- Prc_Wst_Mnth_full_mxst %>%
  ggboxplot(x = "Variable",
            y = "Value",
            xlab = "Projection and Year Range",
            ylab = "Prec. of the Wettest Month \n Highest Bd Suitability",
            fill = "Variable",
            ppalette = c("#003f5c", "#58508d", "#bc5090", "#ff6361", "#ffa600")) +
stat_compare_means(comparisons = list(c('Current',
                                        '(2011-2040) ssp126'),
                                      c('(2011-2040) ssp126',
                                        '(2011-2040) ssp585'),
                                      c('Current',
                                        '(2011-2040) ssp585'),
                                      c('(2011-2040) ssp585',
                                        '(2041-2070) ssp126'),
                                      c('Current',
                                        '(2041-2070) ssp126'),
                                      c('(2041-2070) ssp126',
                                        '(2041-2070) ssp585'),
                                      c('Current',
                                        '(2041-2070) ssp585'),
                                      c('(2011-2040) ssp126',
                                        '(2041-2070) ssp126'),
                                      c('(2011-2040) ssp585',
                                        '(2041-2070) ssp585'),
                                      c('(2011-2040) ssp126',
                                        '(2041-2070) ssp585')),
                  label = "p.signif", hide.ns = FALSE) +
stat_compare_means(label.y = 550)

