#!/bin/bash

function main {

			clear
			while [[ true ]]
			do
				# Interface 
				interface

				read input && clear

				#1 Commit only
				if [[ $input == 1 ]]
				then
					input_1

				#2 Undo last commit
				elif [[ $input == 2 ]]
				then
					input_2

				#3 Push only	
				elif [[ $input == 3 ]]
				then
					input_3

				#4 Undo last push
				elif [[ $input == 4 ]]
				then
					input_4

				#5 Pull changes	
				elif [[ $input == 5 ]]
				then
					input_5

				#6 Commit & push changes
				elif [[ $input == 6 ]]
				then
					input_6

				#7 Files Status
				elif [[ $input == 7 ]]
				then
					input_7

				#8 Pull w/o affecting local files
				elif [[ $input == 8 ]]
				then
					input_8

				#9 Simple log
				elif [[ $input == 9 ]]
				then
					input_9

				#10 Create new repository
				elif [[ $input == 10 ]]
				then
					input_10

				#11 Detailed log
				elif [[ $input == 11 ]]
				then
					input_11

				#12 Delete repository
				elif [[ $input == 12 ]]
				then
					input_12

				#13 Restore file
				elif [[ $input == 13 ]]
				then
					input_13

				#14 Remove all local changes
				elif [[ $input == 14 ]]
				then
					input_14

				#15 Repo status
				elif [[ $input == 15 ]]
				then
					input_15

				#16 Show changes since last commit
				elif [[ $input == 16 ]]
				then
					input_16

				# Quit
				elif [[ $input == 'Q' || $input == 'q' ]]
				then
					quit
					break

				# Error, Unrecognized entry
				else
					error
				fi

			done

}

function interface {

			echo "+=========================================================+"
			echo -e "|                     \033[32;1;82mGit Repo Utility\033[0m                    |"
			echo "+=========================================================+"
			echo -e "| \033[36;1;82mOptions:\033[0m                                                |"
			echo "+---------------------------------------------------------+"
			echo -e "|  \033[33;1;82m[1] Commit only    [2] Undo last commit\033[0m                |"
			echo -e "|  \033[33;1;82m[3] Push only      [4] Undo last push\033[0m                  |"
			echo -e "|  \033[33;1;82m[5] Pull changes   [6] Commit & push changes\033[0m           |"
			echo -e "|  \033[33;1;82m[7] Files status   [8] Pull w\o affecting local files\033[0m  |"
			echo -e "|  \033[33;1;82m[9] Simple log    [10] Create new repository\033[0m           |"
			echo -e "| \033[33;1;82m[11] Detailed log  [12] Delete repository\033[0m               |"
			echo -e "| \033[33;1;82m[13] Restore file  [14] Remove all local changes\033[0m        |"
			echo -e "| \033[33;1;82m[15] Repo status   [16] Show changes since last commit\033[0m  |"
			echo "+---------------------------------------------------------+"
			echo -e "| \033[36;1;82mEnter Nubmer:\033[0m                                           |"
			echo "+=========================================================+"
			echo -e "|                    \033[31;1;82mEnter [q] to Exit\033[0m                    |"
			echo "+=========================================================+"
			echo -ne "\033[4A\r| \033[36;1;82mEnter Number:\033[0m "

}

