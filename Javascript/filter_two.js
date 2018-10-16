//Nathanos Donks.
//Learning javascript everyday.
//Thanks to taylan.codes on instagram
//filter

function passing(num){
  return num>=60;
}

var grades = [];
for (let i=0;i<20;i++){
  grades[i]=Math.floor(Math.random()*101);
}

passgrades = grades.filter(passing);
console.log("All grades: ");
console.log(grades);
console.log("Passing grades: ");
console.log(passgrades);
