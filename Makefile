# TARGET parameter is used if running the makefile inside a builder
TARGET ?= "build"

# Tag each build with the current HEAD sha
ifdef CIRCLECI_SHA1
GIT_COMMIT ?= $(CIRCLECI_SHA1)
else
GIT_COMMIT ?= $(shell git rev-parse --verify HEAD)
endif

# Build a PDF from the latex file
build: resume.tex
	pdflatex -halt-on-error -interaction=nonstopmode resume.tex

# Remove artifacts of the build process
clean:
	rm -f resume.aux resume.log resume.pdf texput.log

# Static check the latex file
lint:
	lacheck resume.tex

# Create the builder docker image
docker_build:
	echo $(GIT_COMMIT)
	docker build -t resume:$(GIT_COMMIT) .

# Run make inside the builder docker image with this repository cross-mounted.  Passes TARGET parameter to the make
docker_run: docker_build
	docker run -v `pwd`:/app resume:$(GIT_COMMIT) $(TARGET)
