FROM --platform=linux/arm64 rayproject/ray:2.24.0-aarch64

USER root

# Install Java 8, needed for spark to run
RUN sudo apt update
RUN sudo apt-get install -y software-properties-common
RUN sudo add-apt-repository -y ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y openjdk-8-jre
RUN update-alternatives --config java
RUN update-alternatives --config javac

# Install RayDP
RUN mkdir /raydp \
&& chown -R ray /raydp \
&& $HOME/anaconda3/bin/pip --no-cache-dir install raydp

# Add the Spark job script
COPY ray_script.py /app/ray_script.py

# Set the working directory
WORKDIR /app

