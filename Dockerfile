FROM rclone/rclone:1.54

# FROM ubuntu:latest

# RUN apt-get update && \
#     apt-get -y install --no-install-recommends \

# #install rclone
# RUN curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
# RUN unzip rclone-current-linux-amd64.zip
# RUN cd rclone-*-linux-amd64

# #copy binary file
# RUN sudo cp rclone /usr/bin/
# RUN sudo chown root:root /usr/bin/rclone
# RUN sudo chmod 755 /usr/bin/rclone



#mount s3 bucket as destination

#run rclone
# CMD [ "executable", "/usr" ]
# CMD [ "sh", "/bin/bash" ]