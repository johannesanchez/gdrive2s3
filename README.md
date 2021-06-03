# Dockerized Application to backup folders from Google Drive to S3
* Based on https://rclone.org

************
gdrive2s3 is a docker-compose definition  which helps you to backup Files and Folder from Google Drive to AWS S3.
IMPORTANT NOTE::: # Current --> Google Drive to Local
************
https://github.com/johannesanchez/gdrive2s3.git
The following is just an example how you can configure it, make the changes based in your own parameters.

* Create the folder where the Google Drive Remote will be mounted.

$ mkdir -p data/mount


* Then you need to configure your remote.

$ docker-compose run rclone config

2021/06/01 21:06:14 NOTICE: Config file "/config/rclone/rclone.conf" not found - using defaults  
No remotes found - make a new one  
n) New remote  
s) Set configuration password  
q) Quit config  
n/s/q> n  
name> Gdrive   
Type of storage to configure.  
Enter a string value. Press Enter for the default ("").  
Choose a number from below, or type in your own value  
 1 / 1Fichier  
   \ "fichier"  
 2 / Alias for an existing remote  
   \ "alias"  
 3 / Amazon Drive  
   \ "amazon cloud drive"  
 4 / Amazon S3 Compliant Storage Providers including AWS, Alibaba, Ceph, Digital Ocean, Dreamhost, IBM COS, Minio, and Tencent COS  
   \ "s3"  
 5 / Backblaze B2  
   \ "b2"  
 6 / Box  
   \ "box"  
 7 / Cache a remote  
   \ "cache"  
 8 / Citrix Sharefile  
   \ "sharefile"  
 9 / Compress a remote  
   \ "compress"  
10 / Dropbox  
   \ "dropbox"  
11 / Encrypt/Decrypt a remote  
   \ "crypt"  
12 / Enterprise File Fabric  
   \ "filefabric"  
13 / FTP Connection  
   \ "ftp"  
14 / Google Cloud Storage (this is not Google Drive)  
   \ "google cloud storage"  
15 / Google Drive  
   \ "drive"  
16 / Google Photos  
   \ "google photos"  
17 / Hadoop distributed file system  
   \ "hdfs"  
18 / Hubic  
   \ "hubic"  
19 / In memory object storage system.  
   \ "memory"  
20 / Jottacloud  
   \ "jottacloud"  
21 / Koofr  
   \ "koofr"  
22 / Local Disk  
   \ "local"  
23 / Mail.ru Cloud  
   \ "mailru"  
24 / Mega  
   \ "mega"  
25 / Microsoft Azure Blob Storage  
   \ "azureblob"  
26 / Microsoft OneDrive  
   \ "onedrive"  
27 / OpenDrive  
   \ "opendrive"  
28 / OpenStack Swift (Rackspace Cloud Files, Memset Memstore, OVH)  
   \ "swift"  
29 / Pcloud  
   \ "pcloud"  
30 / Put.io  
   \ "putio"  
31 / QingCloud Object Storage  
   \ "qingstor"  
32 / SSH/SFTP Connection  
   \ "sftp"  
33 / Sugarsync  
   \ "sugarsync"  
34 / Tardigrade Decentralized Cloud Storage  
   \ "tardigrade"  
35 / Transparently chunk/split large files  
   \ "chunker"  
36 / Union merges the contents of several upstream fs  
   \ "union"  
37 / Webdav  
   \ "webdav"  
38 / Yandex Disk  
   \ "yandex"  
39 / Zoho  
   \ "zoho"  
40 / http Connection  
   \ "http"  
41 / premiumize.me  
   \ "premiumizeme"  
42 / seafile  
   \ "seafile"  
Storage> 15  
** See help for drive backend at: https://rclone.org/drive/ **

