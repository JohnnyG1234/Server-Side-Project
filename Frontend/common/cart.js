
// Bike cost consts

const bike1Cost = 500;
const bike2Cost = 400;
const bike3Cost = 1000;
const bike4Cost = 1500;


//Mason Lee's find cookie function!!!
function findCookie(val) {
    let cookieString = document.cookie;

    cookieString = cookieString.split(";")

    for (let i = 0; i < cookieString.length; i++)
    {
        let cookiePair = cookieString[i].split("=");
        if (cookiePair[0].trim() == val)
        {
            return cookiePair[1]
        }
    }
			
}

onload = () => {

    let clearButton = document.getElementById("clearCart");
    clearButton.onclick = clearCart;

    getBike("1");
    getBike("2");
    getBike("3");
    getBike("4");

    getTotal();
}


const getBike = (bikeNumber) => {
    const bikeCookie = findCookie("bike" + bikeNumber)
    console.log(bikeCookie);

    let tableElement = document.getElementById("bike" + bikeNumber + "Quantity")
    tableElement.textContent = bikeCookie;
        
}

const getTotal = () => {
    const bike1Value = findCookie("bike1")
    const bike2Value = findCookie("bike2")
    const bike3Value = findCookie("bike3")
    const bike4Value = findCookie("bike4")


    const total = Number(bike1Value) * bike1Cost + Number(bike2Value) * bike2Cost + Number(bike3Value) * bike3Cost + Number(bike4Value) * bike4Cost;
    
    let totalElement = document.getElementById("total")
    totalElement.textContent = 'Total: ' + total;
}

const clearCart = () => {
    // date setup for cookies
    var today = new Date();
    var expdate = today.getTime()+(1000*60*60*24*7);

    document.cookie="bike1=0;expires="+expdate+";path=/;SameSite ='Lax'";
    document.cookie="bike2=0;expires="+expdate+";path=/;SameSite ='Lax'";
    document.cookie="bike3=0;expires="+expdate+";path=/;SameSite ='Lax'";
    document.cookie="bike4=0;expires="+expdate+";path=/;SameSite ='Lax'";

    getBike1();
    getBike2();
    getBike3();
    getBike4();
    getTotal();
}


