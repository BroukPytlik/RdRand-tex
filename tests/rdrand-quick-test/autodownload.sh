#!/usr/bin/env bash

# This script will download the package rdrand-quick-test.tar.gz, 
# decompress it and run it. For easier deploying.

wget http://www.stud.fit.vutbr.cz/~xtulak00/rdrand-quick-test.tar.gz
tar xf rdrand-quick-test.tar.gz
cd rdrand-quick-test 
./git.sh 
./test.sh 

