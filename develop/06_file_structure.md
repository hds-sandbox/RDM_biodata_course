---
title: File structure and naming conventions
summary: In this lesson we discuss about how to organize your files and follow some naming recommendations.
tags:
    - File structure
    - File organization
    - Naming conventions
    - Folder templates
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

We have learn so far how to adhere to FAIR and Open Science standards. You may have noticed that they mostly cover information regarding sharing your data after your project is finished or your data is published. However, how can you **effectively manage your data while you work with it**? How should I organize my data folders, raw data, processed data, data analysis scripts, figures and results? You may not worry too much about it since you will be working on your data all the time, so you will know where everything is. However, projects tend to last long, and the data, its analysis and results, accumulate greatly over time. Not having any sort of structure will incur in many problems in the future, specially once the project is finished or some colleague or collaborator want to access the data. How will they be able to find X or Y table? Will you be able to remember where a figure came from or which script created a csv file? By not applying an efficient and clear system, you are inviting chaos to your doorstep!

On the other hand, applying a consistent file structure and naming conventions to your files will help you to efficiently manage your data. Consider the following practices:

- **Folder structure**: Aim to establish a logical and intuitive folder structure that reflects the organization of research projects and experimental data. Use descriptive folder names to make it easy to locate and access specific data files.
    - **Subfolders**: Use subfolders to further categorize data based on their contents, such as code notebooks, results, reports, etc. This helps to keep data organized and facilitates quick retrieval.
- **File naming conventions**: implement a standardized file naming convention to ensure consistency and clarity. Use descriptive names that include relevant information, such as type of plots, results tables, etc.

In this lesson we will see a practical example on how you could organize your own files and folders.

## Folder organization

You will probably want to divide your NGS data into three different types of folders:

1. **Assay folders**: This folder contains the **raw and processed NGS datasets**, as well as the **pipeline/workflow** used to generate the processed data, provenance of the raw data and quality control reports of the data. This data should be **locked and read-only** to prevent unwanted modifications.
2. **Project folders**: This folder contains **all the necessary files for a specific research project**. A project may use several assays or results from other projects. The assay data should not be copied or duplicated, but linked from the original source.
3. **Genomic resources folders**: This folder contains **common genomic resources**, such as genome references (fasta files) and annotations (gtf files) for different species, as well as indexes for different alignment algorithms. This data should also be **locked and read-only** to prevent unwanted modifications.

This will help you to keep your data tidied up, specially if you are working on a big lab where assays may be used for different purposes and different people!

## Assay folder

For each NGS experiment there should be an `Assay` folder that will contain all experimental datasets, that is, an `Assay` (raw files and pipeline processed files). Raw files should not be modified at all, but you should probably lock modifications to the final results once you are done with preprocessing the data. This will help you prevent unwanted modifications to the data. Each `Assay` subfolder should be named in a way that it is unique, easily readable, distinguishable and understood at a glance. For example, you could name an NGS assay using an acronym for the type of NGS assay (RNAseq, ChIPseq, ATACseq), a keyword that represents a unique descriptive element of that assay, and the date. Like this:

```
<Assay-ID>_<keyword>_YYYYMMDD
```

For example `CHIP_Oct4_20230101` is a ChIPseq assay made on 1st January 2023 with the keyword Oct4, so it is easily identifiable by eye.

### Assay ID code names

Below is a example list of different Assay-ID code names. You are welcome to use it and expand it as you wish!

- `CHIP`: ChIP-seq
- `RNA`: RNA-seq
- `ATAC`: ATAC-seq
- `SCR`: scRNA-seq
- `PROT`: Mass Spectrometry Assay
- `CAT`: Cut&Tag
- `CAR`: Cut&Run
- `RIME`: Rapid Immunoprecipitation Mass spectrometry of Endogenous proteins
- ...

### Assay folder structure

Next, let's take a look at a possible folder structure and what kind of files you can find there.

```bash
CHIP_Oct4_20230101/
├── README.md
├── metadata.yml
├── pipeline.md
├── processed
└── raw
   ├── .fastq.gz
   └── samplesheet.csv
```

- **README.md**: Long description of the assay in markdown format. It should contain provenance of the raw NGS data (samples, laboratory protocols used, aim of the assay, etc)
- **metadata.yml**: metadata file for the assay describing different keys and important information regarding that assay ([see this lesson](./07_metadata.md)).
- **pipeline.md**: description of the pipeline used to process raw data, as well as the commands used to run the pipeline.
- **processed**: folder with results of the preprocessing pipeline. Contents depend on the pipeline used.
- **raw**: folder with the raw data.
    - *.fastq.gz*:In the case of NGS assays, there should be fastq files.
    - *samplesheet.csv*: file that contains metadata information for the samples. This file is used to run the nf-core pipelines. You can also add extra columns with info regarding the experimental variables and batches so it can be used for downstream analysis as well.

