---
title: Data storage
teaching: 10
exercises: 10
questions:
- What are good practices for storing the data that will be processed during your project?

objectives:
- Understand what to consider when planning for data storage and processing
- Adopt good practices for data storage, processing and documentation
- Identify and address requirements on storage and processing workflows

keypoints:
- Good data storage is the backbone and safety line of any research project
---

> ## About this episode 
> Research data storage may not seem like a pressing issue at the very beginning of a project. Depending on the kind of data, how it will be analysed, the amount of data needed, and what the data will or can be used for in the future, researchers may need to consider storage as a factor already in the early stages of a project. Failure to do so may require considerable time investment later on. 
> 1. TOC
> {:toc}
> {: .toc}
{: .callout .toc}


# Plan a storage strategy
It is an important aspect of your data management planning to determine what your storage needs are, and select solutions accordingly. Factors that play a role are, for example, data sensitivity, ease of access, file size and overall data volume. You can also ask yourself where, how and by whom your data will be produced, accessed, transformed, and transferred throughout and beyond the project. If necessary, design a backup plan for data storage, in case an intended form of storage becomes unavailable or is considered unsuitable for certain kinds of data. 

<!-- ![Data Life Cycle][life-cycle]  -->
<p align="center">
<img src="../fig/101-intro/rdmkit-data-lifecycle.png" width="400" height="400"/>
</p>

One way of categorising different types of storage options is:
* Portable devices – Laptops, tablets, external hard-drives, flash drives and Compact Discs
* Cloud storage - E.g. Google Drive, OneDrive, Dropbox, a University’s OwnCloud, Open Science Framework and Tresorit
* Local storage – Desktop computers and personal laptops
* Networked drives – Shared drives on university servers, NAS servers (Network Attached Storage) or infrastructures (such as SNIC)

> ### Discussion
> What storage categories do you use and what factors do you consider when selecting which category to use or not to use? 
> * Portable devices – Laptops, tablets, external hard-drives, flash drives and Compact Discs
> * Cloud storage - E.g. Google Drive, OneDrive, Dropbox, a University’s OwnCloud, Open Science Framework and Tresorit
> * Local storage – Desktop computers and personal laptops
> * Networked drives – Shared drives on university servers, NAS servers (Network Attached Storage) or infrastructures (such as SNIC)
>
>> ### Portable devices
>> - Do: use for temporary, short-term storage for non-sensitive data, e.g. in the field or to transport data and files when online transmission is not possible.
>> - Do: use in combination with encryption and strong password protection, especially if working with sensitive information (see 'Security').
>> - Do: conduct regular checks to ensure your device is working and that files are accessible.
>> - **Do not**: use for long-term storage or master copies of your data and files.
> {: .solution}
>
>> ### Cloud storage
>> - Do: use cloud services for granting shared, remote and easy access to data and other files to all involved in the project.
>> - Do: read the terms of service. Especially focus on rights to use content given to the service provider.
>> - Do: opt for European, national, or institutional cloud services which store data in Europe if possible.
>> - **Do not**: make this your only storage and backup solution.
>> - **Do not**: use for unencrypted (sensitive) personal data.
> {: .solution}
>
>> ### Local storage
>> Using desktop computers and personal laptops as the primary way of storing and accessing data and files is only suitable for projects involving very few people (ideally: only yourself) and where data and files will not have to be moved back and forth between personal computers frequently.
>> 
>> If you plan to work on the data on different (local) workstations, e.g. with your laptop at home and the desktop in the office:
>> - Do: make sure that you always work on the most current version of your files, for example with the help of versioning software or version control guidelines (see 'Data authenticity, versions and editions').
>> - Do: make sure that the most current version is always backed up (see 'Backup').
> {: .solution}
>
>> ### Networked drives
>> - Do: use for distributed collaborative projects involving many people who need access to data and files
>> - Do: use in combination with a suitable security strategy to protect data and files against unauthorised access (see 'Security').
>> - Do: use in combination with strict versioning rules (see 'Data authenticity, versions and editions')
>> - Do: think about long-term archival solutions for data that is complete and has been analysed. Valuable storage space might be released in this way.
>> - Do: work with rights and permissions to ensure that not everyone has access to everything if this is not required (e.g. make access to master files more restricted than access to working files).
> {: .solution}
>
{: .discussion}

## Plan a backup and disaster recovery strategy
A backup strategy in one sentence would be: Have at least three copies of the original data on at least two different types of storage media, keep storage devices in separate locations with at least one off-site, regularly check whether they work, ensure all project members know the process and follow it. Doing so will ensure that at least one of the three copies will be retrievable if something happens.

> ### Discussion
> What are examples of potential causes for data loss in a research project?
>
>> ### Examples
>> - Hardware failure;
>> - Software malfunction;
>> - Malware or hacking;
>> - Human error (research data accidentally gets deleted or overwritten or is lost in transport);
>> - Theft, natural disaster or fire;
>> - Degradation of storage media.
> {: .solution}
>
{: .discussion}


> ### Creating a backup strategy in 10 steps
> 
> 1. Find out whether your institution has a backup strategy
> 2. Determine what you want to back up
> 3. Decide how many backups you will need and how frequently to back up
> 4. Decide where backups will be stored
> 5. Determine how much storage capacity will be needed
> 6. Determine if there are tools you could use to automate backup
> 7. Determine how long backups will be kept and how they will be destroyed
> 8. Determine how personal data will be protected
> 9. Devise a disaster recovery plan
> 10. Assign responsibilities 
{: .callout}

> ### Further reading
>
> - [ELIXIR (2021) Data storage. In Research Data Management Kit. A deliverable from the EU-funded ELIXIR-CONVERGE project (grant agreement 871075).](https://rdmkit.elixir-europe.org/storage.html)
> - [--- (2021) Processing. In Research Data Management Kit. A deliverable from the EU-funded ELIXIR-CONVERGE project (grant agreement 871075).](https://rdmkit.elixir-europe.org/processing)
> - [--- (2021) Data analysis. In Research Data Management Kit. A deliverable from the EU-funded ELIXIR-CONVERGE project (grant agreement 871075).](https://rdmkit.elixir-europe.org/data_analysis.html)
>
> ### Examples of practices
> Some best practice rules (UK Data Service, 2017a; Krejčí, 2014) can be summarised as follows:
> - Establish the terms and conditions of data use and make them known to team members and other users;
> - Create a ‘master file’ and take measures to preserve its authenticity, i.e. place it in an adequate location and define access rights and responsibilities – who is authorised to make what kind of changes;
> - Distinguish between versions shared by researchers and working versions of individuals;
> - Decide how many versions of a file to keep, which versions to keep (e.g. major versions rather than minor versions (keep version 02-00 but not 02-01)), for how long and how to organise versions;
> - Introduce clear and systematic naming of data file versions and editions;
> - Record relationships between items where needed, for example between code and the data file it is run against, between data file and related documentation or metadata or between multiple files;
> - Document which changes were made in any version;
> - Keep original (raw) versions of data files, or keep documentation that allows the reconstruction of original files;
> - Track the location of files if they are stored in a variety of locations;
> - Regularly synchronise files in different locations, such as using MS SyncToy (2016).
{: .discussion}