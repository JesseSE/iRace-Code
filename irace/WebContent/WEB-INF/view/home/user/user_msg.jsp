<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${ title }</title>
<%@ include file="/public/section/header.jsp"%>
<link href="<%=request.getContextPath()%>/public/css/default.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath()%>/public/css/nivo-slider.css"
	rel="stylesheet" type="text/css" media="all" />

<style type="text/css">
.msg-state-tag {
	color: #4F7F90;
	float: right;
	cursor: pointer;
}

.msg-state-tag:hover {
	text-decoration: underline;
	color: #7A5555;
}

.msg-state-haveRead {
	color: #7A5555;
	float: right;
}
</style>

<script type="text/javascript">
	function upDown(id) {
		var msgFlagId = "msg" + id;
		var content = document.getElementById(msgFlagId);
		if (content.style.display == "none") {
			content.style.display = "block";
		} else {
			content.style.display = "none";
		}
	}

	function msgTab(pos) {
		var tab1 = document.getElementById("tab1");
		var tab2 = document.getElementById("tab2");
		var raceDiv1 = document.getElementById("notRead");
		var raceDiv2 = document.getElementById("haveRead");

		if (pos == 1) {
			tab1.style.backgroundColor = "#DFF0D8";
			tab2.style.backgroundColor = "";
			raceDiv1.style.display = "block";
			raceDiv2.style.display = "none";
		} else if (pos == 2) {
			tab2.style.backgroundColor = "#DFF0D8";
			tab1.style.backgroundColor = "";
			raceDiv1.style.display = "none";
			raceDiv2.style.display = "block";
		} else {
		}
	}
</script>


