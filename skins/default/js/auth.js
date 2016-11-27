// JavaScript Document
function authGo(){
	var login = document.getElementById('inlog');
	var pass = document.getElementById('inpass');
	if(login.value.length < 4 || login.value.length > 20) {
		document.getElementById('inlog').style.border = '1px solid red';
		document.getElementById('inlog').style.boxShadow = 'inset 0 1px 1px rgba(0,0,0,.075),0 0 20px red';
		document.getElementById('inlog').style.mozShadow = '0 1px 1px rgba(0,0,0,.075),0 0 20px red';
		return false;
	} else {
		document.getElementById('inlog').style.border = '1px solid green';
		document.getElementById('inlog').style.boxShadow = 'inset 0 1px 1px rgba(0,0,0,.075),0 0 20px green';
		document.getElementById('inlog').style.mozShadow = '0 1px 1px rgba(0,0,0,.075),0 0 20px green';
	}
	if(pass.value.length < 6) {
		document.getElementById('inpass').style.border = '1px solid red';
		document.getElementById('inpass').style.boxShadow = 'inset 0 1px 1px rgba(0,0,0,.075),0 0 20px red';
		document.getElementById('inpass').style.mozShadow = '0 1px 1px rgba(0,0,0,.075),0 0 20px red';
		return false;
	} else {
		document.getElementById('inpass').style.border = '1px solid green';
	}
}
