FROM ucsb/jupyter-base:latest

MAINTAINER LSIT Systems <lsitops@lsit.ucsb.edu>

USER root

RUN sudo apt update ; apt install -y cargo rustc; apt-get clean

RUN mamba install -c conda-forge -y ipympl mplcursors nltk nodejs pytest spacy tweepy xeus-python

RUN pip install arpa cython gensim ipdb jsonschema karel_robot linguistics mlconjug3 morfessor nlpcube praat-parselmouth PTable pytest-custom-report timeout-decorator

RUN python -m spacy download en && \
    python -m spacy download en_core_web_md

RUN jupyter labextension install jupyter-matplotlib@0.7.3 && \
    jupyter labextension update jupyterlab_bokeh && \
    jupyter lab build

USER $NB_USER
