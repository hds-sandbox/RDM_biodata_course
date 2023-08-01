---
title: File structure and naming conventions
summary: In this lesson we discuss about how to organize your files and follow some naming recommendations.
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

# File structure and naming conventions

**Last updated:** *{{ git_revision_date_localized }}*

!!! note "Section Overview"

    &#128368; **Time Estimation:** X minutes  

    &#128172; **Learning Objectives:**    
        1. First item  
        2. Second item  

    
Write your introduction to the page here.

## 1. Folder structure and organization

To ensure efficient data management, it is important to establish a consistent approach to organizing research data. We consider the following practices:

- Folder structure: we aim to a logical and intuitive folder structure that reflects the organization of research projects and experimental data. We use descriptive folder names to make it easy to locate and access specific data files.
- Subfolders: Use subfolders to further categorize data based on their contents, such as code notebooks, results, reports, etc. This helps to keep data organized and facilitates quick retrieval.
- File naming conventions: implement a standardized file naming convention to ensure consistency and clarity. Use descriptive names that include relevant information, such as type of plots, results tables, etc.

### 1.1 Template engine

We are currently using a [cookiecutter](https://github.com/cookiecutter/cookiecutter)
template to generate a [folder structure](https://github.com/brickmanlab/ngs-template).
Use [cruft](https://github.com/cruft/cruft) when generating assay and project folders to
allow us to validate and sync old templates with the latest version.

See [this section](./starting-assay-project.md) to get started with a new project/assay.

### 1.2 Assay folder

For each NGS experiment there should be an `Assay` folder that will contain all experimental datasets (raw files and pipeline processed files).
Inside `Assay` there will be subfolders named after a unique NGS ID and the date it was created:

```bash
<Assay-ID>_YYYYMMDD
```

#### Assay ID code names

- `CHIP`: ChIP-seq
- `RNA`: RNA-seq
- `ATAC`: ATAC-seq
- `SCR`: scRNA-seq
- `PROT`: Mass Spectrometry Assay
- `CAT`: Cut&Tag
- `CAR`: Cut&Run
- `RIME`: Rapid Immunoprecipitation Mass spectrometry of Endogenous proteins

<!-- **Note:** we do not know much about proteomics and mass spec data, neither imaging data.  -->

For example `CHIP_20230101` is a ChIPseq assay made on 1st January 2023.

#### Folder Structure

```bash
CHIP_20230424
├── description.yaml
├── metadata.yaml
├── pipeline.md
├── processed
└── raw
   ├── .fastq.gz
   └── samplesheet.csv
```

- **description.yaml**: short and long descriptions of the assay in yaml format.
- **metadata.yaml**: metadata file for the assay describing different keys ([see below](#21-assay-metadata-fields)).
- **pipeline.md**: description of the pipeline used to process raw data.
- **processed**: folder with results of the preprocessing pipeline. Contents depend on the pipeline used.
- **raw**: folder with the raw data.
    - *.fastq.gz*:In the case of NGS assays, there should be fastq files.
    - *samplesheet.csv*: file that contains metadata information for the samples. This file is used to run the nf-core pipelines. Ideally, it will also contain a column with info regarding the experimental variables and batches so it can be used for down stream analysis as well.

### 1.3 Project folder

There should be another folder called `Projects` that will contain project information and data analysis.

A project may use one or more assays to answer a scientific question. This should be, for example, all the data analysis related
to a publication.

The project folder should be named after a unique identifier, such as:

```bash
<Project-ID>_YYYYMMDD
```

`<Project-ID>` should be the initials of the owner of the project folder and the publication year, e.g. `JARH_et_al_20230101`.

#### **Folder structure**

```bash
<Project-ID>_20230424
├── data
│  ├── assays
│  ├── external
│  └── processed
├── documents
│  └── Non-sensitive_NGS_research_project_template.docx
├── notebooks
│  └── 01_data_analysis.rmd
├── README.md
├── reports
│  ├── figures
│  │  └── 01_data_analysis
│  └── 01_data_analysis.html
├── requirements.txt
├── results
│  └── 01_data_analysis/
├── scripts
├── description.yml
└── metadata.yml
```

- **data**: folder that contains symlinks or shortcuts to where the data is, avoiding copying and modification of original files.
- **documents**: folder containing word documents, slides or pdfs related to the project, such as explanations of the data or project, papers, etc. It also contains your [Data Management Plan](#8-create-a-data-management-plan).
    - *Non-sensitive_NGS_research_project_template.docx*. This is a prefilled Data Management Plan based on the Horizon Europe guidelines.
- **notebooks**: folder containing Jupyter, R markdown or Quarto notebooks with the actual data analysis. Using annotated notebooks is ideal for reproducibility and readability purposes. Notebooks should be labeled numerically in order they were created e.g. `00_preprocessing`
- **README.md**: detailed description of the project in markdown format.
- **reports**: notebooks rendered as html/docx/pdf versions, ideal for sharing with colleagues and also as a formal report of the data analysis procedure.
    - *figures*: figures produced upon rendering notebooks. The figures will be saved under a subfolder named after the notebook that created them. This is for provenance purposes so we know which notebook created which figures.
- **results**: results from the data analysis, such as tables with differentially expressed genes, enrichment results, etc. These results should be saved under a subfolder named after the notebook that created them. This is for provenance purposes so we know which notebook created which results.
- **scripts**: folder containing helper scripts needed to run data analysis or reproduce the work of the folder
- **description.yml**: short description of the project.
- **metadata.yml**: metadata file for the assay describing different keys ([see below](#22-project-metadata-fields)).

<!-- **Note**: maybe we can make an environment folder or put inside the scripts folder a Dockerfile that should give you an environment where you can reproduce the results of the folder? -->

<!-- **Note2**: shouldn't there be also a project_metadata.yaml here as well? also a project_description.yaml too? -->

### 1.4 Synchronization with DanGPU server

We will have to setup a cron job to perform one-way sync between the `/projects`
folder and `NGS_data` folder. All the analysis will be done on danGPU server,
with **no exceptions**!

After project is done and published, it will be moved to `NGS_data`.

### 1.5 General naming conventions and more info

- date format: `YYYYMMDD`
- authors: initials
- file and folder names: **No use of spaces**. Field sections are separated by underscores `_`. Words in each section are written in camelCase. For example: `field1_word1Word2.txt`.

[Transcriptomics metadata standards and fields](https://faircookbook.elixir-europe.org/content/recipes/interoperability/transcriptomics-metadata.html#analysis-metadata)

More info on naming conventions for different types of files and analysis is in development.

{{ read_table('./assets/file_naming_convention.tsv') }}