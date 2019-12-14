"use strict";

const Utils = require("../helpers/utils");
const Types = require("../helpers/types");

class ExceptionMiddleware {
    // ... Check app token 
    errorHandler(err, req, res, next) {
        const utils  = new Utils();
        
        return res.status(500).send(utils.setResult(Types.Status.ERROR, err.message, null)) ;
    }
}

module.exports = ExceptionMiddleware;