#!/bin/bash
        if [[ -n $3 ]]; then
			for i in $(grep $3 $2 | grep -o "#[0-9a-fA-F]\{6\}") ; do
				echo $i
				echo $1
				echo $2
				echo $3
				echo $(bash ./makehue $i $1)
                        	sed -i "/$3/s/#[0-9a-fA-F]\{6\}/$(bash ./makehue $i $1)/g" $2
                	done
        else
			for i in $(grep -o "#[0-9a-fA-F]\{6\}" $2); do
				echo $i
                	        echo $1
                        	echo $2
	                        echo $3
				echo $(bash ./makehue $i $1)
                	        sed -i "s/#[0-9a-fA-F]\{6\}/$(bash ./makehue $i $1)/g" $2
	                done
        fi
