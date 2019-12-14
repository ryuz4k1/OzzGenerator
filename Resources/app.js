'use strict';

const express                   = require('express');
const bodyParser                = require('body-parser');
const ejs                       = require('ejs');
const cookieParser              = require('cookie-parser');
const Utils                     = require('../src/helpers/utils');
const dotenv                    = require('dotenv').config();

// db Connection
//const Connection                = require('../src/helpers/connection');

//Controllers
const IndexController           = require('../src/controllers/index-controller');

// Middleware
const ExceptionMiddleware      = require('./middleware/exception-middleware');


class App {
  constructor() {
      this.app = express();

      this.config();
      this.controllers();

      //this.Connection = new Connection().mongoDB();
  }

  config() {
    this.utils = new Utils();

    //db connection
    //this.Connection;
    
    // ... Body parser
    this.app.use(bodyParser.urlencoded({ extended: true }));
    this.app.use(bodyParser.json()); 
    this.app.use(cookieParser());

    // view engine setup
    this.app.engine('.ejs', ejs.__express);
    this.app.set('views', __dirname + '/views');
    this.app.set('view engine', 'ejs');

  }

  controllers(){
    this.app.use('/public', express.static('public'));
    
    // ... Index Controller
    let router = express.Router();
    this.app.use('/', router);
    new IndexController(router);
    
     // ... Exception middleware
     const exceptionMiddleware = new ExceptionMiddleware();
     this.app.use(exceptionMiddleware.errorHandler);
  };

  getApp() {
    return this.app;
  }

}

module.exports = App;
