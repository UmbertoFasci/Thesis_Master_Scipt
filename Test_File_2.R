library(tidyverse)
library(ggspatial)
library(patchwork)
library(raster)
library(ggpubr)

# Testing the dplyr filter method in order to 

Annual_Mean_Temp_1140_126_Queensland_df <- Annual_Mean_Temp_2011_2040_126_df %>% 
    filter(between(Longitude, 138.00, 155.00) | between(Latitude, -29.00, -9.00))

Annual_Mean_Temp_1140_126_Qnslnd_Map <- ggplot(data = Annual_Mean_Temp_1140_126_Queensland_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Annual_Mean_Temp_2011_2040_126`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(138.00, 155.00), ylim = c(-29.00, -9.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))

