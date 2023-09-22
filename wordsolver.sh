#!/bin/sh
input="$1"
if [[ -n $2 ]]; then
	len=$2
	diff=$(($len-${#input}))
	for ((j=0;j<$diff;j++)); do
		input+="."
	done
else
	len=${#input}
fi
res=($(grep -w "${input:0:$len}" /usr/share/dict/words-insane))
arr=()
for i in "${res[@]}"; do
	[[ ! $i =~ "'" ]] &&	arr+=("$i")
done
printf "%s\n" "${arr[@]}" | sort -u
