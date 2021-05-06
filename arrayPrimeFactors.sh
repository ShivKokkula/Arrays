#!/bin/bash -x

echo "Enter value of N";
read N;

counter=0;

while [ $(( N%2 )) == 0 ]
do
	Factors[((counter++))]=2;
	N=$(( N/2 ));
done

for (( i=3; $((i*i))<=N; i=$((i+2)) ))
do

	while [ $(( N%i )) == 0 ]
	do
		Factors[((counter++))]=$i;
		N=$((N/i));
	done

done

if [ N>2 ]
then
	Factors[((counter++))]=$N;
fi

echo ${Factors[@]};
