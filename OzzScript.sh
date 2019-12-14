#! /bin/bash
echo "WELCOME TO OZZGENERATOR NODEJS ARCHITECTURE CREATOR"

doInfoShape(){
  echo '
 -----------------------------
 +                           +
 +           INFO            +
 +                           +
 ----------------------------- '
}

timeout() {
  sleep 3
}

setUp () {
 echo "Set up new function"
 doInfoShape
 echo "Please provide the path to the directory where you will create the project: " 
 echo "Example: Desktop/NodeJS/myProject (Should not begin and should not end with '/')"
 echo "The path must be end of your project folder name"
 read projectRootDirectory
 timeout
 fullPath=~/$projectRootDirectory
 echo "Your directory: " $fullPath
 IFS='/' #delimiter
 read -ra ADDR <<< "$fullPath"
 projectFolder=${ADDR[*]: -1}
 withOutProjectFolder=${fullPath//$projectFolder}
 cd "$withOutProjectFolder"
 mkdir $projectFolder
 cd $projectFolder
 doInfoShape
 echo "Project creating"
 echo "You are here now: " "${ADDR[*]}"
 mkdir bin
 cd bin
 touch www
 cd ..
 mkdir src
 cd src
 touch app.js
 mkdir controllers
 mkdir helpers
 mkdir models
 mkdir views
 mkdir middleware
 mkdir api
 cd ..
 mkdir public
 cd public
 mkdir js
 mkdir images
 mkdir stylesheets
 cd ..
 touch .env
 touch .gitignore
 touch config.json
 touch README.md
 timeout
 echo "$PWD"
 eval "npm init -y"
}



PS3='Please enter your choice: '
options=("Set up a new Node.JS project" "Set up an existing Node.JS project" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Set up a new Node.JS project folder")
            echo "you chose choice 1"
	          setUp
	          break
            ;;
        "Set up an existing Node.JS project folder")
            echo "you chose choice 2"
	          setUp
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done