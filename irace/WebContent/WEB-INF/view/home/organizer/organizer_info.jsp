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
function info_edit()
{
	var showInfo=document.getElementById("showInfo");
	var modifyInfo=document.getElementById("modifyInfo");
	showInfo.style.display="none";
	modifyInfo.style.display="block";
}

function submitChange()
{
	alert("修改成功！");
	var showInfo=document.getElementById("showInfo");
	var modifyInfo=document.getElementById("modifyInfo");
	showInfo.style.display="block";
	modifyInfo.style.display="none";
}

</script>

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
                    <li><a href="<%=request.getContextPath() %>/organizer/orginfo" style="color:#FFF;background-color:#4cb1ca;">机构信息管理<span class="sr-only">(current)</span></a></li>  
                    <li><a href="<%=request.getContextPath() %>/organizer/orgaccount">机构账号管理</a></li>                   
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
    	      <h4 class="title" style="font-weight:bold;">机构信息管理 
			  <div style="float:right;">
				<img style="width:14px; height:14px;" src="images/edit-icon.jpg"></img>
				<a onclick="info_edit();" style="font-size:0.7em">编辑资料</a>
			  </div>
			  </h4>
			  
			  <div id="showInfo" style="margin-top:48px;margin-bottom:45px;margin-left:70px;">
			  <table class="formTable" style="width:300px;text-align:justify;">
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						机构名称
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo">${ organizer.getName() }</font>
					</td>
				</tr>
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						电子邮件
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo">${ organizer.getEmail() }</font>
					</td>
				</tr>
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						电话
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo">${ organizer.getTel() }</font>
					</td>
				</tr>
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						城市
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo">${ organizer.getCity() }</font>
					</td>
				</tr>
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						Comment
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo">${ organizer.getComment() }</font>
					</td>
				</tr>
				</table>
			  
			  </div>
			  
			  <div id="modifyInfo" style="display:none;margin-top:5px;margin-bottom:18px;">
		    	<form class="form-horizontal" id="joinus" name="joinus">
				  <div class="form-group">
				    <label for="organizername" class="col-sm-2 control-label">机构名称</label>
				    <div class="col-sm-4">
				      <input type="input" class="form-control" id="organizername" name="organizername" placeholder="${ organizer.getName() }" readOnly="true"></input>
				    </div>
				    <div id="warnNickname" color="red"></div>
				  </div>
				  <div class="form-group">
				    <label for="email" class="col-sm-2 control-label">电子邮件</label>
				    <div class="col-sm-4">
				      <input type="input" class="form-control" id="email" name="email" placeholder="${ organizer.getEmail() }" onblur="check_email()"></input>
					</div>
				    <div id="warnEmail" color="red"></div>
				  </div>
				  <div class="form-group">
				    <label for="phone" class="col-sm-2 control-label">电话</label>
				    <div class="col-sm-4">
				      <input type="tel" class="form-control" id="phone" name="phone" placeholder="${ organizer.getTel() }"></input>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="city" class="col-sm-2 control-label">城市</label>
				    <div class="col-sm-4">
				      <input type="input" class="form-control" id="city" name="city" placeholder="${ organizer.getCity() }"></input>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="comment" class="col-sm-2 control-label">Comment</label>
				    <div class="col-sm-4">
				      <input type="input" class="form-control" id="comment" name="comment" placeholder="Commet"></input>
				    </div>
				  </div>

				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10" style="margin-left:200px;">
				      <button type="button" class="grey" id="submit-btn">提交修改</button>
				      <!--button style="display:none" type="reset" class="grey" style="margin-left: 20px;">重置</button-->
				      <!-- <button type="submit" class="btn btn-default">Sign in</button> -->
				    </div>
				  </div>
				</form>
				</div>
    		</div>
    	</div>	
				   
			
			</div>	            		 						 			    
		  </div>
            
            
            
         <!--侧边开始-->
		<div class="rsidebar span_1_of_left">
           <div class="top-border"> </div>
			<div class="sidebar-bottom">
			    <h2 class="m_1">新的比赛<br> 创建</h2>
			    <p class="m_text">您可以通过我们网站定制并发布自己的比赛</p>
			    <div class="subscribe">
					 <form>
					    <!-- <input name="userName" type="text" class="textbox"> -->
					    <input type="submit" value="定制" id="addNewRace">
					 </form>
	  			</div>
			</div>
	    </div>
	    <!-- 侧边结束 -->
    
    
   	<!-- 页底开始  -->
    
	<!-- 页底结束  -->
	
	<!-- 取得用户id -->
	<input id="orIDHtml" type="hidden" value="<%=session.getAttribute("oid") %>">

	<script type="text/javascript">
		$(document).ready(function(){	
			$("#submit-btn").click(function() {
				$.ajax({
					url : $("#appName").val() + "/organizer/organizerInfoChange.act",
					type : "POST",
					data : {
						organizername : $("#organizername").val(),
						email : $("#email").val(),
						phone : $("#phone").val(),
						city : $("#city").val(),
						comment : $("#comment").val()
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