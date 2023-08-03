---
title: Metadata for NGS data
summary: A brief description of my document.
---

# Metadata for NGS data

**Last updated:** *{{ git_revision_date_localized }}*

!!! note "Section Overview"

    &#128368; **Time Estimation:** X minutes  

    &#128172; **Learning Objectives:**    
        
    1. Learn what is metadata  
    2. Learn what metadata is associated to NGS data
    3. Learn sources for controlled vocabularies for NGS data

Write your introduction to the page here.

## Metadata and documentation

Accurate documentation and metadata play a crucial role in facilitating data discovery and interpretation. Consider the following guidelines:

- Metadata capture: Record essential metadata for each dataset, including type of experiment, date, organisms, etc. This information provides context and helps others understand and reuse the data effectively.
- Readme files: Create readme files for each project or dataset. These files should provide a brief overview of the project, list the files and their descriptions, and explain any specific instructions or dependencies required for data analysis.

### Assay metadata fields

{{ read_table('./assets/assay_metadata.tsv') }}

### Project metadata fields

In development.

{{ read_table('./assets/project_metadata.tsv') }}