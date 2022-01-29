#!/bin/bash

clear
while [[ true ]]
do

	echo "+========================================================+"
	echo -e "|                   \033[32;1;82mGit Repo Utility\033[0m                     |"
	echo "+========================================================+"
	echo -e "| \033[36;1;82mOptions:\033[0m                                               |"
	echo "+--------------------------------------------------------+"
	echo -e "| \033[33;1;82m[1] Push changes    [2] Pull w\o affecting local files\033[0m |"
	echo -e "| \033[33;1;82m[3] Pull changes    [4] Remove all local changes\033[0m       |"
	echo -e "| \033[33;1;82m[5] Files status    [6] Show changes since last commit\033[0m |"
	echo -e "| \033[33;1;82m[7] Simple log      [8] Detailed log\033[0m                   |"
	echo -e "| \033[33;1;82m[9] Restore file    [10] Quit\033[0m                          |"
	echo "+--------------------------------------------------------+"
	echo -e "| \033[36;1;82mEnter Nubmer:\033[0m                                          |"
	echo "+========================================================+"
	echo -e "|                   \033[31;1;82mEnter [q] to Exit\033[0m                    |"
	echo "+========================================================+"
	echo -ne "\033[4A\r| \033[36;1;82mEnter Number:\033[0m "
	read input && echo -e "\n\n\n"

	for i in {1..16}
	do	
		echo -ne "\033[A\033[K\r"
	done

	if [[ $input == 1 ]]
	then
		git status -s -b -unormal
		#if ! (dpkg -s zenity >/dev/null 2>&1) && ! (rpm -q zenity >/dev/null 2>&1) && ! (yum list installed zenity >/dev/null 2>&1) && ! (dnf list installed zenity >/dev/null 2>&1) && ! (which zenity >/dev/null 2>&1) ;
		#then
		echo "----------------------------------------------"
		echo -n "Add [A]ll or [s]pecific file (A/s/[R]eturn): " 
		read fileOption

		if [[ $fileOption == 'A' || $fileOption == 'a' ]] && [[ $comment != 'R' && $comment != 'r' ]]
		then
			# adding files
			git add . >/dev/null 2>&1

		elif [[ $fileOption == 'S' || $fileOption == 's' ]] && [[ $comment != 'R' && $comment != 'r' ]]
		then
			echo -ne "\033[A\033[KEnter name of file: "
			read fileName
			
			if [ -f $fileName ]
			then
				#adding a file
				git add $fileName >/dev/null 2>&1

			else
				clear && echo -e "\033[30;41;2;82m--- Error, Wrong Entry ---\033[0m" && sleep 1.5 && clear

				git status -s -b -unormal
				echo "----------------------------------------------"
				echo -n "Enter name of file: "
				read fileName
			
				if [ -f $fileName ]
				then
					#adding a file
					git add $fileName >/dev/null 2>&1

				else
					clear && echo -e "\033[30;41;2;82m--- Error, Wrong Entry ---\033[0m" && sleep 1.5 && clear && continue
				fi
			fi

		else
			clear && continue
		fi

		echo -ne "\033[A\033[KEnter a comment to commit changes or [R]eturn: "
		read comment

		if [[ $comment != 'R' && $comment != 'r' ]]
		then

			#else
			#	comment='$(zenity --title="Git Repository" --entry --text="Enter a comment to commit changes:")'
			#fi

			# commiting changes
			git commit -m "$comment" >/dev/null 2>&1
			clear
			
			# pushing to repository
			if (git push)
			then
				git status -s -b -unormal && sleep 1.5 && clear
				echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
				sleep 1.5 && clear

			else
				echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
				sleep 1.5 && clear
			fi
		else
			clear && continue
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
		if (git log --color | less -R)
		then
			clear
		else
			echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
			sleep 1.5 && echo -ne "\033[A\033[2K\r"
		fi
	
	elif [[ $input == 8 ]]
	then
		if (git log -p --color | less -R)
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
		echo -e "\033[30;42;5;82m--- Good Bye ---\033[0m" && sleep 1.5 && clear && break

	else
		echo -e "\033[30;41;2;82m--- Error, Wrong Entry ---\033[0m"&& sleep 1 && echo -ne "\033[A\033[2K\r"	
	fi
done






