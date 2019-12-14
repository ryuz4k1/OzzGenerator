# OzzGenerator
#### Use the application generator tool script, ozz-generator, to quickly create an application skeleton.
 -  The aim of this project; A Node.JS project is intended to create the framework structure, to establish the necessary   structure, architecture, and to do this in a regular, readable form.
 -  By default the mongodb connection is built with .ejs for appearance, express to create an http server, and useful modules that you can use.


## Requirements
This is a bash script. For this reason, Mac OS X and Unix works on all operating systems.


## Project Structure

    myProject/
    ├─ bin
    |   ├─ wwww #build and start server file
    ├─ public
    │   ├─ images
    │   ├─ js
    │   ├─ stylesheets
    ├─ src/
    │  ├── api/
    │  ├── controllers/
    │  │      ├── index-controller.js
    │  ├── helpers/
    │  │      ├── connection.js
    │  │      ├── utils.js
    │  │      ├── types.js
    │  ├── middleware/
    |  |      ├── exception-middleware.js          
    │  ├── models/
    │  ├── views/
    |  |      ├── index.ejs
    │  ├── app.js  
    │  ├── config.json
    │  ├── test/
    │  ├── package.json
    └─ 



## Usage

### Step 1 - Github
- Clone this repository.
  
  git clone https://github.com/ryuz4k1/OzzGenerator.git

### Step 2 - Run Script
- You can run wherever you want.
```
 bash OzzScript.sh 
 or
 ./OzzScript.sh
```
### Step 3 - Editing package.json
- Here we have to make a few changes manually. Go to package.json and replace the relevant section with the following.

    - ### Add this
    ```
    "scripts": {
        "start": "node ./bin/www",
        "dev": "nodemon ./bin/www"
    }
    ```
    - ###  Delete this
    ```
    "main": "index.js"
    ```


### Step 4 - Start server
- Open a terminal and go to project directory and just run
    > npm start

  On the terminal screen you will see; 
  
  Server is running on port: 5000 


## Author

* [Murat Özer](https://ryuz4k1.github.io/murat-ozer/)