</head>
<body>
	<!-- 一引入公共的用户注册登录栏 -->
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
					<ul class="nav navbar-nav" style="font-family: 微软雅黑;">
						<li><a href="<%=request.getContextPath()%>/user/userCenter">我参加的比赛
								<span class="sr-only">(current)</span>
						</a></li>
						<li><a href="<%=request.getContextPath()%>/user/userTeam">参加的队伍</a></li>
						<li><a href="<%=request.getContextPath()%>/user/userCenter"
							style="color: #FFF; background-color: #4cb1ca;">通知中心</a></li>
						<li><a href="<%=request.getContextPath()%>/user/userCenter">个人信息</a></li>
						<li><a href="<%=request.getContextPath()%>/user/userCenter">账号管理</a></li>
					</ul>
				</div>
			</div>
			</nav>
		</div>
	</div>
	<!-- 导航栏结束 -->



	<!--显示-->
	<div class="main" style="margin-top: -25px;">
		<div class="wrap">
			<div class="section group">
				<div class="cont span_2_of_3">

					<!-- 通知开始 -->
					<div class="top-box" name="my_msg" style="font-family: 微软雅黑;">
						<ul class="nav nav-tabs">
							<li role="presentation" class="active"><a href="##"
								id="tab1" onclick="msgTab(1);"
								style="background-color: #DFF0D8;"><h4>未阅读</h4></a></li>
							<li role="presentation" class="active"><a href="##"
								id="tab2" onclick="msgTab(2);"><h4>已阅读</h4></a></li>
						</ul>

						<!-- 未阅读的通知 -->
						<div id="notRead" style="display: block">
							<div class="panel panel-default">
								<a name="race_default"></a>
								<div class="panel-body" id="newMessage">

									<!-- 一条通知开始 -->
									<div class="list-group">
										<a class="list-group-item list-group-item-success" href="##"
											onclick="upDown('msg1');">
											<h3 style="display: inline;">《关于提交第一次材料的通知》</h3>
										</a> <a class="list-group-item">

											<div id="msg1" style="display: none">
												<table class="table"
													style="word-break: break-all; word-wrap: break-all;">
													<th>ootstrap，来自 Twitter，是目前最受欢迎的前端框架。Bootstrap 是基于
														HTML、CSS、JAVASCRIPT 的，它简洁灵活，使得 Web 开发更加快捷。[1]
														它由Twitter的设计师Mark Otto和Jacob
														Thornton合作开发，是一个CSS/HTML框架。Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。Bootstrap一经推出后颇受欢迎，一直是GitHub上的热门开源项目，包括NASA的MSNBC（微软全国广播公司）的Breaking
														News都使用了该项目。</th>
												</table>
											</div> <span class="label label-default">发送者：中国软件协会</span> <span
											class="label label-primary">接收方：GDS小组</span> <span
											class="label label-success">所属比赛：大学生创新创业大赛</span> <span
											class="label label-info">发送时间：2016/04/28 21:38</span>
											<h3 class="msg-state-tag">点击标记为已读</h3>
										</a>
									</div>
									<!-- 一条通知结束 -->

								</div>
							</div>
						</div>
						<!-- 未阅读的通知结束 -->

						<!-- 已经阅读的通知 -->
						<div id="haveRead" style="display: none">
							<div class="panel panel-default">
								<a name="race_default"></a>
								<div class="panel-body" id="oldMessage">

									<!-- 一条通知开始 -->
									<div class="list-group">
										<a class="list-group-item list-group-item-success" href="##"
											onclick="upDown('msg3');">
											<h3 style="display: inline;">《关于提交第一次材料的通知》</h3>
										</a> <a class="list-group-item">

											<div id="msg3" style="display: none">
												<table class="table"
													style="word-break: break-all; word-wrap: break-all;">
													<th>ootstrap，来自 Twitter，是目前最受欢迎的前端框架。Bootstrap 是基于
														HTML、CSS、JAVASCRIPT 的，它简洁灵活，使得 Web 开发更加快捷。[1]
														它由Twitter的设计师Mark Otto和Jacob
														Thornton合作开发，是一个CSS/HTML框架。Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。Bootstrap一经推出后颇受欢迎，一直是GitHub上的热门开源项目，包括NASA的MSNBC（微软全国广播公司）的Breaking
														News都使用了该项目。</th>
												</table>
											</div> <span class="label label-default">发送者：中国软件协会</span> <span
											class="label label-primary">接收方：GDS小组</span> <span
											class="label label-success">所属比赛：大学生创新创业大赛</span> <span
											class="label label-info">发送时间：2016/04/28 21:38</span>
											<h3 class="msg-state-haveRead">已读</h3>
										</a>
									</div>
									<!-- 一条通知结束 -->

								</div>
							</div>
						</div>
						<!-- 已阅读的通知结束 -->


						<div class="clear"></div>

						<!--分页-->
						<nav style="text-align:center">
						<ul class="pagination">
							<li><a href="#" aria-label="Previous" id="prePage"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#" aria-label="Next" id="nextPage"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
						</nav>

					</div>
					<!-- 通知结束 -->

					<!-- 在这里显示推介的比赛 -->
					<h2 class="head">猜你喜欢</h2>
					<div class="top-box" id="recommendation">
					
					</div>
					
					<div class="clear"></div>
				</div>
			</div>



			<!--侧边开始-->
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
						<a href="<%=request.getContextPath()%>/public/single.html">Check
							it Out</a>
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
			<!-- 侧边结束 -->

			<div class="clear"></div>
		</div>
	</div>
	<!-- 主体结束 -->


	<div class="footer">
		<div class="footer-middle">
			<div class="wrap">
				<div class="copy">
					<p>
						GDS软件工程实践课小组版权所有<a target="_blank" href="##">IRACE</a>
					</p>
				</div>
				<div class="f-list2">
					<ul>
						<li class="active"><a href="##">团队介绍</a></li> |
						<li><a href="##">网站加盟</a></li> |
						<li><a href="##">工程介绍</a></li> |
						<li><a href="##">联系我们</a></li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>

	<%@ include file="/public/section/footer.jsp"%>
	<script
		src="<%=request.getContextPath()%>/public/js/jquery.nivo.slider.js">
	</script>
	<script type="text/javascript"> 
	var totalPageNum;  //文件列表长度
	var currentPage; //当前页面
	var eachPageNum; //每页显示个数
	var isHeldNow;
	var userID; //用户的ID
	
	//初始化值
	function initValue(){
		totalPageNum = 1000;
		currentPage = 1;
		eachPageNum = 6;
		isHeldNow = true;
		userID = 1;
	}
	
	//前一页
	function prePage(){
		if(currentPage > 1){
			currentPage = currentPage -1;			
			return true;
		}else{
			alert("已经是第一页了哦！");
			return false;
		}
	}
	
	//下一页
	function nextPage(){
		if(currentPage < totalPageNum){
			currentPage = currentPage + 1;
			return true;
		}else{
			alert("已经是最后一页了哦！");
			return false;
		}
			
	}
	
	
	//Ajax函数
	$(document).ready(function(){		
		$(".inner_content").hover(function() {
	        $(".inner_content#"+this.id+" .product_image .float-Bar").slideToggle();
	    });		
		$('#slider').nivoSlider();
		
		//初始化
	    initValue();
	    //document.getElementById("nm").style.display="";
    	//document.getElementById("om").style.display="none";
    	getNewMessage();
	    getReconmmendation();
	    
	    //点击正在参加的比赛
	    $("#tab1").click(function(){
	    	//document.getElementById("nm").style.display="";
	    	//document.getElementById("om").style.display="none";
	    	initValue();
	    	getNewMessage();
	    });
	    //点击以前参加的比赛
	    $("#tab2").click(function(){
	    	//document.getElementById("nm").style.display="none";
	    	//document.getElementById("om").style.display="";
	    	initValue();
	    	isHeldNow = false;
	    	getOldMessage();
	    });
	
	    //点击前一页
	    $("#prePage").click(function(){
	    	if(prePage())
	    		if(isHeldNow)
	    			getNewMessage();
	    		else
	    			getOldMessage();
	    });
	   //点击后一页
	    $("#nextPage").click(function(){
	    	if(nextPage())
	    		if(isHeldNow)
	    			getNewMessage();
	    		else
	    			getOldMessage();
	    });	 
	});
	
	
	function getNewMessage(){	
		$.ajax({
       		url: $("#appName").val()+"/user/getNewMsg.act",
       		type: "POST",
       		data: {
       				currentpagenum: currentPage,
       				userId: userID
       			  },
       		dataType: "JSON",
       		success: function(res) {           		
       			showNewMessage(res);        			
       		},
       		error: function(res) {        			
       			console.log(res);
       			alert('获取新消息失败');
       		}   
		});		
	}
	
	function showNewMessage(res){		
		var message = eval(res);   
		//console.log(res); 
		//console.log(message.length); 
		var htmlText = "";
		
		for(var i=0;i<message.length;i++){
			var msgFlag = "msg" + message[i].id;
			htmlText = htmlText +
			"<div class='list-group'>" +
			"<a class='list-group-item list-group-item-success' href='##' onclick='upDown("+ message[i].id +");'>" +
			"<h3 style='display:inline;'>"+ message[i].sUserEntity.nickname +"发来的消息</h3>" +
			"</a>" +
			"<a class='list-group-item'>" +
			"<div id='"+ msgFlag +"' style='display:none'>" +
			"<table class='table' style='word-break:break-all; word-wrap:break-all;'>" +
			"<th>" +
			message[i].content +
			"</th>" +
			"</table>" +
			"</div>" +
			"<span class='label label-default'>发送者："+ message[i].sUserEntity.nickname +"</span>" +
			//"<span class='label label-primary'>接收方："+ message[i].reciver +"</span>" +
			//"<span class='label label-success'>所属比赛："+ message[i].race.name +"</span>" +
			"<span class='label label-info'>发送时间："+ message[i].time.year +"/" + message[i].time.month +"/" + message[i].time.day+"</span>" +
			"<h3 class='msg-state-tag' onclick='readMsg("+ message[i].id +")'>点击标记为已读</h3>" +
			"</a>" +
			"</div>";
		}		
			
		
		if(htmlText =="")
			$("#newMessage").html(	"没有内容哦");
		else
			$("#newMessage").html(htmlText);
	}
	
	function getOldMessage(){
		
		$.ajax({
       		url: $("#appName").val()+"/user/getOldMsg.act",
       		type: "POST",
       		data: {
       				currentpagenum: currentPage,
       				userId: userID
       			  },
       		dataType: "JSON",
       		success: function(res) {           		
       			showOldMessage(res);        			
       		},
       		error: function(res) {        			
       			console.log(res);
       			alert('获取已阅读消息失败');
       		}   
		});		
	}
	
	function showOldMessage(res){		
		var message = eval(res);   
		//console.log(res); 
		var htmlText = "";
		for(var i=0;i<message.length;i++){
			var msgFlag = "msg" + message[i].id;
			htmlText = htmlText +
				"<div class='list-group'>" +
				"<a class='list-group-item list-group-item-success' href='##' onclick='upDown("+ message[i].id +");'>" +
				"<h3 style='display:inline;'>"+ message[i].sUserEntity.nickname +"发来的消息</h3>" +
				"</a>" +
				"<a class='list-group-item'>" +
				"<div id='"+ msgFlag +"' style='display:none'>" +
				"<table class='table' style='word-break:break-all; word-wrap:break-all;'>" +
				" <th>" +
				message[i].content +
				"</th>" +
				"</table>" +
				"</div>" +
				"<span class='label label-default'>发送者："+ message[i].sUserEntity.nickname +"</span>" +
				//"<span class='label label-primary'>接收方：GDS小组</span>" +
				//"<span class='label label-success'>所属比赛：大学生创新创业大赛</span>" +
				"<span class='label label-info'>发送时间："+ message[i].time.year +"/" + message[i].time.month +"/" + message[i].time.day+"</span>" +
				"<h3 class='msg-state-haveRead'>已读</h3>" +
				"</a>" +
				"</div>";
		}
		
		if(htmlText =="")
			$("#oldMessage").html(	"没有内容哦");
		else
			$("#oldMessage").html(htmlText);
	}
	
	function readMsg(msgId){	
		$.ajax({
    		url: $("#appName").val()+"/user/setMsgStatus.act",
    		type: "POST",
    		data: { "msgId": msgId},
    		dataType: "JSON",
    		success: function(res) {           		
    			getNewMessage();        			
    		},
    		error: function(res) {        			
    			console.log(res);
    			alert('服务器错误，未能标识为已阅读');
    		}   
		});
	}
	
	
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
				//生成动态id
				var raceBarId = "raceBar" + race[cursor].id;
			   htmlText = htmlText + 
			   "<div class='col_1_of_3 span_1_of_3' onmouseover='openRaceInd("+ race[cursor].id + ")' onmouseout='closeRaceInd("+ race[cursor].id + ")'>"+
					 "<a href=' " +$("#appName").val()+ "/race/detail/"+ race[cursor].id +"'>"+ 
					 "<div id='race"+race[cursor].id+"' class='inner_content clearfix'>"+
					 "<div class='product_image'>"+
					 "<img src='"+race[cursor].picUrl+"' alt=''/>"+
					 "<div class='float-Bar' id='"+ raceBarId +"'>"+ //添加动态id
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
	
	//打开比赛关注级别
	function openRaceInd(raceDiv){
		var raceBarId = "raceBar" + raceDiv;
		document.getElementById(raceBarId).style.opacity=0.3;
		document.getElementById(raceBarId).style.display="block";  		
	}
	//关闭比赛关注级别
	function closeRaceInd(raceDiv){
		var raceBarId = "raceBar" + raceDiv;
		document.getElementById(raceBarId).style.display="none";   
	}
	
</script>
</body>
</html>