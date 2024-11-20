# Load necessary libraries
library(ggplot2)
library(reshape2)

# Create data frame
weather_data <- data.frame(
  Date = c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05"),
  Temperature = c(10, 12, 8, 15, 14),
  Humidity = c(75, 70, 80, 65, 72),
  Wind_Speed = c(15, 12, 18, 20, 16)
)

# 1. Temperature variation with humidity and wind speed
cor(weather_data$Temperature, weather_data$Humidity)
cor(weather_data$Temperature, weather_data$Wind_Speed)

# 2. Visualize relationship between wind speed and humidity (with temperature as third dimension)
library(rgl)
plot3d(weather_data$Humidity, weather_data$Wind_Speed, weather_data$Temperature,
       type = "s", size = 2, xlab = "Humidity (%)", ylab = "Wind Speed (km/h)", zlab = "Temperature (°C)")

# 3. Discernible pattern
ggplot(weather_data, aes(x = Humidity, y = Wind_Speed, color = Temperature)) +
  geom_point() +
  scale_color_continuous(low = "blue", high = "red") +
  labs(x = "Humidity (%)", y = "Wind Speed (km/h)", color = "Temperature (°C)")

# 4. 3D surface plot
library(akima)
humidity <- seq(min(weather_data$Humidity), max(weather_data$Humidity), length.out = 100)
wind_speed <- seq(min(weather_data$Wind_Speed), max(weather_data$Wind_Speed), length.out = 100)
H <- outer(humidity, wind_speed)
temperature <- interp(weather_data$Humidity, weather_data$Wind_Speed, weather_data$Temperature, xo = humidity, yo = wind_speed)
persp(humidity, wind_speed, temperature,
      theta = 30, phi = 30, expand = 0.5, col = "lightblue",
      xlab = "Humidity (%)", ylab = "Wind Speed (km/h)", zlab = "Temperature (°C)")

# 5. Compare 3D plots
ggplot(weather_data, aes(x = Humidity, y = Temperature)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Humidity (%)", y = "Temperature (°C)")

ggplot(weather_data, aes(x = Wind_Speed, y = Temperature)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x = "Wind Speed (km/h)", y = "Temperature (°C)")








