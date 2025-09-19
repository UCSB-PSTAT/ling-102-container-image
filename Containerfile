FROM ucsb/jupyter-base:latest

MAINTAINER LSIT Systems <lsitops@lsit.ucsb.edu>

USER root

RUN conda install -y \
    beautifulsoup4 \
    ptable \
    pytest \
    morfessor \
    nbgrader \
    scikit-learn

# FIXME - Install unlreased deprecated dev version of karel-robot
RUN pip install -i https://test.pypi.org/simple/ karel-robot==0.0.2

USER $NB_USER
