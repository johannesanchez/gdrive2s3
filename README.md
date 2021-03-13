#Docker Container to backup folders from Google Drive to S3

INPUTS:
* email
* password


Outputs:
* Artifacts on S3 Bucket



# to list all objects in the path on remote:
docker run -it \
--name rclone  \
--rm --volume "$(pwd)"/rclone:/config/rclone  \
--volume "$(pwd)"/data:/data:shared  \
--user $(id -u):$(id -g) \
rclone/rclone:1.54 ls GoogleDrive:

# to list all directories/containers/buckets in the path
docker run -it \
--name rclone  \
--rm --volume "$(pwd)"/rclone:/config/rclone  \
--volume "$(pwd)"/data:/data:shared  \
--user $(id -u):$(id -g) \
rclone/rclone:1.54 lsd GoogleDrive:

# to list all remotes
docker run -it \
--name rclone  \
--rm --volume "$(pwd)"/rclone:/config/rclone  \
--volume "$(pwd)"/data:/data:shared  \
--user $(id -u):$(id -g) \
rclone/rclone:1.54 listremotes

# to mount a gdrive on folder
docker run --rm \
    --volume "$(pwd)"/rclone:/config/rclone \
    --volume "$(pwd)"/data:/data:shared \
    --user $(id -u):$(id -g) \
    --volume /etc/passwd:/etc/passwd:ro --volume /etc/group:/etc/group:ro \
    --device /dev/fuse --cap-add SYS_ADMIN --security-opt apparmor:unconfined \
    rclone/rclone:1.54 \
    mount GoogleDrive: /data/mount &

# to list all remotes
docker run -it \
--name rclone  \
--rm --volume "$(pwd)"/rclone:/config/rclone  \
--volume "$(pwd)"/data:/data:shared  \
--user $(id -u):$(id -g) \
rclone/rclone:1.54 copy GoogleDrive: "$(pwd)"/s3