#Base Environment
FROM anapsix/alpine-java:8_jdk

#Declare variable
ENV package_name fastqc_v0.11.5.zip

ADD http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip /tmp/

RUN cd /opt/ && unzip /tmp/${package_name} \
    && rm /tmp/${package_name} \
    && apk update \
    && apk add perl \
    && chmod 750 /opt/FastQC/fastqc

ENTRYPOINT ["/opt/FastQC/fastqc"]