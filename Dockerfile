FROM continuumio/miniconda3:latest

# update package installer
RUN apt-get update -y; apt-get upgrade -y

# copy environment-file to the root and create virtual environment
COPY environment.yml .

RUN conda env create --force -f environment.yml 

ENV CONDA_EXE /opt/conda/bin/conda
ENV CONDA_PREFIX /opt/conda/envs/data-science-test
ENV CONDA_PYTHON_EXE /opt/conda/bin/python
ENV CONDA_PROMPT_MODIFIER (data-science-test)
ENV CONDA_DEFAULT_ENV data-science-test
ENV PATH /opt/conda/envs/data-science-test/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN echo "conda activate data-science-test" >> ~/.bashrc
#SHELL ["/bin/bash", "--login", "-c"]

# \
# mkdir -p /opt/notebooks && \
# jupyter notebook \
# --notebook-dir=/opt/notebooks --ip='*' --port=8888 \
# --no-browser --allow-root