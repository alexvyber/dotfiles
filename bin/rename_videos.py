#!/usr/bin/env python

from os import listdir
from natsort import natsorted
import os
import re

lesson_names = []
with open('content.txt') as my_file:
    for line in my_file:
        new_line = line.strip()
        lesson_names.append(new_line)

pattern = re.compile("mp4")

lessons = []
for file in listdir("./"):
    if file.endswith(".mp4"):
        lessons.append(file)

sorted_lessons = natsorted(lessons)

result_names = list(map( lambda x: str(lesson_names.index(x) + 1 ) + ". " + x , lesson_names))
# result_names = list(map( lambda x: x , lesson_names))

for i, lesson in enumerate(sorted_lessons):
    new_name = result_names[i] + ".mp4"
    print(new_name)
    os.rename(sorted_lessons[i], new_name)


