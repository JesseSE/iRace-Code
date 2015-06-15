<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${ title }</title>

<%@ include file="/public/section/header.jsp"%>





<!--展开小组详细信息-->
<script type="text/javascript">
	function upDown(id) {
		var content = document.getElementById(id);
		if (content.style.display == "none") {
			content.style.display = "block";
		} else {
			content.style.display = "none";
		}
	}
</script>

<style type="text/css">
.team-join {
	margin-top: 5px;
	color: #4F7F90;
	float: right;
	cursor: pointer;
}

.team-join:hover {
	text-decoration: underline;
	color: #7A5555;
}

.build-team {
	font-family: 微软雅黑;
	border: 0px;
	padding: 10px;
	color: #FFF;
	background-color: #4cb1ca;
	float: right;
	margin-right: 17px;
	margin-top: -10px;
}
</style>
</head>
<body>
	<div class="header-top">
		<div class="wrap">
			<div class="header-top-left">
				<div class="box">
					<div class="logo" style="margin-top: 8px;">
						<a href="index.html"><img src="images/logo1.png" alt="" /></a>
					</div>
				</div>
				<div class="clear"></div>
			</div>

			<!--用户头像-->
			<div class="cssmenu" role="navigation">
				<ul>
					<li><image src="images/message.png"></image></li>
					<li><a href="##">消息</a></li>|
					<li><image src="images/userican.png"></image></li>

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" role="button"
						aria-expanded="false"> 刘嵩 </a>
						<ul class="dropdown-menu" role="menu">
							<div class="dropdown-header">dropdown header</div>
							<li><a class="dropdown-btn" href="##">个人中心</a> <a
								class="dropdown-btn" href="##">退出登录</a></li>

						</ul></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>

	<div class="header-bottom">
		<div class="wrap">
			<div class="header-bottom-left">
				<div class="logo">
					<a href="index.html"><img src="images/logo1.png" alt="" /></a>
				</div>
			</div>
			<div class="header-bottom-right">
				<div class="search">
					<input type="text" name="s" class="textbox" value="Search"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {this.value = 'Search';}"> <input
						type="submit" value="Subscribe" id="submit" name="submit">
					<div id="response"></div>
				</div>

			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!--报名资料-->
	<div class="register_account" id="applyInfo" style="min-height: 430px;">
		<div class="wrap">
			<h4 class="title" style="font-family: 微软雅黑">填写报名资料</h4>
			<form class="form-horizontal" id="apply" name="apply">
				<div class="form-group">
					<label for="username" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" name="username"
							id="username">
						<h5 id="describe" style="color: #777">你的真实姓名</h5>
					</div>
					<!-- <p id="testP"></p> -->
				</div>
				<div class="form-group">
					<label for="emailad" class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" name="emailad"
							id="emailad">
						<h5 id="describe" style="color: #777">可以联系到的邮箱</h5>
					</div>
					<!-- <p id="testP"></p> -->
				</div>
				<div class="form-group">
					<label for="education" class="col-sm-2 control-label">学历</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" name="education"
							id="education">
						<h5 id="describe" style="color: #777">最高学历</h5>
					</div>
					<!-- <p id="testP"></p> -->
				</div>
				<div class="form-group">
					<label for="school" class="col-sm-2 control-label">学校</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" name="school" id="school">
						<h5 id="describe" style="color: #777">你现在所在的学校</h5>
					</div>
					<!-- <p id="testP"></p> -->
				</div>


				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="grey" onclick="apply()" id="applybtn">提交报名资料</button>
						<button type="reset" class="grey" style="margin-left: 20px;">重置</button>
						<!-- <button type="submit" class="btn btn-default">Sign in</button> -->
					</div>
				</div>
			</form>
		</div>
	</div>
	<!--选择参赛队伍-->
	<div id="chooseTeam" style="display: none; min-height: 430px;">
		<div class="wrap">
			<h4 class="title" style="font-family: 微软雅黑">
				选择参赛队伍
				<button class="build-team" onclick="showBuildTeam();">
					<a style="color: #FFF;">创建一支队伍</a>
				</button>
			</h4>

			<!--GDS软件工程实践课小组-->
			<div class="panel-body">
				<div class="list-group">
					<!--upDown()函数里的参数是小组的id，动态加载时需要将小组id写入布局-->
					<a class="list-group-item list-group-item-success" href="##"
						onclick="upDown('zyxzContent');">
						<h5 style="display: inline;">GDS软件工程实践课小组</h5>
					</a> <a class="list-group-item"> <!--开始展示小组成员-->
						<div id="zyxzContent" style="display: none">
							<div class="panel panel-default">
								<!-- Default panel contents -->
								<!--div class="panel-heading">Panel heading</div-->

								<!-- Table -->
								<table class="table"
									style="word-break: break-all; word-wrap: break-all;">
									<thead style="font-weight: bold;">
										<tr>
											<th>#</th>
											<th>姓名</th>
											<th>邮箱</th>
											<th>电话</th>
											<th>状态</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">1</th>
											<td>Mark</td>
											<td>Otto</td>
											<td>@mdo</td>
											<td>已加入</td>
										</tr>
										<tr style="background-color: #D9EDF7;">
											<th scope="row">2</th>
											<td>Jacob</td>
											<td>Thornton</td>
											<td>@fat</td>
											<td>待审核</td>
										</tr>
										<tr>
											<th scope="row">3</th>
											<td>Larry</td>
											<td>the aaaa</td>
											<td>18811442504</td>
											<td>已加入</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div> <span class="label label-default">比赛名字</span> <span
						class="label label-primary">组长</span> <span
						class="label label-success">口号</span>
						<h5 class="team-join" onclick="alert();">申请加入队伍</h5>
					</a>

				</div>
			</div>
		</div>
	</div>
	<!--创建我的队伍-->
	<div class="register_account" id="buildTeam"
		style="display: none; min-height: 430px;">
		<div class="wrap">
			<h4 class="title" style="font-family: 微软雅黑">创建我的队伍</h4>

			<form class="form-horizontal" action="" method="post" id="joinus"
				name="joinus">
				<div class="form-group">
					<label for="teamname" class="col-sm-2 control-label">队伍名称</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" name="teamname"
							id="teamname">
						<h5 id="describe" style="color: #777">参赛全程将以此小组名进行</h5>
					</div>
					<!-- <p id="testP"></p> -->
				</div>
				<div class="form-group">
					<label for="slogan" class="col-sm-2 control-label">口号</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" name="slogan" id="slogan">
						<h5 id="describe" style="color: #777">队伍的精神</h5>
					</div>
					<!-- <p id="testP"></p> -->
				</div>


				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="grey" onclick="">创建</button>
						<button type="reset" class="grey" style="margin-left: 20px;"
							onclick="showChooseTeam();">放弃</button>
						<!-- <button type="submit" class="btn btn-default">Sign in</button> -->
					</div>
				</div>
			</form>
		</div>
	</div>


	<div class="footer">
		<!--
		<div class="footer-top">
			<div class="wrap">
			  <div class="section group example">
				<div class="col_1_of_2 span_1_of_2">
					<ul class="f-list">
					  <li><img src="img/2.png"><span class="f-text">Free Shipping on orders over $ 100</span><div class="clear"></div></li>
					</ul>
				</div>
				<div class="col_1_of_2 span_1_of_2">
					<ul class="f-list">
					  <li><img src="img/3.png"><span class="f-text">Call us! toll free-222-555-6666 </span><div class="clear"></div></li>
					</ul>
				</div>
				<div class="clear"></div>
		      </div>
			</div>
		</div>
