#! /bin/bash


# config docker remap from https://wiki.archlinux.org/title/docker

id dockremap

echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"

cat /etc/subuid

echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"

cat /etc/subgid

echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"

mkdir /tmp/shared
sudo chown -R 165536:65536 /tmp/shared

echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"


docker run -it --rm --user root -v /tmp/shared:/shared -v /:/host alpine ash

    # / # touch /host/afile
    # / # echo "hello $(id) in $(hostname)" >> /shared/afile
    # / # exit

echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"

sudo ls -la /tmp/shared/afile

echo -e "\e[1;33m\n------------------------------------------\n\e[1;m"

sudo cat /tmp/shared/afile



# output:

# uid=963(dockremap) gid=962(dockremap) groups=962(dockremap)

# ------------------------------------------

# dockremap:165536:65536

# ------------------------------------------

# dockremap:165536:65536

# ------------------------------------------


# ------------------------------------------

# / # touch /host/afile
# touch: /host/afile: Permission denied
# / # echo "hello $(id) in $(hostname)" >> /shared/afile
# / # exit

# ------------------------------------------

# -rw-r--r-- 1 165536 65536 456 Jun  1 11:42 /tmp/shared/afile

# ------------------------------------------

# hello uid=0(root) gid=0(root) groups=0(root),1(bin),2(daemon),3(sys),4(adm),6(disk),10(wheel),11(floppy),20(dialout),26(tape),27(video) in 35ec2172232a
