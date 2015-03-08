import sys
import paramiko

import fileutil

if __name__ == "__main__":
    conf = Configuration(sys.argv[1])
    cred = get_credentials(credentials_file)
    sftp = get_connection(cred)
    if not check_for_shutdown(sftp):
        check_for_reboot(sftp)
