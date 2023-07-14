#!/bin/bash

function main {
    while true; 
	do
        # Display interface
        interface
        
        # Get user input
        read input && clear
        
        # Process user input
        case $input in
            1)
                input_1
                ;;
            2)
                input_2
                ;;
            3)
                input_3
                ;;
            4)
                input_4
                ;;
            5)
                input_5
                ;;
            6)
                input_6
                ;;
            7)
                input_7
                ;;
            8)
                input_8
                ;;
            9)
                input_9
                ;;
            10)
                input_10
                ;;
            11)
                input_11
                ;;
            12)
                input_12
                ;;
            13)
                input_13
                ;;
            14)
                input_14
                ;;
            15)
                input_15
                ;;
            16)
                input_16
                ;;
            17)
                input_17
                ;;
            18)
                input_18
                ;;
            19)
                input_19
                ;;
            20)
                input_20
                ;;
            21)
                input_21
                ;;
            [qQ])
                quit
                break
                ;;
            *)
                error
                ;;
        esac
    done
}

function interface {
    
    echo "+=========================================================+"
    echo -e "|                     \033[32;1;82mGit Utility\033[0m                         |"
    echo "+=========================================================+"
    echo -e "| \033[36;1;82mOptions:\033[0m                                                |"
    echo "+---------------------------------------------------------+"
    echo -e "| \033[33;1;82m[ 1] Commit only   [ 2] Reset to previous commit\033[0m        |"
    echo -e "| \033[33;1;82m[ 3] Push only     [ 4] Undo last push\033[0m                  |"
    echo -e "| \033[33;1;82m[ 5] Files status  [ 6] Commit & push changes\033[0m           |"
    echo -e "| \033[33;1;82m[ 7] Pull changes  [ 8] Pull w\o affecting local files\033[0m  |"
    echo -e "| \033[33;1;82m[ 9] Simple log    [10] Create new repository\033[0m           |"
    echo -e "| \033[33;1;82m[11] Detailed log  [12] Delete repository\033[0m               |"
    echo -e "| \033[33;1;82m[13] Restore file  [14] Remove all local changes\033[0m        |"
    echo -e "| \033[33;1;82m[15] Remote status [16] Show changes since last commit\033[0m  |"
    echo -e "| \033[33;1;82m[17] Local status  [18] Remove a file/folder from remote\033[0m|"
    echo -e "| \033[33;1;82m[19] Merge branch  [20] Delete local & remote branch\033[0m    |"
    echo -e "| \033[33;1;82m[21] Create branch\033[0m                                      |"
    echo "+---------------------------------------------------------+"
    echo -e "| \033[36;1;82mEnter Choice Nubmer:\033[0m                                    |"
    echo "+=========================================================+"
    echo -e "|                    \033[31;1;82mEnter [q] to Exit\033[0m                    |"
    echo "+=========================================================+"
    echo -ne "\033[4A\r| \033[36;1;82mEnter Choice Number:\033[0m "
    
}

function interface_child_1 {
    
    echo "+========================================================+"
    echo -e "|                     \033[32;1;82mGit Utility\033[0m                        |"
    echo "+========================================================+"
    echo -e "| \033[36;1;82mFiles list:\033[0m                                            |"
    echo "+--------------------------------------------------------+"
    git status -s -b -unormal
    echo "+--------------------------------------------------------+"
    
}

function interface_child_2 {
    
    echo "+========================================================+"
    echo -e "|                   \033[32;1;82mGit Utility\033[0m                          |"
    echo "+========================================================+"
    echo -e "| \033[36;1;82mDirectory list:\033[0m                                        |"
    echo "+--------------------------------------------------------+"
    cd && ls --color -d -1a */
    echo "+--------------------------------------------------------+"
    
}

function interface_option_20 {
    echo "+=========================================================+"
    echo -e "|            \033[32;1;82mDelete Local & Remote Branch\033[0m                |"
    echo "+=========================================================+"
    echo -e "| \033[36;1;82mAvailable Branches:\033[0m                                     |"
    echo "+---------------------------------------------------------+"

    # List branch names
    git branch --list --format='| %-30(branchname:short) |' --color=always

    echo "+---------------------------------------------------------+"
    echo -e "| \033[36;1;82mEnter branch name to delete:\033[0m                             |"
    echo "+=========================================================+"
    echo -e "|                    \033[31;1;82mEnter [r] to Return\033[0m                  |"
    echo "+=========================================================+"
    echo -ne "\033[7A\r| \033[36;1;82mEnter branch name to delete: \033[0m"
}

