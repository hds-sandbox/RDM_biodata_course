---
title: File structure and naming conventions
summary: In this lesson we discuss about how to organize your files and follow some naming recommendations.
---

# File structure and naming conventions

**Last updated:** *{{ git_revision_date_localized }}*

!!! note "Section Overview"

    &#128368; **Time Estimation:** X minutes  

    &#128172; **Learning Objectives:**    
    
    1. Learn how to organize your NGS data.
    2. Separate your data into projects and assays.
    3. Manage genomic resources.
    4. Learn general rules for naming files and folders.
    5. Create your own rules for naming specific results and figures.

We have learn so far how to adhere to FAIR and Open Science standards. You may have noticed that they mostly cover information regarding sharing your data after your project is finished or your data is published. However, how can you effectively manage your data **while you work with it**? How should I organize my data folders, raw data, processed data, data analysis scripts, figures and results? You may not worry too much about it since you will be working on your data all the time, so you will know where everything is. However, projects tend to last for long, and data, its analysis and results, accumulate greatly over time. Not having any sort of structure will incur in many problems in the future, specially once the project is finished or some colleague or collaborator want to access the data. How will they be able to find X or Y table? Will you be able to remember where a figure came from or which script created a csv file? By not applying an efficient system, you are inviting chaos to your doorstep!

On the other hand, applying a consistent file structure and naming conventions to your files will help you to efficiently manage your data. Consider the following practices:

- Folder structure: Aim to establish a logical and intuitive folder structure that reflects the organization of research projects and experimental data. Use descriptive folder names to make it easy to locate and access specific data files.
- Subfolders: Use subfolders to further categorize data based on their contents, such as code notebooks, results, reports, etc. This helps to keep data organized and facilitates quick retrieval.
- File naming conventions: implement a standardized file naming convention to ensure consistency and clarity. Use descriptive names that include relevant information, such as type of plots, results tables, etc.

## Folder organization

You will probably want to divide your NGS data into three different types of folders:

1. Assay folder: This folder contains the raw and processed NGS datasets, as well as the pipeline/workflow used to generate the processed data, provenance of the raw data and quality control reports of the data. This data should be locked and read-only to prevent unwanted modifications.
2. Project folder: This folder contains all the necessary files for a specific research project. A project may use several assays or results from other projects. The assay data should not be copied or duplicated, but linked from the original source.
3. Genomic resources folders: This folder contains common genomic resources, such as genome references (fasta files) and annotations (gtf files) for different species, as well as indexes for different alignment algorithms. This data should also be locked and read-only to prevent unwanted modifications.

## Assay folder

For each NGS experiment there should be an `Assay` folder that will contain all experimental datasets (raw files and pipeline processed files).
Inside `Assay` there will be subfolders named after a unique NGS ID and the date it was created:

```bash
<Assay-ID>_<keyword>_YYYYMMDD
```

### Assay ID code names

- `CHIP`: ChIP-seq
- `RNA`: RNA-seq
- `ATAC`: ATAC-seq
- `SCR`: scRNA-seq
- `PROT`: Mass Spectrometry Assay
- `CAT`: Cut&Tag
- `CAR`: Cut&Run
- `RIME`: Rapid Immunoprecipitation Mass spectrometry of Endogenous proteins
- ...

For example `CHIP_Oct4_20230101` is a ChIPseq assay made on 1st January 2023 with the keyword Oct4, so it is easily identifiable by eye.

### Assay folder structure

```bash
CHIP_Oct4_20230424
├── description.yaml
├── metadata.yaml
├── pipeline.md
├── processed
└── raw
   ├── .fastq.gz
   └── samplesheet.csv
```

