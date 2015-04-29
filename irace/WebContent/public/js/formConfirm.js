
	function testP(){
		document.getElementById("testP").innerHTML = 'test';
	}
	//除去两边空格
	function trim(str){
	  return str.replace(/(^\s*)|(\s*$)/g, "");
	}

	function check_username(){
		var username = document.getElementById("username").value;
		username = trim(username);
		if(username == ""){
			//alert("用户名输入不合法，请输入用户名！");
			document.getElementById("warnUsername").innerHTML = '用户名输入不合法，请输入用户名！';
			document.getElementById("username").value = "";
			document.getElementById("username").focus();
			return(1);
			//document.getElementById("username").focus();
		}else{
			document.getElementById("warnUsername").innerHTML = '';
		}
		return(0);
	}

	function check_usernum(){
		var usernum = document.getElementById("usernum").value;
		usernum = trim(usernum);
		if(usernum == ""){
			alert("学号为空，请输入学号！");
			document.getElementById("usernum").value = "";
			return(1);
		}else{

		}
		return(0);
	}

	function check_password(){
		var password = document.getElementById("password").value;
		if (password == "") {
			document.getElementById("warnPassword").innerHTML = '密码为空，请输入！';
			document.getElementById("password").focus();
			return(1);
		} else {
			document.getElementById("warnPassword").innerHTML = '';
		}
		return(0);
	}

	function check_repassword(){
		var password = document.getElementById("password").value;
		var repassword = document.getElementById("repassword").value;
		password = trim(password);
		repassword = trim(repassword);
		if (repassword == "") {
			document.getElementById("warnrePassword").innerHTML = '重复密码为空，请输入！';
			document.getElementById("repassword").focus();
			return(1);
		}else{
			document.getElementById("warnrePassword").innerHTML = '';
		}
		if (password !== repassword) {
			//alert("两次密码输入不一致，请重新输入");
			document.getElementById("warnrePassword").innerHTML = '两次密码输入不一致，请重新输入!';
			document.getElementById("repassword").focus();
			return(1);
		}else{
			document.getElementById("warnrePassword").innerHTML = '';
		}
		return(0);
	}

	function check_email(){
		var emailad = document.getElementById("email").value;
		emailad = trim(emailad);
		//alert(emailad + + "   " + email_test(emailad));
		if (email_test(emailad)) {
			//alert("邮箱地址输入不规范，请重新输入！");
			document.getElementById("warnEmail").innerHTML = '邮箱地址输入不规范，请重新输入！';
			document.getElementById("email").focus();
			return(1);
		}else{
			document.getElementById("warnEmail").innerHTML = '';
		}
		return(0);
	}

	function chongzhi(){
		document.getElementById("username").value = "";
		document.getElementById("usernum").value = "";
		document.getElementById("password").value = "";
		document.getElementById("repassword").value = "";
		document.getElementById("email").value = "";
	}

	function tijiao(){
		if (yanzheng() == 1) {
			document.getElementById("joinus").submit();
		}else{
			alert("提交失败，请重新操作！");
		};
	}
	function yanzheng(){
		if (check_username()) {
			//alert("2用户名输入不合法，请输入用户名！");
			return(0);
		};
		if (check_password()) {
			//alert("2两次密码输入不一致，请重新输入");
			document.getElementById("password").focus();
			return(0);
		};
		if (check_repassword()) {
			//alert("2两次密码输入不一致，请重新输入");
			document.getElementById("password").focus();
			return(0);
		};
		if (check_email()) {
			//alert("2邮箱地址输入不规范，请重新输入!");
			return(0);
		};
		return(1);
	}

		function char_test(chr)
		//字符检测函数
		{
			var i;
			var smallch="abcdefghijklmnopqrstuvwxyz";
			var bigch="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			for(i=0;i<26;i++)
			if(chr==smallch.charAt(i) || chr==bigch.charAt(i))
			  return(1);
			return(0);
		}

		function spchar_test(chr)
		//数字和特殊字符检测函数
		{
			var i;
			var spch="_-.0123456789";
			for (i=0;i<13;i++)
			  if(chr==spch.charAt(i))
			  return(1);
			return(0);
		}

		function email_test(str)
		{
			var i,flag=0;
			var at_symbol=0;
			//“@”检测的位置
			var dot_symbol=0;
			//“.”检测的位置
			//if(char_test(str.charAt(0))==0 )
			//return (1);
			//首字符必须用字母

			for (i=1;i<str.length;i++)
			if(str.charAt(i)=='@')
			  {
			  at_symbol=i;
			  break;
			  }
			//检测“@”的位置

			if(at_symbol==str.length-1 || at_symbol==0)
			return(2);
			//没有邮件服务器域名

			if(at_symbol<3)
			return(3);
			//帐号少于三个字符

			if(at_symbol>19 )
			return(4);
			//帐号多于十九个字符

			for(i=1;i<at_symbol;i++)
			if(char_test(str.charAt(i))==0 && spchar_test(str.charAt(i))==0)
			  return (5);
			for(i=at_symbol+1;i<str.length;i++)
			if(char_test(str.charAt(i))==0 && spchar_test(str.charAt(i))==0)
			  return (5);
			//不能用其它的特殊字符   
			  
			for(i=at_symbol+1;i<str.length;i++)
				if(str.charAt(i)=='.') dot_symbol=i;
				for(i=at_symbol+1;i<str.length;i++)
					if(dot_symbol==0 || dot_symbol==str.length-1)
			//简单的检测有没有“.”，以确定服务器名是否合法
						return (6);
			  
			return (0);
			//邮件名合法
		}