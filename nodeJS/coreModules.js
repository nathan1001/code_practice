var fs = require('fs');
var path = require('path');

fs.writeFileSync("nathan.txt","The quick brown fox jumps over the lazy dog");

console.log(fs.readFileSync("nathan.txt").toString());

var websiteHome = "nathandonkor/Downloads/Techoft//myFreshwordapp/index.html";
var websiteAbout = "nathandonkor/Downloads/Techoft/myFreshwordapp/About.html";

console.log(path.normalize(websiteHome));
console.log(path.dirname(websiteAbout));
console.log(path.basename(websiteAbout));
console.log(path.extname(websiteAbout));

setInterval( function(){
    console.log('Beef');
}, 2000);

console.log(__dirname);
console.log(__filename);