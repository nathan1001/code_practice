//Nathanos Donks.
//Learning javascript everyday.
//Thanks to taylan.codes on instagram
//filter
function isOdd(num){
  return num%2!=0;
}
function isEven(num){
  return num%2==0;
}

var nums=[];

for (let i = 0;i<20;i++){
  nums[i]=i+1;
}

var evens =nums.filter(isEven) ;
console.log('Even numbers: ');
console.log(evens);

var odds =nums.filter(isOdd) ;
console.log('Odd numbers: ');
console.log(odds);
