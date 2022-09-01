run("mkdir -p /usr/lib/motd")
run("cp /tmp/motd/main.py /usr/lib/motd/main.py")
if os.path.exists(file("/etc/motd")):
    pass
else:
    run("mkdir -p /etc/motd")

if os.path.exists(file("/etc/motd/motd")):
    pass
else:
    run("cp /tmp/motd/motd /etc/motd/motd")

if os.path.exists(file("/etc/motd/users")):
    pass
else:
    run("cp /tmp/motd/users /etc/motd/users")
