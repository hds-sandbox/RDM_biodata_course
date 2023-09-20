---
title: Creating a data catalog
summary: In this lesson we will learn how to create your own database based on your projects and assays' metadata.
---

# Database of your NGS experiments and projects

**Last updated:** *{{ git_revision_date_localized }}*

!!! note "Section Overview"

    &#128368; **Time Estimation:** X minutes  

    &#128172; **Learning Objectives:**    
    
    1. Learn how to create a database based on your metadata files
    2. Create and use a catalogue browser to explore your data files

Imagine the same lab as before, that lab with a ton of NGS data with lots of assays and projects folders, as we have seen in the previous section. Now, picture a researcher eager to test a hypothesis with a new NGS experiment. But here's the catch: they're unsure if a similar experiment has already been conducted in the past. This uncertainty leads to hours lost looking through the data, only to realize they're reinventing the wheel. Or even worse! They performed the experiment and now a colleague remembers that the experiment was done some time ago by someone that left the lab already. Not only time was wasted, but also money! Now, let's rewind and introduce a centralized database cataloging every NGS experiment and projects using those NGS data. In this section, we explore how we can create a database from the 'metadata.yml' files we have created for both project and assays folder and see how this simple tool will let you and your lab control your all the data saved in your storage.

## What is a database

A database is a structured repository that stores, manages, and retrieves information. Databases are the basis of efficient data organization, ensuring data integrity and accessibility. You could store your database in something as simple as a table in tabular format (like excel, tsv, csv), although it would be more appropriate to use a DataBase Management System (DBMS) like SQLite. A DBMS would allow you to store data efficiently, more securely and be able to make fast queries of data. That said, it is very possible that you do not need all these features, and a browsable table would be enough! It all depends on the complexity and number of experiments and folders you have. We will take a look at both possibilities, always trying to make it as simple as possible.

### Using a table as a database

Since all our metadata files are structured in the same way, it would be very simple to construct a table by recursively going through your main `Assays` or `Projects` folder with an R or python script, and saving it as `database_YYYYMMDD.tsv`. We would recommend to use tabs instead of commas as your separator, due to the fact that some fields (like short description, or lists of keywords, for example) may contain commas.

For example, consider this `Assays` folder:

```bash
Assays/
├── CHIP_oct4_20200101/
├── RNA_oct4_20200101/
├── CHIP_med1_20190204/
├── SCR_humanSkin_20210302/
└── SCR_humanBrain_20220610/
```

You can use an R script like this one to create a tsv table:

```R
library(yaml)
library(dplyr)
library(lubridate)

# Function to recursively fetch metadata.yml files
get_metadata <- function(folder_path) {
  file_list <- list.files(path = folder_path, pattern = "metadata\\.yml$", recursive = TRUE, full.names = TRUE)
  metadata_list <- lapply(file_list, yaml::yaml.load_file)
  return(metadata_list)
}

# Specify the folder path
folder_path <- "/path/to/your/folder"

# Fetch metadata from the specified folder
metadata <- get_metadata(folder_path)

# Convert metadata to a data frame
metadata_df <- data.frame(matrix(unlist(metadata), ncol = length(metadata), byrow = TRUE))
colnames(metadata_df) <- names(metadata[[1]])

# Save the data frame as a TSV file
output_file <- paste0("database_", format(Sys.Date(), "%Y%m%d"), ".tsv")
write.table(metadata_df, file = output_file, sep = "\t", quote = FALSE, row.names = FALSE)

# Print confirmation message
cat("Database saved as", output_file, "\n")
```

Your database table should look like this:

{{ read_table('./assets/database_example_20230810.tsv') }}

Using a tabular table is a very simple way to create a catalog of all your projects and assays, making sure your lab can keep track of all the experiments ever performed.

### Using a SQLite database

SQLite is a lightweight and self-contained relational database management system known for its simplicity and efficiency. Unlike traditional databases, SQLite doesn't require a separate server to operate, making it a convenient choice for smaller-scale applications and scenarios where resource usage needs to be minimal, like our case! It excels in tasks that involve storing and retrieving structured data, offering a reliable solution for managing information such as the metadata collected in our experiments.

All the information saved in the metadata.yml files can be recorded in a SQLite database with a script like this:

```R
library(yaml)
library(DBI)
library(dplyr)
library(lubridate)

# Function to recursively fetch metadata.yml files
get_metadata <- function(folder_path) {
  file_list <- list.files(path = folder_path, pattern = "metadata\\.yml$", recursive = TRUE, full.names = TRUE)
  metadata_list <- lapply(file_list, yaml::yaml.load_file)
  return(metadata_list)
}

# Specify the folder path
folder_path <- "/path/to/your/folder"

# Fetch metadata from the specified folder
metadata <- get_metadata(folder_path)

# Convert metadata to a data frame
metadata_df <- data.frame(matrix(unlist(metadata), ncol = length(metadata), byrow = TRUE))
colnames(metadata_df) <- names(metadata[[1]])

# Create an SQLite database and insert data
db_file <- paste0("database_", format(Sys.Date(), "%Y%m%d"), ".sqlite")
con <- dbConnect(SQLite(), db_file)

dbWriteTable(con, "metadata", metadata_df, row.names = FALSE)

# Print confirmation message
cat("Database saved as", db_file, "\n")

# Close the database connection
dbDisconnect(con)
```

