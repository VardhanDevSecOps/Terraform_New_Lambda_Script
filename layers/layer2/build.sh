#!/bin/bash

rm -rf python layer2.zip

mkdir -p python

pip install numpy -t python/

zip -r layer2.zip python
