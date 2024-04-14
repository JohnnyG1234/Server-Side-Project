

const submitForm = () => {

    validateData();
       
}

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

    RegExpText = /^[A-Z a-z]+$/;
	RegExpST = /^[A-Za-z]{2}$/;
    RegExpZip = /^[0-9]{5}$/;

    if(!RegExpText.test(firstName))
    {
        alert('Invalid input: First Name');
		document.form.firstname.focus();
		document.form.firstname.select();
		document.form.firstname.backgroundColor = '#ffcccc';
		return false; /*Keeps the user in the webpage*/     
    }

    //everything is valid
    cookieData();
    return true;
}


const cookieData = () => {
    console.log("cookie!")
}