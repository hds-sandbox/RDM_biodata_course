# Versioning of data and code
This is a lesson versioning for data management. The lesson is divided into four episodes covering how to get started with version control using Git.

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
