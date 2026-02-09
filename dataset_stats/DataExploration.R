# Clear workspace
rm(list = ls())

# Load data
data <- read.csv("Crop_recommendation.csv")

# View data
head(data)
tail(data)

# Check size and columns
dim(data)
names(data)
str(data)

# Check missing values
colSums(is.na(data))

#duplicate values
sum(duplicated(data))

# Summary stats
summary(data)

# Numeric columns only
num_cols <- sapply(data, is.numeric)
numeric_data <- data[, num_cols]

# Mean, SD, Min, Max
stats <- data.frame(
  Mean = sapply(numeric_data, mean),
  SD = sapply(numeric_data, sd),
  Variance = sapply(numeric_data, var),
  Min = sapply(numeric_data, min),
  Max = sapply(numeric_data, max)
)

print(stats)

# Class distribution
table(data$label)
prop.table(table(data$label))

# Histograms
hist(data$temperature)
hist(data$humidity)
hist(data$rainfall)
hist(data$ph)

# Boxplots
boxplot(data$rainfall)
boxplot(data$temperature)

# Correlation matrix
cor_matrix <- cor(numeric_data)
print(cor_matrix)


# Skewness
library(e1071)


sapply(numeric_data, skewness)

# Save stats
write.csv(stats, "summary_statistics.csv", row.names = TRUE)

# End
