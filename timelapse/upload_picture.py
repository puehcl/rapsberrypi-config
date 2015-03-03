import sys
import os
import paramiko


def read_credentials(credentials_file):
    with open(credentials_file) as cf:
        host = cf.readline()[:-1] #cut away newline
        user = cf.readline()[:-1]
        password = cf.readline()[:-1]
        return host, user, password

def upload_pictures(local_folder, remote_folder, host, username, password):
    ssh = paramiko.SSHClient()
	ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect(host, 22, username=username, password=password)
    sftp = ssh.open_sftp()
    for file in os.listdir(local_folder):
        if file.endswith(".jpg"):
            full_name = os.path.join(local_folder, file)
            sftp.put(full_path, remote_folder)
            os.remove(full_name)


if __name__ == "__main__":
    local_folder = sys.argv[1]
    remote_folder = sys.argv[2]
    credentials_file = sys.argv[3]
    host, username, password = read_credentials(credentials_file)
    upload_pictures(local_folder, remote_folder, host, username, password)
