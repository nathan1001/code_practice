var Nathan={
    printFirstName:function(){
        console.log("My name is Nathan");
        console.log(this === Nathan);//true
    }
}

Nathan.printFirstName();

//default context is global
function doSomething(){
    console.log("\n I am A son of God");
    console.log(this === global);
}

doSomething();