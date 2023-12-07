#!/usr/bin/python3
import os
userlist=["alpha","beta","gamma"]
print("Adding users to system")
print("##################################")
for user in userlist:
    exitcode = os.system("id {}".format(user))
    if exitcode == 0:
        print(f"user {user} already exist!")
    else :
        print(f"user {user} is not exist!. adding it now")
        os.system(f"useradd {user}")
#creating a group if not exit
exitcode=os.system("grep science /etc/group")
if exitcode == 0:
    print("science group is already exist")
else:
    print("science group is not exist. creating it now")
    os.system("groupadd science")
for user in userlist:
    print(f"Adding user {user} to science group")
    os.system(f"usermod -G science {user}")
path='/opt/science_dir'
if os.path.isdir(path):
    print()
else: 
    os.mkdir(path)
print(f"the dir {path} is here, go and check it!")
os.system(f"chown :science {path}")
os.system(f"chmod 770 {path}")