function input_1 {

			echo "+========================================================+"
			echo -e "|                     \033[32;1;82mGit Repo Utility\033[0m                   |"
			echo "+========================================================+"
			git status -s -b -unormal
			echo "+--------------------------------------------------------+"
			echo -e "| \033[36;1;82mAdd [A]ll or [s]pecific file (A/s): \033[0m                   |" 
			echo "+========================================================+"
			echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
			echo "+========================================================+"
			echo -ne "\033[4A\r| \033[36;1;82mAdd [A]ll or [s]pecific file (A/s): \033[0m"
			read fileOption
			clear

			if [[ $fileOption == 'A' || $fileOption == 'a' ]] && [[ $comment != 'R' || $comment != 'r' ]]
			then
				# adding files
				git add . >/dev/null 2>&1

			elif [[ $fileOption == 'S' || $fileOption == 's' ]] && [[ $comment != 'R' || $comment != 'r' ]]
			then
				echo "+========================================================+"
				echo -e "|                     \033[32;1;82mGit Repo Utility\033[0m                   |"
				echo "+========================================================+"
				echo -e "| \033[36;1;82mFiles list:\033[0m                                            |"
				echo "+--------------------------------------------------------+"
				git status -s -b -unormal
				echo "+========================================================+"
				echo -e "| \033[36;1;82mEnter name of file:\033[0m                                    |"
				echo "+========================================================+"
				echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
				echo "+========================================================+"
				echo -ne "\033[4A\r| \033[36;1;82mEnter name of file: \033[0m"
				read fileName
				
				if [ -f $fileName ]
				then
					#adding a file
					git add $fileName >/dev/null 2>&1

				elif [[ $fileName != 'R' && $fileName != 'r' ]]
				then
					clear && echo -e "\033[30;41;2;82m--- Error, Entry not recognized ---\033[0m" && sleep 1.5 && clear
				else
					clear && return
				fi
			
			elif [[ $fileOption != 'R' && $fileOption != 'r' ]]
			then
				clear && echo -e "\033[30;41;2;82m--- Error, Entry not recognized ---\033[0m" && sleep 1.5 && clear
			else
				clear && return	
			fi
			
			clear
			echo "+========================================================+"
			echo -e "|                     \033[32;1;82mGit Repo Utility\033[0m                   |"
			echo "+========================================================+"
			echo -e "| \033[36;1;82mFiles list:\033[0m                                            |"
			echo "+--------------------------------------------------------+"
			git status -s -b -unormal
			echo "+========================================================+"
			echo -e "| \033[36;1;82mEnter comment to commit changes:\033[0m                       |"
			echo "+========================================================+"
			echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
			echo "+========================================================+"
			echo -ne "\033[4A\r| \033[36;1;82mEnter comment to commit changes: \033[0m"
			read comment && clear

			if [[ $comment != 'R' && $comment != 'r' ]]
			then

				# commiting changes
				git commit -m "$comment" >/dev/null 2>&1
				clear
				git status -s -b -unormal && sleep 1.5 && clear
				echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
				sleep 1 && clear
				
			else
				if (git reset .) || (git restore --staged .) ;
				then
					clear
				else
					echo "\033[30;41;2;82m--- Error! ---\033[0m" && sleep 1 && clear		
				fi
			fi

}

function input_2 {

			git status -s -b -unormal && sleep 1.5
			if (git reset HEAD~1 --soft && git restore --staged . >/dev/null 2>&1) ;
			then
				clear
				git status -s -b -unormal && sleep 1.5
				clear && echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
			else
				echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
			fi
			sleep 1 && clear

}

function input_3 {

			while [[ true ]]
			do
				echo -ne "\033[33;1;82mPlease, wait...\033[0m\033[K\r"
				if [[ $(git push origin HEAD >/dev/null 2>&1) == "Everything up-to-date" ]]
				then
					git status -s -b -unormal && sleep 1.5 && clear
					echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
				elif [[ $(git push origin HEAD >/dev/null 2>&1) != "Everything up-to-date" ]]
				then
					clear
					echo -e "\033[33;1;82m--- Everything up to date ---\033[0m"
				else
					clear
					echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
					git restore --staged .
				fi
				sleep 1 && clear && break
			done		

}

function input_4 {
#if (git show HEAD > patch >/dev/null 2>&1) && (git revert HEAD --no-edit >/dev/null 2>&1) && (git apply patch >/dev/null 2>&1) ;

			echo "Being developed..." && sleep 1 && clear	
}

function input_5 {

			while [[ true ]]
			do
				echo -ne "\033[33;1;82mPlease, wait...\033[0m\033[K\r"
				if [[ $(git pull --no-edit 2>/dev/null) != "Already up to date." ]]
				then
					clear
					git status -s -b -unormal && sleep 1.5 && clear
					echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
				elif [[ $(git pull --no-edit 2>/dev/null) == "Already up to date." ]]
				then
					clear
					echo -e "\033[33;1;82m--- Already up to date. ---\033[0m"
				else
					clear && echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
				fi
				sleep 1.5 && clear && break
			done

}