- **description.yaml**: short and long descriptions of the assay in yaml format. Long description should contain provenance of the raw NGS data (samples, laboratory protocols used, aim of the assay, etc)
- **metadata.yaml**: metadata file for the assay describing different keys ([see this lesson](./07_metadata.md)).
- **pipeline.md**: description of the pipeline used to process raw data.
- **processed**: folder with results of the preprocessing pipeline. Contents depend on the pipeline used.
- **raw**: folder with the raw data.
    - *.fastq.gz*:In the case of NGS assays, there should be fastq files.
    - *samplesheet.csv*: file that contains metadata information for the samples. This file is used to run the nf-core pipelines. Ideally, it will also contain a column with info regarding the experimental variables and batches so it can be used for down stream analysis as well.

## Project folder

There should be another folder called `Projects` that will contain project information and data analysis.

A project may use one or more assays to answer a scientific question. This should be, for example, all the data analysis related
to a publication.

The project folder should be named after a unique identifier, such as:

```bash
<author_initials>_<keyword>_YYYYMMDD
```

For example, `JARH_Oct4_20230101`, is a project about the gene Oct4 owned by Jose Alejandro Romero Herrera, created on the 1st of January of 2023.

### Project folder structure

```bash
<author_initials>_<keyword>_YYYYMMDD
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
- **documents**: folder containing word documents, slides or pdfs related to the project, such as explanations of the data or project, papers, etc. It also contains your [Data Management Plan](./05_DMP.md).
    - *Non-sensitive_NGS_research_project_template.docx*. This is a prefilled Data Management Plan based on the Horizon Europe guidelines.
- **notebooks**: folder containing Jupyter, R markdown or Quarto notebooks with the actual data analysis. Using annotated notebooks is ideal for reproducibility and readability purposes. Notebooks should be labeled numerically in order they were created e.g. `00_preprocessing`
- **README.md**: detailed description of the project in markdown format.
- **reports**: notebooks rendered as html/docx/pdf versions, ideal for sharing with colleagues and also as a formal report of the data analysis procedure.
    - *figures*: figures produced upon rendering notebooks. The figures will be saved under a subfolder named after the notebook that created them. This is for provenance purposes so we know which notebook created which figures.
- **results**: results from the data analysis, such as tables with differentially expressed genes, enrichment results, etc. These results should be saved under a subfolder named after the notebook that created them. This is for provenance purposes so we know which notebook created which results.
- **scripts**: folder containing helper scripts needed to run data analysis or reproduce the work of the folder
- **description.yml**: short description of the project.
- **metadata.yml**: metadata file for the assay describing different keys ([see this lesson](./07_metadata.md)).

<!-- **Note**: maybe we can make an environment folder or put inside the scripts folder a Dockerfile that should give you an environment where you can reproduce the results of the folder? -->

## Template engine

Now, it would be very tedious to set up a new folder every time! Fortunately, it is very easy to create a folder template using [cookiecutter](https://github.com/cookiecutter/cookiecutter)! Cookiecutter is a command-line utility that creates projects from cookiecutters (project templates), e.g. creating a Python package project from a Python package project template. Here you can find an example of a cookiecutter folder template directed to [NGS data](https://github.com/brickmanlab/ngs-template), where we have applied the structures explained in the previous sections. You are very welcome to adapt it or modify it to your needs!

Now, using only cookiecutter might have some issues. If you update the template, it might be really hard to maintain older folders. By using another tool, [cruft](https://github.com/cruft/cruft) when generating assay and project folders, it allows the user to validate and syncronize old templates with the latest version.

See [this section](./starting-assay-project.md) to get started with a new project/assay.

## Genomic resources folder

### Manual download

### RefGenie

## General naming conventions

- date format: `YYYYMMDD`
- authors: initials
- file and folder names: **No use of spaces**. Field sections are separated by underscores `_`. Words in each section are written in camelCase. For example: `field1_word1Word2.txt`.

[Transcriptomics metadata standards and fields](https://faircookbook.elixir-europe.org/content/recipes/interoperability/transcriptomics-metadata.html#analysis-metadata)

More info on naming conventions for different types of files and analysis is in development.

{{ read_table('./assets/file_naming_convention.tsv') }}