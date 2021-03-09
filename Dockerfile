FROM ubuntu:20.10

## Some utilities
# ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
# RUN apt-get clean
# && apt upgrade -y
# RUN apt-get install -y build-essential 
# libfuse-dev libcurl4-openssl-dev 
# libxml2-dev pkg-config libssl-dev mime-support automake libtool wget tar git unzip
# RUN apt-get install lsb-release -y  && apt-get install zip -y && apt-get install vim -y

# ## Install AWS CLI
# RUN apt-get update && \
#     apt-get install -y \
#         python3 \
#         python3-pip \
#         python3-setuptools \
#         groff \
#         less \
#     && pip3 install --upgrade pip \
#     && apt-get clean

# RUN pip3 --no-cache-dir install --upgrade awscli

# ## Install S3 Fuse
# RUN rm -rf /usr/src/s3fs-fuse
# RUN git clone https://github.com/s3fs-fuse/s3fs-fuse/ /usr/src/s3fs-fuse
# WORKDIR /usr/src/s3fs-fuse 
# RUN ./autogen.sh && ./configure && make && make install

# ## Create folder
# WORKDIR /var/www
# RUN mkdir s3

# ## Set Your AWS Access credentials
# ENV AWS_ACCESS_KEY=
# ENV AWS_SECRET_ACCESS_KEY=

# ## Set the directory where you want to mount your s3 bucket
# ENV S3_MOUNT_DIRECTORY=/var/www/s3

# ## Replace with your s3 bucket name
# ENV S3_BUCKET_NAME=

# ## S3fs-fuse credential config
# RUN echo $AWS_ACCESS_KEY:$AWS_SECRET_ACCESS_KEY > /root/.passwd-s3fs && \
#     chmod 600 /root/.passwd-s3fs

# ## change workdir to /
# WORKDIR /

# ## Entry Point
# ADD start-script.sh /start-script.sh
# RUN chmod 755 /start-script.sh 
# CMD ["/start-script.sh"]