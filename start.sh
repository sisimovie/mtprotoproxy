#!/bin/bash

python3 mtprotoproxy.py &
git clone -b stable https://github.com/alexbers/mtprotoproxy.git 
cd mtprotoproxy