Google Application Client Id  
Setting your own is recommended.  
See https://rclone.org/drive/#making-your-own-client-id for how to create your own.  
If you leave this blank, it will use an internal key which is low performance.  
Enter a string value. Press Enter for the default ("").  
client_id>   
OAuth Client Secret  
Leave blank normally.  
Enter a string value. Press Enter for the default ("").  
client_secret>   
Scope that rclone should use when requesting access from drive.  
Enter a string value. Press Enter for the default ("").  
Choose a number from below, or type in your own value  
 1 / Full access all files, excluding Application Data Folder.  
   \ "drive"  
 2 / Read-only access to file metadata and file contents.  
   \ "drive.readonly"  
   / Access to files created by rclone only.  
 3 | These are visible in the drive website.  
   | File authorization is revoked when the user deauthorizes the app.  
   \ "drive.file"  
   / Allows read and write access to the Application Data folder.  
 4 | This is not visible in the drive website.  
   \ "drive.appfolder"  
   / Allows read-only access to file metadata but  
 5 | does not allow any access to read or download file content.  
   \ "drive.metadata.readonly"  
scope> 1  
ID of the root folder  
Leave blank normally.  

Fill in to access "Computers" folders (see docs), or for rclone to use  
a non root folder as its starting point.  

Enter a string value. Press Enter for the default ("").  
root_folder_id>   
Service Account Credentials JSON file path   
Leave blank normally.  
Needed only if you want use SA instead of interactive login.  

Leading `~` will be expanded in the file name as will environment variables such as `${RCLONE_CONFIG_DIR}`.  

Enter a string value. Press Enter for the default ("").  
service_account_file>   
Edit advanced config? (y/n)  
y) Yes  
n) No (default)  
y/n> n  
Remote config  
Use auto config?  
 * Say Y if not sure  
 * Say N if you are working on a remote or headless machine  
y) Yes (default)  
n) No  
y/n> n  
Please go to the following link: https://accounts.google.com/o/oauth2/auth?  ************************************************************************************************************************************************************  


Here you need to go to the browser and paste the previous Link, then you need to accept permision request. Copy and paste the code displayed in the next step.  

Log in and authorize rclone for access  
Enter verification code> ************************************
Configure this as a Shared Drive (Team Drive)?  
y) Yes  
n) No (default)  
y/n>   

--------------------

[Gdrive]  
type = drive  
scope = drive  
token =   {"access_token":"**************CODEHERE*********************"}

--------------------

y) Yes this is OK (default)  
e) Edit this remote  
d) Delete this remote  
y/e/d> y  
Current remotes:  

Name                 Type  
====                 ====  
Gdrive               drive  

e) Edit existing remote  
n) New remote  
d) Delete remote  
r) Rename remote  
c) Copy remote  
s) Set configuration password  
q) Quit config  
e/n/d/r/c/s/q> q  


<br>
Now you need to reference the remote to a local mount point.  

docker-compose up -d  


<br>

# Troubleshooting
The next commands can help you to troubleshoot or configure with docker commands

* to configure
```docker
docker run -it \
--name rclone  \
--rm --volume "$(pwd)"/rclone:/config/rclone  \
--volume "$(pwd)"/data:/data:shared  \
--user $(id -u):$(id -g) \
rclone/rclone:1.54 configure
```

* to list all objects in the path on remote:
```docker
docker run -it \
--name rclone  \
--rm --volume "$(pwd)"/rclone:/config/rclone  \
--volume "$(pwd)"/data:/data:shared  \
--user $(id -u):$(id -g) \
rclone/rclone:1.54 ls Gdrive:
```

* to list all directories/containers/buckets in the path
```docker
docker run -it \
--name rclone  \
--rm --volume "$(pwd)"/rclone:/config/rclone  \
--volume "$(pwd)"/data:/data:shared  \
--user $(id -u):$(id -g) \
rclone/rclone:1.54 lsd Gdrive:
```

* to list all remotes
```docker
docker run -it \
--name rclone  \
--rm --volume "$(pwd)"/rclone:/config/rclone  \
--volume "$(pwd)"/data:/data:shared  \
--user $(id -u):$(id -g) \
rclone/rclone:1.54 listremotes
```

* to mount a gdrive on folder
```docker
docker run -it \  
--name rclone \
--rm --volume ~/.config/rclone:/config/rclone \     
--volume ~/data:/data:shared  --volume /etc/passwd:/etc/passwd:ro --volume /etc/group:/etc/group:ro   \
--user $(id -u):$(id -g) \
--device /dev/fuse \
--cap-add SYS_ADMIN \
--security-opt apparmor:unconfined \
rclone/rclone:1.54   mount Gdrive: /data/mount &
```