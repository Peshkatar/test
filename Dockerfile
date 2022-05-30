FROM continuumio/miniconda3

# copy environment-file
COPY . .

# # update conda
RUN conda update -y conda

# create virtual environment from the environment.yml
RUN conda env create -f environment.yml

# activate environment
# ENV PATH /opt/conda/envs/data-science-test/bin:$PATH
ENV PATH /opt/miniconda3/envs/data-science-test/bin:$PATH
RUN /bin/bash -c "source activate data-science-test"

