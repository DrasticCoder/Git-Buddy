# !/bin/bash
echo "**************************************************"
echo "**                                              **"
echo "**             Welcome to Git-Buddy             **"
echo "**                                              **"
echo "**************************************************"
read -p "|--   Enter 1: To initialize git repository 
|--   Enter 2: To add files to existing repository
" choice

if [ $choice -eq 1 ];then
    read -p "Enter path to initialize repository: " path
    if [ -d $path ];then 
        cd $path
        git init
        echo "Git repository initialized"
    else echo "Directory does not exist"
    fi

elif [ $choice -eq 2 ];then
    read -p "Path to local repository : example(/home/user/something)  " path
    if [ -d "$path" ]; then
        # echo "Directory exists"
        cd path
        # echo "Directory changed to $path"
        read -p "Add all files to staging area? [Y/N] " NY
        if [ "$NY" = "Y" ]; then
            git add .
            echo "All files added to staging area"
        else
            read -p "Enter file names : " files
            git add $files
            echo "Files added to staging area"
        fi

        read -p "Enter commit message : " message
        git commit -m "$message"
        # echo "Commit message added (commit message : $message)"

        read -p "Push to remote repository? [Y/N] " choice2

        if [ "$choice2" = "Y" ]; then
            read -p "Enter remote repository url : " url
            git remote add origin $url
            git push -u origin master
            echo "Pushed to remote repository"
        else
            echo "Not pushed to remote repository"
            read -p "Push locally? [Y/N] " choice3

            if [ "$choice3" = "Y" ]; then
                git push
                echo "Pushed successfully"
            else
                echo "Not pushed..."
            fi
        fi
    else
        echo "Directory does not exist"
    fi
else
    echo "Invalid choice"
fi