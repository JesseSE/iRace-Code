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
	function info_edit() {
		var showInfo = document.getElementById("showInfo");
		var modifyInfo = document.getElementById("modifyInfo");
		showInfo.style.display = "none";
		modifyInfo.style.display = "block";
	}

	function submitChange() {
		alert("修改成功！");
		var showInfo = document.getElementById("showInfo");
		var modifyInfo = document.getElementById("modifyInfo");
		showInfo.style.display = "block";
		modifyInfo.style.display = "none";
	}
</script>

</head>
<body>
<!-- 在这里引入登录模块 -->
<%@ include file="/public/section/user-div.jsp" %>

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
		                    <li><a href="<%=request.getContextPath() %>/user/userCenter">我参加的比赛 </a></li>
		                    <li><a href="<%=request.getContextPath() %>/user/userTeam">参加的队伍</a></li>   
		                    <li><a href="<%=request.getContextPath() %>/user/usermsg">通知中心</a></li>  
		                    <li><a href="<%=request.getContextPath() %>/user/userInfo">个人信息<span class="sr-only">(current)</span></a></li>  
		                    <li><a href="<%=request.getContextPath() %>/user/userAccount">账号管理</a></li>                      
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
								个人信息管理
								<div style="float: right;">
									<img style="width: 14px; height: 14px;"
										src="images/edit-icon.jpg"></img> <a onclick="info_edit();"
										style="font-size: 0.7em">编辑资料</a>
								</div>
							</h4>

							<div id="showInfo" style="margin-top: 48px; margin-left: 70px;">
								<table class="formTable"
									style="width: 300px; text-align: justify;">
									<tr
										style="margin-bottom: 10px; color: #000; font-family: 微软雅黑; border: solid 2px #4cb1ca">
										<td style="padding: 10px 10px;">昵称</td>
										<td style="padding: 10px 10px;"><font name="showInfo">
												${ user.getNickname() }
										</font></td>
									</tr>
									<tr
										style="margin-bottom: 10px; color: #000; font-family: 微软雅黑; border: solid 2px #4cb1ca">
										<td style="padding: 10px 10px;">用户名</td>
										<td style="padding: 10px 10px;"><font name="showInfo">
												${ user.getUsername() }
										</font></td>
									</tr>
									<tr
										style="margin-bottom: 10px; color: #000; font-family: 微软雅黑; border: solid 2px #4cb1ca">
										<td style="padding: 10px 10px;">电话</td>
										<td style="padding: 10px 10px;"><font name="showInfo">
										${ user.getTel() }</font>
										</td>
									</tr>
									<tr
										style="margin-bottom: 10px; color: #000; font-family: 微软雅黑; border: solid 2px #4cb1ca">
										<td style="padding: 10px 10px;">性别</td>
										<td style="padding: 10px 10px;"><font name="showInfo">
										${ user.getGender() }</font>
										</td>
									</tr>
									<tr
										style="margin-bottom: 10px; color: #000; font-family: 微软雅黑; border: solid 2px #4cb1ca">
										<td style="padding: 10px 10px;">QQ</td>
										<td style="padding: 10px 10px;"><font name="showInfo">${ user.getQq() }</font>
										</td>
									</tr>
									<tr
										style="margin-bottom: 10px; color: #000; font-family: 微软雅黑; border: solid 2px #4cb1ca">
										<td style="padding: 10px 10px;">学校</td>
										<td style="padding: 10px 10px;"><font name="showInfo">北京交通大学</font>
										</td>
									</tr>
									<tr
										style="margin-bottom: 10px; color: #000; font-family: 微软雅黑; border: solid 2px #4cb1ca">
										<td style="padding: 10px 10px;">专业</td>
										<td style="padding: 10px 10px;"><font name="showInfo">软件工程</font>
										</td>
									</tr>
								</table>

							</div>

							<div id="modifyInfo" style="display: none; margin-top: 40px;">
								<form class="form-horizontal" id="joinus" name="joinus">
									<div class="form-group">
										<label for="username" class="col-sm-2 control-label">昵称</label>
										<div class="col-sm-4">
											<input type="input" class="form-control" id="username"
												name="username" placeholder="<%session.getAttribute("username");%>" readOnly="true"></input>
										</div>
										<div id="warnNickname" color="red"></div>
									</div>
									<div class="form-group">
										<label for="nickname" class="col-sm-2 control-label">昵称</label>
										<div class="col-sm-4">
											<input type="input" class="form-control" id="nickname"
												name="nickname" placeholder="Nickname"></input>
										</div>
										<div id="warnNickname" color="red"></div>
									</div>
									<div class="form-group">
										<label for="email" class="col-sm-2 control-label">电子邮件</label>
										<div class="col-sm-4">
											<input type="input" class="form-control" id="email"
												name="email" placeholder="Email" onblur="check_email()"></input>
										</div>
										<div id="warnEmail" color="red"></div>
									</div>
									<div class="form-group">
										<label for="phone" class="col-sm-2 control-label">电话</label>
										<div class="col-sm-4">
											<input type="tel" class="form-control" id="phone"
												name="phone" placeholder="Phone number"></input>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">性别</label>
										<div class="col-sm-4" id="sexRadio">
											<label class="radio-inline"> <input type="radio"
												name="sexRadioOptions" id="sexManRadio" value="0"> 男</input>
											</label> <label class="radio-inline"> <input type="radio"
												name="sexRadioOptions" id="sexWomanRadio" value="1"> 女</input>
											</label>
										</div>
									</div>
									<div class="form-group">
										<label for="qq" class="col-sm-2 control-label">QQ</label>
										<div class="col-sm-4">
											<input type="input" class="form-control" id="qq" name="qq"
												placeholder="QQ"></input>
										</div>
									</div>
									<div class="form-group">
										<label for="school" class="col-sm-2 control-label">学校</label>
										<div class="col-sm-4">
											<input type="input" class="form-control" id="school"
												name="school" placeholder="School"></input>
										</div>
									</div>
									<div class="form-group">
										<label for="major" class="col-sm-2 control-label">专业</label>
										<div class="col-sm-4">
											<input type="input" class="form-control" id="major"
												name="major" placeholder="Major"></input>
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10"
											style="margin-left: 200px;">
											<button type="button" class="grey" onclick="submitChange()">提交修改</button>
											<!--button style="display:none" type="reset" class="grey" style="margin-left: 20px;">重置</button-->
											<!-- <button type="submit" class="btn btn-default">Sign in</button> -->
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>


					<div class="clear" style="height: 40px;"></div>

					<h2 class="head">猜你喜欢</h2>
					<div class="top-box" id="recommendation"></div>
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
							<img
								src="<%=request.getContextPath()%>/public/images/t-img1.jpg"
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
	<%@ include file="/public/section/upload-file.jsp"%>
	<script
		src="<%=request.getContextPath()%>/public/js/jquery.nivo.slider.js"></script>
	<script type="text/javascript">
		var totalPageNum; //文件列表长度
		var currentPage; //当前页面
		var eachPageNum; //每页显示个数
		var isHeldNow;
		var userID; //用户的ID

		//初始化值
		function initValue() {
			totalPageNum = 1000;
			currentPage = 1;
			eachPageNum = 6;
			isHeldNow = true;
			userID = 1;
		}

		//Ajax函数
		$(document).ready(
				function() {
					$(".inner_content").hover(
							function() {
								$(
										".inner_content#" + this.id
												+ " .product_image .float-Bar")
										.slideToggle();
							});
					$('#slider').nivoSlider();

					//初始化
					initValue();
					getReconmmendation();
				});

		function getReconmmendation() {
			$.ajax({
				url : $("#appName").val() + "/user/getReconmmendation.act",
				type : "POST",
				data : {
					currentpagenum : 1
				},
				dataType : "JSON",
				success : function(res) {
					showReconmmendation(res);
				},
				error : function(res) {
					console.log(res);
					alert('输入错误！请返回重新输入！');
				}
			});
		}

		function showReconmmendation(res) {
			var race = eval(res);
			console.log(res);

			var htmlText = "";
			var cursor = 0;

			for (var j = 0; j < 3; j++) {
				if (cursor < race.length) {
					htmlText = htmlText
							+ "<div class='col_1_of_3 span_1_of_3'>"
							+ "<a href=' "
							+ $("#appName").val()
							+ "/user/single'>"
							+ "<div id='race"+race[cursor].id+"' class='inner_content clearfix'>"
							+ "<div class='product_image'>"
							+ "<img src='"+race[cursor].picUrl+"' alt=''/>"
							+ "<div class='float-Bar'>"
							+ "<div class='float-Bar_left'>"
							+ race[cursor].grade
							+ "</div>"
							+ "<div class='float-Bar_right'>关注人数：233</div>"
							+ "</div></div>"
							+ "<div class='sale-box'><span class='on_sale title_shop'>New</span></div>"
							+ "<div class='price'>" + "<div class='cart-left'>"
							+ "<span class='actual'>" + race[cursor].name
							+ "</span>" + "<div class='price1'>"
							+ "<span class='actual'>"
							+ race[cursor].organizerEntity.name + "</span>"
							+ "</div> </div>" + "<span class='actual'>分类："
							+ race[cursor].typeRaceEntity.name + "</span>"
							+ "<div class='price1'>"
							+ "<span class='actual' font='0.5em'>"
							+ race[cursor].startTime.year + "/"
							+ race[cursor].startTime.month + "-"
							+ race[cursor].endTime.year + "/"
							+ race[cursor].endTime.month + "</span>" + "</div>"
							+ "<div class='clear'></div>"
							+ "</div></div></a></div>";
					cursor++;
				}

			}

			if (htmlText == "")
				$("#recommendation").html("没有内容哦");
			else
				$("#recommendation").html(htmlText);
		}
		
		function submitChange(){
			if(document.getElementById("sexManRadio").checked){
				var sex = 'Man';
			}else{
				var sex = 'Woman';
			}
			$.ajax({
				url : $("#appName").val() + "/user/userInfoChange.act",
				type : "POST",
				data : {
					username : $("#username").val(),
					nickname : $("#nickname").val(),
					email : $("#email").val(),
					phone : $("#phone").val(),
					sexRadio : sex,
					qq : $("#qq").val(),
					school : $("#school").val(),
					major : $("#major").val()
				},
				dataType : "JSON",
				success : function(res) {
					
				},
				error : function(res) {
					console.log(res);
					alert('提交失败，请重新操作！');
				}
			});
		}
	</script>

</body>
</html>