function input_6 {

			echo "+========================================================+"
			echo -e "|                     \033[32;1;82mGit Repo Utility\033[0m                   |"
			echo "+========================================================+"
			echo -e "| \033[36;1;82mFiles list:\033[0m                                            |"
			echo "+--------------------------------------------------------+"
			git status -s -b -unormal
			echo "+--------------------------------------------------------+"
			echo -e "| \033[36;1;82mAdd [A]ll or [s]pecific file (A/s): \033[0m                   |" 
			echo "+========================================================+"
			echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
			echo "+========================================================+"
			echo -ne "\033[4A\r| \033[36;1;82mAdd [A]ll or [s]pecific file (A/s): \033[0m"
			read fileOption
			clear

			if [[ $fileOption == 'A' || $fileOption == 'a' ]] && [[ $comment != 'R' || $comment != 'r' ]]
			then
				# adding files
				git add . >/dev/null 2>&1

			elif [[ $fileOption == 'S' || $fileOption == 's' ]] && [[ $comment != 'R' || $comment != 'r' ]]
			then
				echo "+========================================================+"
				echo -e "|                     \033[32;1;82mGit Repo Utility\033[0m                   |"
				echo "+========================================================+"
				echo -e "| \033[36;1;82mFiles list:\033[0m                                            |"
				echo "+--------------------------------------------------------+"
				git status -s -b -unormal
				echo "+========================================================+"
				echo -e "| \033[36;1;82mEnter name of file:\033[0m                                    |"
				echo "+========================================================+"
				echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
				echo "+========================================================+"
				echo -ne "\033[4A\r| \033[36;1;82mEnter name of file: \033[0m"
				read fileName
				
				if [ -f $fileName ]
				then
					#adding a file
					git add $fileName >/dev/null 2>&1

				elif [[ $fileName != 'R' && $fileName != 'r' ]]
				then
					clear && echo -e "\033[30;41;2;82m--- Error, Entry not recognized ---\033[0m" && sleep 1.5 && clear && return
				else
					clear && return
				fi

			elif [[ $fileOption != 'R' && $fileOption != 'r' ]]
			then
				clear && echo -e "\033[30;41;2;82m--- Error, Entry not recognized ---\033[0m" && sleep 1.5 && clear	
			else
				clear && return	
			fi
			
			clear
			echo "+========================================================+"
			echo -e "|                     \033[32;1;82mGit Repo Utility\033[0m                   |"
			echo "+========================================================+"
			echo -e "| \033[36;1;82mFiles list:\033[0m                                            |"
			echo "+--------------------------------------------------------+"
			git status -s -b -unormal
			echo "+========================================================+"
			echo -e "| \033[36;1;82mEnter comment to commit:\033[0m                               |"
			echo "+========================================================+"
			echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
			echo "+========================================================+"
			echo -ne "\033[4A\r| \033[36;1;82mEnter comment to commit: \033[0m"
			read comment && clear

			if [[ $comment != 'R' && $comment != 'r' ]]
			then

				# commiting changes
				git commit -m "$comment" >/dev/null 2>&1


				# pushing to repository
				while [[ true ]]
				do
					echo -ne "\033[33;1;82mPlease, wait...\033[0m\033[K\r"
					if (git push origin HEAD 2>/dev/null)
					then
						git status -s -b -unormal && sleep 1.5 && clear
						echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
					else
						clear
						echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
						git reset HEAD~1 --soft && git restore --staged . >/dev/null 2>&1
					fi
					sleep 1 && clear && break
				done
			else
				if (git reset .) || (git restore --staged .) ;
				then
					clear
				else
					echo "\033[30;41;2;82m--- Error! ---\033[0m" && sleep 1 && clear		
				fi
			fi

}

function input_7 {

			if (git status -s -b -unormal | less --quiet -R)
			then
				clear
			else
				echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
				sleep 1 && clear
			fi

}

function input_8 {

			while [[ true ]]
			do
				echo -ne "\033[33;1;82mPlease, wait...\033[0m\033[K\r"

				# git pull is basically git fetch && git merge
				# git stash pop = git stash apply + git stash drop
				#git stash pop // if git stash pop doesn't work, then git stash apply + git stash drop work the same way
				if (git stash -u >/dev/null 2>&1) && (git pull >/dev/null 2>&1) && (git stash apply >/dev/null 2>&1) && (git stash drop >/dev/null 2>&1) ;
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

}

