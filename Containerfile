FROM registry.cloud.college.ucsb.edu/ucsb/jupyter-base:latest

MAINTAINER LSIT Systems <lsitops@lsit.ucsb.edu>

USER root

RUN conda install -y \
    beautifulsoup4 \
    ptable \
    pytest \
    morfessor \
    nbgrader \
    nltk \
    scikit-learn

USER $NB_USER
