FROM registry.cloud.college.ucsb.edu/ucsb/jupyter-base:latest

MAINTAINER LSIT Systems <lsitops@lsit.ucsb.edu>

USER root

RUN mamba install -y -c conda-forge\
    beautifulsoup4\
    jupyter-archive\
    jupyterlab-lsp\
    jupytext\
    ptable\
    pytest\
    morfessor\
    nbgrader\
    nltk\
    rich\
    scikit-learn &&\
    mamba run pip install python-lsp-server[pyflakes]


USER $NB_USER
