

onload = () => {

    // getting buttons set up
    const button1 = document.getElementById("button1");
    button1.onclick = addBike1;

    const button2 = document.getElementById("button2");
    button2.onclick = addBike2;

    const button3 = document.getElementById("button3");
    button3.onclick = addBike3;

    const button4 = document.getElementById("button4");
    button4.onclick = addBike4;
}


const addBike1 = () =>{
    console.log("bike 1");

    // get rid of old cookie value
    document.cookie = "bike1=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";

    // get input
    let input = document.getElementById("bike1");
    const num = input.value;

    // date setup for cookies
    var today = new Date();
    var expdate = today.getTime()+(1000*60*60*24*7);

    // do regex here to tell if its a number

    // cookie it!
    document.cookie="bike1="+num+";expires="+expdate+";path=/;SameSite ='Lax'";
}

const addBike2 = () =>{
    console.log("bike 2");

    // get rid of old cookie value
    document.cookie = "bike2=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";

    // get input
    let input = document.getElementById("bike2");
    const num = input.value;

    // date setup for cookies
    var today = new Date();
    var expdate = today.getTime()+(1000*60*60*24*7);

    // do regex here to tell if its a number

    // cookie it!
    document.cookie="bike2="+num+";expires="+expdate+";path=/;SameSite ='Lax'";
}

const addBike3 = () =>{
    console.log("bike 3");

    // get rid of old cookie value
    document.cookie = "bike3=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";

    // get input
    let input = document.getElementById("bike3");
    const num = input.value;

    // date setup for cookies
    var today = new Date();
    var expdate = today.getTime()+(1000*60*60*24*7);

    // do regex here to tell if its a number

    // cookie it!
    document.cookie="bike3="+num+";expires="+expdate+";path=/;SameSite ='Lax'";
}

const addBike4 = () =>{
    console.log("bike 4");

    // get rid of old cookie value
    document.cookie = "bike4=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";

    // get input
    let input = document.getElementById("bike4");
    const num = input.value;

    // date setup for cookies
    var today = new Date();
    var expdate = today.getTime()+(1000*60*60*24*7);

    // do regex here to tell if its a number

    // cookie it!
    document.cookie="bike4="+num+";expires="+expdate+";path=/;SameSite ='Lax'";
}