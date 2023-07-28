---
title: RDM intro
summary: An introduction to Research Data Management from the point of view of the University of Copenhagen.
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
        1. Learn the basics about what is Research Data Management
        2. Learn why good RDM are important

The University of Copenhagen (UCPH) defines Research Data Management (RDM) as a "collective term for the planning, collection, storage, sharing and preservation of research data"[@UCPH_guidelines].

RDM is of paramount importance in modern scientific investigations due to the exponential growth of data in various disciplines, particularly in fields like genomics, climate research, and social sciences. Effectively managing research data offers several key benefits:

- First, it enhances the reliability and credibility of research findings by providing a transparent and structured approach to data collection, organization, and analysis.
- Second, RDM promotes data discoverability, allowing researchers to locate and utilize existing data for new investigations, thus maximizing the value of research efforts.
- Third, proper data management facilitates collaboration and knowledge sharing within the scientific community, accelerating the pace of discoveries and advancements. 
- Finally, RDM ensures compliance with ethical and legal requirements, safeguarding sensitive data and promoting responsible data use. By adopting robust RDM practices, researchers can optimize their workflow, increase research impact, and contribute to the overall progress of science.

## What is Research Data Management

While the meaning of Research Data Management might be obvious, it is a good idea to break down its components to make a good sense of what it implies. Let's start with *Management*, which is rather simple!

!!! note "Meaning of Management"

    The literal [meaning](https://www.merriam-webster.com/dictionary/management) of *Management* is "the practice of managing; handling, supervision, or control."


On the other hand, we have *Research Data*:

!!! note "Meaning of Research Data"

    In accordance with the UCPH Policy for Research Data Management[@UCPH_guidelines], research data encompasses both physical material and digital information gathered, observed, produced, or formulated during research activities carried out at UCPH. This broad definition includes various types of data serving as the foundation for the research, such as specimens, notebooks, interviews, texts, literature, digital raw data, recordings, computer code, and meticulous documentation of these materials and data, forming the core of the analysis that underlies the research outcomes.

So, our goal is to handle and control the data that we generate during our research, including **both physical and digital** data! This must be done **throughout the whole life [cycle of the data](#research-data-cycle)**.


Nonetheless, we will focus on the **digital part** of our data.

!!! warning

    This workshop focuses on RDM of digital data and how it was generated!

### Research Data Cycle

The Research Data Life Cycle is a conceptual framework that illustrates the various stages that research data goes through during its lifetime, from its initial creation or collection to its eventual archiving or disposal. It provides a structured approach to managing research data effectively, ensuring data integrity, accessibility, and reusability. We will talk about the Research Data Life Cycle in the [third lesson](./03_data_life_cycle.md).

<p align="center">

<img src="./images/RD_lifeCycle.png" alt="Research Data Life Cycle"/>
<figcaption>Research Data Life Cycle, University of Copenhagen RDM guidelines.</figcaption>

</p>

## Why is Research Data Management important

Effective data management can significantly benefit research, providing advantages for individual researchers:

- Careful planning aids in the early identification and resolution of potential issues, aligns expectations among collaborators, and clarifies data rights and ownership.
- Thorough data documentation streamlines the process of locating and comprehending previous research, promoting efficiency and building upon existing knowledge.
- Conducting risk assessments and devising robust data storage and security strategies mitigate the risk of data loss, breaches, or unauthorized use, safeguarding valuable research assets.
- Sharing data with others beyond the project's conclusion enhances research visibility and fosters increased citations, expanding the impact of the findings.
- Developing a data preservation plan ensures the long-term availability of research data well after the project's completion, contributing to data accessibility and continued research relevance.

### The cost of bad RDM practices

Do these pictures look familiar to you?

<p align="right">

<a href="https://www.su.se/staff/researchers/research-data/manage-store-data">
<img src="./images/data_mess.jpg" alt="Messy office"/>
<figcaption>Photo by Wonderlane on Unsplash.</figcaption>

</p>


Several surveys have shown that data scientists spend between 50-70% of their time loading and cleaning data, becoming the most consuming tasks (and many would call it tedious) of their jobs [@anaconda_report;@forbes_article]. Below we show the number figures from the [Anaconda "State of data science 2020" report](https://www.anaconda.com/resources/whitepapers/state-of-data-science-2020)[@anaconda_report].

<p align="center">

<img src="./images/cleaning_data.png" alt="Time spent in different tasks by data scientists"/>
<figcaption>Time spent in different tasks by data scientists, Anaconda State of data science report 2020.</figcaption>

</p>

### Benefits of good RDM practices