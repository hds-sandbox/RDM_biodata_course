---
title: "Planning for data publication"
teaching: 5
exercises: 30-60
questions:
- "How do I create a data publication plan?"
objectives:
- "After the exercise you will have exerience of how to find a suitable repository, and to find out what is required for a submission."
keypoints:
- "Planning for how, when and where research data will be made accessible is part of a Data Management Plan"
- "Plan ahead - by knowing where the data will be published already during the project, the data and metadata can be formatted according to the repository's requirements, thus reducing the labour when submitting"
---
<!--
Present the exercise, purpose, how
Present expected outcome, how to create the plan
Present the 3 scenarios
Present solutions
-->
## Exercise - make a plan for data publication
One of the questions that needs to be addressed in a Data Management Plan (DMP) is *"How, when and where will research data or information about data (metadata) be made accessible?"*. Since the first version of a DMP is to be written before a project begins, this means that you have to have a plan for data sharing early on. Also, different repositories have different requirements regarding which metadata to provide and which formats to use when submitting. Knowing the requirements early on in a project, allows you to collect and format the appropriate metadata already while working on the project, when it is fresh in yours and your collaborators minds. This will greatly reduce the time spent on submission.

During this exercise you will create a plan for making research data available to the public, by identifying a suitable repository and finding out what the requirements are for submission. Three data output scenarios will be presented.

### Data publication plan
Things to consider when making a data publication plan:

**1. What types of outputs will you be creating or collecting?**

Make a list of the outputs, start with the main, most important, data type(s) for the study, since these will indicate which repository is suitable.

**2. What are suitable repositories for your outputs?**

Depositing your data in a publicly accessible recognised repository which assigns a globally persistent identifier (e.g. a DOI) ensures that your dataset continues to be available to both humans and machines in a usable form in the future.
Try to identify suitable repositories for your main data type(s).

##### Tools
* [ELIXIR Deposition Databases for Biomolecular Data](https://www.elixir-europe.org/platforms/data/elixir-deposition-databases)
* [EBI Repository Wizard](https://www.ebi.ac.uk/submission/)
* [Scientific Data Repository Guidance](https://www.nature.com/sdata/policies/repositories#life)

**3. What are the documentation guidelines for the repositories?**

Repositories often have documentation guidelines that are according to domain-specific standards, which will improve the FAIRness of your data. Organising your output documentation according to these guidelines and standards from the start will make your FAIRification journey much easier.

Which formats for data and metadata are required to be able to submit? Include the link to documentation guidelines.

**4. Under what licenses will your research outputs be shared?**

From a FAIR perspective, you should aim for a license which allows your data to be shared as openly as possible. Does the repository decide the license, or is this decided by you as a submitter? Identify the terms of the repository. If you decide, which license would you choose and why? The [Creative commons license chooser](https://creativecommons.org/choose/) is a tool to assist you in finding an appropriate license for data. (Other tools exist if you instead want to put a license on code or software e.g. [Choose a license](https://choosealicense.com/).)

### The scenarios
Select one of the scenarios below and answer the questions.
<!-- for each project, present a brief description of the research question and the main outcomes; data types, excel sheets, analysis scripts? -->

> ## Project A <!-- ArrayExpress -->
> <!-- https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7766033/, https://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-7276/ -->
> Gene *expression profiling* of Fowlpox knock-out mutant viruses using genome *microarrays* in order to investigate the ability of avian fowlpox virus to modulate host antiviral immune responses.
{: .solution}

> ## Project B <!-- PRIDE -->
> <!-- https://www.ebi.ac.uk/pride/archive/projects/PXD029490 -->
> *Protein* expression analysis (*proteomics*) in order to identify novel protein binders of human MIRO2 in prostate cancer using tandem *mass spectrometry* (MS/MS).
{: .solution}

> ## Project C <!-- SLL Figshare -->
> <!-- https://scilifelab.figshare.com/articles/dataset/Thermal_Proteome_Profiling_dataset_from_Hazara_virus_infected_SW13_cells_treated_with_DMSO_or_antiviral_inhibitor_20_M_TH6744_/13089023 -->
> Thermal proteome profiling dataset of Hazara virus infected cells. Thermal proteome profiling data type is a new type developed by your group. The dataset consists of a *spreadsheet* containing proteins identified and experimental conditions.
{: .solution}

### Questions to answer
* What types of outputs will you be creating or collecting?
* What are suitable repositories for your outputs?
* What are the documentation guidelines for the repositories? Which formats for data and metadata are required to be able to submit?
* Under what licenses will your research outputs be shared?

### Solutions
  > ## Solution project A <!-- ArrayExpress -->
  > **Data types**
  > * Microarray gene expression data
  >
  > **Repository**
  > * [ArrayExpress](https://www.ebi.ac.uk/arrayexpress/)
  >
  > **Documentation guidelines**
  > * [Submission overview](https://www.ebi.ac.uk/arrayexpress/help/submissions_overview.html)
  > * [What to prepare](https://www.ebi.ac.uk/fg/annotare/help/what_to_submit.html#what_to_prepare)
  >
  > * Collect the sample descriptions in txt format according to the metadata standard [Minimum Information About a Microarray Experiment (MIAME)](https://www.fged.org/projects/miame)
  >
  > **License**
  >
  > No clear license, but [ArrayExpress data access policy](https://www.ebi.ac.uk/arrayexpress/help/FAQ.html#data_restrictions): "No restrictions, all public data from ArrayExpress can be used by anyone and our services are completely free of charge."
  >
  {: .solution}

  > ## Solution project B <!-- PRIDE -->
  > **Data types**
  > * Mass spectra
  >
  > **Repository**
  > * [PRIDE](https://www.ebi.ac.uk/pride/)
  >
  > **Documentation guidelines**
  >
  > [Prepare submission](https://www.ebi.ac.uk/pride/markdownpage/submitdatapage#prepare_submission)
  > * Ensure that we have RAW (raw data files), RESULT (analysis files in mzIdentML format) and PEAK files
  >
  > **License**
  >
  > No clear license but [Citing PRIDE](https://www.ebi.ac.uk/pride/markdownpage/citationpage): "All datasets in PRIDE (as part of ProteomeXchange) are made fully open, once the corresponding paper is published."
  >
  {: .solution}

  > ## Solution project C <!-- SLL Figshare -->
  > **Data types**
  > * Spreadsheet in xlsx format
  >
  > **Repository**
  > * [SciLifeLab Data Repository](https://scilifelab.figshare.com/)
  >
  > **Documentation guidelines**
  > * [Submission guidelines](https://www.scilifelab.se/data/repository/submission/)
  > * Write a data dictionary to describe the different metadata attributes
  > * Write a manifest file, [(example)](https://www.scilifelab.se/wp-content/uploads/2021/10/MANIFEST.txt)
  > * Write a README file, [(example)](https://www.scilifelab.se/wp-content/uploads/2021/10/README-1.txt)
  >
  > **License**
  >
  > There are several licenses to choose between, we decided upon [Creative Commons Zero (CC0)](https://creativecommons.org/share-your-work/public-domain/cc0/) in order to make the dataset as open and freely available as possible.
  {: .solution}
