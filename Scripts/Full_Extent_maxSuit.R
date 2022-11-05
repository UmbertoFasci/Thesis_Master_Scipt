library(tidyverse)

# Filter out the max suitability levels return only rows that have suitability_level == 4.

MRIESM2_1140_126_maxSuit <- MRIESM2_1140_126_Stats %>% filter(Suitability_Levels == 4)
MRIESM2_1140_585_maxSuit <- MRIESM2_1140_585_Stats %>% filter(Suitability_Levels == 4)
MRIESM2_4170_126_maxSuit <- MRIESM2_4170_126_Stats %>% filter(Suitability_Levels == 4)
MRIESM2_4170_585_maxSuit <- MRIESM2_4170_585_Stats %>% filter(Suitability_Levels == 4)

# Plot map data for the highest suitability level (4)

MRIESM2_1140_126_maxSuit_map <- ggplot(data = MRIESM2_1140_126_maxSuit, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Predicted_Bd_Suitability`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

MRIESM2_1140_585_maxSuit_map <- ggplot(data = MRIESM2_1140_585_maxSuit, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Predicted_Bd_Suitability`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

MRIESM2_4170_126_maxSuit_map <- ggplot(data = MRIESM2_4170_126_maxSuit, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Predicted_Bd_Suitability`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

MRIESM2_4170_585_maxSuit_map <- ggplot(data = MRIESM2_4170_585_maxSuit, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Predicted_Bd_Suitability`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

# Compile all env vars from each year range and projection type for comparison.

# First Select columns individually and create an instance of their record in order to compile them together in future code.

# Annual Mean Temperature

An_Mn_Tmp_1140_126_mxst <- MRIESM2_1140_126_maxSuit %>%
  select(Annual_Mean_Temp_2011_2040_126)
An_Mn_Tmp_1140_585_mxst <- MRIESM2_1140_585_maxSuit %>%
  select(Annual_Mean_Temp_2011_2040_585)
An_Mn_Tmp_4170_126_mxst <- MRIESM2_4170_126_maxSuit %>%
  select(Annual_Mean_Temp_2041_2070_126)
An_Mn_Tmp_4170_585_mxst <- MRIESM2_4170_585_maxSuit %>%
  select(Annual_Mean_Temp_2041_2070_585)

# Combine

An_Mn_Tmp_full_mxst <- bind_cols(list(An_Mn_Tmp_1140_126_mxst,
                                      An_Mn_Tmp_1140_585_mxst,
                                      An_Mn_Tmp_4170_126_mxst,
                                      An_Mn_Tmp_4170_585_mxst))

# Configure

colnames(An_Mn_Tmp_full_mxst) <- c('(2011-2040) ssp126',
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
                                        '(2041-2070) ssp585'))
                  label = "p.signif", hide.ns = FALSE) +
stat_compare_means(label.y = 50)


# Mean Diurnal Range

Mn_Dnl_Rng_1140_126_mxst <- MRIESM2_1140_126_maxSuit %>%
  select(Mean_Diurnal_Range_2011_2040_126)
Mn_Dnl_Rng_1140_585_mxst <- MRIESM2_1140_585_maxSuit %>%
  select(Mean_Diurnal_Range_2011_2040_585)
Mn_Dnl_Rng_4170_126_mxst <- MRIESM2_4170_126_maxSuit %>%
  select(Mean_Diurnal_Range_2041_2070_126)
Mn_Dnl_Rng_4170_585_mxst <- MRIESM2_4170_585_maxSuit %>%
  select(Mean_Diurnal_Range_2041_2070_585)

# Combine

Mn_Dnl_Rng_full_mxst <- bind_cols(list(Mn_Dnl_Rng_1140_126_mxst,
                                       Mn_Dnl_Rng_1140_585_mxst,
                                       Mn_Dnl_Rng_4170_126_mxst,
                                       Mn_Dnl_Rng_4170_585_mxst))

# Configure

colnames(Mn_Dnl_Rng_full_mxst) <- c('(2011-2040) ssp126',
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
                                        '(2041-2070) ssp585'))
                  label = "p.signif", hide.ns = FALSE) +
stat_compare_means(label.y = 50)


# Isothermality

Mn_Dnl_Rng_1140_126_mxst <- MRIESM2_1140_126_maxSuit %>%
  select(Mean_Diurnal_Range_2011_2040_126)
Mn_Dnl_Rng_1140_585_mxst <- MRIESM2_1140_585_maxSuit %>%
  select(Mean_Diurnal_Range_2011_2040_585)
Mn_Dnl_Rng_4170_126_mxst <- MRIESM2_4170_126_maxSuit %>%
  select(Mean_Diurnal_Range_2041_2070_126)
Mn_Dnl_Rng_4170_585_mxst <- MRIESM2_4170_585_maxSuit %>%
  select(Mean_Diurnal_Range_2041_2070_585)

# Combine

Mn_Dnl_Rng_full_mxst <- bind_cols(list(Mn_Dnl_Rng_1140_126_mxst,
                                       Mn_Dnl_Rng_1140_585_mxst,
                                       Mn_Dnl_Rng_4170_126_mxst,
                                       Mn_Dnl_Rng_4170_585_mxst))

# Configure

colnames(Mn_Dnl_Rng_full_mxst) <- c('(2011-2040) ssp126',
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
                                        '(2041-2070) ssp585'))
                  label = "p.signif", hide.ns = FALSE) +
stat_compare_means(label.y = 50)