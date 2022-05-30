# image
FROM continuumio/miniconda3

# add environment-file
ADD ./environment.yaml ./environment.yaml

# create virtual environment from the environment.yaml
RUN conda env create -f environment.yaml
ENV PATH /opt/conda/envs/data-science-test/bin:$PATH

# activate environment
RUN /bin/bash -c "source activate data-science-test"

# launch jupyter notebook
CMD [ "jupyter notebook" ]