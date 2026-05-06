#!/bin/bash

rm -rf python layer1.zip

mkdir -p python

pip install requests -t python/

zip -r layer1.zip python
