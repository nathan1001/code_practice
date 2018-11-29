function User(){
    this.name="";
    this.life=100;
    this.giveLife = function giveLife(targetPlayer){
        targetPlayer.life +=1;
        console.log(this.name + " gave 1 life to "+ targetPlayer.name);
    }
}

var Nathan = new User();
var Baba = new User();

Nathan.name="Nathan";
Baba.name="Baba";

Nathan.giveLife(Baba);
console.log("Nathan: "+ Nathan.life);
console.log("Baba: "+ Baba.life);

//You can add functions to all objects.
User.prototype.uppercut = function uppercut(targetPlayer){
    targetPlayer.life -=5;
    console.log(this.name + " just uppercutted "+ targetPlayer.name);
}

Baba.uppercut(Nathan);
console.log("Nathan: "+ Nathan.life);
console.log("Baba: "+ Baba.life);

//adding properties to all objects.
User.prototype.magic = 60;
console.log(Nathan.magic);
console.log(Baba.magic);