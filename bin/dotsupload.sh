#!/bin/bash

for file in $(cat dots)
do
	dotdir=${file#\$HOME\/\.}
	dotdir=${dotdir%\/*}
	if [[ ${dotdir} =~ .*'/'.* ]]; then
		mkdir -p ../${dotdir}
		echo "Copying ${file} to ../${dotdir}/"
		eval cp ${file} ../${dotdir}/
	else
		echo "Copying ${file} to dotfiles" 
		eval cp ${file} ..
	fi
done

