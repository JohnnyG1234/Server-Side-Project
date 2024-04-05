
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

    getBike1();
    getBike2();
    getBike3();
    getBike4();

    getTotal();
}


const getBike1 = () => {
    const bikeCookie = findCookie("bike1")
    console.log(bikeCookie);

    let tableElement = document.getElementById("bike1Quantity")
    tableElement.textContent = bikeCookie;
        
}

const getBike2 = () => {
    const bikeCookie = findCookie("bike2")
    console.log(bikeCookie);

    let tableElement = document.getElementById("bike2Quantity")
    tableElement.textContent = bikeCookie;
}

const getBike3 = () => {
    const bikeCookie = findCookie("bike3")
    console.log(bikeCookie);

    let tableElement = document.getElementById("bike3Quantity")
    tableElement.textContent = bikeCookie;
}

const getBike4 = () => {
    const bikeCookie = findCookie("bike4")
    console.log(bikeCookie);

    let tableElement = document.getElementById("bike4Quantity")
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



