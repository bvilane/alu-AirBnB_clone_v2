#!/usr/bin/python3
<<<<<<< HEAD
# Fabric script that generates a .tgz archive from
# the contents of the web_static folder of your AirBnB Clone
# repo, using the function do_pack
"""Fabric file"""
from fabric.api import *
import datetime


def do_pack():
    """Do_pack function"""
    today = datetime.datetime.now()
    file_local = 'versions/web_static_{}{}{}{}{}{}.tgz'.format(today.year,
                                                               today.month,
                                                               today.day,
                                                               today.hour,
                                                               today.minute,
                                                               today.second)

    local('mkdir -p versions')
    check = local('tar -cvzf {} web_static'.format(file_local))
    if check.failed:
        return None
    else:
        return file_local
=======
""" Function that compress a folder """
from datetime import datetime
from fabric.api import local
import os


def do_pack():
    """The function that compress a folder before sending"""
    try:
        if not os.path.exists("versions"):
            local('mkdir versions')
        t = datetime.now()
        f = "%Y%m%d%H%M%S"
        archive_path = 'versions/web_static_{}.tgz'.format(t.strftime(f))
        local('tar -cvzf {} web_static'.format(archive_path))
        return archive_path
    except:
        return None
>>>>>>> 2ca41524e28f0bfa8bb00a60e6c5ef5b347fe8b6
