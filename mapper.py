#!/usr/bin/python2.7
# mapper.py
import re
import sys
from collections import defaultdict

word_dict = defaultdict(int)
MAX_SIZE = 100


def map_function(title):
    temp = re.split(r'\W+', title)  # Split title to fields
    for word in temp:  # Split primary title by words
        result = ''.join([i for i in word if not i.isdigit()])
        if result != '':
            yield result.lower(), 1  # Use a word as a key


for line in sys.stdin:
    # Call the map_function for each line in the input
    for key, value in map_function(line):
        # Agregate value for a word locally
        word_dict[key] += value

        # To keep O(1) space, we bound the size of our memory footprint
        if len(word_dict) > MAX_SIZE:
            for key, value in word_dict.items():
                print(key + "|" + str(value))

            word_dict.clear()

# Emit leftover key-value pairs and use '|' as the delimiter
for key, value in word_dict.items():
    print(key + "|" + str(value))

#
# f = open("sample.txt", "r")
#
# words = f.read()
#
# w = open("prac.txt", "w+")
#
# for i in range(100):
#     w.write(words)
#     print(i)
#
# w.close()
# print("done!")
