﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<title>${ title }</title>
	<%@ include file="/public/section/header.jsp"%>
</head>
<body>
	
	<input type="hidden" name="appName" id="appName" value="<%%>" />
	<div class="header-top">
		<div class="wrap">
			<div class="cssmenu">
				<ul>
					<li><a href="login.html">登录</a></li> |
					<li><a href="register.html">注册</a></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>


	<div class="header-bottom">
		<div class="wrap">
			<div class="header-bottom-left">
				<!--                网站标题logo-->
				<div class="logo">
					<a href="index.html"><img src="<%=request.getContextPath() %>/public/images/logo1.png"
						alt="" /></a>
				</div>
			</div>

		</div>
	</div>


	<div width="50%" float="right">
		<div class="login_account">
			<div class="wrap">
				<h4 class="title">登陆</h4>
				<form class="form-horizontal" action="" method="post" id="joinus"
					name="joinus">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">账号</label>
						<div class="col-sm-4">
							<input type="input" class="form-control" id="username"
								name="username" placeholder="Username">
						</div>

					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="Password">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="grey" id="submit-btn">登陆</button>
							<button type="reset" class="grey" style="margin-left: 20px;">找回密码</button>
							<!-- <button type="submit" class="btn btn-default">Sign in</button> -->
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/public/section/footer.jsp" %>
	<script type="text/javascript">
        $(document).ready(function() {
            $("#submit-btn").click(function(){
                $.ajax({
               		<%-- url: <%=request.getContextPath()%>+"/user/login", --%>
               		url: "<%=request.getContextPath()%>/user/login",
               		type: "POST",
               		data: { username: $("#username").val(),
               				password: $("#password").val()
               				},
               		dataType: "JSON",
               		success: function(res) {
               			//var res = eval("("+obj+")");
               			
               			location.href = "";    
               		},
               		error: function(res) {
               			
               			console.log(res);
               			alert('输入错误！请返回重新输入！');

               			/* document.getElementById("username").value = res.username;
               			document.getElementById("password").value = res.password; */
               	
               		}
               	});				                
            });
            
        });
    </script>
</body>
</html>