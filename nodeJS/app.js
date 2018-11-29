function placeAnOrder(ordernumber){
    console.log("Customer Number:",ordernumber);

    cookAndDeliverFood(function(){
        console.log("Delivered food with order number",ordernumber)
    })
}

//simulate a 5 second operation
function cookAndDeliverFood(callback){
    setTimeout(callback,5000);
}

//simulate users web request
placeAnOrder(1);
placeAnOrder(2);
placeAnOrder(3);
placeAnOrder(4);
placeAnOrder(5);
placeAnOrder(6);
placeAnOrder(7);
placeAnOrder(8);
