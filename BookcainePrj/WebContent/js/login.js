window.addEventListener("load", function(){

	var section = document.querySelector("login-info-form");
	var loginButton = section.querySelector("login-button");
	var idInput = section.querySelector("id-input");
	var pwdInput = section.querySelector("pwd-input");
	
	loginButton.onclick = function(e){
		var id = idInput.value;
		var pwd = pwdInput.value;
		
		if(id = null)
			alert("아이디를 입력하세요");
		if(pwd = null)
			alert("비밀번호를 입력하세요");	
	}
	
});