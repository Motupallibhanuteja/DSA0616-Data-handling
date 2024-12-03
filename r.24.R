# Load necessary libraries
library(ggplot2)
library(plotly)
library(akima)

# Data
environment_data <- data.frame(
  Location = c("A", "B", "C", "D", "E"),
  Temperature = c(15, 20, 18, 12, 17),
  Humidity = c(65, 70, 68, 60, 72),
  CO2Levels = c(400, 450, 420, 380, 430)
)

# 1. Correlation Analysis
cor_matrix <- cor(environment_data[, c("Temperature", "Humidity", "CO2Levels")])
print("Correlation Matrix:")
print(cor_matrix)

# 2. 3D Scatter Plot: Temperature vs Humidity with CO2 Levels as Color
scatter_plot <- plot_ly(environment_data, 
                        x = ~Temperature, 
                        y = ~Humidity, 
                        z = ~CO2Levels, 
                        color = ~CO2Levels, 
                        colors = colorRamp(c("blue", "red")), 
                        type = "scatter3d", 
                        mode = "markers") %>%
  layout(title = "3D Scatter: Temperature vs Humidity (CO2 Levels as Color)",
         scene = list(
           xaxis = list(title = "Temperature (°C)"),
           yaxis = list(title = "Humidity (%)"),
           zaxis = list(title = "CO2 Levels (ppm)")))
scatter_plot

# 3. Spatial Patterns in the 3D Scatter Plot
# Insights will be derived visually from the scatter_plot.

# 4. 3D Surface Plot: CO2 Levels vs Temperature and Humidity
interp_data <- with(environment_data, interp(Temperature, Humidity, CO2Levels))
surface_plot <- plot_ly(x = interp_data$x, 
                        y = interp_data$y, 
                        z = interp_data$z, 
                        type = "surface", 
                        colorscale = "Viridis") %>%
  layout(title = "3D Surface: CO2 Levels vs Temperature and Humidity",
         scene = list(
           xaxis = list(title = "Temperature (°C)"),
           yaxis = list(title = "Humidity (%)"),
           zaxis = list(title = "CO2 Levels (ppm)")))
surface_plot

# 5. Separate Surface Plots for CO2 Levels vs Temperature and Humidity
# CO2 Levels vs Temperature
interp_temp <- with(environment_data, interp(Temperature, seq(min(Humidity), max(Humidity), length.out=5), CO2Levels))
surface_temp <- plot_ly(x = interp_temp$x, 
                        y = interp_temp$y, 
                        z = interp_temp$z, 
                        type = "surface", 
                        colorscale = "Blues") %>%
  layout(title = "3D Surface: CO2 Levels vs Temperature",
         scene = list(
           xaxis = list(title = "Temperature (°C)"),
           yaxis = list(title = "Constant Humidity"),
           zaxis = list(title = "CO2 Levels (ppm)")))
surface_temp

# CO2 Levels vs Humidity
interp_humidity <- with(environment_data, interp(seq(min(Temperature), max(Temperature), length.out=5), Humidity, CO2Levels))
surface_humidity <- plot_ly(x = interp_humidity$x, 
                            y = interp_humidity$y, 
                            z = interp_humidity$z, 
                            type = "surface", 
                            colorscale = "Reds") %>%
  layout(title = "3D Surface: CO2 Levels vs Humidity",
         scene = list(
           xaxis = list(title = "Constant Temperature"),
           yaxis = list(title = "Humidity (%)"),
           zaxis = list(title = "CO2 Levels (ppm)")))
surface_humidity# Load necessary libraries
library(ggplot2)
library(plotly)
library(akima)

# Data
environment_data <- data.frame(
  Location = c("A", "B", "C", "D", "E"),
  Temperature = c(15, 20, 18, 12, 17),
  Humidity = c(65, 70, 68, 60, 72),
  CO2Levels = c(400, 450, 420, 380, 430)
)

# 1. Correlation Analysis
cor_matrix <- cor(environment_data[, c("Temperature", "Humidity", "CO2Levels")])
print("Correlation Matrix:")
print(cor_matrix)

# 2. 3D Scatter Plot: Temperature vs Humidity with CO2 Levels as Color
scatter_plot <- plot_ly(environment_data, 
                        x = ~Temperature, 
                        y = ~Humidity, 
                        z = ~CO2Levels, 
                        color = ~CO2Levels, 
                        colors = colorRamp(c("blue", "red")), 
                        type = "scatter3d", 
                        mode = "markers") %>%
  layout(title = "3D Scatter: Temperature vs Humidity (CO2 Levels as Color)",
         scene = list(
           xaxis = list(title = "Temperature (°C)"),
           yaxis = list(title = "Humidity (%)"),
           zaxis = list(title = "CO2 Levels (ppm)")))
scatter_plot

# 3. Spatial Patterns in the 3D Scatter Plot
# Insights will be derived visually from the scatter_plot.

# 4. 3D Surface Plot: CO2 Levels vs Temperature and Humidity
interp_data <- with(environment_data, interp(Temperature, Humidity, CO2Levels))
surface_plot <- plot_ly(x = interp_data$x, 
                        y = interp_data$y, 
                        z = interp_data$z, 
                        type = "surface", 
                        colorscale = "Viridis") %>%
  layout(title = "3D Surface: CO2 Levels vs Temperature and Humidity",
         scene = list(
           xaxis = list(title = "Temperature (°C)"),
           yaxis = list(title = "Humidity (%)"),
           zaxis = list(title = "CO2 Levels (ppm)")))
surface_plot

# 5. Separate Surface Plots for CO2 Levels vs Temperature and Humidity
# CO2 Levels vs Temperature
interp_temp <- with(environment_data, interp(Temperature, seq(min(Humidity), max(Humidity), length.out=5), CO2Levels))
surface_temp <- plot_ly(x = interp_temp$x, 
                        y = interp_temp$y, 
                        z = interp_temp$z, 
                        type = "surface", 
                        colorscale = "Blues") %>%
  layout(title = "3D Surface: CO2 Levels vs Temperature",
         scene = list(
           xaxis = list(title = "Temperature (°C)"),
           yaxis = list(title = "Constant Humidity"),
           zaxis = list(title = "CO2 Levels (ppm)")))
surface_temp

# CO2 Levels vs Humidity
interp_humidity <- with(environment_data, interp(seq(min(Temperature), max(Temperature), length.out=5), Humidity, CO2Levels))
surface_humidity <- plot_ly(x = interp_humidity$x, 
                            y = interp_humidity$y, 
                            z = interp_humidity$z, 
                            type = "surface", 
                            colorscale = "Reds") %>%
  layout(title = "3D Surface: CO2 Levels vs Humidity",
         scene = list(
           xaxis = list(title = "Constant Temperature"),
           yaxis = list(title = "Humidity (%)"),
           zaxis = list(title = "CO2 Levels (ppm)")))
surface_humidity