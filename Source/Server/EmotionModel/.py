
# Import pandas library
import pandas as pd

# Define the data as a list of lists
data = [
    [1, 1.6252, 0.5288, 1.3960, 0.5759],
    [2, 1.1785, 0.6299, 1.3961, 0.5691],
    [3, 0.7908, 0.7497, 1.5492, 0.5686],
    [4, 0.4684, 0.8582, 1.7667, 0.5562]
]

# Define the column names as a list
columns = ["Epoch", "Train loss", "Train accuracy",
           "Validation loss", "Validation accuracy"]

# Create the DataFrame from the data and columns
df = pd.DataFrame(data=data, columns=columns)

# Display the DataFrame
print(df)


# Plot the line plot for each column
ax = df.plot.line(x="Epoch")
