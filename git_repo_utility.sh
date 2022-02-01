#!/bin/bash

clear
while [[ true ]]
do

	echo "+=========================================================+"
	echo -e "|                     \033[32;1;82mGit Repo Utility\033[0m                    |"
	echo "+=========================================================+"
	echo -e "| \033[36;1;82mOptions:\033[0m                                                |"
	echo "+---------------------------------------------------------+"
	echo -e "|  \033[33;1;82m[1] Push changes    [2] Pull w\o affecting local files\033[0m |"
	echo -e "|  \033[33;1;82m[3] Pull changes    [4] Remove all local changes\033[0m       |"
	echo -e "|  \033[33;1;82m[5] Files status    [6] Show changes since last commit\033[0m |"
	echo -e "|  \033[33;1;82m[7] Simple log      [8] Create new repository\033[0m          |"
	echo -e "|  \033[33;1;82m[9] Detailed log   [10] Delete repository\033[0m              |"
	echo -e "| \033[33;1;82m[11] Restore file\033[0m                                       |"
	echo "+---------------------------------------------------------+"
	echo -e "| \033[36;1;82mEnter Nubmer:\033[0m                                           |"
	echo "+=========================================================+"
	echo -e "|                    \033[31;1;82mEnter [q] to Exit\033[0m                    |"
	echo "+=========================================================+"
	echo -ne "\033[4A\r| \033[36;1;82mEnter Number:\033[0m "
	read input && clear #echo -e "\n\n\n"

	#for i in {1..17}
	#do	
		#echo -ne "\033[A\033[K\r"
	#done
	if [[ $input == 1 ]]
	then
		git status -s -b -unormal
		#if ! (dpkg -s zenity >/dev/null 2>&1) && ! (rpm -q zenity >/dev/null 2>&1) && ! (yum list installed zenity >/dev/null 2>&1) && ! (dnf list installed zenity >/dev/null 2>&1) && ! (which zenity >/dev/null 2>&1) ;
		#then
		echo "----------------------------------------------"
		echo -n "Add [A]ll or [s]pecific file (A/s/[R]eturn): " 
		read fileOption

		if [[ $fileOption == 'A' || $fileOption == 'a' ]] && [[ $comment != 'R' || $comment != 'r' ]]
		then
			# adding files
			git add . >/dev/null 2>&1

		elif [[ $fileOption == 'S' || $fileOption == 's' ]] && [[ $comment != 'R' || $comment != 'r' ]]
		then
			echo -ne "\033[A\033[KEnter name of file: "
			read fileName
			
			if [ -f $fileName ]
			then
				#adding a file
				git add $fileName >/dev/null 2>&1

			else
				clear && echo -e "\033[30;41;2;82m--- Error, Entry not recognized ---\033[0m" && sleep 1.5 && clear

				git status -s -b -unormal
				echo "----------------------------------------------"
				echo -n "Enter name of file: "
				read fileName
			
				if [ -f $fileName ]
				then
					#adding a file
					git add $fileName >/dev/null 2>&1

				else
					clear && echo -e "\033[30;41;2;82m--- Error, Entry not recognized ---\033[0m" && sleep 1.5 && clear && continue
				fi
			fi

		elif [[ $fileOption == 'R' || $fileOption == 'r' ]] && [[ $comment == 'R' || $comment == 'r' ]]
		then
			clear && continue		
		else
			clear && echo -e "\033[30;41;2;82m--- Error, Entry not recognized ---\033[0m" && sleep 1.5 && clear && continue		
		fi
		
		clear
		git status -s -b -unormal
		echo "----------------------------------------------"
		echo -n "Enter comment to commit changes | [R]eturn: "
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
				sleep 1 && clear

			else
				echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
				git restore --staged .
				sleep 1 && clear
			fi
		else
			if (git reset .) || (git restore --staged .) ;
			then
				clear
			else
				echo "\033[30;41;2;82m--- Error! ---\033[0m" && sleep 1 && clear		
			fi
			continue
		fi

	elif [[ $input == 2 ]]
	then
		while [[ true ]]
		do
			echo -ne "\033[33;1;82mPlease, wait...\033[0m\033[K\r"
			# git pull is basically git fetch && git merge
			#git stash apply // if git stash pop doesn't work, then git stash apply works the same way
			if (git stash >/dev/null 2>&1) && (git pull >/dev/null 2>&1) && (git stash pop >/dev/null 2>&1) && (git stash drop >/dev/null 2>&1) ;
			then
				clear
				git status -s -b -unormal && sleep 1.5 && clear
				echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
				sleep 1 && clear && break

			else
				clear && echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
				sleep 1 && clear && break
			fi
		done

	elif [[ $input == 3 ]]
	then
		while [[ true ]]
		do
			echo -ne "\033[33;1;82mPlease, wait...\033[0m\033[K\r"
			if (git pull --no-edit >/dev/null 2>&1)
			then
				clear
				git status -s -b -unormal && sleep 1.5 && clear
				echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
				sleep 1 && clear && break

			else
				clear && echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
				sleep 1 && clear && break
			fi
		done

	elif [[ $input == 4 ]]
	then
		while [[ true ]]
		do
			echo -ne "\033[33;1;82mPlease, wait...\033[0m\033[K\r"
			if (git fetch >/dev/null 2>&1) && (git reset --hard HEAD >/dev/null 2>&1) && (git merge >/dev/null 2>&1) ;
			then
				clear
				git status -s -b -unormal && sleep 1.5 && clear
				echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
				sleep 1 && clear && break

			else
				clear && echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
				sleep 1 && clear && break
			fi
		done

	elif [[ $input == 5 ]]
	then
		if (git status -s -b -unormal | less --quiet -R)
		then
			clear
		else
			echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
			sleep 1 && clear
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
			sleep 1 && clear
		fi

	elif [[ $input == 7 ]]
	then
		if (git log --color | less -R)
		then
			clear
		else
			echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
			sleep 1 && clear
		fi

	elif [[ $input == 8 ]]
	then
		# checking if hub is installed and installing it if not and making the repository
		if ! (dpkg -s hub >/dev/null 2>&1) && ! (rpm -q hub >/dev/null 2>&1) && ! (yum list installed hub >/dev/null 2>&1) && ! (dnf list installed hub >/dev/null 2>&1) && ! (which hub >/dev/null 2>&1) ;
		then
			echo -n "hub is not found! Do you want to install it? (Y/n): "
			read answer
			echo -ne "\033[A\033[2K\r"

			if [[ $answer == 'Y' || $answer == 'y' ]] 
			then
				if (sudo apt-get -y install hub >/dev/null 2>&1) ;
				then
					echo -e "\033[30;48;2;82mFinished Downloading Hub\033[0m"
					echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
					sleep 1.5 && clear
				# it works the same as the previous if condition just different format
				elif (yes | sudo pacman -S hub >/dev/null 2>&1) ;
				then
					echo -e "\033[30;48;2;82mFinished Downloading Hub\033[0m"
					echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
					sleep 1.5 && clear
				# it works the same as the "if ! dpkg" condition just different format 
				elif ! (sudo yum -y install hub >/dev/null 2>&1) ;
				then
					echo -e "\033[30;41;2;82mCouldn't install it, you need to install it manually\033[0m"
					echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
					sleep 2 && clear && continue			
				fi
			else
				echo -e "\033[30;41;2;82mhub is dependency for the program to work, Program Exit!\033[0m"
				echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
				sleep 2 && clear && continue
			fi
		fi		

			# Creating github repo
			# Enter the type of repository before building 
			echo -n "Create a [P]ublic or [PR]ivate repository? (P/pr/[R]eturn): "
			read repository

			if [[ $repository == 'R' || $repository == 'r' ]]
			then
				clear && continue

			elif [[ $repository == 'P' || $repository == 'p' || $repository == 'PR' || $repository == 'Pr' || $repository == 'pR' || $repository == 'pr' ]]
			then
				echo -ne "\033[A\033[2K\r"
			else
				clear && echo -e "\033[30;41;2;82m--- Error, Entry not recognized ---\033[0m" && sleep 1.5 && clear && continue
			fi

			# Enter the Directory where the folder and github repository will reside
			echo "+========================================================+"
			echo -e "|                   \033[32;1;82mGit Repo Utility\033[0m                     |"
			echo "+========================================================+"
			echo -e "| \033[36;1;82mDirectory list:\033[0m                                        |"
			echo "+--------------------------------------------------------+"
			cd && ls --color -d */
			echo "+--------------------------------------------------------+"
			echo -e "| \033[36;1;82mPress [Enter] to reside in current directory\033[0m \033[31;1;82mOR\033[0m        |"
			echo -e "| \033[36;1;82mEnter name where repo should reside: \033[0m                  |"
			echo "+========================================================+"
			echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
			echo "+========================================================+"
			echo -ne "\033[4A\r| \033[36;1;82mEnter name where repo should reside: \033[0m"
			read DIRECTORY
			clear

			#counter=5
			#while [ $counter -ge 0 ]
			#do
				#echo -ne "\033[A\033[2K\r"
				#((counter-=1))
			#done

			if [[ $DIRECTORY == 'R' || $DIRECTORY == 'r' ]]
			then
				clear && continue
			else
				cd && cd $DIRECTORY
			fi

			# Enter the name of the repository to name both the local folder and github repository
			echo -n "Enter name of repository: "
			read name
			echo -ne "\033[A\033[2K\r"

			# making the local folder
			if [ -d $name ]
			then 
				git init $name >/dev/null 2>&1 && cd $name

				if [ ! -f "README.md" ]
				then
					echo "#hi" >> README.md
				fi

				git add README.md >/dev/null 2>&1
				git commit -m "first commit" >/dev/null 2>&1
				git branch -M main >/dev/null 2>&1

			elif [ ! -d $name ]
			then
				mkdir $name && git init $name >/dev/null 2>&1
				cd $name

				if [ ! -f "README.md" ]
				then
					echo "#hi" >> README.md
				fi

				git add README.md >/dev/null 2>&1
				git commit -m "first commit" >/dev/null 2>&1
				git branch -M main >/dev/null 2>&1

			else
				echo -e "\033[30;41;2;82m--- Error, Entry not recognized! ---\033[0m"
				sleep 1.5 && clear && continue
			fi
			
			if [ $repository == 'P' ] || [ $repository == 'p' ]
			then
				# Checking if hub needs an access token to github account and making a file that stores the username,token, and protocol in ~/.config/ after following the mentioned steps 
				if ! (hub create 2>/dev/null) ;
				then
					echo -ne "\033[A\033[2K\r\033[A\033[2K\r"
					touch temp
					echo "---------------------------------------------------------------" >> temp
					echo "First time user, login to your github account and do the following:" >> temp
					echo "1) Under 'Settings' click on 'Developer settings'" >> temp
					echo "2) Under 'Developer settings' click on Personal access tokens" >> temp 
					echo "3) Under 'Personal access tokens' click on 'Generate new token'" >> temp
					echo "4) Click on 'Note' and enter 'hub for <your computer's name>'" >> temp
					echo "5) Click on 'repo', 'workflow', 'gist' , and 'delete_repo' checkbox" >> temp
					echo "6) Scroll down, click on 'Generate token' and copy the access token" >> temp
					echo "---------------------------------------------------------------" >> temp
					echo -ne "\nTo exit: click Crtl+x" >> temp
					nano temp
					rm temp
					echo -n "Do you want to enter generated token? (Y/n): "
					read choice
					echo -ne "\033[A\033[2K\r"

					if [[ $choice == 'Y' || $choice == 'y' ]]
					then
						echo -n "Enter your generated token: "
						read token
						echo -ne "\033[A\033[2K\r" && cd ~/.config/
						echo -n "Enter your github username: " && read username
						echo -ne "\033[A\033[2K\r"
						touch hub && echo "github.com:" >> hub && echo "- user: $username" >> hub && echo "  oauth_token: $token" >> hub && echo "  protocol: https" >> hub
						cd && cd $DIRECTORY/$name
						hub create >/dev/null 2>&1

					else
						cd .. && rm -rf $name
						sleep 1 && clear && continue
					fi
				else
					while [[ $(git push -u origin main >/dev/null 2>&1) ]]
					do
						echo -ne "Please, wait...\033[K\r"
					done
					sleep 1 && clear && echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
					sleep 1 && clear && continue
				fi

			elif [ $repository == 'Pr' ] || [ $repository == 'pr' ] || [ $repository == 'PR' ] || [ $repository == 'pR' ]
			then
				if ! (hub create -p 2>/dev/null) ;
				then
					echo -ne "\033[A\033[2K\r\033[A\033[2K\r"
					touch temp
					echo "---------------------------------------------------------------" >> temp
					echo "First time user, login to your github account and do the following:" >> temp
					echo "1) Under 'Settings' click on 'Developer settings'" >> temp
					echo "2) Under 'Developer settings' click on Personal access tokens" >> temp 
					echo "3) Under 'Personal access tokens' click on 'Generate new token'" >> temp
					echo "4) Click on 'Note' and enter 'hub for <your computer's name>'" >> temp
					echo "5) Click on 'repo', 'workflow', 'gist', and 'delete_repo' checkbox" >> temp
					echo "6) Scroll down, click on 'Generate token', and copy the access token" >> temp
					echo "---------------------------------------------------------------" >> temp
					echo -ne "\nTo exit: click Crtl+x" >> temp
					nano temp
					rm temp		
					echo -n "Do you want to enter generated token? (Y/n): "
					read choice
					echo -ne "\033[A\033[2K\r"

					if [[ $choice == 'Y' || $choice == 'y' ]]
					then
						echo -n "Enter your generated token: "
						read token
						echo -ne "\033[A\033[2K\r" && cd ~/.config/
						echo -n "Enter your github username: " && read username
						echo -ne "\033[A\033[2K\r"
						touch hub && echo "github.com:" >> hub && echo "- user: $username" >> hub && echo "  oauth_token: $token" >> hub && echo "  protocol: https" >> hub
						cd && cd $DIRECTORY/$name
						hub create -p >/dev/null 2>&1

					else
						cd .. && rm -rf $name
						sleep 1 && clear && continue
					fi
				else
					while [[ $(git push -u origin main >/dev/null 2>&1) ]]
					do
						echo -ne "Please, wait...\033[K\r"
					done
					sleep 1 && clear && echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
					sleep 1 && clear && continue
				fi

			else
				rm -rf $name
				echo -e "\033[30;41;2;82m--- Error, Entry not recognized! ---\033[0m"
				sleep 1.5 && clear && continue	
			fi

	elif [[ $input == 9 ]]
	then
		if (git log -p --color | less -R)
		then
			clear
		fi

	elif [[ $input == 10 ]]
	then

		echo "+========================================================+"
		echo -e "|                   \033[32;1;82mGit Repo Utility\033[0m                     |"
		echo "+========================================================+"
		echo -e "| \033[36;1;82mDirectory list:\033[0m                                        |"
		echo "+--------------------------------------------------------+"
		cd && ls --color -d */
		echo "+--------------------------------------------------------+"
		echo -e "| \033[36;1;82mPress [Enter] if repo resides in current directory\033[0m \033[31;1;82mOR\033[0m  |"
		echo -e "| \033[36;1;82mEnter name where repo resides: \033[0m                        |"
		echo "+========================================================+"
		echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
		echo "+========================================================+"
		echo -ne "\033[4A\r| \033[36;1;82mEnter name where repo resides: \033[0m"
		read DIRECTORY
		clear

		if [[ $DIRECTORY == 'R' || $DIRECTORY == 'r' ]]
		then
			clear && continue
		else

			# Enter the name of the repository to delete
			echo -n "Enter name of repository: "
			read RepoToDelete
			echo -ne "\033[A\033[2K\r"

			if ! (cd && cd $RepoToDelete >/dev/null 2>&1) && ! (cd && cd $DIRECTORY/$RepoToDelete) ;
			then
				echo -e "\033[30;41;2;82m--- Error, Repository Not Found! \033[0m"
				sleep 1.5 && clear && continue	
			else	
				if ! (hub delete $RepoToDelete 2>/dev/null)
				then
					echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
					sleep 1.5 && clear && continue	
				else
					clear && echo -n "Do you want to delete repository's local folder? (Y/n): "
					read optional
					echo -ne "\033[A\033[2K\r\033[A\033[2K\r"
					
					if [[ $optional == 'Y' || $optional == 'y' ]]	
					then
						if [ -d $RepoToDelete ]
						then
							rm -rf $RepoToDelete
						else
							rm -rf ~/$DIRECTORY/$RepoToDelete
						fi
					fi

					echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
					sleep 1 && clear && continue 		
				fi
			fi
		fi

	elif [[ $input == 11 ]]
	then
		echo "+========================================================+"
		echo -e "|                   \033[32;1;82mGit Repo Utility\033[0m                     |"
		echo "+========================================================+"
		echo -e "| \033[36;1;82mFiles list:\033[0m                                            |"
		echo "+--------------------------------------------------------+"
		ls --color -p | grep -v /
		echo "+--------------------------------------------------------+"
		echo -e "| \033[36;1;82mEnter file name:\033[0m                                       |"
		echo "+========================================================+"
		echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
		echo "+========================================================+"
		echo -ne "\033[4A\r| \033[36;1;82mEnter file name:\033[0m "
		read name and echo ""
		clear
		
		if [[ $name != 'R' && $name != 'r' ]]
		then
			if (git restore $name >/dev/null 2>&1)
			then
				echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
				sleep 1 && clear && continue
				break
			else
				echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
				sleep 1 && clear && continue
			fi
		else
			clear && continue
		fi

	elif [[ $input == 'Q' || $input == 'q' ]]
	then
		echo -e "\033[30;42;5;82m--- Good Bye ---\033[0m" && sleep 1.5 && clear && break
	else
		echo -e "\033[30;41;2;82m--- Error, Entry not recognized! ---\033[0m"&& sleep 1.5 && clear && continue	
	fi
done