function input_1 {
    
    while [[ true ]]
    do
        interface_child_1
        echo -e "| \033[36;1;82mAdd [A]ll or [s]pecific file (A/s): \033[0m                   |"
        echo "+========================================================+"
        echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
        echo "+========================================================+"
        echo -ne "\033[4A\r| \033[36;1;82mAdd [A]ll or [s]pecific file (A/s): \033[0m"
        read -r fileOption
        clear
        
        if [[ $fileOption == 'A' || $fileOption == 'a' ]] && [[ $comment != 'R' && $comment != 'r' ]]
        then
            # adding files
            git add . >/dev/null 2>&1
            
        elif [[ $fileOption == 'S' || $fileOption == 's' ]] && [[ $comment != 'R' && $comment != 'r' ]]
        then
            interface_child_1
            echo -e "| \033[36;1;82mEnter name of file:\033[0m                                    |"
            echo "+========================================================+"
            echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
            echo "+========================================================+"
            echo -ne "\033[4A\r| \033[36;1;82mEnter name of file: \033[0m"
            read -ei "" -p "| " -r fileName

			if [ -z "$fileName" ]
			then
				clear && echo -e "\033[30;41;2;82m--- Error, File name cannot be empty ---\033[0m" && sleep 1.5 && clear
				return
            elif [ -f $fileName ] || [ -d $fileName ]
            then
                #adding a file
                git add $fileName >/dev/null 2>&1
                
            elif [[ $fileName != 'R' && $fileName != 'r' ]]
            then
                clear && echo -e "\033[30;41;2;82m--- Error, Entry not recognized ---\033[0m" && sleep 1.5 && clear && continue
            else
                clear && continue
            fi
            
        elif [[ $fileOption != 'R' && $fileOption != 'r' ]]
        then
            clear && echo -e "\033[30;41;2;82m--- Error, Entry not recognized ---\033[0m" && sleep 1.5 && clear && continue
        else
            clear && break
        fi
        
        clear
        interface_child_1
        echo -e "| \033[36;1;82mEnter comment to commit changes:\033[0m                       |"
        echo -e "|                                                        |"
        echo "+========================================================+"
        echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
        echo "+========================================================+"
        echo -ne "\033[5A\r| \033[36;1;82mEnter comment to commit changes: \033[0m"
        read -r comment && clear

		if [ -z "$comment" ]
		then
			if git reset . || git restore --staged .
			then
				clear && echo -e "\033[30;41;2;82m--- Error, Commit message cannot be empty ---\033[0m" && sleep 1.5 && clear
				return
			fi
        elif [[ $comment != 'R' && $comment != 'r' ]]
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
                clear && continue
            else
                echo "\033[30;41;2;82m--- Error! ---\033[0m" && sleep 1 && clear && break
            fi
        fi
    done
    
}

function input_2 {
    echo "+=========================================================+"
	echo -e "|                  \033[32;1;82mReset to Previous Commit\033[0m               |"
    echo "+=========================================================+"
    echo -e "| \033[36;1;82mLast 10 Commits:\033[0m                                        |"
    echo "+---------------------------------------------------------+"
	echo -e "|  \033[36;1;82mHash\033[0m   |  \033[36;1;82mMessage\033[0m                                      |"
	echo "+---------------------------------------------------------+"
    git log --pretty=format:"| %h | %s" -10
    echo "+---------------------------------------------------------+"
    echo -e "| \033[36;1;82mEnter the commit hash to reset to:\033[0m                      |"
    echo "+=========================================================+"
    echo -e "|                    \033[31;1;82mEnter [r] to Return\033[0m                  |"
    echo "+=========================================================+"
    echo -ne "\033[4A\r| \033[36;1;82mEnter the commit hash to reset to: \033[0m"
    
    read -r commitHash
    
    if [[ $commitHash != 'R' && $commitHash != 'r' ]]; then
        if git reset --hard "$commitHash" >/dev/null 2>&1; then
            clear && echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
        else
            clear && echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
        fi
	else
		clear && return
    fi
    
    sleep 1 && clear
}

