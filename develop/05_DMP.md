---
title: Data Management Plans
summary: A brief description of my document.
---

# Data Management Plans

**Last updated:** *{{ git_revision_date_localized }}*

!!! note "Section Overview"

    &#128368; **Time Estimation:** X minutes  

    &#128172; **Learning Objectives:**    
       
    1. Learn what is a DMP
    2. Learn about the different DMP templates
    3. How to write a DMP focused on NGS data

There are a lot of terms regarding data management and a lot of best practices to collect and implement, but how do we gather all the decisions made and how do we know that we have covered it all, that our data will be well managed throughout its life cycle? The answer is to write a data management plan (DMP).

A DMP is a document addressing requirements and practices for managing the project's data, code and documentation, throughout the data life cycle, i.e from the initial planning until the project ends and beyond.

It outlines the data management strategies in a project. Making plans for how you will collect, document, organize, and preserve your data are all part of the data management strategy.

## Why write a DMP?

There are several reasons why writing a data management plan is a very good idea:

* Think of the DMP as a checklist, comparable to a pilot's checklist before take-off, and going through the checklist allows you to **identify gaps** in current data management strategies. Identifying the gaps early on saves a lot of headache and time spent later. Going through the process of planning is more important than the actual plan itself.
* In a project with several members, it is important to decide on **standards** that all **collaborators** should adhere to, e.g. regarding how to organise the data, how to name it, which metadata standards to use, what vocabularies to use, etc.
* Writing a DMP also enables you to **estimate costs** regarding data production, storage, data management, etc.
* It is also a good way to clarify **responsibilities** regarding the data and the data management, e.g. who is responsible for the execution of the DMP.
* By planning how the data will be managed, there's greater chance that the research data will be **well-managed** (no guarantee, since you still need to have good strategies and actually implement them for this to happen). Of course there are many benefits with well-managed data but the main ones are:
    * **reproducibility**, so that the results can be verified
    * **reusability**, so that this data can be used for answering other scientific questions, thus reducing redundancy
* A DMP is the first step towards being **FAIR** in your project.

If the reasons above don't persuade you, the last argument is that it is more and more a **requirement** by funders and other stakeholders:

* For **transparency** and **openness**: publicly funded research data must be discoverable, accessible, and reusable to the public
* **Return on investment**: well planned data maximizes the research potential of the data and provides greater returns on public investments and research.

## When write a DMP?

A DMP is a **living document**, the initial version is written the same time as a new project idea is emerging, before e.g. applying for funds, and then successively updated as the project continues and new decisions are made. Ideally it should be updated continuously, but there are three major time points:

1. **Project planning:** The DMP should outline the strategies for data management in sufficient detail to be able to estimate the resources needed to implement the DMP, so that this can be included in the proposal for funding (e.g. data production, data analysis, storage during and after project, costs related to publishing of data).
2. **Project start:** The DMP is completed with more details e.g. about documentation, data quality measures, file and folder strategies, etc.
3. **Project end:** The DMP is updated a final time with e.g. links to published data and details about archiving (what data and where), so that this document enables future re-use of the project (by yourself or others).

## The main parts of a DMP

1. **Description of data**
    * What types of data will be created and/or collected, in terms of data format and amount/volume of data?
2. **Documentation**
    * How will the material be documented and described, with associated metadata relating to structure, standards and format for descriptions of the content, collection method, etc.?
3. **Storage and backup**
    * How is data security, storage and backup of data and metadata safeguarded during the research process?
4. **Legal and ethical aspects**
    * How is data handling according to legal requirements safeguarded, e.g. in terms of handling of personal data, confidentiality and intellectual property rights?
5. **Accessibility and long-term storage**
    * How, when and where will research data or information about data (i.e. metadata) be made accessible? E.g. via deposition to international public repositories.
    * In what way is long-term storage safeguarded, and by whom?
6. **Responsibility and resources**
    * Who are the responsible persons for data management?
    * What resources (costs, labour input or other) will be required for data management?

## DMP templates

Different agencies and funders may have different DMP templates that are mandatory for researchers to comply with data management requirements. Here you can find some examples.

### UCPH template

The University of Copenhagen has developed a DMP template in alignment with the UCPH Policy on Research Data Manage​ment. This is the recommended template for all researchers, guests and students involved in research activities at UCPH, unless other specific DMP requirements from a funding agency or a partner institution apply.

The UCPH DMP template is available within the DMPonline tool (see information below) or can be downloaded as a [Word document](https://kunet.ku.dk/work-areas/research/data/data-management-plans/Documents/UCPH%20Data%20Management%20Plan%20Template%20v2.1.docx).

Guidance for all questions in this template can be found [here](https://kunet.ku.dk/work-areas/research/data/data-management-plans/Documents/Guidelines%20for%20UCPH's%20data%20management%20plan%20template%20v2.1.pdf).

### Horizon Europe and ERC templates

All projects funded in the Horizon Europe framework programme must prepare and submit a data management plan as deliverable according to the details described in the respective grant agreement.

## How write a DMP?

Standard DMP templates can typically be found at funder agencies, e.g. [Swedish Research Council](https://www.vr.se/english/applying-for-funding/requirements-terms-and-conditions/producing-a-data-management-plan/data-management-plan-template.html) and [Science Europe](https://www.scienceeurope.org/media/jezkhnoo/se_rdm_practical_guide_final.pdf), and it is of course possible to write in your favorite text editor. In addition, there are several tools that can assist you in writing a DMP as well as guidance.

* DMPOnline. DMPonline is an online tool for writing, sharing and reviewing data management plans. A Danish installation is available under dmponline.deic.dk. It is provided by the Danish e-Infrastructure Cooperation (DeiC) and jointly administered by the Royal Danish Library and DTU Library. DMPonline contains a number of different DMP templates, guidance texts and examples from Danish research institutions and relevant funders.
    * The tool most universities have chosen to offer (check with your institute)
    * Good guidance but typically generic and not Life Science specific
    * Most often free text answers
    * Contains guidance for several DMP templates
* [Data Stewardship wizard](http://dsw.scilifelab.se/)
    * Provided by [SciLifeLab](https://www.scilifelab.se)
    * Gives Life Science specific guidance
    * Less free text answers, instead many questions with answer options

## Example of a DMP for NGS data

We are have written a DMP template that it is prefilled with repetitive information using [DMPonline](https://dmponline.deic.dk/) and the Horizon Europe guidelines. This template contains all the necessary information regarding common practices that we will use, the repositories we use for NGS, etc. The template is part of the `project` folder template, under `documents`. You can check the file [here](https://github.com/brickmanlab/ngs-template/blob/master/project/%7B%7B%20cookiecutter.project%20%7D%7D/documents/Non-sensitive_NGS_research_project_template.docx).

The Horizon Europe template is mostly focused on digital data and so, it is maybe not the best option if you are also interested in recording in your DMP physical data, such as samples, reagents, media, cultures, model organisms, etc.

***

*Some parts of this lesson are taken from the [NBISweden workshop](https://uppsala.instructure.com/courses/48087/pages/introduction-to-data-management-practices) on RDM practices.*
