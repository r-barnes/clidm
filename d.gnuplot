#!/usr/bin/env python3

import sys
import tempfile
import subprocess
import os

data = sys.stdin.read()

fname = tempfile.mktemp()

with open(fname,'w') as fout:
  fout.write(data)

p = subprocess.Popen(["/usr/bin/gnuplot", "--persist"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, shell=False)

p.communicate("plot '{0}' {1}\n".format(fname,sys.argv[1]).encode())

os.remove(fname)