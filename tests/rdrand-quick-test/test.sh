#!/usr/bin/env bash

# Amount of tests - will start on FROM threads
# and will go up to TO threads...
# From 1 to 16 should be enough for most of machines.

TEST_T_FROM=1 # optionaly set to number of cores on your cpu
TEST_T_TO=16 # optionaly set to double of cores on your cpu 

# other settings
TEST_DURATION=3
METHOD="rdrand_get_bytes_retry"
FILE=$(date +%F_%H-%M-%S)

function main() {
echo "Results will be saved into $FILE.csv and plotted in $FILE.png file."
testRdRand
}

# Do the test 
function testRdRand() {
pushd ./RdRand/tests
echo "threads RdRand-get_bytes">>"$FILE.csv"
for i in $(seq $TEST_T_TO); do 
	if [ $i -ge $TEST_T_FROM ]; then
		echo "Testing "$i" threads..."
		DATA=$(./RdRand \
			-m $METHOD \
			-r1 \
			-d$TEST_DURATION \
			-t $i 2>&1 \
      			| tail -n+2| cut -d " " -f2)
    		echo "$i $DATA">>"$FILE.csv"
		echo "$DATA"

	fi
done
mv "$FILE.csv" ../../ 
popd

gnuplot -e "filename='$FILE'" plot.gpl
}


main
