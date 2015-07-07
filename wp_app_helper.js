#!/opt/node/bin/node

// to avoid node.js ignoring self-signed certificates
process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";

// DEBUG
console.log = function() {};

// imports
var xmlrpc = require('xmlrpc');
var config = require('./wp_secret.js');
require('shelljs/global');

// MAIN
var client = xmlrpc.createSecureClient(config.client);

client.methodCall('wp.getPosts', [0, config.wordpress.username, config.wordpress.password, {post_status: "pending"}], function (error, value) {
    console.log('getPosts result', value);
    if (error !== null) throw error;

    var tempDir = exec('mktemp -d', {silent: true}).output.trim();
    cd(tempDir);

    value.forEach(function (post) {
        var newContent = post.post_content.replace(/<a href=".*\/(wordpress\/wp-content\/uploads\/.*)">.*<\/a>/ig, function (match, p1) {
            //TODO: rm p1.replace('.jpg', '*') to clean up wordpress upload dir
            cp('/home/ftp/www/' + p1, tempDir);
            var response = [];
            exec('blog_pictures', {silent: true}).output.trim().split('\n').forEach(function (line) {
                if (line.slice(0, 3) == '<a ') {
                    response.push(line);
                }
            });
            rm('-f', tempDir + '/*');
            return response.join('');
        });

        var newPost = {
            post_content: newContent.replace(/<\/a>\s*<a /ig, '</a><a '),
            post_status: 'publish'
        };

        client.methodCall('wp.editPost', [0, config.wordpress.username, config.wordpress.password, post.post_id, newPost], function (error, value) {
            console.log('editPost result', value);
            if (error !== null) throw error;
        });

        console.log('newPost', newPost);
    });

    rm('-rf', tempDir);
});
