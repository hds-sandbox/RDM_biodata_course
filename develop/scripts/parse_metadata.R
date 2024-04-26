# Rscript to create a metadata tsv file for r shiny catalog
check_and_install_package <- function(package_name) {
  # Suppress warnings while checking and installing the package
  suppressMessages(suppressWarnings({
    # Check if the package is available and loaded
    if (!require(package_name, character.only = TRUE)) {
      # If the package is not available, install it
      install.packages(package_name)
      # Load the package
      require(package_name, character.only = TRUE)
    }
  }))
}

# Check and install necessary libraries
check_and_install_package("yaml")
check_and_install_package("dplyr")
check_and_install_package("lubridate")


read_yaml <- function(file_path) {
  # Read the YAML file and convert it to a data frame
  df <- yaml::yaml.load_file(file_path) %>% as.data.frame(stringsAsFactors = FALSE)
  
  # Return the data frame
  return(df)
}

# Function to recursively fetch metadata.yml files
get_metadata <- function(folder_path) {
  file_list <- list.files(path = folder_path, pattern = "metadata\\.yml$", recursive = TRUE, full.names = TRUE)

  metadata_list <- lapply(file_list, read_yaml)
  
  # Combine the list of data frames into a single data frame using dplyr::bind_rows()
  combined_metadata <- bind_rows(metadata_list)

  return(combined_metadata)
}

# Specify the folder path
folder_path <- "/path/to/your/folder"

# Fetch metadata from the specified folder
metadata <- get_metadata(folder_path)

# Save the data frame as a TSV file
output_file <- paste0("database_", format(Sys.Date(), "%Y%m%d"), ".tsv")
write.table(metadata, file = output_file, sep = "\t", quote = FALSE, row.names = FALSE)

# Print confirmation message
cat("Database saved as", output_file, "\n")