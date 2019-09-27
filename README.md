# Latex Resume template
[![CircleCI](https://circleci.com/gh/cep21/resume_template.svg?style=svg)](https://circleci.com/gh/cep21/resume_template)

A complete example of using Github to store and generate your latex resume.  This is how I manage my resume and it has a lot of
advantages.

* Use Github to store your resume in the cloud
* Use latex to create the resume, giving your resume a pretty typography and easy tracking
* Manage changes to your resume with git so you can revert to older formats if you want
* Generate your resume using docker.  Latex can make it difficult to track which dependencies you
need to render your template.  Using docker codifies all the dependencies you need so you can regenerate it easily
* Use CircleCI to create the final PDF file.  As a build artifact, you can download it later.  Also, using CircleCI to
generate the resume means you get a consistent output.

[My resume](https://circleci.com/api/v1.1/project/github/cep21/resume_template/latest/artifacts/0/home/circleci/project/resume.pdf).
