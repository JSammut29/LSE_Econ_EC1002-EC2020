# Load necessary libraries
library(ggplot2)

# Define the x values
x_values <- seq(0, 200, by = 0.05)

# Define the functions
demand_curve <- function(x) -10 * x + (500 + 8 * sqrt(8000))
marginal_cost_curve <- function(x) 500 - 6 * x + 0.0005 * x^3
average_total_cost_curve <- function(x) (500 * x - (6/2) * x^2 + (0.0005/4) * x^4) / x

# Calculate the equilibrium point
x_eq <- sqrt(8000)
y_eq <- 500 - 2 * sqrt(8000)

# Create a data frame
data <- data.frame(
  x = x_values,
  Demand_Curve = demand_curve(x_values),
  Marginal_Cost_Curve = marginal_cost_curve(x_values),
  Average_Total_Cost_Curve = average_total_cost_curve(x_values)
)

# Create the plot
ggplot(data) +
  # Demand Curve
  geom_line(aes(x = x, y = Demand_Curve, color = "Demand Curve"), size = 1.2) +
  
  # Marginal Cost Curve
  geom_line(aes(x = x, y = Marginal_Cost_Curve, color = "Marginal Cost Curve"), size = 1.2) +
  
  # Average Total Cost Curve
  geom_line(aes(x = x, y = Average_Total_Cost_Curve, color = "Average Total Cost Curve"), size = 1.2) +
  
  # Add the equilibrium point
  geom_point(aes(x = x_eq, y = y_eq, color = "Equilibrium = (89.4, 321.1)"), size = 3, shape = 4, stroke = 2) + # shape 4 is the "X"
  
  # Set the axis limits
  scale_x_continuous(limits = c(0, 200)) +
  scale_y_continuous(limits = c(0, 1000)) +
  
  # Reordering the legend
  scale_color_manual(
    values = c(
      "Demand Curve" = "#33a02c",             # Blue for Demand Curve
      "Marginal Cost Curve" = "#1f78b4",      # Green for Marginal Cost Curve
      "Average Total Cost Curve" = "#e31a1c", # Red for Average Total Cost Curve
      "Equilibrium = (89.4, 321.1)" = "black"                 # Black for Equilibrium "X"
    ),
    breaks = c(
      "Demand Curve", 
      "Marginal Cost Curve", 
      "Average Total Cost Curve", 
      "Equilibrium = (89.4, 321.1)"
    )
  ) +
  
  # Customize the plot
  labs(
    title = "Initial Equilibrium Position",
    x = "Quantity (x)",
    y = "Price/Cost (y)",
    color = "Curve"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),
    legend.title = element_blank(),
    legend.position = c(0.85, 0.85), # Top right "island" position
    legend.background = element_rect(fill = "white", color = "black"),
    legend.box.background = element_rect(color = "black")
  )

#############################
# Imposition of Lump-Sum Tax

# Define the new Average Total Cost Curve (shifted)
new_average_total_cost_curve <- function(x) {
  ((500 * x - (6/2) * x^2 + (0.0005/4) * x^4) / x) + 50
}

# Create a new plot
ggplot(data) +
  # Demand Curve
  geom_line(aes(x = x, y = Demand_Curve, color = "Demand Curve"), size = 1.2) +
  
  # Marginal Cost Curve
  geom_line(aes(x = x, y = Marginal_Cost_Curve, color = "Marginal Cost Curve"), size = 1.2) +
  
  # Original Average Total Cost Curve (dashed line)
  geom_line(aes(x = x, y = Average_Total_Cost_Curve, color = "Average Total Cost Curve"), size = 0.9, linetype = "dashed") +
  
  # New Average Total Cost Curve (solid line)
  geom_line(aes(x = x, y = new_average_total_cost_curve(x), color = "Average Total Cost Curve"), size = 1.2) +
  
  # Add the equilibrium point (keeping it as it was)
  geom_point(aes(x = x_eq, y = y_eq, color = "Equilibrium = (89.4, 321.1)"), size = 3, shape = 4, stroke = 2) +
  
  # Add a dashed black vertical line at x = sqrt(8000)
  geom_vline(xintercept = x_eq, linetype = "dashed", color = "black", size = 0.6) +
  
  # Set the axis limits
  scale_x_continuous(limits = c(0, 200)) +
  scale_y_continuous(limits = c(0, 1000)) +
  
  # Reordering the legend (remains unchanged)
  scale_color_manual(
    values = c(
      "Demand Curve" = "#33a02c",             # Green for Demand Curve
      "Marginal Cost Curve" = "#1f78b4",      # Blue for Marginal Cost Curve
      "Average Total Cost Curve" = "#e31a1c", # Red for Average Total Cost Curve
      "Equilibrium = (89.4, 321.1)" = "black" # Black for Equilibrium "X"
    ),
    breaks = c(
      "Demand Curve", 
      "Marginal Cost Curve", 
      "Average Total Cost Curve", 
      "Equilibrium = (89.4, 321.1)"
    )
  ) +
  
  # Customize the plot (same as before)
  labs(
    title = "Imposition of Lump-Sum Tax",
    x = "Quantity (x)",
    y = "Price/Cost (y)",
    color = "Curve"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),
    legend.title = element_blank(),
    legend.position = c(0.85, 0.85), # Top right "island" position
    legend.background = element_rect(fill = "white", color = "black"),
    legend.box.background = element_rect(color = "black")
  )

