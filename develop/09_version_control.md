---
title: Data analysis version control
summary: In this lesson we will discuss how to track and version control your data analysis using git and github.
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

# Version control of your data analysis using Git and Github

**Last updated:** *{{ git_revision_date_localized }}*

!!! note "Section Overview"

    &#128368; **Time Estimation:** X minutes  

    &#128172; **Learning Objectives:**    
    
    1. Learn what is version control and why it is important
    2. Introduce you to Git and Github repositories
    3. Make your own repositories
    4. Make a Github page to show off your data analysis reports

In this lesson, we will explore the concept of version control and its pivotal role in modern research and development workflows. We'll introduce Git, a widely adopted version control system that empowers you to systematically track changes in your work. Additionally, we will check GitHub, a collaborative platform for hosting Git repositories, enabling you to share your work with others and increase the visibility of your projects. By the end of this lesson, you'll have a introductory understanding of version control, the ability to create Git repositories, and the skills to build a GitHub page to showcase your data analysis.

## Version control

Version control is a systematic approach to tracking changes made to a project over time. It provides a structured means of documenting alterations, allowing you to revisit and understand the evolution of your work. In research data management and data analytics, version control is very important and gives you a lot of advantages.

!!! success "Advantages of using version control"

    It offers a methodical way to:

    1. **Document Progress**: Version control keeps a detailed history of changes, making it easier to understand how a project has developed, what modifications were made, and by whom.
    2. **Ensure Data Integrity**: It safeguards data by preventing accidental overwrites or deletions. Each change is tracked, enabling easy recovery in case of errors.
    3. **Facilitate Collaboration**: In collaborative research, version control enables multiple team members to work simultaneously on a project without conflicts. Changes can be merged seamlessly.
    4. **Reproducibility**: It enhances reproducibility by preserving the exact state of your project at any point in time. This is invaluable for validating research findings and data analysis.
    5. **Branching and Experimentation**: Version control allows for branching, where you can create alternative versions of your project for experimentation without affecting the main branch.
    6. **Global Accessibility**: Platforms like GitHub provide global visibility, allowing researchers to share their work, receive feedback, and contribute to open science.

## Git and Github

!!! warning

    In this section we will only talk briefly about what is Git and Github. Explaining how git works is beyond the scope of this course. If you want to know more, please check out our [courses](https://heads.ku.dk/course/git_github/)!

### Version control using Git

[Git](https://git-scm.com/about) is a distributed version control system that enables developers and researchers to efficiently manage their project's history, collaborate seamlessly, and ensure data integrity. At its core, Git operates through the following principles and mechanisms:

1. **Local Repository**: Each user maintains a local repository on their computer, allowing them to work on a project independently. This local repository stores the complete project history.
2. **Snapshots, Not Files**: Git does not track individual file changes but rather captures snapshots of the entire project at different points in time. This 'snapshot' approach ensures data consistency.
3. **Commits**: Users create 'commits,' which are snapshots of the project at a specific moment. Commits record changes made to files, along with a commit message explaining the modifications.
4. **Branching**: Git supports branching, enabling users to create separate lines of development. Branches are useful for experimenting with new features or fixing bugs without affecting the main project.
5. **Merging**: Changes made in one branch can be merged into another, allowing for the incorporation of new features or bug fixes back into the main project. Git ensures a smooth merging process.
6. **Distributed Architecture**: Git's distributed nature means that each user's local repository is a complete copy of the project, including its entire history. This enables offline work and ensures data redundancy.
7. **Remote Repositories**: Git allows users to connect and synchronize their local repositories with remote repositories hosted on platforms like GitHub. Remote repositories facilitate collaboration and provide a central hub for project sharing.
8. **Push and Pull**: Users 'push' their local changes to a remote repository to share with others. Conversely, they 'pull' changes made by others into their local repository to stay up-to-date.
9. **Conflict Resolution**: In cases of conflicting changes, Git provides tools to resolve conflicts manually, ensuring that data integrity is maintained during collaboration.
10. **Versioning and Tagging**: Git offers versioning and tagging capabilities, allowing users to mark specific points in history, such as major releases or significant milestones.

### Hosting your git repos using Github

On the other hand, [GitHub](https://github.com/) is a web-based platform that enhances Git's capabilities by providing a collaborative and centralized hub for hosting Git repositories. It offers several key functionalities, such as tracking issues, security features to safeguard your repos, and GitHub Pages that allows you to create websites to showcase your proyects. We will see more about Github Pages in the section below. In addition, you can set your repository as **private** until you are ready to publish your work!

If you do not have an account in Github already, we recommend you to do one now! There are other alternatives to GitHub, such as [BitBucket](https://bitbucket.org/) and [GitLab](https://about.gitlab.com/), Some features might be different, so we will stick to Github for the rest of the lesson!

## Creating a repo from your Project folder

We will show you two ways to make your `Project` folder into a Git repository

!!! warning "What about my Assay folder?"

    An assay folder contains very big files that are not suitable for version control, at least in GitHub. We recommend that you deposit the data into a domain specific archive such as GEO or ArrayExpress. Even Zenodo would be a better option in this case. 
    
    Remember to link the original dataset with the data analysis repository!

### Creating a git repo from an existing folder

Your project may already exist locally, but it doesn't have Git yet. `git init` is probably the right choice for you if you have created a `Project` folder using the cookiecutter template we saw in the [previous lesson](./06_file_structure.md).

The `git init` command will only be run once, even if other collaborators share the project.

- First, initialize the repository (`git init`) and make at least one commit (`git add` and `git commit`).
- Once you have initialized the repository, create a remote repository in [GitHub](https://github.com/)
- Then, add the remote URL to your local git repository with `git remote add origin \<URL\>`. This stores the remote URL under a more human-friendly name, origin.
- Shape your history into at least one commit by using `git add` to stage the existing files, and `git commit` to make the snapshot.
- Once you have at least one commit, you can push to the remote and set up the tracking relationship for good with `git push -u origin master`.

### Creating a git repo online and copying your project folder

If the repository already exists on a remote, you would choose to `git clone` and not `git init`. On the other hand, if you create a remote repository first with the intent of moving your project to it later, you may have a few other steps to follow. If there are no commits in the remote repository, you can follow the steps above for `git init`. If there are commits and files in the remote repository but you would still like it to contain your project files, `git clone` that repository. Then, move the project's files into that cloned repository. `git add`, `git commit`, and `git push` to create a history that makes sense for the beginning of your project. Then, your team can interact with the repository without `git init` again.

!!! tip "Tips to write good commit messages"

    If you would like to know more about Git commits and the best way to make clear git messages, check out [this post](https://www.conventionalcommits.org/en/v1.0.0/)!

## GitHub Pages

Once you have created your repository (and put it in GitHub), you have now the opportunity to add your data analysis reports that you created, in either Jupyter Notebooks, Rmarkdowns or html reports, in a [GitHub Page website](https://pages.github.com/). Creating a GitHub page is very simple, and we really recommend that you follow the nice tutorial that GitHub as put for you.

There are many different ways to create your webpages. We recommend using Mkdocs and Mkdocs materials as a framework to create a super nice webpage in a simple manner. The folder templates that we used as an example in [lesson 06](./06_file_structure.md) already contain everything you need to start a webpage. Nonetheless, you will need to understand the basics of [MkDocs](https://www.mkdocs.org/) and [MkDocs materials](https://squidfunk.github.io/mkdocs-material/) to design a webpage to your liking. MkDocs is a static webpage generator that is very easy to use, while MkDocs materials is an extension of the tool that gives you many more options to customize your website.
