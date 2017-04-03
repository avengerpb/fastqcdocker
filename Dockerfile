# Set the base image to Ubuntu
FROM ubuntu:14.04
RUN apt-get update


# Install OpenJDK 7 JRE
RUN apt-get update && apt-get install --yes \
    openjdk-7-jre \
    perl \
    unzip

RUN mkdir /tmp/fastqc
WORKDIR /tmp/fastqc

# Download FastQC
ADD http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip /tmp/fastqc
RUN unzip fastqc_v0.11.5.zip
RUN cp FastQC/fastqc /usr/bin/fastqc_unknown

COPY rgFastQC.py /usr/bin/rgFastQC.py
RUN chmod a+x /usr/bin/rgFastQC.py

RUN apt-get clean && rm -rf /tmp/fastqc && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