function input_3 {
    
    while [[ true ]]
    do
        echo -ne "\033[33;1;82mPlease, wait...\033[0m\033[K\r"
        if [[ $(git push origin HEAD >/dev/null 2>&1) != "Everything up-to-date" ]]
        then
            git status -s -b -unormal && sleep 1.5 && clear
            echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
        elif [[ $(git push origin HEAD >/dev/null 2>&1) == "Everything up-to-date" ]]
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
    git status -s -b -unormal && sleep 1
    # git revert HEAD --no-edit && git push origin HEAD // create a "revert" commit
    if (git reset HEAD~1 >/dev/null 2>&1) && (git push -f origin HEAD >/dev/null 2>&1) ;
    then
        clear
        git status -s -b -unormal && sleep 1.5
        clear && echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
    else
        clear
        echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
    fi
    sleep 1 && clear
}

function input_5 {
    
    #if (git status -s -b -unormal | less --quiet -R)
    if (git -c color.status=always status -sb -unormal | less --quiet -Rc)
    then
        clear
    else
        echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
        sleep 1 && clear
    fi
    
}

function input_6 {
    interface_child_1
    echo -e "| \033[36;1;82mAdd [A]ll or [s]pecific file (A/s): \033[0m                   |"
    echo "+========================================================+"
    echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
    echo "+========================================================+"
    echo -ne "\033[4A\r| \033[36;1;82mAdd [A]ll or [s]pecific file (A/s): \033[0m"
    read -r fileOption
    clear
    
    if [[ $fileOption == 'A' || $fileOption == 'a' ]] && [[ $comment != 'R' || $comment != 'r' ]]
    then
        # adding files
        git add . >/dev/null 2>&1
    elif [[ $fileOption == 'S' || $fileOption == 's' ]] && [[ $comment != 'R' || $comment != 'r' ]]
    then
        interface_child_1
        echo -e "| \033[36;1;82mEnter name of file:\033[0m                                    |"
        echo "+========================================================+"
        echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
        echo "+========================================================+"
        echo -ne "\033[4A\r| \033[36;1;82mEnter name of file: \033[0m"
        read -e -r fileName
        
        if [ -z "$fileName" ]
        then
            clear && echo -e "\033[30;41;2;82m--- Error, File name cannot be empty ---\033[0m" && sleep 1.5 && clear
            return
        elif [ -f "$fileName" ] || [ -d "$fileName" ]
        then
            # adding a file
            git add "$fileName" >/dev/null 2>&1
        else
            clear && return
        fi
    elif [[ $fileOption != 'R' && $fileOption != 'r' ]]
    then
        clear && echo -e "\033[30;41;2;82m--- Error, Entry not recognized ---\033[0m" && sleep 1.5 && clear && return
    else
        clear && return
    fi
    
    clear
    interface_child_1
    echo -e "| \033[36;1;82mEnter comment to commit:\033[0m                               |"
    echo -e "|                                                        |"
    echo "+========================================================+"
    echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
    echo "+========================================================+"
    echo -ne "\033[5A\r| \033[36;1;82mEnter comment to commit: \033[0m"
    read comment && clear
    
    if [ -z "$comment" ]
    then
		if git reset . || git restore --staged .
		then
			clear && echo -e "\033[30;41;2;82m--- Error, Commit message cannot be empty ---\033[0m" && sleep 1.5 && clear
			return
		fi
    elif [[ $comment != 'R' && $comment != 'r' ]]
    then
        # committing changes
        git commit -m "$comment" >/dev/null 2>&1
        
        # pushing to repository
        while true
        do
            echo -ne "\033[33;1;82mPlease, wait...\033[0m\033[K\r"
            if git push origin HEAD 2>/dev/null
            then
                clear && git status -s -b -unormal && sleep 1.5 && clear
                echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
            else
                clear
                echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
                git reset HEAD~1 --soft && git restore --staged . >/dev/null 2>&1
            fi
            sleep 1 && clear && break
        done
    else
        if git reset . || git restore --staged .
        then
            clear
        else
            echo -e "\033[30;41;2;82m--- Error! ---\033[0m" && sleep 1 && clear
        fi
    fi
}

