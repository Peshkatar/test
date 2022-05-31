FROM continuumio/miniconda3

# update package installer
RUN apt-get update -y; apt-get upgrade -y

# copy environment-file
COPY environment.yml .

# # update conda
RUN conda update -y conda

# create virtual environment from the environment.yml
RUN conda env create --force -f environment.yml

WORKDIR /home

# activate environment
ENTRYPOINT [ "conda", "run", "-n", "data-science-test", "jupyter", "notebook", "--ip=0.0.0.0", "--port=8080", "--allow-root", "--NotebookApp.token=''", "NotebookApp.password=''" ]

