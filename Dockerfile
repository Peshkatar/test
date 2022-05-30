# image
FROM continuumio/miniconda3

# add environment-file
ADD ./environment.yaml ./environment.yaml

# create virtual environment from the environment.yaml
RUN conda env create -f environment.yaml

# activate environment
ENV PATH /opt/miniconda3/envs/data-science-test/bin:$PATH
RUN /bin/bash -c "source activate data-science-test"

# launch jupyter notebook
#CMD [ "jupyter notebook" ]