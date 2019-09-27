FROM ubuntu:bionic
RUN apt-get update -q \
    && apt-get install -qy \
    # Used for TexLive install
    build-essential wget libfontconfig1 \
    # Used for latex linting
    chktex lacheck \
    # Used for "make" obivously
    make \
    # Both of these are used for tlmgr
    wget xzdec \
    && rm -rf /var/lib/apt/lists/*

# Install TexLive with scheme-basic
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
	mkdir /install-tl-unx && \
	tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1 && \
    echo "selected_scheme scheme-basic" >> /install-tl-unx/texlive.profile && \
	/install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile && \
    rm -r /install-tl-unx && \
	rm install-tl-unx.tar.gz
# Note: Why is this '2019'?  Do I have to literally modify this every year?  What is this path setup?
ENV PATH="/usr/local/texlive/2019/bin/x86_64-linux:${PATH}"
# These are the packages used by resume.tex
RUN tlmgr install latexmk preprint titlesec marvosym enumitem
WORKDIR /app
ENTRYPOINT ["make"]
