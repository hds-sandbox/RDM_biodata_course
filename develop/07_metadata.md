---
title: General page
summary: A brief description of my document.
---

<!--
# Put above to hide navigation (left), toc (right) or footer (bottom)

hide:
  - navigation 
  - toc
  - footer 

# You should hide the navigation if there are no subsections
# You should hide the Table of Contents if there are no important titles
-->

# General Page

**Last updated:** *{{ git_revision_date_localized }}*

!!! note "Section Overview"

    &#128368; **Time Estimation:** X minutes  

    &#128172; **Learning Objectives:**    
        1. First item  
        2. Second item  

Write your introduction to the page here.

## 2. Metadata and documentation

Accurate documentation and metadata play a crucial role in facilitating data discovery and interpretation. Consider the following guidelines:

- Metadata capture: Record essential metadata for each dataset, including type of experiment, date, organisms, etc. This information provides context and helps others understand and reuse the data effectively.
- Readme files: Create readme files for each project or dataset. These files should provide a brief overview of the project, list the files and their descriptions, and explain any specific instructions or dependencies required for data analysis.

### 2.1 Assay metadata fields

{{ read_table('./assets/assay_metadata.tsv') }}

### 2.2 Project metadata fields

In development.

{{ read_table('./assets/project_metadata.tsv') }}