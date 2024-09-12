#!/usr/bin/env Rscript

# Author:    Alba Refoyo Martinez
# Copyright: Copyright 2024, University of Copenhagen
# Email:     gsd818@ku.dk
# License:   MIT
# R version: 4.3.2

# Load libs
quiet <- function(x) { suppressMessages(suppressWarnings(x)) }
quiet(library(shiny))
quiet(library(DT))
quiet(library(DBI))


# Define the UI
ui <- fluidPage(
  titlePanel("SQLite R Shiny App"),
  
  # Use tabsetPanel to add multiple tabs
  tabsetPanel(
    # Existing tab for browsing the SQLite database
    tabPanel("Browse Database",
             sidebarLayout(
               sidebarPanel(
                 fileInput("db_file", "Select SQLite Database File", accept = c(".sqlite")),
                 uiOutput("table_select"),
                 uiOutput("column_filter_select"),
                 textInput("filter_value", "Find by value", ""),
                 actionButton("refresh", "Refresh Tables")
                 # UI output for selecting columns (populated based on the selected table)
                 # uiOutput("column_select"),
               ),
               mainPanel(
                 DTOutput("tableData")
               )
             )),
    
    # New tab for creating a project directory and filling metadata fields
    tabPanel("Create Project Directory",
             sidebarLayout(
               sidebarPanel(
                 textInput("project_name", "Project Name:", value = "MyProject"),
                 textInput("metadata_field1", "Metadata Field 1:", value = ""),
                 textInput("metadata_field2", "Metadata Field 2:", value = ""),
                 actionButton("create_project", "Create Project")
               ),
               mainPanel(
                 textOutput("message")  # To display feedback messages
               )
             )
    )
  )
)

# Define the server
server <- function(input, output, session) {
  # Reactive value to hold the database connection
  db_conn <- reactiveVal(NULL)
  
  # Observe changes in the file input
  observeEvent(input$db_file, {
    # Check if a file is uploaded
    if (!is.null(input$db_file)) {
      # Get the path to the uploaded file
      db_path <- input$db_file$datapath
      
      # Disconnect any existing connection
      if (!is.null(db_conn())) {
        dbDisconnect(db_conn())
      }
      
      # Establish a new connection to the SQLite database
      conn <- dbConnect(RSQLite::SQLite(), dbname = db_path)
      db_conn(conn)
      
      # Update the list of tables
      updateTableChoices()
    }
  })
  
  # Function to update the list of tables in the database
  updateTableChoices <- function() {
    # Ensure there's a database connection
    if (!is.null(db_conn())) {
      # Retrieve the list of tables in the database
      tables <- dbListTables(db_conn())
      # Update the choices in the select input
      updateSelectInput(session, "table", choices = tables)
    }
  }
  
  # Observe the refresh button
  observeEvent(input$refresh, {
    updateTableChoices()
  })
  
  # Render the select input for tables
  output$table_select <- renderUI({
    selectInput("table", "Select a table", choices = character(0))
  })
  
  # Render the select input for columns (choices populated based on the selected table)
  # output$column_select <- renderUI({
  #   req(input$table)
  #   # Read data from the selected table
  #   data <- dbReadTable(db_conn(), input$table)
  #   # Get the column names from the data
  #   columns <- names(data)
  #   # Create a select input for the column choices
  #   selectInput("columns", "Select columns", choices = columns, multiple = TRUE)
  # })
  
  
  # Render the select input for columns to filter by
  output$column_filter_select <- renderUI({
    req(input$table)
    data <- dbReadTable(db_conn(), input$table)
    columns <- names(data)
    selectInput("column_filter", "Filter by column", choices = columns)
  })
  
  # Display data from the selected table
  output$tableData <- renderDT({
    req(input$table)
    data <- dbReadTable(db_conn(), input$table)
    
    # If filtering by columns, ensure they are selected
    # req(input$columns)
    #filtered_data <- data[, input$columns, drop = FALSE]
    
    if (!is.null(input$column_filter) && input$filter_value != "") {
      filtered_data <- data[data[[input$column_filter]] == input$filter_value, ]
    } else {
      filtered_data <- data
    }
    
    datatable(filtered_data)
  })
  
  # Observe the create_project button
  observeEvent(input$create_project, {
    project_name <- input$project_name
    metadata_field1 <- input$metadata_field1
    metadata_field2 <- input$metadata_field2
    
    # Define the project directory path
    project_dir <- file.path(getwd(), project_name)
    
    # Check if the directory already exists
    if (dir.exists(project_dir)) {
      output$message <- renderText("Directory already exists. Please choose a different project name.")
    } else {
      # Create the directory
      dir.create(project_dir)
      
      # Save the metadata fields to a TSV file in the project directory
      metadata <- data.frame(Field1 = metadata_field1, Field2 = metadata_field2)
      metadata_file <- file.path(project_dir, "metadata.tsv")
      write.table(metadata, metadata_file, sep = "\t", row.names = FALSE, col.names = TRUE)
      
      # Provide feedback to the user
      output$message <- renderText(paste("Project created successfully in", project_dir))
    }
  })
  
  # Close the database connection when the app is stopped
  onStop(function() {
    if (!is.null(db_conn())) {
      dbDisconnect(db_conn())
    }
  })
}

# Run the app
shinyApp(ui = ui, server = server)