!!! success "Why create a SQLite database instead of a tsv file?"

    Creating a SQLite database offers several benefits over saving data in a tabular format:

    1. **Efficient Querying**: SQLite databases are optimized for querying and retrieving data. Complex queries and filtering operations are faster and more efficient, making it easier to extract specific information from the dataset.
    2. **Structured Organization**: Databases provide a structured and organized way to store data. Tables, relationships, and indices ensure that data remains well-organized and easily accessible.
    3. **Data Integrity**: SQLite databases enforce data integrity through constraints and validations. This helps prevent errors and inconsistencies in the data, ensuring high-quality and reliable information.
    4. **Concurrency and Multi-User Support**: SQLite databases support concurrent read access from multiple users, ensuring that data remains accessible while maintaining data integrity.
    5. **Scalability**: As datasets grow, SQLite databases continue to perform efficiently. They can handle larger datasets without significant degradation in performance.
    6. **Modularity and Portability**: Databases are self-contained and modular, meaning that a single database file can contain multiple tables, simplifying data distribution.
    7. **Security and Access Control**: SQLite databases offer security features, such as password protection and encryption, to safeguard sensitive data. Access to specific tables or data can be controlled through user roles and permissions.
    8. **Indexing**: SQLite databases support indexing, which significantly speeds up data retrieval based on specific columns. This is especially advantageous for large datasets.
    9. **Data Relationships**: Databases allow the establishment of relationships between tables, facilitating the storage of complex and interconnected data. This could be very relevant if you would like to connect information about projects, assays and samples.

## Making a catalog browser

Designing a catalog browser for your NGS database can be accomplished using tools like [Rshiny](https://www.rstudio.com/products/shiny/) or a [Panel python app](https://panel.holoviz.org/). These frameworks offer user-friendly interfaces for navigating and interacting with your database, providing features for dynamic search, filtering, and visualization. They allow for an accessible and efficient way to explore the contents of your database, which will be great for your teammates and your group leader.

Below we will see how to create a simple browser tool using Rshiny from both a tsv file and a SQLite database.

### From a tsv file

```R
library(shiny)
library(DT)

# UI
ui <- fluidPage(
  titlePanel("TSV File Viewer"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Choose a TSV file", accept = c(".tsv"))
    ),
    
    mainPanel(
      DTOutput("table")
    )
  )
)

# Server
server <- function(input, output) {
  
  data <- reactive({
    req(input$file)
    read.delim(input$file$datapath, sep = "\t")
  })
  
  output$table <- renderDT({
    datatable(data())
  })
}

# Run the app
shinyApp(ui, server)
```

### From a SQLite database

```R
library(shiny)
library(DBI)
library(DT)

# UI
ui <- fluidPage(
  titlePanel("SQLite Database Viewer"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput("db_file", "Choose an SQLite Database", accept = c(".sqlite")),
      textInput("table_name", "Enter Table Name:", value = ""),
      actionButton("load_button", "Load Table")
    ),
    
    mainPanel(
      DTOutput("table")
    )
  )
)

# Server
server <- function(input, output, session) {
  
  con <- reactive({
    if (!is.null(input$db_file)) {
      dbConnect(SQLite(), input$db_file$datapath)
    }
  })
  
  data <- reactive({
    req(input$load_button > 0, input$table_name, con())
    query <- glue::glue_sql("SELECT * FROM {dbQuoteIdentifier(con(), input$table_name)}")
    dbGetQuery(con(), query)
  })
  
  output$table <- renderDT({
    datatable(data())
  })
  
  observeEvent(input$load_button, {
    output$table <- renderDT({
      datatable(data())
    })
  })
  
  # Disconnect from the database when app closes
  observe({
    on.exit(dbDisconnect(con()), add = TRUE)
  })
}

# Run the app
shinyApp(ui, server)
```

### See an example

Below we have added an example of a SQLite database catalog created by the Brickman Lab at the Center for Stem Cell Medicine. Simple, but effective! As an additional feature, the Brickman lab has added the option to open the metadata.yml file whenever you click on a data row, allowing you to see the full extent of the metadata for that `Assay`.

![type:video](./assets/database_example.mp4)

## Future ideas

If you would like to make a more complex catalog browser, here are some ideas!

- Add a tab or an option where you can create an `Assay` or `Project` folder interactively from there as well as fill up metadata .
- Modify and correct existing entries
- Visualize an analysed single cell RNAseq dataset by opening [Cirrocumulus](https://cirrocumulus.readthedocs.io/en/latest/) session.

Nonetheless, implementing these ideas are beyond the scope of this course, it would be very complicated to implement!

!!! question "Exercise: create a catalog of your NGS folders"

    Create at least three test folders of NGS datasets using your cookiecutter template with filled metadata. Then use one the options explained above to create a catalog, either with a tsv file or a SQLite database. Finally, make your own browsable app and explore the test datasets!

## Wrap up

This lesson has been a very practical one. We have seen how useful your metadata can be! By collecting all the metadata in your folders, you are able to create a catalog that can be interactively explored using a Rshiny or Python panel tool. This allows you, your workmates and your group leader to keep track of all the experiments performed at the lab, making sure they will not be lost or forgotten. You will be able to see who made them, when and other interesting features that might help you understand the data at hand. In the next lesson, we will learn how to use version control tools in order to keep track of your data analyses and results using Git and GitHub.
