#!/usr/bin/env bash

# clone and compile
git clone https://github.com/BroukPytlik/RdRand.git
pushd RdRand/tests/ 
make
popd
