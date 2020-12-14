#!/bin/bash

access_location="/home/devpogi/dotfiles/bin"
cwd=$(pwd)

if [[ $cwd != $access_location ]]; then
	echo Run this script from ${access_location} only.
	exit 1
fi

sed -i 's/$HOME/\/home\/devpogi/g' dots

for file in $(cat dots)
do
	bak_file=${file#\/home\/devpogi\/}
	bak_file=${bak_file#\.}
	bak_file=${bak_file#\/}
	
	if [[ -f ${file} ]]; then
		if [[ $bak_file =~ .*'/'.* ]]; then
			dotdir=${bak_file%\/*}
			mkdir -p ../$dotdir
			echo Copying $file to ../${dotdir}
                        cp --no-dereference ${file} ../${dotdir}/
                else
			echo Copying ${file} to dotfiles
                        cp --no-dereference ${file} ../
		fi
	else
			
		echo "$(tput rev) ${file} does not exist $(tput sgr0)"
	fi
done

sed -i 's/\/home\/devpogi/$HOME/g' dots
