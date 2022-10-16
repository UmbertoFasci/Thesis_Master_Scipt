

# 2011-2040 ssp126
MRIESM2_1140_126_10k_var6_ras <- raster("~/Thesis_Master/Thesis_Master_Data/B_Dendrobatidis_Models/MRIESM2_1140/ssp126/MRIESM2_1140_ssp126_10k_vargroup6/Batrachochytrium_dendrobatidis.asc")
MRIESM2_1140_126_1k_var1_ras <- raster("~/Thesis_Master/Thesis_Master_Data/B_Dendrobatidis_Models/MRIESM2_1140/ssp126/MRIESM2_1140_ssp126_1k_vargroup1/Batrachochytrium_dendrobatidis.asc")
MRIESM2_1140_126_1k_var5_ras <- raster("~/Thesis_Master/Thesis_Master_Data/B_Dendrobatidis_Models/MRIESM2_1140/ssp126/MRIESM2_1140_ssp126_1k_vargroup5/Batrachochytrium_dendrobatidis.asc")

# 2011-2040 ssp858
MRIESM2_1140_585_10k_var6_ras <- raster("~/Thesis_Master/Thesis_Master_Data/B_Dendrobatidis_Models/MRIESM2_1140/ssp585/MRIESM2_1140_ssp585_10k_vargroup6/Batrachochytrium_dendrobatidis.asc")
MRIESM2_1140_585_1k_var1_ras <- raster("~/Thesis_Master/Thesis_Master_Data/B_Dendrobatidis_Models/MRIESM2_1140/ssp585/MRIESM2_1140_ssp585_1k_vargroup1/Batrachochytrium_dendrobatidis.asc")
MRIESM2_1140_585_1k_var5_ras <- raster("~/Thesis_Master/Thesis_Master_Data/B_Dendrobatidis_Models/MRIESM2_1140/ssp585/MRIESM2_1140_ssp585_1k_vargroup5/Batrachochytrium_dendrobatidis.asc")

# 2041-2070 ssp126
MRIESM2_4170_126_1k_var1_ras <- raster("~/Thesis_Master/Thesis_Master_Data/B_Dendrobatidis_Models/MRIESM2_4170/ssp126/MRIESM2_4170_ssp126_1k_vargroup1/Batrachochytrium_dendrobatidis.asc")

# 2041-2070 ssp858
MRIESM2_4170_585_10k_var6_ras <- raster("~/Thesis_Master/Thesis_Master_Data/B_Dendrobatidis_Models/MRIESM2_4170/ssp585/MRIESM2_4170_ssp585_10k_vargroup6/Batrachochytrium_dendrobatidis.asc")
MRIESM2_4170_585_1k_var1_ras <- raster("~/Thesis_Master/Thesis_Master_Data/B_Dendrobatidis_Models/MRIESM2_4170/ssp585/MRIESM2_4170_ssp585_1k_vargroup1/Batrachochytrium_dendrobatidis.asc")

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
colnames(MRIESM2_1140_126_Avg_df) <- c("Longitude", "Latitude", "Predicted Bd Suitability")
colnames(MRIESM2_1140_585_Avg_df) <- c("Longitude", "Latitude", "Predicted Bd Suitability")
colnames(MRIESM2_4170_126_Avg_df) <- c("Longitude", "Latitude", "Predicted Bd Suitability")
colnames(MRIESM2_4170_585_Avg_df) <- c("Longitude", "Latitude", "Predicted Bd Suitability")

# Create ggplot maps of the predicted suitability for Bd
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


# Calculate variance (sd ** 2)

# create stacked raster objects
MRIESM2_1140_126_stacked <- stack(MRIESM2_1140_126_10k_var6_ras, MRIESM2_1140_126_1k_var1_ras, MRIESM2_1140_126_1k_var5_ras)
MRIESM2_1140_585_stacked <- stack(MRIESM2_1140_585_10k_var6_ras, MRIESM2_1140_585_1k_var1_ras, MRIESM2_1140_585_1k_var5_ras)
MRIESM2_4170_585_stacked <- stack(MRIESM2_4170_585_10k_var6_ras, MRIESM2_4170_585_1k_var1_ras)

# Calculate standard deviaton
MRIESM2_1140_126_sd <- calc(MRIESM2_1140_126_stacked, fun = sd)
MRIESM2_1140_585_sd <- calc(MRIESM2_1140_126_stacked, fun = sd)
MRIESM2_4170_585_sd <- calc(MRIESM2_1140_585_stacked, fun = sd)

# Calculate Variance
MRIESM2_1140_126_Variance <- MRIESM2_1140_126_sd ** 2
MRIESM2_1140_585_Variance <- MRIESM2_1140_585_sd ** 2
MRIESM2_4170_585_Variance <- MRIESM2_4170_585_sd ** 2

# Create vairance plots with ggplot; similar to previous plot creation
# Raster to points
MRIESM2_1140_126_Variance.p <- rasterToPoints(MRIESM2_1140_126_Variance)
MRIESM2_1140_585_Variance.p <- rasterToPoints(MRIESM2_1140_585_Variance)
MRIESM2_4170_585_Variance.p <- rasterToPoints(MRIESM2_4170_585_Variance)

# Points to dataframe
MRIESM2_1140_126_Variance_df <- data.frame(MRIESM2_1140_126_Variance.p)
MRIESM2_1140_585_Variance_df <- data.frame(MRIESM2_1140_585_Variance.p)
MRIESM2_4170_585_Variance_df <- data.frame(MRIESM2_4170_585_Variance.p)

# Update column names
colnames(MRIESM2_1140_126_Variance_df) <- c("Longitude", "Latitude", "Variance")
colnames(MRIESM2_1140_585_Variance_df) <- c("Longitude", "Latitude", "Variance")
colnames(MRIESM2_4170_585_Variance_df) <- c("Longitude", "Latitude", "Variance")

# Create ggplot maps of the variance for Bd
MRIESM2_1140_126_Variance_raster <- ggplot(data = MRIESM2_1140_126_Variance_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Variance`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  scale_fill_gradient(low = "white", high = "dark green") +
  theme_bw()

MRIESM2_1140_585_Variance_raster <- ggplot(data = MRIESM2_1140_585_Variance_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Variance`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  scale_fill_gradient(low = "white", high = "dark green") +
  theme_bw()

MRIESM2_4170_585_Variance_raster <- ggplot(data = MRIESM2_4170_585_Variance_df, aes(x=Longitude, y=Latitude)) +
  geom_raster(aes(fill = `Variance`)) +
  labs(x = "Longitude", y = "Latitude") +
  coord_sf(xlim = c(110.00, 160.00), ylim = c(-45.00, -10.00), expand = T, crs = "WGS84") +
  annotation_scale(location = "bl", width_hint = 0.5) +
  scale_fill_gradient(low = "white", high = "dark green") +
  theme_bw()