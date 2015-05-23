<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${ title }</title>
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/irace/public/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href='/irace/public/css/family.css' rel='stylesheet'
	type='text/css'>

<link href='/irace/public/bootstrap-3.3.4-dist/css/bootstrap.min.css'
	rel='stylesheet' type='text/css'>
<link
	href='/irace/public/bootstrap-3.3.4-dist/css/bootstrap-theme.min.css'
	rel='stylesheet' type='text/css'>

start menu
<link href="/irace/public/css/megamenu.css" rel="stylesheet"
	type="text/css" media="all" />
<script type="text/javascript" src="/irace/public/js/megamenu.js"></script>


<script type="text/javascript"
	src="/irace/public/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="/irace/public/js/formConfirm.js"></script>
<script src="/irace/public/js/jquery.easydropdown.js"></script>
<script src="/irace/public/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){$(".megamenu").megamenu();});
</script> -->

<%@ include file="/public/section/header.jsp"%>

<link href="<%=request.getContextPath()%>/public/css/default.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/public/css/nivo-slider.css"
	rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/public/js/formConfirm.js"></script>
	<script type="text/javascript"
	src="<%=request.getContextPath()%>/public/js/md5-v2.2.js"></script>


</head>
<body>
	
	<%-- <input type="hidden" name="appName" id="appName" value="<% %>" /> --%>
	<div class="header-top">
		<div class="wrap">
			<div class="cssmenu">
				<ul>
					<li><a href="<%=request.getContextPath()%>/user/login">登录</a></li>
					<li><a href="<%=request.getContextPath()%>/user/register">注册</a></li>
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
					<a href="index.html"><img src="/irace/public/images/logo1.png"
						alt="" /></a>
				</div>
			</div>

		</div>
	</div>

	<div class="register_account">
		<div class="wrap">
			<h4 class="title">新用户注册</h4>
			<form class="form-horizontal" id="joinus"
				name="joinus">
				<div class="form-group">
					<label for="username" class="col-sm-2 control-label">账号</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" id="username"
							name="username" placeholder="Username" onblur="check_username()">
					</div>
					<font id="warnUsername" color="red"></font>
					<!-- <p id="testP"></p> -->
				</div>
				<div class="form-group">
					<label for="password" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="Password" onblur="check_password()">
					</div>
					<font id="warnPassword" color="red"></font>
				</div>
				<div class="form-group">
					<label for="repassword" class="col-sm-2 control-label">密码确认</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" id="repassword"
							name="repassword" placeholder="rePassword"
							onblur="check_repassword()">
					</div>
					<font id="warnrePassword" color="red"></font>
				</div>
				<div class="form-group">
					<label for="nickname" class="col-sm-2 control-label">昵称</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" id="nickname"
							name="nickname" placeholder="Nickname">
					</div>
					<font id="warnNickname" color="red"></font>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-2 control-label">电子邮件</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" id="email" name="email"
							placeholder="Email" onblur="check_email()">
					</div>
					<font id="warnEmail" color="red"></font>
				</div>
				<div class="form-group">
					<label for="phone" class="col-sm-2 control-label">电话</label>
					<div class="col-sm-4">
						<input type="tel" class="form-control" id="phone" name="phone"
							placeholder="Phone number">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">性别</label>
					<div class="col-sm-4">
						<label class="radio-inline"> <input type="radio"
							name="sexRadio" id="sexManRadio" > 男
						</label> <label class="radio-inline"> <input type="radio"
							name="sexRadio" id="sexWomanRadio"> 女
						</label>
					</div>
				</div>
				<div class="form-group">
					<label for="qq" class="col-sm-2 control-label">QQ</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" id="qq" name="qq"
							placeholder="QQ">
					</div>
				</div>
				<div class="form-group">
					<label for="school" class="col-sm-2 control-label">学校</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" id="school" name="school"
							placeholder="School">
					</div>
				</div>
				<div class="form-group">
					<label for="major" class="col-sm-2 control-label">专业</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" id="major" name="major"
							placeholder="Major">
					</div>
				</div>
				
				<div class="form-group">
				    <label for="major" class="col-sm-2 control-label">上传头像</label>
				    <div class="col-sm-4">
				      <input type="file" class="form-control" id="image" name="image" placeholder="image">
				    </div>
				  </div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="grey" id="submit-btn">提交</button>
						<button type="reset" class="grey" style="margin-left: 20px;">重置</button>
						<!-- <button type="submit" class="btn btn-default">Sign in</button> -->
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/public/section/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#submit-btn").click(function() {
				if (yanzheng() != 1) {
					alert("提交失败，请重新操作！");
					return;
				};
				if(document.getElementById("sexManRadio").checked){
					var sex = 'Man';
				}else{
					var sex = 'Woman';
				}
				$.ajax({
					url : $("#appName").val() + "/user/register.act",
					type : "POST",
					data : {
						username : $("#username").val(),
						password : hex_md5($("#password").val()),
						repassword : hex_md5($("#repassword").val()),
						nickname : $("#nickname").val(),
						email : $("#email").val(),
						phone : $("#phone").val(),
						sexRadio : sex,
						qq : $("#qq").val(),
						school : $("#school").val(),
						major : $("#major").val(),
						major : $("#image").val()
					},
					dataType : "JSON",
					success : function(res) {
						//var res = eval("("+obj+")");
						console.log("登陆success!");
						location.href = $("#appName").val() + "/user/index";
					},
					error : function(res) {

						console.log(res);
						console.log("unsuccess!");
						//alert('输入错误！请返回重新输入！');
					}
				});
			});

		});
	</script>
</body>
</html>