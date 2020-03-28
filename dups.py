#!/usr/bin/python2.7
# dups.py
import re
import sys
from collections import defaultdict

f = open("sample.txt", "r")

words = f.read()

w = open("largeprac.txt", "w+")

for i in range(10000):
    w.write(words)
    print(i)

w.close()
f.close()
print("done!")