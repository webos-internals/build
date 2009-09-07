#!/usr/bin/python

import os
import sys
import time

(mode, ino, dev, nlink, uid, gid, size, atime, mtime, ctime) = os.stat(sys.argv[1])
sys.stdout.write("%d" % ctime);
