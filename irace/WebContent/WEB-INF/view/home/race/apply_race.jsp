<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<!-- 用户登录信息div -->
	<%@ include file="/public/section/user-div.jsp"%>
	
	
	<input name="groupId" id="groupId" type="hidden" value="${groupId }">
	<input name="raceId" type="hidden" value="${rid }">
	
	<c:if test="${hasApplyed == false }">
	
	<!--报名资料-->
	<div class="register_account" id="applyInfo" style="min-height: 430px; border:0;">
		<div class="wrap">
			<h4 class="title" style="font-family: 微软雅黑">填写报名资料</h4>
			<form action="<%=request.getContextPath() %>/race/applyRace.act" class="form-horizontal" id="apply" name="apply">
				
				<div class="form-group">
					<label for="racename" class="col-sm-2 control-label">比赛名称</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" value="${raceName }" readonly>
					</div>
				</div>
				<div class="form-group">
					<label for="racename" class="col-sm-2 control-label">参加组别</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" value="${groupName }" readonly>
					</div>
				</div>
				
				<c:forEach var="p" items="${propertyList }">
				<div class="form-group">
					<label for="school" class="col-sm-2 control-label">${p.getName() }</label>
					<div class="col-sm-4">
						<input type="input" class="form-control" name="property${p.getId() }" id="property${p.getId() }">
						<h5 id="describe" style="color: #777">${p.getRequires() }</h5>
					</div>
				</div>
				</c:forEach>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="grey" id="applybtn">提交报名资料</button>
						<button type="reset" class="grey" style="margin-left: 20px;">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	</c:if>
	
	<!--选择参赛队伍-->
	<div id="chooseTeam" style="<c:if test='${hasApplyed == false }'>display: none;</c:if> min-height: 430px; margin-top: 60px;">
		<div class="wrap">
			<h4 class="title" style="font-family: 微软雅黑">
				选择参赛队伍
				<button class="build-team" onclick="showBuildTeam();">
					<a style="color: #FFF;">创建一支队伍</a>
				</button>
			</h4>

			<!--GDS软件工程实践课小组-->
			<div class="panel-body">
				
				<!--upDown()函数里的参数是小组的id，动态加载时需要将小组id写入布局-->
				<!-- 
				<div class="list-group">
					
					<a class="list-group-item list-group-item-success" href="##"
						onclick="upDown('zyxzContent');">
						<h5 style="display: inline;">GDS软件工程实践课小组</h5>
					</a>
					<a class="list-group-item">
						<div id="zyxzContent" style="display: none">
							<div class="panel panel-default">
								
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
				 -->
				
				<c:forEach var="t" items="${teamList }">
				<div class="list-group" id="team${t.getId() }">
					<!--upDown()函数里的参数是小组的id，动态加载时需要将小组id写入布局-->
					<a class="list-group-item list-group-item-success" href="#"
						onclick="upDown('zyxzContent');">
						<h5 style="display: inline;">${t.getName() }</h5>
					</a>
					<a class="list-group-item"> <!--开始展示小组成员-->
						<span class="label label-default">${raceName }</span>
						<span class="label label-primary">${t.getUserEntity().getNickname() }</span>
						<span class="label label-success">${t.getSlogan() }</span>
						<h5 class="team-join" onclick="joinTeam(${t.getId() })">申请加入队伍</h5>
					</a>
				</div>
				</c:forEach>
				
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
						<button type="button" class="grey" onclick="createTeam();">创建</button>
						<button type="reset" class="grey" style="margin-left: 20px;"
							onclick="showChooseTeam();">放弃</button>
						<!-- <button type="submit" class="btn btn-default">Sign in</button> -->
					</div>
				</div>
			</form>
		</div>
	</div>


	<%@ include file="/public/section/footer.jsp" %>

	<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/jquery.form.min.js"></script>
	<script type="text/javascript">
		

		function showChooseTeam() {
			var applyInfo = document.getElementById("applyInfo");
			var chooseTeam = document.getElementById("chooseTeam");
			var buildTeam = document.getElementById("buildTeam");
			$("#applyInfo").hide();
			$("#buildTeam").hide();
			$("#chooseTeam").show();

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
			$("#applyInfo").hide();
			$("#buildTeam").show();
			$("#chooseTeam").hide();
		}
		
		function showApplyInfo() {
			var applyInfo = document.getElementById("applyInfo");
			var chooseTeam = document.getElementById("chooseTeam");
			var buildTeam = document.getElementById("buildTeam");
			$("#applyInfo").show();
			$("#buildTeam").hide();
			$("#chooseTeam").hide();
		}
		
		var applyOptions = {
				beforeSubmit: function() {
					var ok = true;
					$("input[id*='property']").each(function(index,ele) {
						if(ele.value == "" && ok) {
							alert("请按要求填写各项信息!");
							ok = false;
						}
					});
					return ok;
				},
				success: function(res) {
					if(res.code == 200) {
						alert("恭喜报名成功！请选择参加比赛的队伍！");
						showChooseTeam();
					} else {
						alert(res.msg);
					}
					
				},
				error: function(e) {
					console.log(e);
				},
				dataType: "JSON",
				resetForm: true,
				timeout: 3000
		};
		
		
		
		$("#apply").submit(function() {
			$("#apply").ajaxSubmit(applyOptions);
			return false;
		});
		
		function createTeam() {
			if($("#slogan").val() == '' || $("#teamname").val() == '') {
				alert("队伍名称和用户名不能为空！");
			} else {
				
				$.ajax({
					url : $("#appName").val() + "/race/createTeam.act",
					type : "POST",
					data : {
						groupId: $("#groupId").val(),
						slogan: $("#slogan").val(),
						name: $("#teamname").val()
					},
					dataType : "JSON",
					success : function(res) {
						if(res.code == 200) {
							alert("创建队伍成功!");
							location.href = $("#appName").val() + '/user/userTeam';
						} else {
							alert(res.msg);
						}
					},
					error : function(res) {
						console.log(res);
					}
				});
			}
			
			
		}
		
		function joinTeam(tid) {
			$.ajax({
				url : $("#appName").val() + "/race/joinTeam.act",
				type : "POST",
				data : {
					groupId: $("#groupId").val(),
					teamId: tid
				},
				dataType : "JSON",
				success : function(res) {
					if(res.code == 200) {
						alert("申请成功发送!");
						location.href = $("#appName").val() + '/user/userTeam';
					} else {
						alert(res.msg);
					}
				},
				error : function(res) {
					console.log(res);
				}
			});
		}
		
	</script>
</body>
</html>