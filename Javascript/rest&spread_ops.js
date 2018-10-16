//Nathanos Donks.
//Learning javascript everyday.
//Thanks to taylan.codes on instagram
//concatenate arrays

var arr1 = [0,1,2];
var arr2 = [3,4,5];

arr1 = [...arr1,...arr2];

console.log(arr1);

//REST: condense multiple elements into an array

function multiply(multiplier,...arguments){
  return arguments.map(function(element){
    return multiplier * element;
  });
}

var array = multiply(2,1,2,3,4,5,6,7,8,9,10);
console.log(array);
