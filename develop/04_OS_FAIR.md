---
title: Introduction to Open Science and FAIR principles
summary: In this lesson we provide a short intro to what is Open Science and FAIR principles
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

# Introduction to Open Science and FAIR principles

**Last updated:** *{{ git_revision_date_localized }}*

!!! note "Section Overview"

    &#128368; **Time Estimation:** X minutes  

    &#128172; **Learning Objectives:** 

    1. Learn about Open Science
    2. Learn about FAIR principles
    3. Learn about how they can be applied to NGS data  
  
Open Science and FAIR principles have emerged as powerful frameworks that promote transparency, accessibility, and reusability in scientific research. As the landscape of scientific knowledge sharing evolves, these principles stand at the forefront of a global movement to accelerate scientific discovery and innovation. Open Science advocates for the unrestricted access to research outputs, data, and methodologies, fostering collaboration and democratizing scientific knowledge. On the other hand, the FAIR principles emphasize the importance of making data Findable, Accessible, Interoperable, and Reusable, laying the foundation for a data-driven approach that transcends disciplinary boundaries and supports long-term data preservation. Together, Open Science and FAIR principles offer a transformative vision for a more inclusive and impactful scientific ecosystem that advances the boundaries of knowledge for the benefit of society as a whole. Funding agencies and governments worldwide are increasingly recognizing the value and potential of Open Science and FAIR principles in advancing research and driving societal impact. As a result, they have been actively promoting and requiring the adoption of these principles in academia through various mechanisms and policies. In this lesson we will learn what is Open Science and the FAIR principles, and how they can be applied to NGS data.

## Open Science

Funding agencies and regulatory agencies, such as the EU, have been actively promoting Open Science through various policies, recognizing its potential to advance research, innovation, and societal well-being. The reasons for this push are plentiful. Open Science allows research outputs to be accessible to a wider audience, accelerating the impact of research and fostering collaboration among researchers and institutions, as well as encourages transparency and reproducibility, fostering responsible research conduct and mitigating issues like scientific fraud and data manipulation. The reasons are also economical: by promoting Open Access and data sharing, the EU seeks to maximize the return on its research investments by ensuring that knowledge and data are used and built upon by the broader scientific community. This also provides a foundation for innovation and entrepreneurship, enabling businesses and startups to access and leverage research findings for creating new products and services, and allows researchers to integrate and analyze large datasets from different sources, leading to new insights and discoveries.

More and more agencies are promoting Open Science initiatives, supporting research that adheres to OS principles. Here are some more examples:

- National Institutes of Health (NIH): In the United States, NIH encourages Open Science practices, such as data sharing, through various policies and initiatives. The NIH Data Sharing Policy requires researchers to share their data with the scientific community.
- Wellcome Trust: The Wellcome Trust, a global charitable foundation, has a strong commitment to Open Science. It mandates that research outputs funded by Wellcome must be made openly available through Open Access platforms.
- European Molecular Biology Organization (EMBO): EMBO supports Open Access to research outputs and provides guidelines for best practices in data sharing.
- Bill & Melinda Gates Foundation: The foundation advocates for Open Access and data sharing to maximize the impact of its global health and development research.
- European Research Council (ERC): The ERC promotes Open Access to research outputs, requiring grantees to make their publications openly accessible. It also encourages data sharing and adheres to the FAIR principles to ensure the findability, accessibility, interoperability, and reusability of research data.

### Benefits of Open Science for you!

While it may seem that this push for Open Science is being enforced by funding agencies to get more bang for their buck, adhering to Open Science practices can offer numerous benefits to you, as a researcher. Some of the key advantages include:

- Increased Visibility and Impact: When you share your research openly, more people can access and read your papers and data, increasing the visibility and impact of your work.
- Enhanced Collaboration: Open Science encourages collaboration with other researchers, leading to new ideas and projects that can be more impactful.
- Build Trust in Your Findings: By sharing your data and methods openly, other researchers can verify and validate your findings, increasing the credibility of your research.
- Research Moves Faster: Open Science lets researchers build upon each other's work, accelerating the pace of discovery and progress in science.
- Inspire New Discoveries: Your shared data can inspire others to explore new research questions and find insights you might not have considered.
- Attract Funding Opportunities: More and more funding agencies are supporting Open Science, and following open practices can help you qualify for more funding opportunities.
- Transparency and Accountability: Open Science practices promote transparency, accountability, and responsible conduct in research, reducing the risk of scientific misconduct.
- Preserve Your Data: By archiving your data in repositories, you ensure that it is preserved and available for future generations of scientists.

