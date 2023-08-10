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

Imagine the same lab as before, a lab with a treasure trove of NGS data – stacks of assays and projects folders as we have seen in the previous section. Now, picture a researcher eager to test a hypothesis with a new NGS experiment. But here's the hitch: they're unsure if a similar experiment has already been conducted in the past. This uncertainty leads to hours lost sifting through the data, only to realize they're reinventing the wheel. Or even worse! They performed the experiment and now a colleague remembers that the experiment was done some time ago by someone that left the lab already. Not only time was wasted, but also money! Now, let's rewind and introduce a game-changer – a centralized database cataloging every NGS experiment and projects using those NGS data. In this section, we explore the power of creating a database from the 'metadata.yml' files we have created for both project and assays folders. We unravel how this simple yet ingenious practice transforms data chaos into organized harmony, ensuring seamless data discovery and a roadmap to navigate a labyrinth of data.

## What is a database

A database is a structured repository that stores, manages, and retrieves information. Databases are the backbone of efficient data organization, ensuring data integrity and accessibility. You could store your database in something as simple as a table in tabular format (like excel, tsv, csv), although it would be more appropriate to use a DataBase Management System (DBMS) like SQLite. A DBMS would allow you to store data efficiently, more securely and be able to make fast queries of data. It is very possible that you do not need all these features, and a browsable table would be enough! It all depends on the complexity and number of experiments and folders you have.

### Using a table as a database

Since all our metadata files are structured in the same way, it would be very simple to construct a table by recursively going through your main `Assays` or `Projects` folder with an R or python script, and saving it as `database_YYYYMMDD.tsv`. We would recommend to use tabs instead of commas as your separator, due to the fact that some fields (like short description, or lists, for example) maybe contain commas.

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

### Using a SQLite database

Introducing SQLite – a lightweight, serverless, and self-contained relational database management system. It's the versatile tool that efficiently stores and retrieves data, making it ideal for small to medium-scale applications. With SQLite, you get the benefits of structured data organization without the complexities of a dedicated database server. Whether you're managing project details, research findings, or NGS experiment metadata, SQLite provides a streamlined solution for effective data management and retrieval.

All the information saved in the metadata.yml files can be rec

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

### Why create a SQLite database instead of a tsv file?

Creating a SQLite database offers several benefits over saving data in a tabular format:

1. **Efficient Querying**: SQLite databases are optimized for querying and retrieving data. Complex queries and filtering operations are faster and more efficient, making it easier to extract specific information from the dataset.
2. **Structured Organization**: Databases provide a structured and organized way to store data. Tables, relationships, and indices ensure that data remains well-organized and easily accessible.
3. **Data Integrity**: SQLite databases enforce data integrity through constraints and validations. This helps prevent errors and inconsistencies in the data, ensuring high-quality and reliable information.
4. **Concurrency and Multi-User Support**: SQLite databases support concurrent read access from multiple users, ensuring that data remains accessible while maintaining data integrity.
5. **Scalability**: As datasets grow, SQLite databases continue to perform efficiently. They can handle larger datasets without significant degradation in performance.
6. **Modularity and Portability**: Databases are self-contained and modular, allowing for easy management and transport of data. A single database file can contain multiple tables, simplifying data distribution.
7. **Transaction Management**: SQLite databases support transactions, ensuring that modifications to the data are atomic and consistent. This is crucial for maintaining data integrity, especially in critical applications.
8. **Security and Access Control**: SQLite databases offer security features, such as password protection and encryption, to safeguard sensitive data. Access to specific tables or data can be controlled through user roles and permissions.
9. **Indexing**: SQLite databases support indexing, which significantly speeds up data retrieval based on specific columns. This is especially advantageous for large datasets.
10. **Data Relationships**: Databases allow the establishment of relationships between tables, facilitating the storage of complex and interconnected data.

In summary, using a SQLite database provides a robust and efficient way to store, manage, and access data, making it a preferred choice for scenarios where data organization, integrity, querying efficiency, and scalability are important considerations.

## Making a catalog browser

[Panel python app](https://panel.holoviz.org/).
The app will display the latest version of the SQLite database. Clicking on an item from the database
will open a tab containing all available metadata for the assay.

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

### See an example:

Add video here of how it works

## Future ideas

In the future, you could ideally visualize an analysed single cell RNAseq dataset by opening [Cirrocumulus](https://cirrocumulus.readthedocs.io/en/latest/) session.

Also, it would be nice if you can create an `Assay` or `Project` folder directly from there, as well as fill up metadata and modify it if necessary.
