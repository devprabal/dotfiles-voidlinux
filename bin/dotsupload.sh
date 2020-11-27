#!/bin/bash

cwd=$(pwd)
cwd_allowed='/home/devpogi/dotfiles/bin' 

if [[ "$cwd" != ${cwd_allowed} ]]; then
	echo Run this script from ${cwd_allowed} dir only. # to safeguard against relative paths 
	exit 1
fi

for file in $(cat dots)
do
	dotdir=${file#\$HOME\/\.}
	dotdir=${dotdir%\/*}

	## idk why $HOME prefix in file is not getting expanded
	file=${file#\$HOME\/}
	file="$HOME/${file}"

	if [[ ${dotdir} =~ .*'/'.* ]]; then
		mkdir -p ../${dotdir}
		echo Copying ${file} to ../${dotdir}/
		if [[ -f ${file} ]]; then
			cp --no-dereference ${file} ../${dotdir}/
		else
			echo "$(tput rev) ${file} does not exist $(tput sgr0)"
		fi
	else
		echo Copying ${file} to dotfiles 
		if [[ -f ${file} ]]; then
			cp --no-dereference ${file} ..
		else
			echo "$(tput rev) ${file} does not exist $(tput sgr0)"
		fi

	fi
done

