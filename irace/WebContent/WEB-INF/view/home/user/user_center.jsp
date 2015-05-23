<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<title>${ title }</title>
<%@ include file="/public/section/header.jsp"%>

<link href="<%=request.getContextPath() %>/public/css/default.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath() %>/public/css/nivo-slider.css"
	rel="stylesheet" type="text/css" media="all" />


<style type="text/css">
.race-state-submit {
	color: #4F7F90;
	float: right;
	cursor: pointer;
}

.race-state-submit:hover {
	text-decoration: underline;
	color: #7A5555;
}

.race-state-wait {
	color: #7A5555;
	float: right;
}
</style>

<script type="text/javascript">	
function raceTab(pos)
{
	var tab1= document.getElementById("tab1");
	var tab2= document.getElementById("tab2");
	var raceDiv1 = document.getElementById("ongoing");
	var raceDiv2 = document.getElementById("finish");
	
	if(pos==1)
	{
		tab1.style.backgroundColor="#DFF0D8";
		tab2.style.backgroundColor="";
		raceDiv1.style.display="block";
		raceDiv2.style.display="none";
	}
	else if(pos==2)
	{
		tab2.style.backgroundColor="#DFF0D8";
		tab1.style.backgroundColor="";
		raceDiv1.style.display="none";
		raceDiv2.style.display="block";
	}
	else{}
}

