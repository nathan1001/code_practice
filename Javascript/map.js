//Nathanos Donks.
//Learning javascript everyday.
//Thanks to taylan.codes on instagram
// map

function curve (grade){
  return grade +=5;
}

var grades =[55,76,65,89,83,99,93];
var newgrades= grades.map(curve);
console.log(newgrades);

function first(word){
  return word[0];
}

var words =["Mfantsipim","Senior","High","School"];
var acronym=words.map(first);
console.log(acronym.join(""));
