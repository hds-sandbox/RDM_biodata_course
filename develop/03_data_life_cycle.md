---
title: Data Life Cycle
summary: In this lesson we talk about what is the Data Life Cycle and how it is related with NGS data.
tags:
    - Data Life Cycle
---

# Data Life Cycle

**Last updated:** *{{ git_revision_date_localized }}*

!!! note "Section Overview"

    &#128368; **Time Estimation:** X minutes  

    &#128172; **Learning Objectives:**    
        
    1. Understand what the Data Life Cycle is
    2. Understand what each of the phases of the Data Life Cycle.

The data life cycle is a comprehensive and systematic approach that encompasses the entire journey of research data, from its inception through its collection, processing, analysis, sharing, and preservation. Like a living organism, data goes through different stages in its life cycle, each with specific considerations and requirements. Understanding and managing the data life cycle is crucial for researchers to ensure data integrity, accessibility, and long-term usability. By following the data life cycle, researchers can effectively organize, document, and share their data, fostering transparency, reproducibility, and collaboration in scientific research.

## Data Life Cycle phases

UCPH describes the data life cycle in 6 phases:

1. **Plan**: In the planning stage, researchers define the objectives of their data collection and analysis, identify data requirements, and develop a data management plan. This plan outlines how data will be collected, stored, and shared, as well as ethical and legal considerations.
2. **Collect and Document**: In this stage, researchers gather the data according to their plan. They document important details about the data, such as its source, collection methods, and any modifications made during data acquisition. Proper documentation ensures data quality and facilitates later use.
3. **Process and Analyse**: Data is processed and analyzed to draw meaningful insights and conclusions. Researchers use various methods, tools, and algorithms to extract valuable information from the collected data. During this phase, data is transformed, cleaned, and transformed into usable formats.
4. **Store and Secure**: Storing data securely is essential to protect it from loss, unauthorized access, and corruption. Researchers must choose appropriate storage solutions and implement data security measures to safeguard sensitive or confidential information.
5. **Share**: Sharing data is an important aspect of the data life cycle. Researchers are encouraged to share their data openly whenever possible, adhering to Open Science and FAIR principles. Data sharing fosters collaboration, increases the visibility of research, and enables data reuse by others.
6. **Preserve**: Data preservation ensures that valuable research data is available and usable in the long term. Researchers should deposit data in trusted data repositories or archives, ensuring its ongoing accessibility and future use by the scientific community.

<p align="center">

<img src="./images/RD_lifeCycle.png" alt="Research Data Life Cycle"/>
<figcaption>Research Data Life Cycle, University of Copenhagen RDM guidelines.</figcaption>

</p>

Let's take a look at each of the phases:

### Plan

In the planning stage, researchers define the objectives of their data collection and analysis, identify data requirements, and develop a data management plan. This plan outlines how data will be collected, stored, and shared, as well as ethical and legal considerations.

The management of research data must be thoroughly considered before physical materials (samples, model organisms, reagents or media, etc) and digital data (bioinformatics data) are collected, observed, generated, created or reused. Data management plans (DMP) must be developed and documented, preferably in electronic format. DMPs should be updated when significant changes to the management of research data occur and (references to) the DMP should be stored with the corresponding research data as long as they exist.

!!! warning

    This is a reminder that this course focuses only on **bioinformatics digital data**, not physical samples or materials.

The DMP should be discussed with project collaborators, research managers and supervisors (if any), ensuring that agreements are reached regarding responsibilities for different research data management activities during and after research projects.

!!! tip

    We will check about how to write a DMP for NGS data in the [5th lesson](./05_DMP.md).

### Collect and Document

In this stage, researchers gather the data according to their plan. They document important details about the data, such as its source, collection methods, and any modifications made during data acquisition. Proper documentation ensures data quality and facilitates later use.

Research data should be collected and processed in line with best practice in the research discipline. For example, there will be important differences between a metagenomics project and a clinical trial involving human samples! Research projects should be documented in a way that allows them to be repeated by others. Among other things, this includes clearly and accurately describing project methodology and any equipment, software or code used. This includes workflows for data preprocessing and how you will structure and organize your files.

!!! tip

    We will see about how to structure your files and folders in the [6th lesson](./06_file_structure.md).

In addition, research data should be described using appropriate metadata to facilitate searching for, the identification of, and the interpretation of the research data. Metadata should be linked to the research data as long as they exist, unless legislation or agreements state otherwise.

!!! tip

    We will see about what kind of metadata you can use for your NGS data in the [7th lesson](./07_metadata.md)

### Process and analyse

This, in the data life cycle for NGS data, is a critical phase that involves transforming raw sequencing data into meaningful biological insights. During this stage, researchers apply computational methods and bioinformatics tools to extract valuable information from the vast amount of sequencing data generated in NGS experiments.

Throughout this phase, researchers should adhere to good coding practices, ensuring well-documented and reproducible analyses. Code notebooks and version control tools, such as Git, help maintain transparency and facilitate the sharing of methods and results with the scientific community.

