FROM ucsb/jupyter-base:latest

MAINTAINER LSIT Systems <lsitops@lsit.ucsb.edu>

USER root

RUN pip install PTable pytest beautifulsoup4 gensim scikit-learn nltk arpa morfessor

# FIXME - Install unlreased deprecated dev version of karel-robot
RUN pip install -i https://test.pypi.org/simple/ karel-robot==0.0.2

USER $NB_USER
