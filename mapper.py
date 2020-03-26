#!/usr/bin/python2.7
# mapper.py
import re
import sys


def map_function(title):
    temp = re.split(r'\W+', title)  # Split title to fields
    for word in temp:  # Split primary title by words
        result = ''.join([i for i in word if not i.isdigit()])
        if result != '':
            yield result.lower(), 1  # Use a word as a key


for line in sys.stdin:
    # Call the map_function for each line in the input
    for key, value in map_function(line):
        print(key + "|" + str(value))




