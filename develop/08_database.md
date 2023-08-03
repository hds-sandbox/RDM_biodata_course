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

## 3. Data catalogue and browser

@SLundregan is in the process of building a prototype for `Assay`, using the metadata contained in all `description.yml` and `metadata.yml` files in the assay folder.
This will be in the form of an SQLite database that that is easily updatable by running a helper script.

@SLundregan is also working on a browsable database using [Panel python app](https://panel.holoviz.org/).
The app will display the latest version of the SQLite database. Clicking on an item from the database
will open a tab containing all available metadata for the assay.

Also, it would be nice if you can create an `Assay` folder directly from there,
making it easy to fill up the info for the metadata and GEO submission ([see below](#8-data-upload-to-geo))

In the future, you could ideally visualize an analysed single cell RNAseq dataset by opening [Cirrocumulus](https://cirrocumulus.readthedocs.io/en/latest/) session.