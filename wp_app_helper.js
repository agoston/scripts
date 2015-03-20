#!/usr/local/bin/node

// to avoid node.js ignoring self-signed certificates
process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

var xmlrpc = require('xmlrpc');
var config = require('./wp_config.js');

var client = xmlrpc.createSecureClient({
    host: 'seagoat.xs4all.nl',
    port: 443,
    path: '/wordpress/xmlrpc.php',
    basic_auth: config.http_auth
});

client.methodCall('wp.getPostTypes', [0, config.wordpress.username, config.wordpress.password], function (error, value) {
    console.log(value);
    console.log(error);
});

console.log('gelukt!');
