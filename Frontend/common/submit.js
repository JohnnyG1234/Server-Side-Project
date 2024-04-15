
const validateData = () => {
    
    const firstName = document.form.firstname.value;
    const lastName = document.form.lastname.value;
    const email = document.form.email.value;
    const sch = document.form.sch.value;
    const snumber = document.form.snumber.value;
    const address = document.form.address.value;
    const city = document.form.city.value;
    const state = document.form.state.value;
    const zip = document.form.zip.value;

    var RegExpText = /^[A-Z a-z]+$/;
	var RegExpST = /^[A-Za-z]{2}$/;
    var RegExpZip = /^[0-9]{5}$/;
    var RegExpEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;

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

    //everything is valid so make cookies 
    // date setup for cookies
    var today = new Date();
    var expdate = today.getTime()+(1000*60*60*24*7);

    document.cookie="firstName="+firstName+";expires="+expdate+";path=/;SameSite ='Lax'";
    document.cookie="lastName="+lastName+";expires="+expdate+";path=/;SameSite ='Lax'";
    document.cookie="email="+email+";expires="+expdate+";path=/;SameSite ='Lax'";

    console.log(document.cookie);


    // Now go to sumbmit.php
    return true;
}
