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
	if [[ ${dotdir} =~ .*'/'.* ]]; then
		mkdir -p ../${dotdir}
		echo Copying ${file} to ../${dotdir}/
		eval cp --no-dereference ${file} ../${dotdir}/
	else
		echo Copying ${file} to dotfiles 
		eval cp --no-dereference ${file} ..
	fi
done

