#!/usr/bin/env python

# Used: https://gist.github.com/nicodebo/297c1e134256ea24abf02a485ce41420

import json
import subprocess

cmd = ["ddcutil", "getvcp", "10"]
value = subprocess.run(cmd, stdout=subprocess.PIPE).stdout.decode('utf8')

percentage = value.split(":")[1].split(",")[0].split("=")[1].strip(" ")

data = {}

data['percentage'] = int(percentage)

print(json.dumps(data))