## FAIR principles

The FAIR principles are a set of guiding principles designed to enhance the management, sharing, and usability of research data, and could be considered as complementary to Open Science. FAIR stands for Findable, Accessible, Interoperable, and Reusable, and these principles aim to make research data more valuable, impactful, and sustainable. By adhering to the FAIR principles, researchers and institutions can maximize the value and impact of their research data. FAIR data not only benefits individual researchers but also contributes to the broader scientific community by fostering collaboration, data-driven discoveries, and the advancement of knowledge across disciplines. Furthermore, FAIR data supports long-term data preservation, making it valuable for future research and ensuring the sustainability of scientific progress.
Let's break down each FAIR principle:

### Findable

Research data should be easy to find and identify. To achieve this, data should be assigned persistent and unique identifiers (e.g., DOIs) and described using standard metadata. Providing clear and comprehensive metadata helps researchers and machines discover relevant data through various search engines and data repositories.

!!! note "Key components"

    - Persistent Identifiers: Research data should be assigned unique and persistent identifiers, such as Digital Object Identifiers (DOIs) or Uniform Resource Identifiers (URIs). These identifiers ensure that data can be located and referenced over time, even if it is moved or its location changes.
    - Rich Metadata: Data should be accompanied by comprehensive and standardized metadata that describes the content, context, and characteristics of the data. This metadata includes information about the data's origin, format, version, licensing, and the conditions for reuse.
    - Data Repository or Catalog: Data should be deposited in trusted repositories or data catalogs that follow FAIR principles, making it easier to discover and access data from a centralized and reliable source.

### Accessible

Data should be openly accessible to anyone who needs it. This means that there should be minimal restrictions on accessing and downloading the data. Open access to data encourages collaboration, enables verification of research findings, and ensures transparency in research processes.

!!! note "Key components"

    - Open Access: Data should be openly accessible to anyone without restrictions or unnecessary barriers. Researchers should choose appropriate licenses or waivers that allow the broadest possible reuse of the data.
    - Authentication and Authorization: If access restrictions are necessary (e.g., for sensitive or confidential data), proper authentication and authorization mechanisms should be in place to grant access only to authorized individuals or groups.

### Interoperable

Data should be structured and formatted in a way that allows it to be used and combined with other data seamlessly. Following standard data formats and adopting widely used vocabularies and ontologies promotes interoperability, enabling integration and comparison of data from different sources.

!!! note "Key components"

    - Standard Data Formats: Data should be stored in standard and widely-used data formats, facilitating data exchange and interoperability with various software tools and platforms.
    - Vocabularies and Ontologies: Researchers should use community-accepted vocabularies and ontologies to provide common definitions and concepts, ensuring data can be understood and combined with other datasets more effectively.
    - Linked Data: By linking data with other related data and resources, researchers can enrich the context of their datasets, enabling better integration and discovery of interconnected information.

### Reusable

Data should be well-documented and prepared for reuse in different contexts. This involves providing detailed information on data collection, processing, and methodology, allowing other researchers to understand and replicate the study. Additionally, licensing and ethical considerations should be clearly stated to enable legal and ethical reuse of the data.

!!! note "Key components"

    - Documentation and Provenance: Data should be accompanied by comprehensive documentation that explains how the data was collected, processed, and analyzed. Provenance information ensures that data users can understand the data's origin and processing history.
    - Ethical and Legal Considerations: Researchers should provide clear information about ethical considerations related to data collection and use. Additionally, data should adhere to legal and regulatory requirements, ensuring its responsible and ethical reuse.
    - Data Licensing: Researchers should clearly state the licensing terms for data reuse, specifying how others can use, modify, and redistribute the data while respecting intellectual property rights and legal constraints.
