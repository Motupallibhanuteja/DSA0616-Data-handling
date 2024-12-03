# Load necessary libraries
library(ggplot2)
library(plotly)
library(akima)

# Data
market_data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", "2023-01-04", "2023-01-05")),
  StockPrice = c(100, 102, 98, 105, 108),
  VolumeTraded = c(2.5, 3.0, 2.2, 2.8, 3.5),
  MarketCap = c(500, 510, 490, 525, 540)
)

# 1. Correlation Analysis
cor_matrix <- cor(market_data[, c("StockPrice", "VolumeTraded", "MarketCap")])
print("Correlation Matrix:")
print(cor_matrix)

# 2. 3D Scatter Plot: Volume Traded vs Market Cap with Stock Price as Color
scatter_plot <- plot_ly(market_data, 
                        x = ~VolumeTraded, 
                        y = ~MarketCap, 
                        z = ~StockPrice, 
                        color = ~StockPrice, 
                        colors = colorRamp(c("blue", "red")), 
                        type = "scatter3d", 
                        mode = "markers") %>%
  layout(title = "3D Scatter: Volume Traded vs Market Cap (Stock Price as Color)")
scatter_plot

# 3. Identify Clustering or Outliers (Visually from the Scatter Plot)
# No additional code required; insights are based on scatter_plot visualization.

# 4. 3D Surface Plot: Market Cap vs Stock Price and Volume Traded
interp_data <- with(market_data, interp(StockPrice, VolumeTraded, MarketCap))
surface_plot <- plot_ly(x = interp_data$x, 
                        y = interp_data$y, 
                        z = interp_data$z, 
                        type = "surface", 
                        colorscale = "Viridis") %>%
  layout(title = "3D Surface: Market Cap vs Stock Price and Volume Traded",
         scene = list(
           xaxis = list(title = "Stock Price ($)"),
           yaxis = list(title = "Volume Traded (millions)"),
           zaxis = list(title = "Market Cap ($)")))
surface_plot

# 5. Separate 3D Surface Plots for Stock Price vs Volume Traded and Market Cap
# Stock Price vs Volume Traded
interp_volume <- with(market_data, interp(VolumeTraded, seq(min(MarketCap), max(MarketCap), length.out=5), StockPrice))
surface_volume <- plot_ly(x = interp_volume$x, 
                          y = interp_volume$y, 
                          z = interp_volume$z, 
                          type = "surface", 
                          colorscale = "Blues") %>%
  layout(title = "3D Surface: Stock Price vs Volume Traded",
         scene = list(
           xaxis = list(title = "Volume Traded (millions)"),
           yaxis = list(title = "Constant Market Cap"),
           zaxis = list(title = "Stock Price ($)")))
surface_volume

# Stock Price vs Market Cap
interp_marketcap <- with(market_data, interp(seq(min(VolumeTraded), max(VolumeTraded), length.out=5), MarketCap, StockPrice))
surface_marketcap <- plot_ly(x = interp_marketcap$x, 
                             y = interp_marketcap$y, 
                             z = interp_marketcap$z, 
                             type = "surface", 
                             colorscale = "Reds") %>%
  layout(title = "3D Surface: Stock Price vs Market Cap",
         scene = list(
           xaxis = list(title = "Constant Volume Traded"),
           yaxis = list(title = "Market Cap ($)"),
           zaxis = list(title = "Stock Price ($)")))
surface_marketcap