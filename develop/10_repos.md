---
title: Repositories for NGS
summary: In this lesson we navigate through different types of repositories and which ones are ideal to deposit your NGS datasets and data analyses.
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

# Repositories for NGS data

**Last updated:** *{{ git_revision_date_localized }}*

!!! note "Section Overview"

    &#128368; **Time Estimation:** X minutes  

    &#128172; **Learning Objectives:**    
    
    1. Learn what are repositories and which ones are relevant for NGS data
    2. Learn where to archive your GitHub data analysis repositories

In this lesson, we're going to explore repositories like Zenodo, Gene Expression Omnibus, and Annotare. While platforms like GitHub are great for version control and collaborative coding, these repositories serve a different purpose. They're designed specifically for archiving and sharing scientific data, ensuring it's preserved for the long term and accessible to the global research community. You could think of them as secure digital libraries for your valuable NGS data.

## What is a repository/archive?

Specialized repositories/archives are dedicated digital platforms designed for the secure storage, curation, and dissemination of scientific data. These repositories hold great importance in the research community as they serve as reliable archives for preserving valuable datasets. Their standardized formats and robust curation processes ensure the long-term accessibility and citability of research findings. Researchers worldwide rely on these repositories to share, discover, and validate scientific information, thereby fostering transparency, collaboration, and the advancement of knowledge across various domains of study.

## Why are they important?

Archiving your data in these repositories offers a multitude of benefits. Firstly, it ensures the enduring accessibility and preservation of your research, safeguarding it for future generations of scientists. Additionally, repositories typically provide a unique Identifier (often a DOI) for your dataset, granting it a citable status in the academic world. This not only enhances the visibility and impact of your work but also facilitates proper attribution.

Moreover, these repositories often encourage or require comprehensive metadata to accompany your data. This rich contextual information includes details about the methodology, experimental setup, and any other pertinent information. Such metadata greatly enhances the discoverability and interpretability of your dataset, enabling fellow researchers to effectively use and build upon your work. In essence, archiving your data in these repositories not only fulfills scholarly obligations but also amplifies the reach and influence of your research in the scientific community.

In addition, depositing data in these archives is often a mandatory requirement set by scientific journals and funding agencies. This reflects the growing recognition of the critical role these repositories play in ensuring transparency, reproducibility, and the integrity of research outcomes. By adhering to these guidelines, researchers contribute to the broader scientific community and increase the quality of their research.

## Types of repositories

We could divide archives in two mayor categories, general or domain-specific. General repositories like Zenodo cater to a wide range of disciplines, providing a versatile platform for data archiving. On the other hand, domain-specific repositories are tailored to particular scientific fields, like GEO and Annotare in the field of NGS, offering specialized curation and context-specific features. Utilizing domain-specific repositories often provides researchers with a more targeted audience, deeper domain expertise, and enhanced visibility within their specific research community. This focused approach ensures that data is curated and contextualized in a way that aligns closely with the standards and expectations of that particular field, maximizing its impact and utility.

### Domain specific repositories for NGS data: GEO or Annotare

#### Gene Expression Omnibus

The Gene Expression Omnibus, commonly known as GEO, is a specialized repository curated by the National Center for Biotechnology Information (NCBI). It is dedicated to archiving and sharing high-throughput functional genomic data sets, primarily focused on gene expression data.

Researchers can easily deposit and access a wide range of genomic data, including microarray and high-throughput sequencing studies. GEO provides a structured platform for researchers to share their findings with the scientific community, enhancing data transparency and reproducibility.

GEO assigns unique accession numbers to each dataset, ensuring traceability and enabling proper citation in research publications. Its domain-specific focus on functional genomics makes it an invaluable resource for researchers in genetics, genomics, and related fields, allowing for the comprehensive exploration of gene expression patterns across various biological conditions and experimental designs.

#### Annotare

Annotare is a specialized repository hosted by the European Bioinformatics Institute (EBI) that is tailored for the submission and storage of functional genomics experiments, particularly those involving high-throughput sequencing data. Unlike general repositories, Annotare provides a domain-specific platform optimized for researchers in the field of functional genomics.

Researchers can upload their experimental data along with comprehensive metadata, ensuring that the context and details of the experiment are preserved. Annotare supports a wide range of genomic data types, making it a versatile platform for archiving diverse functional genomics studies.

By focusing specifically on functional genomics, Annotare offers researchers a curated environment that aligns closely with the standards and practices of this specialized field. This ensures that data is stored and curated in a manner that is most useful for researchers in the genomics community. The platform's specialization enhances data discoverability, promotes collaboration, and facilitates deeper insights into the functional aspects of the genome.

#### NGS Data upload to GEO or Annotare