This folder structure is simple and straight forward, and files will be exactly where you expect them to be! By including a description and metadata file, you will always be able to understand what this experiment was and how it was generated. This information will be **specially useful once you need to submit your data for archiving or write a manuscript**. The **metadata** file will be really handy if you want to **collect information on all your NGS datasets and create a database** ([see this lesson](./08_database.md))!

Note that the processed folder is not expanded upon. This folder will be very dependant on the workflows/pipelines that you use. We strongly recommend that you use reproducible and community curated pipelines, such as the ones developed by the [nf-core community](https://nf-co.re/), which have a through documentation on the results they produce. For example, imagine you have run an RNAseq experiment and processed the data using the [nf-core:rnaseq pipeline](https://nf-co.re/rnaseq/3.12.0) with the pseudoalignment and quantification option:

```bash
processed/
├── fastqc/
├── multiqc/
├── pipeline_info/
├── salmon/
└── trimgalore/
```

- **fastqc**: Quality Control results of the raw fastq files.
- **multiqc**: Full compilation of the Quality Control checks for all your samples for the entire pipeline.
- **pipeline_info**: Information and logs about the pipeline used for each of the steps of the workflow.
- **salmon**: Pseudoalignment and quantification results of the salmon algorithm.
- **trimgalore**: Cleaned fastq files and Quality Control results of the cleaned files.

By using a standardized pipeline, you should be able to always find the preprocessing results where you expect them to be! No need to come up with your own file organization (and document it) or worry that your colleagues (or your future self) won't be able to find the data.

## Project folder

On the other hand, we have the other type of folder called `Projects`. In this folder you will save a **subfolder for each project** that you (or your lab) works on. Each `Project` subfolder will contain project information and all the data analysis notebooks and scripts used in that project.

Projects and Assays are separated from each other because a project may use one or more assays to answer a scientific question, and assays may be reused several times in different projects. This could be, for example, all the data analysis related to a publication (a RNAseq and a ChIPseq experiment), or a comparison between a previous ATACseq experiment (which was used for a older project) with a new laboratory protocol.

As like for an Assay folder, the Project folder should be named in a way that it is unique, easily readable, distinguishable and understood at a glance. For example, you could name it after the main author initials, a keyword that represents a unique descriptive element of that assay, and the date:

```bash
<author_initials>_<keyword>_YYYYMMDD
```

For example, `JARH_Oct4_20230101`, is a project about the gene Oct4 owned by Jose Alejandro Romero Herrera, created on the 1st of January of 2023.

### Project folder structure

Next, let's take a look at a possible folder structure and what kind of files you can find there.

```bash
<author_initials>_<keyword>_YYYYMMDD
├── data
│  └── <Assay-ID>_<keyword>_YYYYMMDD/
├── documents
│  └── Non-sensitive_NGS_research_project_template.docx
├── notebooks
│  └── 01_data_analysis.rmd
├── README.md
├── reports
│  ├── figures
│  │  └── 01_data_analysis/
│  │   └── heatmap_sampleCor_20230102.png
│  └── 01_data_analysis.html
├── requirements.txt
├── results
│  └── 01_data_analysis/
│      └── DEA_treat-control_LFC1_p01.tsv
├── scripts
└── metadata.yml
```

- **data**: folder that contains symlinks or shortcuts to where the data is, avoiding copying and modification of original files.
- **documents**: folder containing word documents, slides or pdfs related to the project, such as explanations of the data or project, papers, etc. It also contains your [Data Management Plan](./05_DMP.md).
    - *Non-sensitive_NGS_research_project_template.docx*. This is a pre-filled Data Management Plan based on the Horizon Europe guidelines.
- **notebooks**: folder containing Jupyter, R markdown or Quarto notebooks with the actual data analysis.
- **README.md**: detailed description of the project in markdown format.
- **reports**: notebooks rendered as html/docx/pdf versions, ideal for sharing with colleagues and also as a formal report of the data analysis procedure.
    - *figures*: figures produced upon rendering notebooks. The figures will be saved under a subfolder named after the notebook that created them. This is for provenance purposes so we know which notebook created which figures.
- **requirements.txt**: file explaining what software and libraries/packages and their versions are necessary to reproduce the code.
- **results**: results from the data analysis, such as tables with differentially expressed genes, enrichment results, etc.
- **scripts**: folder containing helper scripts needed to run data analysis or reproduce the work of the folder
- **description.yml**: short description of the project.
- **metadata.yml**: metadata file for the assay describing different keys ([see this lesson](./07_metadata.md)).

!!! note "Note on the **data** folder"

    What do we mean with shortcuts to the data is? If you have divided your Assays and Projects as suggested, you do not really need to copy or duplicate your data again, simply make a shortcut to the original folder, and you will have access to the data as if it is in the project folder! You can use this command in Linux or MacOS to create a folder softlink:

    ```bash
    ln -s path/to/assays/Assays/<ASSAY_ID> /path/to/projects/Projects/<PROJECT_ID>/data/
    ```

!!! note "Note on the **notebooks** folder"

    Using annotated notebooks is ideal for reproducibility and readability purposes. Notebooks should be labeled numerically in order they were created, or the order of the data analysis steps, if they are related to each other e.g. `00_preprocessing.rmd` - `01_Differential_Expression_Analysis.rmd` - `02_Functional_Analysis.rmd`

!!! note "Note on the **results** folder"

    Results from your code notebooks should be saved under this folder. Create a subfolder named after the notebook that created them, so you can always identify which notebook created which results!

<!-- **Note**: maybe we can make an environment folder or put inside the scripts folder a Dockerfile that should give you an environment where you can reproduce the results of the folder? -->

## Template engine

You may be thinking right now that doing this kind of setup every time you need to create a new folder would be very tedious, and you would be right! Fortunately, it is very easy to create a folder template using [cookiecutter](https://github.com/cookiecutter/cookiecutter). Cookiecutter is a command-line utility that creates projects from cookiecutters (that is, a template), e.g. creating a Python package project from a Python package project template. Here you can find an example of a cookiecutter folder template directed to [NGS data](https://github.com/brickmanlab/ngs-template), where we have applied the structures explained in the previous sections. You are very welcome to adapt it or modify it to your needs!

Now, using only cookiecutter might have some issues. If you update the template, it might be really hard to maintain older folders. By using another tool, [cruft](https://github.com/cruft/cruft), when generating assay and project folders, it allows the user to validate and syncronize old templates with the latest version.

### Quick tutorial on cookiecutter

Creating a Cookiecutter template from scratch involves defining a folder structure, creating a `cookiecutter.json` file, and specifying the placeholders (keywords) that will be replaced during project generation. Let's walk through the process step by step:

#### Step 1: Create a Folder Template

Start by creating a folder with the structure you want for your template. For example, let's create a simple Python project template:

```plaintext
my_template/
|-- {{cookiecutter.project_name}}
|   |-- main.py
|-- tests
|   |-- test_{{cookiecutter.project_name}}.py
|-- README.md
```

In this example, `{{cookiecutter.project_name}}` is a placeholder that will be replaced with the actual project name when the template is used.

#### Step 2: Create `cookiecutter.json`

In the root of your template folder, create a file named `cookiecutter.json`. This file will define the variables (keywords) that users will be prompted to fill in. For our Python project template, it might look like this:

```json
{
  "project_name": "MyProject",
  "author_name": "Your Name",
  "description": "A short description of your project"
}
```

These are the questions users will be asked when generating a project based on your template. The values provided here will be used to replace the corresponding placeholders in the template files.

In addition to replacing placeholders in file and directory names, Cookiecutter can also automatically fill in information within the contents of text files. This can be useful for providing default configurations or templates for code files. Let's extend our previous example to include a placeholder inside a text file:

Certainly! In addition to replacing placeholders in file and directory names, Cookiecutter can also automatically fill in information within the contents of text files. This can be useful for providing default configurations or templates for code files. Let's extend our previous example to include a placeholder inside a text file:

Modify the `my_template/main.py` file to include a placeholder inside its contents:

```python
# main.py

def hello():
    print("Hello, {{cookiecutter.project_name}}!")
```

Now, the `{{cookiecutter.project_name}}` placeholder is inside the `main.py` file. When you run Cookiecutter, it will automatically replace the placeholders not only in file and directory names but also within the contents of text files. After running Cookiecutter, your generated `main.py` file might look like this:

```python
# main.py

def hello():
    print("Hello, MyProject!")  # Assuming "MyProject" was entered as the project_name
```

#### Step 3: Use Cookiecutter

Now that your template is set up, you can use Cookiecutter to generate a project based on it. Open a terminal and run:

```bash
cookiecutter path/to/your/template
```

Cookiecutter will prompt you to fill in the values for `project_name`, `author_name`, and `description`. After you provide these values, Cookiecutter will replace the placeholders in your template files with the entered values.

#### Step 4: Explore the Generated Project

Once the generation process is complete, navigate to the directory where Cookiecutter created the new project. You will see a project structure with the placeholders replaced by the values you provided.

!!! question "Exercise: Create your own template"

    Using cookiecutter, create your own templates for your folders. You do not need to copy exactly our suggestions, adjust your template to your own needs! In order to create your cookiecutter template, your will need to install python, [cookiecutter](https://cookiecutter.readthedocs.io/en/stable/installation.html), Git and a GitHub account. If you do not have Git and a GitHub account, we suggest you do one as soon as possible. We will take a deeper look at Git and GitHub in the [version control lesson](./09_version_control.md).

    We have prepared already two simple cookiecutter templates in GitHub repositories.

    **Assay**

    1. First, fork our `https://github.com/hds-sandbox/assay-template` from the GitHub page into your own account/organization.
    ![fork_repo_example](./images/fork_repo.png)
    2. Then, use `git clone <your URL to the template>` to put it in your computer.
    3. Modify the contents of the repository so that it matches the **Assay** example above. You are welcome to do changes as you please!
    4. Modify the `cookiecutter.json` file so that it will include the **Assay** name template
    5. Git add, commit and push your changes
    6. Test your folder by using `cookiecutter <URL to your GitHub repository for "assay-template>`
    
    **Project**
    
    7. First, fork our `https://github.com/hds-sandbox/project-template` from the GitHub page into your own account/organization.
    ![fork_repo_example](./images/fork_repo_project.png)
    8. Then, use `git clone <your URL to the template>` to put it in your computer.
    9.  Modify the contents of the repository so that it matches the **Project** example above. You are welcome to do changes as you please!
    10. Modify the `cookiecutter.json` file so that it will include the **Project** name template
    11. Git add, commit and push your changes
    12. Test your folder by using `cookiecutter <URL to your GitHub repository for "project-template>`

## Genomic resources folder

Preprocessing NGS data usually requires different genomic resources in order to align and and annotate fastq files. First and most importantly, you will need reference genomes (human and mouse are the most common ones) in FASTA format. In addition, aligner tools such as STAR, Bowtie, etc., require indexed fasta files to perform alignment of reads. Moreover, GTF or GFF files are necessary in order to quantify reads into genomic regions (such as genes or promoters). Nonetheless, these genomic resources are often updated and are released periodically under different versions from different sources. In order to make your data reproducible, you will need to control and manage these genomic resources and specify their versions and sources. For example, the latest mouse reference genome is GRCm39, but may studies still align their reads to the version GRCm38.

How do you keep track of your resources? You could, again, set up a folder structure that hosts reference genomes, annotations and indexes per species and per version, or use a reference genome manager such as [refgenie](http://refgenie.databio.org/en/latest/). We will take a look at both options.

### RefGenie

[Refgenie](http://refgenie.databio.org/en/latest/) manages storage, access, and transfer of reference genome resources. It provides command-line and Python interfaces to download pre-built reference genome "assets", like indexes used by bioinformatics tools. It can also build assets for custom genome assemblies. Refgenie provides programmatic access to a standard genome folder structure, so software can swap from one genome to another.

Check [their tutorial](http://refgenie.databio.org/en/latest/tutorial/) if you want to start managing your genomic resources with Refgenie!

### Manual download

If you want to keep manual track and manage yourself and not depend on a third party tool, you can always download the genomic resources directly from the source. We will show you how in this section:

1. Create a new folder, called `genomic_resources`.
2. Inside this folder, separate each species with a subfolder.
3. Inside the species subfolder, separate it by the resource version
4. Inside the version subfolder, separate genomic sequences (FASTA) and annotations (GTF/GFF) from different alignment indexes

In the example below, we are downloading human (version GRCh38) and mouse (version GRCm39) genomic resources from the [ensembl FTP server](ftp://ftp.ensembl.org)

```bash
genomic_resources/
├── homo_sapiens/
│  └── GRCh38/
│     ├── Homo_sapiens.GRCh38.109.gtf.gz
│     ├── Homo_sapiens.GRCh38.109.dna_sm.primary_assembly.fa.gz
│     └── indexes/
│        ├── salmon/
│        └── STAR/
├── mus_musculus/
│  └── GRCm39/
│     ├── Mus_musculus.GRCm39.109.gtf.gz
│     ├── Mus_musculus.GRCm39.109.dna_sm.primary_assembly.fa.gz
│     └── indexes/
│        ├── salmon/
│        └── STAR/
├── ref_genomes.sh
└── create_indexes.sh
```

As you can see, we have also keep here a bash script that downloads and sets up the folders. The contents of the bash script should also indicate a date of when was the data downloaded. For example:

```bash
#!/bin/bash

# Download human (GRCh38) and mouse (GRCm39) genome and annotations
# Release 109
# 2023-07-10

# Go to home
cd
# Create homo_sapiens version folder and go to that folder
mkdir -p genomic_resources/homo_sapiens/GRCh38
cd  genomic_resources/homo_sapiens/GRCh38

# Download FASTA file and GTF file from the ensembl release 109
wget -L ftp://ftp.ensembl.org/pub/release-109/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz
wget -L ftp://ftp.ensembl.org/pub/release-109/gtf/homo_sapiens/Homo_sapiens.GRCh38.109.gtf.gz

# Go to home
cd
# Create mus_musculus version folder and go to that folder
mkdir -p genomic_resources/mouse/GRCm39
cd  genomic_resources/mouse/GRCm39

# Download FASTA file and GTF file from the ensembl release 109
wget -L ftp://ftp.ensembl.org/pub/release-109/fasta/mus_musculus/dna/Mus_musculus.GRCm39.dna_sm.primary_assembly.fa.gz
wget -L https://ftp.ensembl.org/pub/release-109/gtf/mus_musculus/Mus_musculus.GRCm39.109.gtf.gz
```

After that is all set up, you can run another bash script that will create a index folder inside each version subfolder and generate indexes for different alignment tools!

## Naming conventions

Using consistent naming conventions is important in scientific research as it helps with the organization and retrieval of data or results. By adopting standardized naming conventions, researchers ensure that files, experiments, or data sets are labeled in a clear, logical manner. This makes it easier to locate and compare similar types of data or results, even when dealing with large datasets or multiple experiments. For instance, in genomics, employing uniform naming conventions for files related to specific experiments or samples allows for swift identification and comparison of relevant data, streamlining the research process and contributing to the reproducibility of findings. This practice promotes efficiency, collaboration, and the integrity of scientific work.

### General tips

Below you will find a small list of general tips to follow when you name a folder or a file:

- Use only alphanumeric characters to write a word: a to z and 0 to 9
- Avoid special characters: ~!@#$%^&*()`[]{}"|
- Date format: use `YYYYMMDD` format. For example: 20230101.
- Authors: use initials. For example: JARH
- **Don't use of spaces**! Computers get very confused when you need to point a path to a file and it contains spaces! Instead:
    - Separate field sections are separated by underscores `_`.
    - Words in each section are written in [camelCase](https://en.wikipedia.org/wiki/Camel_case).
  It would look then like this: `field1_word1Word2.txt`. For example: `heatmap_sampleCor_20230101.png`. The first field indicates what this file is, i.e., a heatmap. Second field is what is being plotted, i.e, sample correlations; since the field contains two words, they are written in camelCase. The third field is the date of when the image was created.
- Use as short fields as possible. You can try to use understandable abbreviations, like LFC for LogFoldChange, Cor for correlations, Dist for distances, etc.
- Avoid long names as much as you can, be concise!
- Avoid creating many sublevels of folders.
- Write down your naming convention pattern and document it in the README file
- When using a sequential numbering system, use leading zeros to make sure files sort in sequential order. Using `01` instead of just `1` if your sequence only goes up to `99`.
- Versions should be used as the last element, and use at least two digits with a leading 0 (e.g. v01, v02)

### Suggestions for NGS data

More info on naming conventions for different types of files and analysis is in development.

{{ read_table('./assets/file_naming_convention.tsv') }}

!!! question "Exercise: Create your own naming conventions"

    Think about the most common types of files and folders you will be working on, such as visualizations, results tables, processed files, etc. Then come up with a logical and clear way of naming those files using the tips suggested above. Remember to avoid making long and complicated names!

## Wrap up

In this lesson, we have learned some practical tips and examples about how to organize your data and bring some order to chaos! We have shown how to use `cookiecutter` as a template engine that can be used to create new `Assay` and `Project` folders without hassle. Hopefully you are now able to create your own templates and reuse them as much as you need. In the next lesson, we will look at what kind of metadata you should record for your `Assay` and `Project` folders, from general fields such as author or date, to more NGS specific like organism, cell type or tissue.
