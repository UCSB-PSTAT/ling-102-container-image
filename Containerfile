FROM ucsb/jupyter-base:latest

MAINTAINER LSIT Systems <lsitops@lsit.ucsb.edu>

USER root

RUN sudo apt update ; apt install -y cargo rustc; apt-get clean

RUN mamba install -c conda-forge -y ipympl mplcursors nltk nodejs pytest spacy tweepy xeus-python

RUN pip install arpa git+https://github.com/UCSB-PSTAT/chronometry.git@63e7db207f132e12e4987b6de540202444376963 cython gensim ipdb jsonschema karel_robot linguistics mlconjug3 morfessor nlpcube praat-parselmouth PTable pytest-custom-report git+https://github.com/UCSB-PSTAT/slytherin.git@0f3821c956e3847bcbb2e1c943866ec12f2b859c timeout-decorator tokenizers==0.11.6

RUN python -m spacy download en && \
    python -m spacy download en_core_web_md

RUN jupyter labextension install jupyter-matplotlib@0.7.3 && \
    jupyter labextension update jupyterlab_bokeh && \
    jupyter lab build

USER $NB_USER
