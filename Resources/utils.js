"use strict";

const packageJson    = require("../../package.json");
const Types          = require("../helpers/types");

class Utils {
    
    // ... Set result
    setResult(code, message, data) {
        var result = {
            code: code,
            message: message,
            data: data,
            time: Date.now(),
            api: {
                author: packageJson.author,
                name: packageJson.name,
                description: packageJson.description,
                version: packageJson.version
            }
        }
        return result;
    };

}

module.exports = Utils;
