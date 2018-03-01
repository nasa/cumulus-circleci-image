FROM circleci/node:6.10 

# install FTP server
RUN sudo apt-get update && \
		sudo apt-get install -y --no-install-recommends vsftpd db-util && \
		sudo apt-get clean

# install HTTP server
RUN sudo apt-get install apache2

# isntall SFTP
RUN sudo apt-get -y install openssh-server && \
    sudo rm -rf /var/lib/apt/lists/* && \
    sudo mkdir -p /var/run/sshd && \
    sudo rm -f /etc/ssh/ssh_host_*key*

# configure FTP
RUN  sudo mkdir -p /etc/vsftpd
RUN  echo "testuser\ntestpass" | sudo tee --append /etc/vsftpd/virtual_users.txt
COPY ftp/vsftpd.conf /etc/vsftpd.conf
COPY ftp/vsftpd_virtual /etc/pam.d/

RUN sudo mkdir -p /var/run/vsftpd/empty

RUN sudo db_load -T -t hash -f /etc/vsftpd/virtual_users.txt /etc/vsftpd/virtual_users.db

RUN sudo mkdir -p /home/vsftpd
RUN sudo chown -R ftp:ftp /home/vsftpd
RUN sudo touch /home/vsftpd/alireza

# configure SFTP
COPY sftp/sshd_config /etc/ssh/sshd_config
COPY sftp/sftp.sh /usr/sbin/

# configure apache2 port
RUN sudo sed -i 's/Listen 80/Listen 3030/g' /etc/apache2/ports.conf