[GEO](https://www.ncbi.nlm.nih.gov/geo/) and [Annotare](https://www.ebi.ac.uk/fg/annotare/login/) are excellent repository choices to deposit your NGS data. Both Annotare and GEO adhere to established community standards for data submission and sharing in the field of functional genomics:

1. [**Minimum Information About a Microarray Experiment (MIAME)**](https://pubmed.ncbi.nlm.nih.gov/11726920/): This is a set of guidelines established to ensure the comprehensive and standardized reporting of microarray experiments. Both Annotare and GEO require compliance with MIAME standards for microarray data submissions.
2. [**Minimum Information about a high-throughput SeQuencing Experiment (MIxS)**](https://www.fged.org/projects/minseqe/): MIxS is a set of standards developed by the Genomic Standards Consortium to ensure consistent reporting of metadata for high-throughput sequencing experiments. Annotare and GEO require adherence to MIxS standards for sequencing data submissions.
3. [**Sequence Read Archive (SRA) Submission Guidelines**](https://www.ncbi.nlm.nih.gov/sra/docs/submit/): Both Annotare and GEO follow the submission guidelines set forth by the Sequence Read Archive, which include requirements for data formatting, metadata inclusion, and quality control.
4. **Community-Specific Standards**: In addition to the above, Annotare and GEO may also adhere to community-specific standards and guidelines established by the functional genomics research community. These standards are designed to ensure that submitted data meets the specific requirements and expectations of the field.

By adhering to these standards, Annotare and GEO ensure that the data submitted to their repositories is of high quality, well-documented, and compliant with community best practices. This facilitates data discovery, reproducibility, and interoperability within the scientific community.

These repositories will only accept NGS data and information related to the creation of the data. This includes the raw FASTQ files, sample metadata, including protocols and descriptions of how the samples and data where processed, as well as final pre-processing results such as read count matrices or genomic position files (like BED). If you adhere to the `Assay` folder creation guideline of [lesson 6](./06_file_structure.md), you will have a very easy time filling up the required documentation and information needed to submit the data in your `Assay` folder to one of these repositories.

Nonetheless, the repositories will not accept other data created by your down-stream analyses, neither the code used for data analyses! This means anything that you have done in your `Project` folder. However, your `Project` folder is already version controlled by GitHub ([see previous lesson](./09_version_control.md)), so there is no need to worry. We will see in the section below how to archive your `Project`` folder as well using a general repository like Zenodo.

### A general repository: Zenodo

Zenodo[https://zenodo.org/] is an open-access digital repository designed to facilitate the archiving of scientific research outputs. It operates under the umbrella of the European Organization for Nuclear Research (CERN) and is supported by the European Commission. Zenodo accommodates a broad spectrum of research outputs, including datasets, papers, software, and multimedia files. This versatility makes it an invaluable resource for researchers across a wide array of domains, promoting transparency, collaboration, and the advancement of knowledge on a global scale.

Operating on a user-friendly web platform, Zenodo allows researchers to easily upload, share, and preserve their research data and related materials. Upon deposit, each item is assigned a unique Digital Object Identifier (DOI), granting it a citable status and ensuring its long-term accessibility. Additionally, Zenodo provides robust metadata capabilities, enabling researchers to enrich their submissions with detailed contextual information. In addition, it allows you to [link you GitHub account](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content), providing a streamlined way to archive a specific release of your GitHub repository directly into Zenodo. This integration simplifies the process of preserving a snapshot of your project's progress for long-term accessibility and citation.

#### `Project` archiving in Zenodo

Once your [accounts are linked](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content), creating a Zenodo archive is as simple as tagging a release in your GitHub repository. Zenodo will automatically detect the release and generate a corresponding archive. This archive is assigned a unique Digital Object Identifier (DOI), making it a citable reference for your work. So, before submitting your work in a journal, make sure to link your data analysis repository to [Zenodo](https://zenodo.org/), get a DOI and cite it in your manuscript!

By leveraging this integration, you ensure that significant milestones in your project are preserved in a reliable and accessible manner. This not only facilitates proper attribution but also contributes to the broader scientific community's ability to reproduce and build upon your research.

## Wrap up

In this final lesson we have learned how to wrap up a project/manuscript experiment by submitting your data to a domain-specific repository, while archiving your data analysis GitHub repositories in Zenodo. By following the simple lessons shown in this workshop, you will dramatically improve the FAIRability of your data, as well as organizing and structuring it in a way that will be much more useful in the future. This advantages do not serve yourself only, but your teammates, group leader and the general scientific population!

We hope that you found this workshop useful. If you would like to leave us some comments or suggestions, feel free to answer this form! 

[**FEEDBACK FORM**](https://forms.office.com/e/BZkpzDKL0L)
