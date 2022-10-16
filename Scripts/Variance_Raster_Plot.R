timedifcurr_1140_126_var_raster <- ggplot(data = time_dif_var_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Variance`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  scale_fill_gradient(low = "white", high = "dark green") +
  theme_bw()