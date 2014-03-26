// This is a workaround for issue where /cordova.js is not served
// correctly on Android.
//
// For further information, please read
// https://github.com/AppGyver/scanner/issues/136

var cordovaLoaderTag = document.getElementById("ag-cordova-loader");

cordovaLoaderTag.src = "http://localhost/zordova.js";
