FROM registry.cloud.college.ucsb.edu/ucsb/jupyter-base:latest

MAINTAINER LSIT Systems <lsitops@lsit.ucsb.edu>

USER root

COPY overrides.json /opt/conda/share/jupyter/lab/settings/overrides.json

RUN mamba install -y -c conda-forge\
    beautifulsoup4\
    jupyter-archive\
    jupyterlab-lsp\
    jupytext\
    ptable\
    pytest\
    pytest-timeout\
    morfessor\
    nbgrader\
    nltk\
    rich\
    scikit-learn &&\
    mamba run pip install python-lsp-server[pyflakes] &&\
    mkdir -p /opt/conda/etc/ipython && \
    printf "c.InteractiveShellApp.extensions = ['autoreload']\nc.InteractiveShellApp.exec_lines = ['%%autoreload 2']\n" > /opt/conda/etc/ipython/ipython_kernel_config.py &&\
    conda clean -afy &&\
    /usr/local/bin/fix-permissions "${CONDA_DIR}" || true

USER $NB_USER
