# 2011-2040 ssp126 Queensland

MRIESM2_1140_126_Avg_preds_Queensland <- ggplot(data = MRIESM2_1140_126_Avg_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Predicted Bd Suitability`)) +
  scale_fill_distiller(palette = "RdGy", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(138.00, 155.00), ylim = c(-29.00, -9.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))
ggsave(device = "tiff", filename = "~/Thesis_Analysis_Final/Maps/Queensland_1140_126.tiff", units = "in", width = 5, height = 5, dpi = "retina")

MRIESM2_1140_585_Avg_preds_Queensland <- ggplot(data = MRIESM2_1140_585_Avg_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Predicted Bd Suitability`)) +
  scale_fill_distiller(palette = "RdGy", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(138.00, 155.00), ylim = c(-29.00, -9.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))
ggsave(device = "tiff", filename = "~/Thesis_Analysis_Final/Maps/Queensland_1140_585.tiff", units = "in", width = 5, height = 5, dpi = "retina")

MRIESM2_4170_126_Avg_preds_Queensland <- ggplot(data = MRIESM2_4170_126_Avg_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Predicted Bd Suitability`)) +
  scale_fill_distiller(palette = "RdGy", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(138.00, 155.00), ylim = c(-29.00, -9.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))
ggsave(device = "tiff", filename = "~/Thesis_Analysis_Final/Maps/Queensland_4170_126.tiff", units = "in", width = 5, height = 5, dpi = "retina")

MRIESM2_4170_585_Avg_preds_Queensland <- ggplot(data = MRIESM2_4170_585_Avg_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Predicted Bd Suitability`)) +
  scale_fill_distiller(palette = "RdGy", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(138.00, 155.00), ylim = c(-29.00, -9.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))
ggsave(device = "tiff", filename = "~/Thesis_Analysis_Final/Maps/Queensland_4170_585.tiff", units = "in", width = 5, height = 5, dpi = "retina")