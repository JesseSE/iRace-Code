<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${ title }</title>

<%@ include file="/public/section/header.jsp"%>

<script text="text/javascript">
function changePwd()
{
	var userInfo = document.getElementById("userInfo");
	var changePwd = document.getElementById("changePwd");
	userInfo.style.display="none";
	changePwd.style.display="block";
}

function submitPwd()
{
	alert("修改成功！");
	var userInfo = document.getElementById("userInfo");
	var changePwd = document.getElementById("changePwd");
	userInfo.style.display="block";
	changePwd.style.display="none";
}

</script>

<style type="text/css">
.headImg {
	box-shadow: 0 0 5px #AAA;
	-webkit-box-shadow: 0 0 5px #AAA;
	-moz-box-shadow: 0 0 5px #AAA;
	-o-box-shadow: 0 0 5px #AAA;
	padding: 22px;
	
	height:240px;
}
.innerImg {
	height:160px;
	width:200px;
}

.headBtn{
	position: absolute;
	margin-left:50px;
	margin-top:7px;
	text-align:center;
	z-index: 9999;
}
.headBtn a {
	border: none;
	color: #FFF;
	cursor: pointer;
	padding: 8px 20px;
	display: inline-block;
	font-size: 1em;
	outline: none;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
	background: #4CB1CA;
	top:-60px;
	left: 52px;
}
.headBtn a:hover{
	background:#39a0b9;
}
</style>

</head>
<body>
 <!-- 在这里引入登录模块 -->
	<%@ include file="/public/section/user-div.jsp"%>
    
    
    <!--导航栏-->
	<div class="header-bottom" style="margin-top:-10px;">
	    <div class="wrap" style="margin-top:-10px;">
            
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">      
                 
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav" style="font-family:微软雅黑;">
                    <li><a href="<%=request.getContextPath() %>/organizer/orgcenter">比赛管理</a></li>
                    <li><a href="<%=request.getContextPath() %>/organizer/orginfo">机构信息管理</a></li> 
                    <li><a href="<%=request.getContextPath() %>/organizer/orgaccount" style="color:#FFF;background-color:#4cb1ca;">机构账号管理<span class="sr-only">(current)</span></a></li>                   
                  </ul>           
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
            </nav>           
            
         </div>      
        
	</div>  
    
    
    
