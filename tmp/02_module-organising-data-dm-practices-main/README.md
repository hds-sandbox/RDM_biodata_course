# Data organisation practices
This is a lesson on data organisation practices for data management. The lesson is divided into five episodes covering:
* How to organise and store the data that will be produced or acquired during your project
* How to organise files and documentation to support your workflows
* How to structure your metadata, tabular data and information about experiments in spreadsheets

The instructional content is an adaptation of previous works as detailed in [LICENSE.md](LICENSE.md). 

# To build this lesson
## Install dependencies
```
conda env update -n name-of-your-env -f environment.yml
conda activate name-of-your-env
gem install bundler
bundle install
```

## Build lesson
```
conda activate name-of-your-env
bundle exec jekyll build
```

## Preview lesson locally
```
$ conda activate name-of-your-env
$ bundle exec jekyll serve
```
