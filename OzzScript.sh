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
doLine(){
    echo "-------------------------------------------------------------------------------------------"
}

timeout() {
  sleep 1
}

resourcesPath(){
    APPJS=$PWD/Resources/app.js
    CONFIG=$PWD/Resources/config.json
    CONNECTIONJS=$PWD/Resources/connection.js
    INDEXEJS=$PWD/Resources/index.ejs
    INDEX_CONTROLLER=$PWD/Resources/index-controller.js
    EX_MIDDLEWARE=$PWD/Resources/exception-middleware.js
    UTILS=$PWD/Resources/utils.js
    TYPES=$PWD/Resources/types.js
    WWW=$PWD/Resources/www
}

npmPackages(){
    eval "npm init -y"
    eval "npm install express --save"
    eval "npm install body-parser --save"
    eval "npm install ejs --save"
    eval "npm install cookie-parser --save"
    eval "npm install dotenv --save"
    eval "npm install mongoose --save"
}

folderAndFileCreator(){
    echo "Project creating"
    echo "You are here now: " "$PWD"
    declare -a ROOT_FOLDERS
    declare -a SRC_SUB_FOLDERS
    declare -a PUBLIC_SUB_FOLDERS
    ROOT_FOLDERS=(bin src public test)
    SRC_SUB_FOLDERS=(controllers helpers middleware models views api)
    PUBLIC_SUB_FOLDERS=(js images stylesheets)
    for i in ${ROOT_FOLDERS[@]}
    do
        mkdir $i
    done
    cd bin
    cp "$WWW" "$PWD"
    cd ..
    cd src
    cp "$APPJS" "$PWD"
    cp "$CONFIG" "$PWD"
    for j in ${SRC_SUB_FOLDERS[@]}
    do
        mkdir $j
    done
    cd controllers
    cp "$INDEX_CONTROLLER" "$PWD"
    cd ..
    cd helpers
    cp "$UTILS" "$PWD"
    cp "$TYPES" "$PWD"
    cd ..
    cd middleware
    cp "$EX_MIDDLEWARE" "$PWD"
    cd ..
    cd views
    cp "$INDEXEJS" "$PWD"
    cd ..
    cd ..
    cd public
    for k in ${PUBLIC_SUB_FOLDERS[@]}
    do
        mkdir $k
    done
    cd ..
}

setUpWithPath () {
 echo "Set up new function"
 doInfoShape
 resourcesPath
 doLine
 echo "Please provide the path to the directory where you will create the project: " 
 echo "Example: Desktop/NodeJS/myProject (Should not begin and should not end with '/')"
 echo "The path must be end of your project folder name"
 doLine
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
 folderAndFileCreator
 echo "$PWD"
 npmPackages
}

setUpHere(){
    resourcesPath
    doLine
    echo "Enter project name: "
    doLine
    read projectFolder
    timeout
    mkdir $projectFolder
    cd $PWD/$projectFolder
    doInfoShape
    folderAndFileCreator
    echo "$PWD"
    npmPackages
}

main(){
    PS3='Please enter your choice: '
    options=("Set up different directory" "Set up an here" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "Set up different directory")
                echo "You chose choice 1"
                setUpWithPath
                break
                ;;
            "Set up an here")
                echo "You chose choice 2"
                setUpHere
                break
                ;;
            "Quit")
                break
                ;;
            *) echo "invalid option $REPLY";;
        esac
    done
}

main