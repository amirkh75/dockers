#! /bin/sh


docker run --pid host busybox:1.29 ps


#  if user name space is not enabled, then the container will not be able to access the host's PID namespace.