<!--显示-->
<div class="main" style="margin-top:-25px;">
	<div class="wrap">
		<div class="section group">            
		  <div class="cont span_2_of_3">
              
			<div class="register_account">
          	<div class="wrap">
    	      <h4 class="title" style="font-weight:bold;">机构账号管理 
			  <div style="float:right;">
				<img style="width:14px; height:14px;" src="images/edit-icon.jpg"></img>
				<a onclick="changePwd();" style="font-size:0.7em;">修改密码</a>
			  </div>
			  </h4>
			  
			 
			
		    <form class="form-horizontal" id="joinus" name="joinus" style="float:lefgt; width:64%; margin-left:0px;margin-top:45px;">
				
				<!--显示账号信息部分-->
				<div id="userInfo" style="margin-top:60px;margin-left:100px;margin-bottom:19px;">
				<table class="formTable" style="width:300px;text-align:justify;">
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						账号名
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo">${ organizer.getUsername() }</font>
					</td>
				</tr>
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						联系邮箱
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo">${ organizer.getEmail() }</font>
					</td>
				</tr>
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						联系电话
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo">${ organizer.getTel() }</font>
					</td>
				</tr>
				</table>
				 </div>
				  
				  <!--显示密码修改部分-->
				  <div id="changePwd" style="display:none;margin-top:50px;margin-left:100px;margin-bottom:-38px;">
				  <div class="form-group" >
				    <label for="oldpassword" class="col-sm-3 control-label">旧密码</label>
				    <div class="col-sm-5">
				      <input type="password" class="form-control" id="oldpassword" name="oldpassword" placeholder="Password" onblur="confirm_password()">
				    </div>
				    <font id="warnPassword" color="red"></font>
				  </div>
				  
				  <div class="form-group">
				    <label for="newpassword" class="col-sm-3 control-label">新密码</label>
				    <div class="col-sm-5">
				      <input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="Password" onblur="check_password()">
				    </div>
				    <font id="warnPassword" color="red"></font>
				  </div>
				  <div class="form-group">
				    <label for="repassword" class="col-sm-3 control-label">请确认</label>
				    <div class="col-sm-5">
				      <input type="password" class="form-control" id="repassword" name="repassword" placeholder="rePassword" onblur="check_repassword()">
				    </div>
				    <font id="warnrePassword" color="red"></font>
				  </div>
				 <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10" style="margin-left:200px;">
				      <button type="button" class="grey" id="submit-btn">提交修改</button>
				      <!--button style="display:none" type="reset" class="grey" style="margin-left: 20px;">重置</button-->
				      <!-- <button type="submit" class="btn btn-default">Sign in</button> -->
				    </div>
				  </div>
				  </div>
				</form>
				
				<div style="width:20%">
				</div>

			  </div>
			
    	</div>	
		<div class="clear" style="height:100px;"></div>
			
				<div class="clear"></div>
			</div>	            		 						 			    
		  </div>
            
            
            
            <!--侧边-->
			<div class="rsidebar span_1_of_left">
				<div class="top-border"></div>
				<div class="border">
					<link href="<%=request.getContextPath()%>/public/css/default.css"
						rel="stylesheet" type="text/css" media="all" />
					<link
						href="<%=request.getContextPath()%>/public/css/nivo-slider.css"
						rel="stylesheet" type="text/css" media="all" />
					<script
						src="<%=request.getContextPath()%>/public/js/jquery.nivo.slider.js"></script>
					<script type="text/javascript">
						$(window).load(function() {
							$('#slider').nivoSlider();
						});
					</script>
					<div class="slider-wrapper theme-default">
						<div id="slider" class="nivoSlider">
							<img src="<%=request.getContextPath()%>/public/images/t-img1.jpg"
								alt="" /> <img
								src="<%=request.getContextPath()%>/public/images/t-img2.jpg"
								alt="" /> <img
								src="<%=request.getContextPath()%>/public/images/t-img3.jpg"
								alt="" />
						</div>
					</div>
					<div class="btn">
						<a href="single.html">Check it Out</a>
					</div>
				</div>
				<div class="top-border"></div>
				<div class="sidebar-bottom">
					<h2 class="m_1">
						新的比赛<br> 创建
					</h2>
					<p class="m_text">您可以通过我们网站定制并发布自己的比赛</p>
					<div class="subscribe">
						<form>
							<input name="userName" type="text" class="textbox"> <input
								type="submit" value="定制">
						</form>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	</div>
    
    
   <%@ include file="/public/section/footer.jsp"%>

	<!-- 引入文件上传弹窗 -->
	<!-- <h3 class='team-state-submit' data-toggle='modal' data-target='#myModal' onclick="setApplyIdForSubmit(1)">比赛正在进行，点击提交阶段产物</h3> -->

	<%@ include file="/public/section/upload-file.jsp"%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/public/js/md5-v2.2.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){	
			$("#submit-btn").click(function() {
				$.ajax({
					url : $("#appName").val() + "/organizer/organizerPasswordChange.act",
					type : "POST",
					data : {
						oldpassword : hex_md5($("#oldpassword").val()),
						newpassword : hex_md5($("#newpassword").val())
					},
					dataType : "JSON",
					success : function(res) {
						alert("修改成功！!");
						console.log(res);
						location.href = $("#appName").val() + "/organizer/orgaccount";
					},
					error : function(res) {
						console.log(res);
						alert('提交失败，请重新操作！');
					}
				});
			});
		});
	</script>
</body>
</html>