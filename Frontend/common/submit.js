//This is really gross I'm sorry! -John
const validateData = () => {
    
    //customer info
    const firstName = document.form.firstname.value;
    const lastName = document.form.lastname.value;
    const email = document.form.email.value;
    const scode = document.form.scode.value;
    const sch = document.form.sch.value;
    const snumber = document.form.snumber.value;
    const address = document.form.address.value;
    const city = document.form.city.value;
    const state = document.form.state.value;
    const zip = document.form.zip.value;

    //billing info
    const cardNum = document.form.cardNumber.value;
    const cvnNum = document.form.CVN.value;
    const cardMonth = document.form.cardMonth.value;
    const cardYear = document.form.cardYear.value;
    const cardName = document.form.cardName.value;
    const billingAddress = document.form.billingAddress.value;
    const billingCity = document.form.billingCity.value;
    const billingState = document.form.billingState.value;
    const billingZip = document.form.billingZip.value;

    const phoneNumber = String(scode) + String(sch) + String(snumber);


    var RegExpText = /^[A-Z a-z]+$/;
	var RegExpST = /^[A-Za-z]{2}$/;
    var RegExpZip = /^[0-9]{5}$/;
    var RegExpEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
    var RegExpNumber = /^[0-9]{10}$/;

    if(!RegExpText.test(firstName))
    {
        alert('Invalid input: First Name');
		document.form.firstname.focus();
		document.form.firstname.select();
		document.form.firstname.backgroundColor = '#ffcccc';
		return false; /*Keeps the user in the webpage*/     
    }
    else if(!RegExpText.test(lastName))
    {
        alert('Invalid input: Last Name');
		document.form.lastname.focus();
		document.form.lastname.select();
		document.form.lastname.backgroundColor = '#ffcccc';
		return false; /*Keeps the user in the webpage*/     
    }
    else if(!RegExpEmail.test(email))
    {
        alert('Invalid input: Email');
		document.form.email.focus();
		document.form.email.select();
		document.form.email.backgroundColor = '#ffcccc';
		return false; /*Keeps the user in the webpage*/   
    }
    else if(!RegExpNumber.test(phoneNumber))
    {
        alert('Invalid input: Phone Number');
		document.form.scode.focus();
		document.form.scode.select();
		document.form.scode.backgroundColor = '#ffcccc';
		return false; /*Keeps the user in the webpage*/  
    }
    else if (!RegExpText.test(city))
    {
        alert('Invalid input: City');
		document.form.city.focus();
		document.form.city.select();
		document.form.city.backgroundColor = '#ffcccc';
		return false; /*Keeps the user in the webpage*/  
    }
    else if (!RegExpST.test(state))
    {
        alert('Invalid input: State');
		document.form.state.focus();
		document.form.state.select();
		document.form.state.backgroundColor = '#ffcccc';
		return false; /*Keeps the user in the webpage*/ 
    }
    else if (!RegExpZip.test(zip))
    {
        alert('Invalid input: Zip Code');
		document.form.zip.focus();
		document.form.zip.select();
		document.form.zip.backgroundColor = '#ffcccc';
		return false; /*Keeps the user in the webpage*/ 
    }

    //everything is valid so make cookies 
    // date setup for cookies
    var today = new Date();
    var expdate = today.getTime()+(1000*60*60*24*7);


    document.cookie="firstName="+firstName+";expires="+expdate+";path=/;SameSite ='Lax'";
    document.cookie="lastName="+lastName+";expires="+expdate+";path=/;SameSite ='Lax'";
    document.cookie="email="+email+";expires="+expdate+";path=/;SameSite ='Lax'";
    document.cookie="phoneNumber="+phoneNumber+";expires="+expdate+";path=/;SameSite ='Lax'";
    document.cookie="addr="+address+";expires="+expdate+";path=/;SameSite ='Lax'";
    document.cookie="city="+city+";expires="+expdate+";path=/;SameSite ='Lax'";
    document.cookie="state="+state+";expires="+expdate+";path=/;SameSite ='Lax'";
    document.cookie="zip="+zip+";expires="+expdate+";path=/;SameSite ='Lax'";

    console.log(document.cookie);


    // Now go to sumbmit.php
    return true;
}

