<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<title>${ title }</title>
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

	<div class="header-top">
		<div class="wrap">
			<div class="cssmenu">
				<ul>
					<li><a href="<%=request.getContextPath()%>/user/login">登录</a></li>
					|
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
					<a href="<%=request.getContextPath()%>/"><img
						src="<%=request.getContextPath()%>/public/images/logo1.png"
						alt="" /></a>
				</div>
			</div>

		</div>
	</div>

	<div class="wrap">
		<div width="50%" float="right">
			<div class="login_account">
				<div class="wrap">
					<h4 class="title">登陆</h4>
					<form class="form-horizontal" id="joinus" name="joinus">
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
							<label for="password" class="col-sm-2 control-label">身份</label>
							<div class="col-sm-4" style="margin-top: 7px;">
								<label style="margin-left: 10px; margin-right: 30px;"> <input
									name="Type" type="radio" value="0" id="organizer" />企业
								</label> <label><input name="Type" type="radio" value="1" checked/>个人
								</label>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" class="grey" id="submit-btn">登陆</button>
								<button type="reset" class="grey" style="margin-left: 20px;">找回密码</button>
								<!-- <button type="submit" class="btn btn-default">Sign in</button> -->
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<input id="appName" type="hidden" value="<%=request.getContextPath() %>">
	</div>

	<%-- <%@ include file="/public/section/footer.jsp" %> --%>
	<script type="text/javascript">
        $(document).ready(function() {
            $("#submit-btn").click(function(){
            	if(document.getElementById("organizer").checked){
					var type = 2;
				}else{
					var type = 1;
				}
                $.ajax({
               		<%-- url: "<%=request.getContextPath()%>/user/login.act", --%>
               		url: $("#appName").val()+"/user/login.act",
               		type: "POST",
               		data: { username: $("#username").val(),
               				password: hex_md5($("#password").val()),
               				type: type
               				},
               		dataType: "JSON",
               		success: function(res) {
               			console.log(res);
               			if(res.code != -1){
               				if(type == 2){
               					location.href = $("#appName").val()+"/organizer/orgcenter";
               				}else{
               					location.href = $("#appName").val();
               				}
               				
               			}else{
               				alert('输入错误！请返回重新输入！');
               				location.href = "";
               			}
               			
               			
               		},
               		error: function(res) {
               			
               			console.log(res);
               			alert('输入错误！请返回重新输入！');
               		}
               	});	                
            });
            
        });
    </script>
</body>
</html>