function input_7 {
    
    while [[ true ]]
    do
        git branch -l
        echo -ne "Enter the branch name to pull from or [r]eturn: "
        read -ei "" -p "| " -r branchName
        
        if [[ $branchName == 'r' || $branchName == 'R' ]]
        then
            clear && break
        fi
        
        clear && echo -ne "\033[33;1;82mPlease, wait...\033[0m\033[K\r"
        if [[ $(git pull --no-edit origin $branchName 2>/dev/null) != "Already up to date." ]]
        then
            clear
            git status -s -b -unormal && sleep 1.5 && clear
            echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
        elif [[ $(git pull --no-edit origin $branchName 2>/dev/null) == "Already up to date." ]]
        then
            clear
            echo -e "\033[33;1;82m--- Already up to date. ---\033[0m"
        else
            clear && echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
        fi
        sleep 1.5 && clear && break
    done
    
}

function input_8 {
    
    while [[ true ]]
    do
        echo -ne "\033[33;1;82mPlease, wait...\033[0m\033[K\r"
        
        # git pull is basically git fetch && git merge
        # git stash pop = git stash apply + git stash drop
        #git stash pop // if git stash pop doesn't work, then git stash apply + git stash drop work the same way
        if (git stash -u >/dev/null 2>&1) && (git pull origin HEAD >/dev/null 2>&1) && (git stash apply >/dev/null 2>&1) && (git stash drop >/dev/null 2>&1) ;
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
        read -r  answer
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
    read -r  repository
    
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
    
    interface_child_2
    echo -e "| \033[36;1;82mPress [Enter] to reside in current directory\033[0m \033[31;1;82mOR\033[0m        |"
    echo -e "| \033[36;1;82mEnter name where repo should reside: \033[0m                  |"
    echo "+========================================================+"
    echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
    echo "+========================================================+"
    echo -ne "\033[4A\r| \033[36;1;82mEnter name where repo should reside: \033[0m"
    read -r  DIRECTORY
    clear
    
    if [[ $DIRECTORY != 'R' && $DIRECTORY != 'r' ]]
    then
        cd && cd $DIRECTORY
    else
        clear && return
    fi
    
    # Enter the name of the repository to name both the local folder and github repository
    echo -n "Enter name of repository: "
    read -r  name
    echo -ne "\033[A\033[2K\r"
    
    # making the local folder
    if [ -d $name ]
    then
        git init $name >/dev/null 2>&1 && cd $name
        
        if [ ! -f "README.md" ]
        then
            echo "## $name" >> README.md
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
            echo "## $name" >> README.md
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
            read -r  choice
            echo -ne "\033[A\033[2K\r"
            
            if [[ $choice == 'Y' || $choice == 'y' ]]
            then
                echo -n "Enter your generated token: "
                read -r  token
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
            read -r  choice
            echo -ne "\033[A\033[2K\r"
            
            if [[ $choice == 'Y' || $choice == 'y' ]]
            then
                echo -n "Enter your generated token: "
                read -r  token
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
    currentDir=$(echo $PWD)
    interface_child_2
    echo -e "| \033[36;1;82mPress [Enter] if repo resides in current directory\033[0m \033[31;1;82mOR\033[0m  |"
    echo -e "| \033[36;1;82mEnter name where repo resides: \033[0m                        |"
    echo "+========================================================+"
    echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
    echo "+========================================================+"
    echo -ne "\033[4A\r| \033[36;1;82mEnter name where repo resides: \033[0m"
    read -ei "" -p "| " -r DIRECTORY
    clear
    
    if [[ $DIRECTORY != 'R' && $DIRECTORY != 'r' ]]
    then
        
        # Enter the name of the repository to delete
        echo -n "Enter name of repository: "
        read -r  RepoToDelete
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
                read -r  optional
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
    cd $currentDir
    clear && return
}

function input_13 {
    
    echo "+========================================================+"
    echo -e "|                   \033[32;1;82mGit Repo Utility\033[0m                     |"
    echo "+========================================================+"
    echo -e "| \033[36;1;82mFiles list:\033[0m                                            |"
    echo "+--------------------------------------------------------+"
    ls --color -p -1a | grep -v /
    echo "+--------------------------------------------------------+"
    echo -e "| \033[36;1;82mEnter file name:\033[0m                                       |"
    echo "+========================================================+"
    echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
    echo "+========================================================+"
    echo -ne "\033[4A\r| \033[36;1;82mEnter file name:\033[0m "
    read -ei "" -p "| " -r name
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
        if (git fetch --all >/dev/null 2>&1) && (git reset --hard HEAD >/dev/null 2>&1) && (git merge >/dev/null 2>&1) ;
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
    
    git fetch >/dev/null 2>&1
    if [[ $(git diff @{u} 2>/dev/null) == '' ]] ;
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
    sleep 1.5 && clear
}

