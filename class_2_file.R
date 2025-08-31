# 1. Define the classify_gene function
classify_gene <- function(logFC, padj) {
  if (is.na(padj)) {
    padj <- 1
  }
  if (logFC > 1 && padj < 0.05) {
    return("Upregulated")
  } else if (logFC < -1 && padj < 0.05) {
    return("Downregulated")
  } else {
    return("Not_Significant")
  }
}

# 2. Define the process_file function
process_file <- function(file_name) {
  data <- read.csv(file_name)
  data$padj[is.na(data$padj)] <- 1
  data$status <- mapply(classify_gene, data$logFC, data$padj)
  
  if (!dir.exists("Results")) {
    dir.create("Results")
  }
  
  new_file_name <- paste0("Results/processed_", basename(file_name))
  write.csv(data, new_file_name, row.names = FALSE)
  
  cat("Summary for", file_name, ":\n")
  print(table(data$status))
}

list.files()

# 3. Call the function for both files
process_file("DEGs_Data_1.csv")
process_file("DEGs_Data_2.csv")
