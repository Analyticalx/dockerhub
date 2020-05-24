FROM ubuntu:18.04

# Update and install dependencies
RUN \
    apt-get update && \
    apt-get install -y \
    openjdk-8-jdk \
    python \
    python3 \
    python-pip \
    python3-pip \
    wget \
    vim 

# create spark dir
RUN wget http://mirror.nbtelecom.com.br/apache/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz
# COPY spark-2.4.5-bin-hadoop2.7.tgz spark-2.4.5-bin-hadoop2.7.tgz
RUN tar zxvf spark-2.4.5-bin-hadoop2.7.tgz
RUN mv spark-2.4.5-bin-hadoop2.7 /opt/spark

# add libs S3
RUN wget -O /opt/spark/jars/aws-java-sdk-1.11.30.jar \
    https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk/1.11.30/aws-java-sdk-1.11.30.jar
RUN wget -O /opt/spark/jars/hadoop-aws-2.7.3.jar \
    https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.7.3/hadoop-aws-2.7.3.jar
RUN wget -O /opt/spark/jars/jets3t-0.9.4.jar \
    https://repo1.maven.org/maven2/net/java/dev/jets3t/jets3t/0.9.4/jets3t-0.9.4.jar

# create zeppelin dir
RUN wget http://mirror.nbtelecom.com.br/apache/zeppelin/zeppelin-0.8.2/zeppelin-0.8.2-bin-all.tgz
# COPY zeppelin-0.8.2-bin-all.tgz zeppelin-0.8.2-bin-all.tgz
RUN tar zxvf zeppelin-0.8.2-bin-all.tgz
RUN mv zeppelin-0.8.2-bin-all /opt/zeppelin

# remove tars
RUN rm -f spark-2.4.5-bin-hadoop2.7.tgz
RUN rm -f zeppelin-0.8.2-bin-all.tgz

# copy variables
COPY zeppelin-env.sh /opt/zeppelin/conf/zeppelin-env.sh

# copy start zeppelin
COPY start.sh start.sh
RUN chmod +x /start.sh

WORKDIR /root

# copy files samples
COPY sample.txt /root/

EXPOSE 8080 

CMD /start.sh

