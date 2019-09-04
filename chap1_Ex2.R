# Load HW data from Excel sample files
hwdata = readxl::read_xls("HTWT1.xls")
 
# Define Height/Weight regression from Chapter 1 
f <- function(x) {
  103.40 + (6.38 * x)
}

# Create 2 empty vectors
v_height <- vector()
v_weight <- vector()

# Print out regression for all x's in HW data
for (i in hwdata$X) {
  y = f(i)
  
  # When appending to vectors, you need to use v = append(v, ...) to capture the return from append
  v_height = append(v_height, i)
  v_weight = append(v_weight, y)
  print(cat("Height =", i, "\t", "Weight =", y))
}

# Create result array
result <- array(
  c(v_height, v_weight),                          # The data vectors
  dim = c(length(v_height), 2),                   # Dimension of rows and columns
  dimnames = list(NULL, c("Height", "Weight")))   # Row and Column names
result

plot(result,
     col = "#FF0000",
     pch = 19,
     main = "Height and Weight of male customers")
abline(103.40, 6.38, col="blue")


