#!/bin/bash -x

first=999;
second=999;

for (( counter=0; counter<=10; counter++ ))
do
	randarr[$counter]=$(( RANDOM%900 + 100 ));
done

echo ${randarr[@]}

for (( i=0; i<10; i++ ))
do
	if [[ ${randarr[i]} -lt $first ]]
	then
		second=$first;
		first=${randarr[i]};
	fi

	if [[ ${randarr[i]} -lt $second && ${randarr[i]} != $first ]]
	then
		second=${randarr[i]};
	fi
done


largest=${randarr[0]}
secondGreatest='unset'

for((i=1; i < 10; i++))
do
  if [[ ${randarr[i]} > $largest ]]
  then
    secondGreatest=$largest
    largest=${randarr[i]}
  elif (( ${randarr[i]} != $largest )) && { [[ "$secondGreatest" = "unset" ]] || [[ ${randarr[i]} > $secondGreatest ]]; }
  then
    secondGreatest=${randarr[i]}
  fi
done

if [ $second -eq 999 ]
then
   echo "There is no second element";
else
   echo "Second smallest is ${second}"
fi

echo "Second Largest number is :${secondGreatest}"