-->

		<div class="footer-bottom">
			<div class="wrap">
				<div class="copy">
					<p>GDS软件工程实践课小组版权所有IRACE</p>
				</div>
				<div class="f-list2">
					<ul>
						<li class="active"><a href="about.html">团队介绍</a></li> |
						<li><a href="delivery.html">网站加盟</a></li> |
						<li><a href="delivery.html">工程介绍</a></li> |
						<li><a href="contact.html">联系我们</a></li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		function apply() {
			//alert("恭喜报名成功！请选择参加比赛的队伍");
			//showChooseTeam();		
			$.ajax({
				url : $("#appName").val() + "/race/applyRace.act",
				type : "POST",
				data : {
					username : $("#username").val(),
					emailad : $("#emailad").val(),
					education : $("#education").val(),
					school : $("#school").val()
				},
				dataType : "JSON",
				success : function(res) {
					//var res = eval("("+obj+")");
					console.log("success!");
					showChooseTeam();
				},
				error : function(res) {
					console.log(res);
					console.log("unsuccess!");
					//alert('输入错误！请返回重新输入！');
				}
			});
		}

		function showChooseTeam() {
			var applyInfo = document.getElementById("applyInfo");
			var chooseTeam = document.getElementById("chooseTeam");
			var buildTeam = document.getElementById("buildTeam");
			applyInfo.style.display = "none";
			buildTeam.style.display = "none";
			chooseTeam.style.display = "block";
			window.location.href = "#";

			$.ajax({
				url : $("#appName").val() + "/race/getRaceList.act",
				type : "POST",
				data : {
					
				},
				dataType : "JSON",
				success : function(res) {
					//var res = eval("("+obj+")");
					console.log("success!");
					//添加已经报名的小组列表
				},
				error : function(res) {
					console.log(res);
					console.log("unsuccess!");
					//alert('输入错误！请返回重新输入！');
				}
			});
		}
		function showBuildTeam() {
			var applyInfo = document.getElementById("applyInfo");
			var chooseTeam = document.getElementById("chooseTeam");
			var buildTeam = document.getElementById("buildTeam");
			applyInfo.style.display = "none";
			buildTeam.style.display = "block";
			chooseTeam.style.display = "none";
			window.location.href = "#";
		}
		function showApplyInfo() {
			var applyInfo = document.getElementById("applyInfo");
			var chooseTeam = document.getElementById("chooseTeam");
			var buildTeam = document.getElementById("buildTeam");
			applyInfo.style.display = "block";
			buildTeam.style.display = "none";
			chooseTeam.style.display = "none";
			window.location.href = "#";
		}
	</script>
</body>
</html>