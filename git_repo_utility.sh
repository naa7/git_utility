#!/bin/bash

while [[ true ]]
do

	echo "========================================================="
	echo "                     Git Repo Utility                       "
	echo "========================================================="
	echo  "Options:"
	echo "---------------------------------------------------------"
	echo -e "[1] Push changes    [2] Pull w\o affecting local files"
	echo -e "[3] Pull changes    [4] Remove all local changes"
	echo -e "[5] Files status    [6] Show changes since last commit"
	echo -e "[7] Simple log	    [8] Detailed log"
	echo -e "[9] Restore file    [10] Quit"
	echo "---------------------------------------------------------"
	echo "Enter Option Nubmer: "
	echo "========================================================="
	echo -ne "\033[2A\033[K\rEnter Option Number: "
	read input && echo ""

	for i in {1..13}
	do	
		echo -ne "\033[A\033[K\r"
	done

	if [[ $input == 1 ]]
	then
		git status -s -b -unormal
		#if ! (dpkg -s zenity >/dev/null 2>&1) && ! (rpm -q zenity >/dev/null 2>&1) && ! (yum list installed zenity >/dev/null 2>&1) && ! (dnf list installed zenity >/dev/null 2>&1) && ! (which zenity >/dev/null 2>&1) ;
		#then
		echo "----------------------------------------------"
		echo -n "Enter a comment to commit changes or [R]eturn: "
		read comment
		clear

		if [[ $comment != 'R' && $comment != 'r' ]]
		then

			#else
			#	comment='$(zenity --title="Git Repository" --entry --text="Enter a comment to commit changes:")'
			#fi

			# adding files
			git add . >/dev/null 2>&1

			# commiting changes
			git commit -m "$comment" >/dev/null 2>&1

			# pushing to repository
			if (git push >/dev/null 2>&1) ;
			then
				git status -s -b -unormal && sleep 1.5 && echo -ne "\033[A\033[2K\r"
				echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
				sleep 1.5 && echo -ne "\033[A\033[2K\r"

			else
				echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
				sleep 1.5 && echo -ne "\033[A\033[2K\r"
			fi
		else
			continue
		fi

	elif [[ $input == 2 ]]
	then
		# git pull is basically git fetch && git merge
		#git stash apply // if git stash pop doesn't work, then git stash apply works the same way
		if (git stash >/dev/null 2>&1) && (git pull >/dev/null 2>&1) && (git stash pop >/dev/null 2>&1) && (git stash drop >/dev/null 2>&1)
		then
			git status -s -b -unormal && sleep 1.5 && echo -ne "\033[A\033[2K\r"
			echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
			sleep 1.5 && echo -ne "\033[A\033[2K\r"

		else
			echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
			sleep 1.5 && echo -ne "\033[A\033[2K\r"
		fi

	elif [[ $input == 3 ]]
	then
		if (git pull --no-edit >/dev/null 2>&1)
		then
			git status -s -b -unormal && sleep 1.5 && echo -ne "\033[A\033[2K\r"
			echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
			sleep 1.5 && echo -ne "\033[A\033[2K\r"

		else
			echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
			sleep 1.5 && echo -ne "\033[A\033[2K\r"
		fi

	elif [[ $input == 4 ]]
	then
		if (git fetch >/dev/null 2>&1) && (git reset --hard HEAD >/dev/null 2>&1) && (git merge >/dev/null 2>&1)
		then
			git status -s -b -unormal && sleep 1.5 && echo -ne "\033[A\033[2K\r"
			echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
			sleep 1.5 && echo -ne "\033[A\033[2K\r"
			break

		else
			echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
			sleep 1.5 && echo -ne "\033[A\033[2K\r"
		fi

	elif [[ $input == 5 ]]
	then
		if (git status -s -b -unormal | less --quiet -R)
		then
			clear
		else
			echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
			sleep 1.5 && echo -ne "\033[A\033[2K\r"
		fi

	elif [[ $input == 6 ]]
	then
		if (git diff --color | less -R)
		then

			if (git diff == "")
			then
				echo "--- Repo is up to date ---" && sleep 1.5
			fi
			clear

		else
			echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
			sleep 1.5 && echo -ne "\033[A\033[2K\r"
		fi

	elif [[ $input == 7 ]]
	then
		if (git log)
		then
			clear
		else
			echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
			sleep 1.5 && echo -ne "\033[A\033[2K\r"
		fi
	
	elif [[ $input == 8 ]]
	then
		if (git log -p)
		then
			clear
		fi


	elif [[ $input == 9 ]]
	then
		echo "========================================================="
		echo "                       Files List                       "
		echo "========================================================="
		ls --color -p | grep -v /
		echo "========================================================="
		echo "Enter name of file to restore or [R]eturn: "
		echo "========================================================="
		echo -ne "\033[2A\033[K\rEnter name of file to restore or [R]eturn: "
		read name and echo ""
		clear
		
		if [[ $name != 'R' && $name != 'r' ]]
		then
			if (git restore $name >/dev/null 2>&1)
			then
				echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
				sleep 1.5 && echo -ne "\033[A\033[2K\r"
				break
			else
				echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
				sleep 1.5 && echo -ne "\033[A\033[2K\r"
			fi
		else
			continue
		fi

	elif [[ $input == 10 || $input == 'Q' || $input == 'q' ]]
	then
		echo -e "\033[30;48;5;82m--- Program Exit ---\033[0m" && sleep 1.5 && echo -ne "\033[A\033[2K\r" && break

	else
		echo -e "\033[30;41;2;82m--- Error, Wrong Entry ---\033[0m"&& sleep 1.5 && echo -ne "\033[A\033[2K\r"	
	fi
done






