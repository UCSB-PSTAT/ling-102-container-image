FROM ucsb/scipy-base:latest

MAINTAINER LSIT Systems <lsitops@lsit.ucsb.edu>

USER root

RUN conda install -y \
    beautifulsoup4 \
    ptable \
    pytest \
    morfessor \
    nbgitpuller \
    scikit-learn

# FIXME - Install unlreased deprecated dev version of karel-robot
RUN pip install -i https://test.pypi.org/simple/ karel-robot==0.0.2

# Pinapple isn't in Conda. 
RUN pip install pynlpl gensim

USER $NB_USER
