# 1. Set Working Directory
getwd()
# Create a new folder on your computer "AI_Omics_Internship_2025".
dir.create('AI_Omics_Internship_2025')
# 2. Create Project Folder
# Inside the project directory, create the following subfolders using R code:
# raw_data, clean_data, scripts, results or Tasks
dir.create('raw_dat')
dir.create('clean_data')
dir.create('scripts')
dir.create('results')
dir.create('Tasks')
# 3. Download "patient_info.csv" dataset from GitHub repository

# load the dataset into your R environment
Data = read.csv('patient_info.csv')

# Inspect the structure of the dataset using appropriate R functions

str(Data)

View(Data)
#Identify variables with incorrect or inconsistent data types.

sapply(Data, class)

# gender, diagnosis, and smoker must be factors

# Convert variables to appropriate data types where needed
Data$gender    <- as.factor(Data$gender)
Data$diagnosis <- as.factor(Data$diagnosis)
Data$smoker    <- as.factor(Data$smoker)

sapply(Data, class)

# Create a new variable for smoking status as a binary factor:

# 1 for "Yes", 0 for "No"
Data$smoker_binary <- ifelse(Data$smoker == "Yes", 1, 0)

sapply(Data, class)

Data$smoker_binary <- factor(Data$smoker_binary, levels = c(0, 1))

sapply(Data, class)

#save file

write.csv(Data, file = "clean_data/patient_info_clean.csv")
