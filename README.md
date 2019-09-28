# Latex Resume template
[![CircleCI](https://circleci.com/gh/cep21/resume_template.svg?style=svg)](https://circleci.com/gh/cep21/resume_template)

A complete example of using Github to store and generate your latex resume.  This is how I manage my resume and it has a
lot of advantages.  All are also free, even for private use.  The core used components are latex, PDF, git, github,
docker and circleci.

# What you get

A version controlled resume that is both easy to track and modify over time, and easy to port to other systems.  You can
also optionally keep your resume private.

# Why use this template

* Private: You can keep your resume in the cloud but still private if you don't want to tell the world your
life story or your phone number.
* Latex: Creates pretty typography.  Consistent output format.  Focus on content over style.
* PDF: Universal document sharing format, generated with pdflatex
* git: Track changes to your resume over time and revert to previous versions
* Github: Free cloud storage of your resume and free private repository if you want to keep personal information less
public
* Docker: Latex can require complex dependencies or sub packages if you don't use it daily.  Docker codifies all these
so you can easily regenerate the resume from nothing.
* CircleCI: Generate your PDF in a clean environment and store it as a build artifact.

# Setting up CircleCI

You can sign up for [CircleCI](https://circleci.com) for free with your github account.  You also can host and build
your resume privately for free.

# Example output

You can find the resume output as a [build artifact of circleci](https://circleci.com/api/v1.1/project/github/cep21/resume_template/latest/artifacts/0/home/circleci/project/resume.pdf).

# How to generate the resume

The latex output will generate for you and be stored as a build artifact of circleci.  To generate
it locally, if you already have all the latex dependencies, you can just use make.

```
    make build
```

If you don't have latex installed exactly as required, then you can generate the resume with docker.  The first run will
take a long time to generate your Dockerfile, afterwards it will run very fast.

```
    make docker_run
```

# How to change the resume template

I like this template because it has little clutter.  There are lots of resume templates in latex if you don't like the
included one.

* https://www.overleaf.com/gallery/tagged/cv
* https://www.sharelatex.com/templates/cv-or-resume
* https://www.latextemplates.com/cat/curricula-vitae

If you use a new template, modify [Dockerfile](./Dockerfile) `tlmgr install` command to include any special packages
needed by your new template.

# Contributing to the template

Feel free to open a github PR or issue if you would like to contribute!

# License

MIT