To streamline and standardize the data analysis process, researchers often employ workflows and pipelines. Workflows automate the execution of multiple analysis steps, enhancing efficiency and consistency while promoting reproducibility. The NGS research community benefits from collaborative efforts, such as the nf-core community, which provides pre-established and validated Nextflow-based pipelines for various NGS applications. Leveraging community-developed pipelines ensures adherence to best practices and accelerates the pace of research through shared expertise.

!!! tip

    We will see more about version control in [lesson 9](./09_version_control.md)

### Store and Secure

Storing data securely is essential to protect it from loss, unauthorized access, and corruption. Researchers must choose appropriate storage solutions and implement data security measures to safeguard sensitive or confidential information.

Research data must be classified at the start of a research project on the basis of the level of sensitivity and the impact to the University if data are disclosed, altered or destroyed without authorisation. Risks to data security and of data loss should be assessed in relation to the data classification. This includes evaluating:

- Physical and digital access to research data
- Risks associated with data management procedures
- Backup requirements and backup procedures
- External and internal threats to data confidentiality, integrity and accessibility
- Financial, regulatory and technical consequences of working with data, data storage and data preservation

!!! warning

    This step is very specific to the setup used in your environment. Maybe you are using a department server with storage, or you use a personal drive, or cloud solutions such as AWS. Thus, we cannot include in this course a comprehensive guideline on this matter.

!!! warning "About GPDR and protected data"

    This course does not talk in detail about protected NGS data, such as human or patient samples. For more information about GPDR protected data, check out [our course](https://heads.ku.dk/course/gdpr_workshop/)!

### Sharing

Sharing data is an important aspect of the data life cycle. Researchers are encouraged to share their data openly whenever possible, adhering to Open Science and FAIR principles. Data sharing fosters collaboration, increases the visibility of research, and enables data reuse by others.

Legislation or agreements may preclude research data sharing or impose conditions for sharing. Before sharing research data, the relevant approvals need to be obtained and, if necessary, the appropriate agreements set up to allow data and material sharing.

By default, research data should be made openly available after project end, as a minimum for data sets underlying research publications. Concerns relating to intellectual property rights, personal data protection, information security as well as commercial and national interests and legislation must be taken into account in accordance with the principle of ‘as open as possible, as closed as necessary’. If the research data cannot be made available, sharing the metadata associated with the research data should be considered.
The FAIR principles (for findable, accessible, interoperable and reusable research objects) should be followed as much as possible when preparing digital data sets that can be shared. This includes as a minimum:

- Providing open access to data (Open Data) by depositing data in a data repository, or by providing access to information on whether, when, how, and to what extent data can be accessed if data sets cannot be made openly available.
- As much as possible using persistent identifiers (PID) and metadata (such as descriptive keywords) that help locate the data set.
- Communicating terms and conditions for data reuse by others, for example by attaching a data licence.
- Providing the information necessary to understand how data sets were created and structured, and for what purpose.  

!!! tip

    We will talk about FAIR and OS principles in the [next lesson](./04_OS_FAIR.md)

### Preserve

Data preservation ensures that valuable research data is available and usable in the long term. Researchers should deposit data in trusted data repositories or archives, ensuring its ongoing accessibility and future use by the scientific community.

Appropriate arrangements for the long-term preservation of digital data, physical material and associated metadata must be made, adhering to legislation and/or agreements. This should include:

- Deciding which research data will be preserved. As a minimum, data sets underlying published research results must be preserved so that any objections or criticisms can be addressed.
- Deciding how long research data will be preserved. Data sets underlying research publications should be retained for at least five years after project completion or date of publication, whichever comes last.
- Choosing a format and location in which research data should be preserved, and deciding what metadata should be associated with the preserved data and material.
- Deleting/destructing research data if legislation or agreements exclude preservation, or when researchers and their managers determine that preservation is not required (for example when research data can easily be reproduced) or not possible (for example when research data are too costly to store or when material quality will deteriorate over time).
- Assigning a person, persons or role(s) responsible for the research data after project end. Responsibilities include safeguarding the long-term integrity of data sets.
- Determining rights, for example, of access to and use of preserved data sets.

In addition, your institution may oblige you to preserve and keep a copy of your data at their premises. They will usually explain any requirement at their own data management department. For example, the UCPH mandates that a copy of data sets and associated metadata must remain at UCPH after project end and/or when employment with the University ceases, in a way in which they are accessible to research managers and understandable for research managers and peers, unless legislation or agreements determine otherwise.

!!! tip

    We will check about which repositories you can use to preserve your NGS data in the [10th lesson](./10_repos.md)

## Wrap up

In this lesson we have learned about the Research Data Life Cycle, from the conception of a project and collection of data until the end of the project and preservation of the data. These concepts were taken from the UCPH data management guidelines and put them in the context of NGS, but are perfectly usable in other universities and applications.
