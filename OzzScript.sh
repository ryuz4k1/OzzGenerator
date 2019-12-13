#! /bin/bash
echo "WELCOME TO OZZGENERATOR NODEJS ARCHITECTURE CREATOR"


setUpNew () {
 echo "Set up new function"
 echo '
 -----------------------------
 +                           +
 +           INFO            +
 +                           +
 ----------------------------- '
 echo "Please provide the path to the directory where you will create the project: " 
 echo "Example: Desktop/NodeJS/myProject (Should not begin and should not end with '/')"
 echo "The path must be end of your project folder name"
 read projectRootDirectory
 fullPath=~/$projectRootDirectory
 echo "Your directory: " $fullPath
 IFS='/' #delimiter
 read -ra ADDR <<< "$fullPath"
 projectFolder=${ADDR[*]: -1}
 withOutProjectFolder=${fullPath//$projectFolder}
 cd "$withOutProjectFolder"
 mkdir $projectFolder
 echo '
 -----------------------------
 +                           +
 +           INFO            +
 +                           +
 ----------------------------- '
 echo "Project created"
 echo "You are here now: " "${ADDR[*]}"
}

setUpExisting(){
 "Set up existing function"
}


PS3='Please enter your choice: '
options=("Set up a new Node.JS project" "Set up an existing Node.JS project" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Set up a new Node.JS project")
            echo "you chose choice 1"
	    setUpNew
	    break
            ;;
        "Set up an existing Node.JS project")
            echo "you chose choice 2"
	    setUpExisting
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done


<<COMMENT
read projectRootDirectory
mkdir $full              
cd $fullPath
echo "Your here now: " $pwd
COMMENT
