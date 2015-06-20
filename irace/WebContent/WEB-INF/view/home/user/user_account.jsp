<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${ title }</title>
<%@ include file="/public/section/header.jsp"%>

<link href="<%=request.getContextPath()%>/public/css/default.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/public/css/nivo-slider.css"
	rel="stylesheet" type="text/css" media="all" />

<script>
	$(document).ready(function() {
		$(".megamenu").megamenu();
	});
</script>

<script text="text/javascript">
	function changePwd() {
		var userInfo = document.getElementById("userInfo");
		var changePwd = document.getElementById("changePwd");
		userInfo.style.display = "none";
		changePwd.style.display = "block";
	}

	function submitPwd() {
		alert("修改成功！");
		var userInfo = document.getElementById("userInfo");
		var changePwd = document.getElementById("changePwd");
		userInfo.style.display = "block";
		changePwd.style.display = "none";
	}
	function showimg() {
		var img = document.getElementById("upimg").value;
		alert(img);
		document.getElementById("innerImg").src = "images/" + img;
	}
</script>

<style type="text/css">
.headImg {
	box-shadow: 0 0 5px #AAA;
	-webkit-box-shadow: 0 0 5px #AAA;
	-moz-box-shadow: 0 0 5px #AAA;
	-o-box-shadow: 0 0 5px #AAA;
	padding: 22px;
	height: 240px;
}

.innerImg {
	height: 160px;
	width: 200px;
}

.headBtn {
	position: absolute;
	margin-left: 50px;
	margin-top: 7px;
	text-align: center;
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
	top: -60px;
	left: 52px;
}

.headBtn a:hover {
	background: #39a0b9;
}
</style>





