# 1. Check Cholesterol level (using if) 
# Write an If statement to check cholesterol level is greater than 240, 
# if true, it will prints “High Cholesterol”
cholesterol_level <- 230

if(cholesterol_level > 240){
  print('High Cholesterol')
}

# 2. Blood Pressure Status (using if...else)
# Write an if…else statement to check if blood pressure is normal.
# If it’s less than 120, print: “Blood Pressure is normal”
# If false then print: “Blood Pressure is high”

Systolic_bp <- 130

if(Systolic_bp < 120){
  print('Blood Pressure is normal')
}else{
  print('Blood Pressure is high')
}

# 3. Automating Data Type Conversion with for loop

# Use patient_info.csv data and metadata.csv

#### patient_info.csv

data_1 <- read.csv(file.choose())

View(data_1)

# Perform the following steps separately on each dataset (patient_info.csv data and metadata.csv)
# Create a copy of the dataset to work on.

patients <- data_1

str(patients)

## Identify all columns that should be converted to factor type.

#gender, diagnosis and smoker must be converted into factor 

# Store their names in a variable (factor_cols).

factor_cols <- c('gender', 'diagnosis', 'smoker')
# Use a for loop to convert all the columns in factor_cols to factor type.

for (col in factor_cols) {
    patients[[col]] <- as.factor(patients[[col]])
}
str(patients)


#### metadata.csv

data_2 <- read.csv(file.choose())
View(data_2)

str(data_2)

# Create a copy of the dataset to work on.

metada <- data_2

## Identify all columns that should be converted to factor type.

# Store their names in a variable (factor_cols).

factor_cols_1 <- c('gender', 'height')

# Use a for loop to convert all the columns in factor_cols to factor type.

for (col in factor_cols_1) {
  metada[[col]] <- as.factor(metada[[col]])
}
str(metada)

# 4. Converting Factors to Numeric Codes

# Choose one or more factor columns (e.g., smoking_status).
# Convert "Yes" to 1 and "No" to 0 using a for loop.

binary_cols <- c('smoker')

for (col in binary_cols) {
  patients[[col]] <- ifelse(patients[[col]] == "Yes", 1, 0)
}

binary_cols_1 <- c('gender')

for (col in binary_cols_1) {
  patients[[col]] <- ifelse(patients[[col]] == 'Female', 1,0)
  
}