function input_17 {
    
    cmd=$(echo $(git remote update ; git status -uno) | grep -o "Your branch is behind")
    
    while [[ true ]]
    do
        echo -ne "\033[33;1;82mPlease, wait...\033[0m\033[K\r"
        if [[ $cmd == "Your branch is behind" ]]
        then
            echo -e "\033[30;41;5;82m--- Local is NOT up to date! ---\033[0m"
        else
            echo -e "\033[30;48;5;82m--- Local is up to date! ---\033[0m"
        fi
        sleep 1.5 && clear && break
    done
    
}

function input_18 {
    
    echo "+========================================================+"
    echo -e "|                     \033[32;1;82mGit Repo Utility\033[0m                   |"
    echo "+========================================================+"
    echo -e "| \033[36;1;82mFiles list:\033[0m                                            |"
    echo "+--------------------------------------------------------+"
    ls --color -1p
    echo "+--------------------------------------------------------+"
    echo -e "| \033[36;1;82mEnter name of file:\033[0m                                    |"
    echo "+========================================================+"
    echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
    echo "+========================================================+"
    echo -ne "\033[4A\r| \033[36;1;82mEnter name of file/folder: \033[0m"
    read -ei "" -p "| " -r fileName
    
    if [ -f $fileName ] || [ -d $fileName ]
    then
        #removing file/folder
        git rm -r --cached $fileName >/dev/null 2>&1
        
    elif [[ $fileName != 'R' && $fileName != 'r' ]]
    then
        clear && echo -e "\033[30;41;2;82m--- Error, Entry not recognized ---\033[0m" && sleep 1.5 && clear
    else
        clear && return
    fi
    
    clear
    interface_child_1
    echo -e "| \033[36;1;82mEnter comment to commit:\033[0m                               |"
    echo -e "|                                                        |"
    echo "+========================================================+"
    echo -e "|                   \033[31;1;82mEnter [r] to Return\033[0m                  |"
    echo "+========================================================+"
    echo -ne "\033[5A\r| \033[36;1;82mEnter comment to commit: \033[0m"
    read -r  comment && clear
    
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

function input_19 {
    echo "+=========================================================+"
    echo -e "|                     \033[32;1;82mMerge Branches\033[0m                      |"
    echo "+=========================================================+"
    echo -e "| \033[36;1;82mAvailable Branches:\033[0m                                     |"
    echo "+---------------------------------------------------------+"
    git branch -l
    echo "+---------------------------------------------------------+"
    echo -e "| \033[36;1;82mEnter name of branch to merge from:\033[0m                     |"
    echo "+=========================================================+"
    echo -e "|                    \033[31;1;82mEnter [r] to Return\033[0m                  |"
    echo "+=========================================================+"
    echo -ne "\033[4A\r| \033[36;1;82mEnter name of branch to merge from: \033[0m"
    read -ei "" -p "| " -r branchName1

    if [[ $branchName1 != 'R' && $branchName1 != 'r' ]]; then
        echo -ne "\033[1A\033[K\r| \033[36;1;82mEnter name of branch to merge to: \033[0m"
        read -ei "" -p "| " -r branchName2
        clear

        if [[ $branchName2 != 'R' && $branchName2 != 'r' ]]; then
            if git fetch --all >/dev/null 2>&1 && git show-ref --quiet --verify "refs/heads/$branchName1" >/dev/null 2>&1 && git show-ref --quiet --verify "refs/heads/$branchName2" >/dev/null 2>&1; then
                if git checkout "$branchName2" && git pull && git checkout "$branchName1" && git pull && git rebase -i "$branchName2" && git checkout "$branchName2" && git merge "$branchName1" && git push origin "$branchName1" >/dev/null 2>&1; then
                    echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
                else
                    clear
                    echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
                fi
            else
                clear && echo -e "\033[30;41;2;82m--- Error, Invalid branch names ---\033[0m" && sleep 1.5 && clear
            fi
        else
            clear && return
        fi
    else
        clear && return
    fi

    sleep 1 && clear
}

function input_20 {
    echo "+=========================================================+"
    echo -e "|               \033[32;1;82mDelete Local & Remote Branch\033[0m              |"
    echo "+=========================================================+"
    echo -e "| \033[36;1;82mAvailable Branches:\033[0m                                     |"
    echo "+---------------------------------------------------------+"
    git branch -l
    echo "+---------------------------------------------------------+"
    echo -e "| \033[36;1;82mEnter branch name to delete:\033[0m                            |"
    echo "+=========================================================+"
    echo -e "|                    \033[31;1;82mEnter [r] to Return\033[0m                  |"
    echo "+=========================================================+"
    echo -ne "\033[4A\r| \033[36;1;82mEnter branch name to delete: \033[0m"
    read -r branchName1

    if [[ $branchName1 != 'R' && $branchName1 != 'r' ]]; then
        if git fetch --all >/dev/null 2>&1; then
            if git show-ref --quiet --verify "refs/heads/$branchName1" >/dev/null 2>&1; then
                echo -ne "\033[A\033[K\r| \033[36;1;82mEnter branch name to switch to: \033[0m"
                read -r branchName2
                clear
                if [[ -z "$branchName2" ]]; then
                    clear && echo -e "\033[30;41;2;82m--- Error, branch name cannot be empty ---\033[0m" && sleep 1.5 && clear
                    return
                elif [[ $branchName2 == 'R' || $branchName2 == 'r' ]]; then
                    clear && return
                elif git show-ref --quiet --verify "refs/heads/$branchName2" >/dev/null 2>&1; then
                    if git checkout "$branchName2" >/dev/null 2>&1 && git branch -D "$branchName1" >/dev/null 2>&1 && git push origin --delete "$branchName1" >/dev/null 2>&1 || true; then
                        echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
                    else
                        clear
                        echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
                    fi
                else
                    clear && echo -e "\033[30;41;2;82m--- Error, branch '$branchName2' does not exist ---\033[0m" && sleep 1.5 && clear
                    return
                fi
            elif git show-ref --quiet --verify "refs/heads/$branchName1" >/dev/null 2>&1; then
                if git branch -D "$branchName1" >/dev/null 2>&1 && git push origin --delete "$branchName1" >/dev/null 2>&1 || true; then
                    echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
                else
                    clear
                    echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
                fi
            else
                clear && echo -e "\033[30;41;2;82m--- Error, branch '$branchName1' does not exist ---\033[0m" && sleep 1.5 && clear
                return
            fi
        else
            clear && echo -e "\033[30;41;2;82m--- Error: Failed to fetch branches ---\033[0m" && sleep 1.5 && clear
            return
        fi
    else
        clear && return
    fi

    sleep 1 && clear
}

function input_21 {
    echo "+=========================================================+"
    echo -e "|                      \033[32;1;82mCreate Branch\033[0m                      |"
    echo "+=========================================================+"
    echo -e "| \033[36;1;82mEnter new branch name: \033[0m                                 |"
	echo "+=========================================================+"
    echo -e "|                    \033[31;1;82mEnter [r] to Return\033[0m                  |"
    echo "+=========================================================+"
    echo -ne "\033[4A\r| \033[36;1;82mEnter new branch name: \033[0m"
    read -r branchName
	if [[ $branchName == 'r' || $branchName == 'R' ]]; then
        clear && return
	fi 
    echo "+=========================================================+"
    echo -ne "\033[2A\033[K\r| \033[36;1;82mDo you want to switch to branch (y/n): \033[0m"
    read -r option
    clear

    if [[ $option == 'y' || $option == 'Y' ]]; then
        if git fetch --all >/dev/null 2>&1 && git checkout -b "$branchName" >/dev/null 2>&1; then
            echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
        else
            clear
            echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
        fi
    elif [[ $option == 'n' || $option == 'N' ]]; then
        if git fetch --all >/dev/null 2>&1 && git branch "$branchName" >/dev/null 2>&1; then
            echo -e "\033[30;48;5;82m--- Successful ---\033[0m"
        else
            clear
            echo -e "\033[30;41;5;82m--- Failed ---\033[0m"
        fi
    elif [[ $option == 'r' || $option == 'R' ]]; then
        clear && return
    else
        clear && echo -e "\033[30;41;2;82m--- Error, Entry not recognized ---\033[0m" && sleep 1.5 && clear
    fi

    sleep 1 && clear
}

function quit {
    echo -e "\033[30;42;5;82m--- Good Bye ---\033[0m" && sleep 1 && clear
    
}

function error {
    echo -e "\033[30;41;2;82m--- Error, Entry not recognized! ---\033[0m"&& sleep 1.5 && clear
    return
}

main