function input_9 {

			if (git log --oneline --color | less -R)
			then
				clear
			else
				echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
				sleep 1 && clear
			fi

}

function input_10 {

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
						sleep 2 && clear && return			
					fi
				else
					echo -e "\033[30;41;2;82mhub is dependency for the program to work, Program Exit!\033[0m"
					echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
					sleep 2 && clear && return
				fi
			fi		

				# Creating github repo
				# Enter the type of repository before building 
				echo -n "Create a [P]ublic or [PR]ivate repository? (P/pr/[R]eturn): "
				read repository

				if [[ $repository == 'P' || $repository == 'p' || $repository == 'PR' || $repository == 'Pr' || $repository == 'pR' || $repository == 'pr' ]]
				then
					echo -ne "\033[A\033[2K\r"
				elif [[ $repository != 'R' && $repository != 'r' ]]
				then
					clear && echo -e "\033[30;41;2;82m--- Error, Entry not recognized ---\033[0m" && sleep 1.5 && clear && return
				else
					clear && return
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

				if [[ $DIRECTORY != 'R' && $DIRECTORY != 'r' ]]
				then
					cd && cd $DIRECTORY
				else
					clear && return
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
					sleep 1.5 && clear && return
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
							sleep 1 && clear && return
						fi
					else
						while [[ $(git push -u origin main >/dev/null 2>&1) ]]
						do
							echo -ne "Please, wait...\033[K\r"
						done
						sleep 1 && clear && echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
						sleep 1 && clear && return
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
							sleep 1 && clear && return
						fi
					else
						while [[ $(git push -u origin main >/dev/null 2>&1) ]]
						do
							echo -ne "Please, wait...\033[K\r"
						done
						sleep 1 && clear && echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
						sleep 1 && clear && return
					fi

				else
					rm -rf $name
					echo -e "\033[30;41;2;82m--- Error, Entry not recognized! ---\033[0m"
					sleep 1.5 && clear && return	
				fi

}

function input_11 {

			if (git log -p --color | less -R)
			then
				clear
			fi

}

function input_12 {

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

			if [[ $DIRECTORY != 'R' && $DIRECTORY != 'r' ]]
			then

				# Enter the name of the repository to delete
				echo -n "Enter name of repository: "
				read RepoToDelete
				echo -ne "\033[A\033[2K\r"

				if ! (cd && cd $RepoToDelete >/dev/null 2>&1) && ! (cd && cd $DIRECTORY/$RepoToDelete >/dev/null 2>&1) ;
				then
					echo -e "\033[30;41;2;82m--- Error, Repository Not Found! \033[0m"
				else	
					if ! (hub delete $RepoToDelete 2>/dev/null)
					then
						clear
						echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
					else
						clear && echo -n "Do you want to delete repository's local folder? (Y/n): "
						read optional
						clear
						
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
					fi
				fi
				sleep 1.5 		
			fi
			clear && return
}

function input_13 {

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
			read name
			clear
			
			if [[ $name != 'R' && $name != 'r' ]]
			then
				if (git restore $name >/dev/null 2>&1)
				then
					echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
				else
					echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
				fi
				sleep 1 && clear
			else
				clear && return
			fi

}

function input_14 {		
	
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

}

function input_15 {

			if [[ $(git diff) == '' ]] ;
			then
				echo -e "\033[30;48;5;82m--- Repo is up to date ---\033[0m"
			else
				echo -e "\033[30;41;5;82m--- Repo is not up to date ---\033[0m"
			fi
			sleep 1.5 && clear

}

function input_16 {

			if ! (git diff --color | less -R) ;
			then
				echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
			fi

}

function quit {

			echo -e "\033[30;42;5;82m--- Good Bye ---\033[0m" && sleep 1.5 && clear

}

function error {

			echo -e "\033[30;41;2;82m--- Error, Entry not recognized! ---\033[0m"&& sleep 1.5 && clear
			return

}

main



