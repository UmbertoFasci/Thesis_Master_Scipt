mean_raster_final <- ggplot(data = mean_results_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Average Prediction`)) +
  scale_fill_continuous(type = "viridis", direction = -1) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  theme_bw() +
  theme(legend.title = element_blank(),
        legend.key.size = unit(6, "mm"), legend.text = element_text(size = 6),
        panel.border = element_rect(colour = "black", size = 0.5))