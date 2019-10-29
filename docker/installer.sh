#!bin/bash

curl http://mirrors.estointernet.in/apache/maven/maven-3/3.6.2/binaries/apache-maven-3.6.2-bin.tar.gz \
    --output  apache-maven-3.6.2-bin.tar.gz
tar zxvf apache-maven-3.6.2-bin.tar.gz

cd apache-maven-3.6.2
echo "export MAVEN_HOME=$PWD" >> ~/.bashrc 
echo "export PATH=/$PATH:$PWD/bin" >> ~/.bashrc 
export PATH=$PATH:$PWD/bin; 
export MAVEN_HOME=$PWD