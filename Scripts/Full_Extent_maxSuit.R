library(tidyverse)

MRIESM2_1140_126_maxSuit <- MRIESM2_1140_126_Stats %>% filter(Suitability_Levels == 4)
MRIESM2_1140_585_maxSuit <- MRIESM2_1140_585_Stats %>% filter(Suitability_Levels == 4)
MRIESM2_4170_126_maxSuit <- MRIESM2_4170_126_Stats %>% filter(Suitability_Levels == 4)
MRIESM2_4170_585_maxSuit <- MRIESM2_4170_585_Stats %>% filter(Suitability_Levels == 4)





MRIESM2_1140_ <- ggplot(data = MRIESM2_4170_126_Avg_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Predicted Bd Suitability`)) +
  scale_fill_distiller(palette = "RdGy", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))