</head>
<body>
	<!-- 在这里引入登录模块 -->
	<%@ include file="/public/section/user-div.jsp"%>


	<!--导航栏-->
	<div class="header-bottom" style="margin-top: -10px;">
		<div class="wrap" style="margin-top: -10px;">

			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header"></div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a href="<%=request.getContextPath()%>/user/userCenter">我参加的比赛
							</a></li>
							<li><a href="<%=request.getContextPath()%>/user/userTeam">参加的队伍</a></li>
							<li><a href="<%=request.getContextPath()%>/user/usermsg">通知中心</a></li>
							<li><a href="<%=request.getContextPath()%>/user/userInfo">个人信息</a></li>
							<li><a
								href="<%=request.getContextPath()%>/user/userAccount" style="color: #FFF; background-color: #4cb1ca;">账号管理<span
									class="sr-only">(current)</span></a></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>

		</div>

	</div>



	<!--显示-->
	<div class="main" style="margin-top: -25px;">
		<div class="wrap">
			<div class="section group">
				<div class="cont span_2_of_3">

					<div class="register_account">
						<div class="wrap">
							<h4 class="title" style="font-weight: bold;">
								账号管理
								<div style="float: right;">
									<img style="width: 14px; height: 14px;"
										src="images/edit-icon.jpg"></img> <a onclick="changePwd();"
										style="font-size: 0.7em;">修改密码</a>
								</div>
							</h4>


							<!--div class="top-border"> </div>
				 <div class="border">
				<img src="images/t-img1.jpg" style="float:left; width:30%; height:254px;"></img>
			 <div class="btn"><a href="single.html">Check it Out</a></div>
			 </div-->

							<div
								style="float: left; width: 30%; height: 254px; margin-left: 20px; margin-top: 45px;">
								<div class="top-border"></div>
								<div class="headImg">
									<div id="preview">
										<img id="imghead" class="innerImg" border=0
											src="images/headExmp.jpg" />
									</div>
									<div class="headBtn" id="headBtn">
										<a onclick="changeHead();">更换头像</a><input
											style="display: none" id="upimg" type="file"
											onchange="previewImage(this);" value="更换头像" name="uploadFile" />
									</div>
								</div>
							</div>

							<form class="form-horizontal" id="joinus" name="joinus"
								style="float: right; width: 64%; margin-left: 0px; margin-top: 45px;">
								<div id="userInfo" style="margin-top: 60px; margin-left: 100px;">
									<table class="formTable"
										style="width: 300px; text-align: justify;">
										<tr
											style="margin-bottom: 10px; color: #000; font-family: 微软雅黑; border: solid 2px #4cb1ca">
											<td style="padding: 10px 10px;">用户名</td>
											<td style="padding: 10px 10px;"><font name="showInfo">${ user.getUsername() }</font>
											</td>
										</tr>
										<tr
											style="margin-bottom: 10px; color: #000; font-family: 微软雅黑; border: solid 2px #4cb1ca">
											<td style="padding: 10px 10px;">绑定邮箱</td>
											<td style="padding: 10px 10px;"><font name="showInfo">${ user.getEmail() }</font>
											</td>
										</tr>
										<tr
											style="margin-bottom: 10px; color: #000; font-family: 微软雅黑; border: solid 2px #4cb1ca">
											<td style="padding: 10px 10px;">绑定手机</td>
											<td style="padding: 10px 10px;"><font name="showInfo">${ user.getTel() }</font>
											</td>
										</tr>
									</table>
								</div>

								<div id="changePwd"
									style="display: none; margin-top: 50px; margin-left: 100px;">
									<div class="form-group">
										<label for="oldpassword" class="col-sm-3 control-label">旧密码</label>
										<div class="col-sm-5">
											<input type="password" class="form-control" id="oldpassword"
												name="oldpassword" placeholder="Password"
												onblur="confirm_password()">
										</div>
										<font id="warnOldPassword" color="red"></font>
									</div>

									<div class="form-group">
										<label for="newpassword" class="col-sm-3 control-label">新密码</label>
										<div class="col-sm-5">
											<input type="password" class="form-control" id="newpassword"
												name="newpassword" placeholder="Password"
												onblur="check_password()">
										</div>
										<font id="warnPassword" color="red"></font>
									</div>
									<div class="form-group">
										<label for="repassword" class="col-sm-3 control-label">请确认</label>
										<div class="col-sm-5">
											<input type="password" class="form-control" id="repassword"
												name="repassword" placeholder="rePassword"
												onblur="check_repassword()">
										</div>
										<font id="warnrePassword" color="red"></font>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10"
											style="margin-left: 200px;">
											<button type="button" class="grey" id="submit-btn">提交修改</button>
											<!--button style="display:none" type="reset" class="grey" style="margin-left: 20px;">重置</button-->
											<!-- <button type="submit" class="btn btn-default">Sign in</button> -->
										</div>
									</div>
								</div>
							</form>

							<div style="width: 20%"></div>

						</div>

					</div>
					<div class="clear" style="height: 100px;"></div>

					<h2 class="head">猜你喜欢</h2>
					<div class="top-box" id="recommendation">

					</div>

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
		function changeHead() {
			document.getElementById('upimg').click();
		}
		//图片上传预览    IE是用了滤镜。
		function previewImage(file) {
			var MAXWIDTH = 260;
			var MAXHEIGHT = 180;
			var div = document.getElementById('preview');
			if (file.files && file.files[0]) {
				div.innerHTML = '<img id=imghead>';
				var img = document.getElementById('imghead');
				img.onload = function() {
					var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT,
							img.offsetWidth, img.offsetHeight);
					img.width = rect.width;
					img.height = rect.height;
					//                 img.style.marginLeft = rect.left+'px';
					img.style.marginTop = rect.top + 'px';
				}
				var reader = new FileReader();
				reader.onload = function(evt) {
					img.src = evt.target.result;
				}
				reader.readAsDataURL(file.files[0]);
			} else //兼容IE
			{
				var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
				file.select();
				var src = document.selection.createRange().text;
				div.innerHTML = '<img id=imghead>';
				var img = document.getElementById('imghead');
				img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
				var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth,
						img.offsetHeight);
				status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width
						+ ',' + rect.height);
				div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
			}

			alert("头像修改成功！")
		}
		function clacImgZoomParam(maxWidth, maxHeight, width, height) {
			var param = {
				top : 0,
				left : 0,
				width : width,
				height : height
			};
			if (width > maxWidth || height > maxHeight) {
				rateWidth = width / maxWidth;
				rateHeight = height / maxHeight;

				if (rateWidth > rateHeight) {
					param.width = maxWidth;
					param.height = Math.round(height / rateWidth);
				} else {
					param.width = Math.round(width / rateHeight);
					param.height = maxHeight;
				}
			}

			param.left = Math.round((maxWidth - param.width) / 2);
			param.top = Math.round((maxHeight - param.height) / 2);
			return param;
		}
	</script>

	<script type="text/javascript">
		$(document).ready(function(){	
			$(".inner_content").hover(function() {
		        $(".inner_content#"+this.id+" .product_image .float-Bar").slideToggle();
		    });		
			$('#slider').nivoSlider();
		    getReconmmendation();

			$("#submit-btn").click(function() {
				$.ajax({
					url : $("#appName").val() + "/user/userPasswordChange.act",
					type : "POST",
					data : {
						oldpassword : hex_md5($("#oldpassword").val()),
						newpassword : hex_md5($("#newpassword").val())
					},
					dataType : "JSON",
					success : function(res) {
						alert("success!");
						console.log(res);
						location.href = $("#appName").val() + "/user/userAccount";
					},
					error : function(res) {
						console.log(res);
						alert('提交失败，请重新操作！');
					}
				});
			});
		});
		
		function getReconmmendation(){	
			$.ajax({
	    		url: $("#appName").val()+"/user/getReconmmendation.act",
	    		type: "POST",
	    		data: { currentpagenum: 1},
	    		dataType: "JSON",
	    		success: function(res) {           		
	    			showReconmmendation(res);        			
	    		},
	    		error: function(res) {        			
	    			console.log(res);
	    			alert('输入错误！请返回重新输入！');
	    		}   
			});
		}

		function showReconmmendation(res){		
			var race = eval(res);   
			console.log(res);        	
			
			var htmlText = "";
			var cursor = 0;	
			
			for(var j=0;j<3;j++){
				if(cursor<race.length){
				   htmlText = htmlText + 
	    				 "<div class='col_1_of_3 span_1_of_3'>"+
						 "<a href='single.html'>"+
						 "<div id='race"+race[cursor].id+"' class='inner_content clearfix'>"+
						 "<div class='product_image'>"+
						 "<img src='"+race[cursor].picUrl+"' alt=''/>"+
						 "<div class='float-Bar'>"+
						 "<div class='float-Bar_left'>"+race[cursor].grade+"</div>"+
						 "<div class='float-Bar_right'>关注人数：233</div>"+
						 "</div></div>"+
						 "<div class='sale-box'><span class='on_sale title_shop'>New</span></div>"+
						 "<div class='price'>"+
						 "<div class='cart-left'>"+
						 "<span class='actual'>"+race[cursor].name+"</span>"+
						 "<div class='price1'>"+
						 "<span class='actual'>"+race[cursor].organizerEntity.name+"</span>"+
						 "</div> </div>"+
						 "<span class='actual'>分类："+race[cursor].typeRaceEntity.name+"</span>"+
						 "<div class='price1'>"+
						 "<span class='actual' font='0.5em'>"+ race[cursor].startTime.year +"/" + race[cursor].startTime.month +"-"+ race[cursor].endTime.year +"/" + race[cursor].endTime.month +"</span>"+
						 "</div>"+
						 "<div class='clear'></div>"+
						 "</div></div></a></div>";  					 
				   cursor++;
				}		
								
			}	
			if(htmlText =="")
				$("#recommendation").html(	"没有内容哦");
			else
				$("#recommendation").html(htmlText);
		}

		function confirm_password(){
			//warnOldPassword
			var password = document.getElementById("oldpassword").value;
			if (password == "") {
				document.getElementById("warnOldPassword").innerHTML = 
				'用户名输入不合法，请输入用户名！';
				document.getElementById("oldpassword").value = "";
			};
		}

	</script>
</body>
</html>