</script>


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
						<li><a href="<%=request.getContextPath() %>/user/userCenter"
							style="color: #FFF; background-color: #4cb1ca;">我参加的比赛 <span
								class="sr-only">(current)</span></a></li>
						<li><a href="<%=request.getContextPath() %>/user/userTeam">参加的队伍</a></li>
						<li><a href="<%=request.getContextPath() %>/user/usermsg">通知中心</a></li>
						<li><a href="<%=request.getContextPath() %>/user/usermsg">个人信息</a></li>
						<li><a href="<%=request.getContextPath() %>/user/userCenter">账号管理</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid --> </nav>

		</div>

	</div>



	<!--显示-->
	<div class="main" style="margin-top: -25px;">
		<div class="wrap">
			<div class="section group">
				<div class="cont span_2_of_3">

					<div class="top-box" name="my_race">
						<ul class="nav nav-tabs">
							<li role="presentation" class="active"><a href="##"
								id="tab1" onclick="raceTab(1);"
								style="background-color: #DFF0D8;"><h4>正在进行</h4></a></li>
							<li role="presentation" class="active"><a href="##"
								id="tab2" onclick="raceTab(2);"><h4>已经结束</h4></a></li>
						</ul>

						<!--  正在进行-->
						<div id="ongoing" style="display: block">
							<div class="panel panel-default" id="heldingRace">
								<!-- 在这里输出正在参加的比赛 -->
							</div>
						</div>

						<!--  已结束-->
						<div id="finish" style="display: none">
							<div class="panel panel-default" id="heldedRace">
								<!-- 在这里输出已经参加过的比赛 -->
							</div>
						</div>

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


					<!-- 在这里显示推介的比赛 -->
					<h2 class="head">猜你喜欢</h2>
					<div class="top-box" id="recommendation"></div>
					<div class="clear"></div>
				</div>
			</div>



			<!--侧边-->
			<div class="rsidebar span_1_of_left">
				<div class="top-border"></div>
				<div class="border">
					<link href="<%=request.getContextPath() %>/public/css/default.css"
						rel="stylesheet" type="text/css" media="all" />
					<link
						href="<%=request.getContextPath() %>/public/css/nivo-slider.css"
						rel="stylesheet" type="text/css" media="all" />
					<script
						src="<%=request.getContextPath() %>/public/js/jquery.nivo.slider.js"></script>
					<script type="text/javascript">
				    $(window).load(function() {
				        $('#slider').nivoSlider();
				    });
				    </script>
					<div class="slider-wrapper theme-default">
						<div id="slider" class="nivoSlider">
							<img
								src="<%=request.getContextPath() %>/public/images/t-img1.jpg"
								alt="" /> <img
								src="<%=request.getContextPath() %>/public/images/t-img2.jpg"
								alt="" /> <img
								src="<%=request.getContextPath() %>/public/images/t-img3.jpg"
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


	<div class="footer">
		<div class="footer-middle">
			<div class="wrap">
				<div class="copy">
					<p>
						GDS软件工程实践课小组版权所有<a target="_blank"
							href="http://www.js-css.cn/a/css/template/">IRACE</a>
					</p>
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
	
	<!-- 取得用户id -->
	<input id="userIDHtml" type="hidden" value="<%=session.getAttribute("uid") %>">

	<%@ include file="/public/section/footer.jsp"%>
	<script
		src="<%=request.getContextPath() %>/public/js/jquery.nivo.slider.js"></script>
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
		//userID = 1;
		userID = $("#userIDHtml").val();
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
	    document.getElementById("heldingRace").style.display="";
    	document.getElementById("heldedRace").style.display="none";
	    getHedingRace();
	    getReconmmendation();
	    
	    //点击正在参加的比赛
	    $("#tab1").click(function(){
	    	document.getElementById("heldingRace").style.display="";
	    	document.getElementById("heldedRace").style.display="none";
	    	initValue();
		    getHedingRace();
	    });
	    //点击以前参加的比赛
	    $("#tab2").click(function(){
	    	document.getElementById("heldingRace").style.display="none";
	    	document.getElementById("heldedRace").style.display="";
	    	initValue();
	    	isHeldNow = false;
	    	getHeldedRace();
	    });
	
	    //点击前一页
	    $("#prePage").click(function(){
	    	if(prePage())
	    		if(isHeldNow)
	    			getHedingRace();
	    		else
	    			getHeldedRace();
	    });
	   //点击后一页
	    $("#nextPage").click(function(){
	    	if(nextPage())
	    		if(isHeldNow)
	    			getHedingRace();
	    		else
	    			getHeldedRace();
	    });	 
	});
	
	
	function getHedingRace(){	
		$.ajax({
       		url: $("#appName").val()+"/user/getHedingRace.act",
       		type: "POST",
       		data: {
       				currentpagenum: currentPage,
       				userId: userID
       			  },
       		dataType: "JSON",
       		success: function(res) {           		
       			showHedingRace(res);        			
       		},
       		error: function(res) {        			
       			console.log(res);
       			alert('输入错误！请返回重新输入！');
       		}   
		});		
	}
	
	function showHedingRace(res){		
		var race = eval(res);   
		console.log(res);        	
		
		var htmlText = " <a name='race_default'></a>" +
			"<div class='panel-body'>";
		for(var i=0; i<race.length;i++){
			if(race[i].status == 1){
				htmlText = htmlText + 
				"<div class='list-group'>" +
				"<a class='list-group-item list-group-item-success' href=' " +$("#appName").val()+ "/race/detail/"+ race[i].id +"'>"+ 
				"<h3 style='display:inline;'>" + race[i].name + "</h3>" ;
				
				//判断组队状态
				if(null == isJoinedAteam(race[i].id)){
					htmlText = htmlText + "<h3 class='race-state-wait'>暂未组队，点击组队</h3>";
				}else{
					htmlText = htmlText + "<h3 class='race-state-wait'>暂未组队，点击组队</h3>";
				}
								
				
				htmlText = htmlText + 
				"</a>" +
				"<a class='list-group-item'>" + race[i].content + "</a>" +
				"<span class='label label-default'>" + race[i].organizerEntity.name + "</span>" +
				"<span class='label label-primary'>" + race[i].grade + "</span>" +
				"<span class='label label-success'>" + race[i].typeRaceEntity.name + "</span>" +
				"<span class='label label-info'>"+ race[i].startTime.year +"/" + race[i].startTime.month +"至"+ race[i].endTime.year +"/" + race[i].endTime.month +"</span>" +
				"</div>";		
			}
		}	
		
			
		htmlText = htmlText + "</div>";
		
		if(htmlText =="")
			$("#heldingRace").html(	"没有内容哦");
		else
			$("#heldingRace").html(htmlText);
	}
	
	function getHeldedRace(){
		
		$.ajax({
       		url: $("#appName").val()+"/user/getHeldedRace.act",
       		type: "POST",
       		data: {
       				currentpagenum: currentPage,
       				userId: userID
       			  },
       		dataType: "JSON",
       		success: function(res) {           		
       			showHededRace(res);        			
       		},
       		error: function(res) {        			
       			console.log(res);
       			alert('输入错误！请返回重新输入！');
       		}   
		});		
	}
	
	function showHededRace(res){		
		var race = eval(res);   
		console.log(res);        	
		
		var htmlText = " <a name='race_done'></a>" +
			"<div class='panel-body'>";
		for(var i=0; i<race.length;i++)	{
			if(race[i].status == 2){
				htmlText = htmlText + 
				"<div class='list-group'>" +
				"<a class='list-group-item disabled' href=' " +$("#appName").val()+ "/race/detail/"+ race[i].id +"'>"+ 
				"<h3 style='display:inline;'>" + race[i].name + "</h3>"+
				"<h3 class='race-state-wait'>未获奖</h3>" +
				"</a>" +			
				" <a class='list-group-item'>" + race[i].content + "</a>" +
				"<span class='label label-default'>" + race[i].organizerEntity.name + "</span>" +
				"<span class='label label-primary'>" + race[i].grade + "</span>" +
				"<span class='label label-success'>" + race[i].typeRaceEntity.name + "</span>" +
				"<span class='label label-info'>"+ race[i].startTime.year +"/" + race[i].startTime.month +"至"+ race[i].endTime.year +"/" + race[i].endTime.month +"</span>" +
				"</div>";
			}
		}
		
			
		htmlText = htmlText + "</div>";
		
		if(htmlText =="")
			$("#heldedRace").html(	"没有内容哦");
		else
			$("#heldedRace").html(htmlText);
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
					 "<a href='  " +$("#appName").val()+ "/race/detail/"+ race[cursor].id +"'>"+ 
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
	//查看组队状态
	function isJoinedAteam(raceId){
		$.ajax({
       		url: $("#appName").val()+"/user/isJoinTeam.act",
       		type: "POST",
       		data: {
       			userId: userId,
       			raceId: raceId
       			  },
       		dataType: "JSON",
       		success: function(res) {           		
       			return eval(res).name;        			
       		},
       		error: function(res) {        			
       			return null;
       		}   
		});		
	}
	//查看获奖状态
	function isGetRaward(raceId){
		$.ajax({
       		url: $("#appName").val()+"/user/isGetRaward.act",
       		type: "POST",
       		data: {
       			userId: userId,
       			raceId: raceId
       			  },
       		dataType: "JSON",
       		success: function(res) {           		
       			return eval(res).name;        			
       		},
       		error: function(res) {        			
       			return null;
       		}   
		});		
	}
	
</script>
</body>
</html>