#################################
# Long-Run Impact of Lump-Sum Tax

# Define the new Aggregate Supply Curve
aggregate_supply_curve <- function(x) {
  500 - 6 * (x + 12.34859) + 0.0005 * (x + 12.34859)^3
}

# New equilibrium point
x_new_eq <- 84.35763
y_new_eq <- 371.96543

# Create a new plot
ggplot(data) +
  # Demand Curve
  geom_line(aes(x = x, y = Demand_Curve, color = "Demand Curve"), size = 1.2) +
  
  # Marginal Cost Curve
  geom_line(aes(x = x, y = Marginal_Cost_Curve, color = "Marginal Cost Curve"), size = 0.9) +
  
  # Original Average Total Cost Curve (dashed line)
  geom_line(aes(x = x, y = Average_Total_Cost_Curve, color = "Average Total Cost Curve"), size = 0.9, linetype = "dashed") +
  
  # New Average Total Cost Curve (solid line)
  geom_line(aes(x = x, y = new_average_total_cost_curve(x), color = "Average Total Cost Curve"), size = 1.2) +
  
  # Aggregate Supply Curve
  geom_line(aes(x = x, y = aggregate_supply_curve(x), color = "Aggregate Supply Curve"), size = 1.2) +
  
  # Add the equilibrium point (Pre-Tax Equilibrium)
  geom_point(aes(x = x_eq, y = y_eq, color = "Pre-Tax Equilibrium"), size = 2, shape = 4, stroke = 1) +
  
  # Add the new equilibrium point
  geom_point(aes(x = x_new_eq, y = y_new_eq, color = "New Equilibrium = (84.4, 372.0)"), size = 3, shape = 4, stroke = 2) +
  
  # Add a dashed black vertical line at x = sqrt(8000)
  geom_vline(xintercept = x_eq, linetype = "dashed", color = "black", size = 0.6) +
  
  # Add a dashed black horizontal line at y = 550 - 2 * sqrt(8000)
  geom_hline(yintercept = 550 - 2 * sqrt(8000), linetype = "dashed", color = "black", size = 0.6) +
  
  # Set the axis limits
  scale_x_continuous(limits = c(0, 200)) +
  scale_y_continuous(limits = c(0, 1000)) +
  
  # Reordering the legend
  scale_color_manual(
    values = c(
      "Demand Curve" = "#33a02c",                   # Green for Demand Curve
      "Marginal Cost Curve" = "#1f78b4",            # Blue for Marginal Cost Curve
      "Average Total Cost Curve" = "#e31a1c",       # Red for Average Total Cost Curve
      "Aggregate Supply Curve" = "#A020F0",         # Orange for Aggregate Supply Curve
      "Pre-Tax Equilibrium" = "black",               # Grey for Pre-Tax Equilibrium "X"
      "New Equilibrium = (84.4, 372.0)" = "black"   # Black for New Equilibrium "X"
    ),
    breaks = c(
      "Demand Curve", 
      "Marginal Cost Curve", 
      "Average Total Cost Curve", 
      "Aggregate Supply Curve",
      "Pre-Tax Equilibrium", 
      "New Equilibrium = (84.4, 372.0)"
    )
  ) +
  
  # Customize the plot
  labs(
    title = "Long-Run Impact of Lump-Sum Tax",
    x = "Quantity (x)",
    y = "Price/Cost (y)",
    color = "Curve"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),
    legend.title = element_blank(),
    legend.position = c(0.85, 0.85), # Top right "island" position
    legend.background = element_rect(fill = "white", color = "black"),
    legend.box.background = element_rect(color = "black")
  )
