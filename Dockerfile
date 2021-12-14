# Docker file for the f1 pit stop analysis project
# Flora Ouedraogo, December, 2021

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# install R packages
FROM r-base
COPY . /usr/local/src/myscripts
WORKDIR /usr/local/src/myscripts
CMD ["Rscript", "myscript.R"]

# R
#RUN conda install -c r ipython-notebook r-irkernel
RUN apt-get update && \
    apt-get install -y r-base && \
    conda install -c r r-irkernel r-essentials -c conda-forge && \
    rm -rf /var/lib/apt/lists/*

COPY packages.r /root/packages.r

RUN ln -s /bin/tar /bin/gtar && \
    Rscript /root/packages.r

WORKDIR /root/

EXPOSE 8888

CMD ["sh", "-c", "jupyter notebook --ip=0.0.0.0 --allow-root"]

# Miniconda
RUN echo 'export PATH=/opt/conda/bin:$PATH' >> /root/.bashrc && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    rm -rf /var/lib/apt/lists/*
ENV PATH /opt/conda/bin:$PATH

"

# install docopt python package
RUN conda install -y -c anaconda \ 
    docopt \
    requests
