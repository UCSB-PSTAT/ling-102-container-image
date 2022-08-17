FROM ucsb/jupyter-base:latest

MAINTAINER LSIT Systems <lsitops@lsit.ucsb.edu>

USER root

RUN sudo apt update ; apt-get clean #apt install -y cargo rustc; apt-get clean

#RUN mamba install -c conda-forge -y ipympl jupyter_bokeh mplcursors nltk nodejs pytest spacy tweepy

RUN pip install PTable pytest curses pandas requests beautifulsoup4 numpy gensim scikit-learn matplotlib nltk arpa morfessor

RUN python -m spacy download en && \
    python -m spacy download en_core_web_md

RUN jupyter labextension install jupyter-matplotlib@0.7.3 && \
    jupyter labextension update jupyterlab_bokeh && \
    jupyter lab build

USER $NB_USER
