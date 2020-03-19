#!/usr/bin/python2.7
# dups.py
import re
import sys
from collections import defaultdict

f = open("sample.txt", "r")

words = f.read()

w = open("prac.txt", "w+")

for i in range(100):
    w.write(words)
    print(i)

w.close()
print("done!")