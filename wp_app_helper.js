#!/usr/local/bin/node

// to avoid node.js ignoring self-signed certificates
process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

var xmlrpc = require('xmlrpc');
var config = require('./wp_config.js');

var client = xmlrpc.createSecureClient(config.client);

client.methodCall('wp.getPostTypes', [0, config.wordpress.username, config.wordpress.password], function (error, value) {
    console.log(value);
    console.log(error);
});

console.log('gelukt!');
