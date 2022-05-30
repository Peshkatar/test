# image
FROM continuumio/miniconda3

# add environment-file
ADD ./environment.yaml ./environment.yaml

# update conda
RUN conda update -y conda

# create virtual environment from the environment.yaml
RUN conda env create -f environment.yaml

# activate environment
# RUN conda activate data-science-test
# ENV PATH /opt/miniconda3/envs/data-science-test/bin:$PATH
ENV PATH /opt/conda/envs/data-science-test/bin:$PATH
RUN /bin/bash -c "source activate data-science-test"
# RUN /bin/bash -c "conda activate data-science-test"

# launch jupyter notebook
#CMD [ "jupyter notebook" ]