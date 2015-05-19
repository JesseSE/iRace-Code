<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="<%=request.getContextPath() %>/public/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath() %>/public/css/form.css" rel="stylesheet" type="text/css" media="all" />
<link href='<%=request.getContextPath() %>/public/css/family.css' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/jquery1.min.js"></script>
<!-- start menu -->

    <!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    
    
    
    
<link href="<%=request.getContextPath() %>/public/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="<%=request.getContextPath() %>/public/text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>


<link href="<%=request.getContextPath() %>/public/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>

<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/jquery1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/jquery-1.11.2.min.js"></script>
<!-- start menu -->
<link href="<%=request.getContextPath() %>/public/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<!--start slider -->
    <link rel="stylesheet" href="css/fwslider.css" media="all">
    <script src="<%=request.getContextPath() %>/public/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath() %>/public/js/jQuery-self.js"></script>
    <script src="<%=request.getContextPath() %>/public/js/css3-mediaqueries.js"></script>
    <script src="<%=request.getContextPath() %>/public/js/fwslider.js"></script>
<!--end slider -->
<script src="<%=request.getContextPath() %>/public/js/jquery.easydropdown.js"></script>
<link href="<%=request.getContextPath() %>/public/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath() %>/public/css/form.css" rel="stylesheet" type="text/css" media="all" />
<!--testlink-->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/public/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/public/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/public/css/myButton.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/public/css/component.css" />


<!--队伍详细信息展开-->
<script type="text/javascript">			
function upDown(id)
{
	var content = document.getElementById(id);
	if(content.style.display=="none")
	{
		content.style.display="block";
	}
	else
	{content.style.display="none";}
}
</script>

<!--二级菜单栏Tabjs-->
<script type="text/javascript">	
function detailTab(pos)
{
	var tab1= document.getElementById("tab1");
	var tab2= document.getElementById("tab2");
	var tab3= document.getElementById("tab3");
	var tab4= document.getElementById("tab4");
	
	var raceDiv1 = document.getElementById("applyCheck");
	var raceDiv2 = document.getElementById("stageCheck");
	var raceDiv3 = document.getElementById("priceAward");
	var raceDiv4 = document.getElementById("msgSend");
	
	if(pos==1)
	{
		tab1.style.backgroundColor="#DFF0D8";
		tab2.style.backgroundColor="";
		tab3.style.backgroundColor="";
		tab4.style.backgroundColor="";
		
		raceDiv1.style.display="block";
		raceDiv2.style.display="none";
		raceDiv3.style.display="none";
		raceDiv4.style.display="none";
	}
	else if(pos==2)
	{
		tab2.style.backgroundColor="#DFF0D8";
		tab1.style.backgroundColor="";
		tab3.style.backgroundColor="";
		tab4.style.backgroundColor="";
		
		raceDiv1.style.display="none";
		raceDiv2.style.display="block";
		raceDiv3.style.display="none";
		raceDiv4.style.display="none";
	}
	else if(pos==3)
	{
		tab3.style.backgroundColor="#DFF0D8";
		tab1.style.backgroundColor="";
		tab2.style.backgroundColor="";
		tab4.style.backgroundColor="";
		
		raceDiv1.style.display="none";
		raceDiv2.style.display="none";
		raceDiv3.style.display="block";
		raceDiv4.style.display="none";
	}
	else if(pos==4)
	{
		tab4.style.backgroundColor="#DFF0D8";
		tab1.style.backgroundColor="";
		tab2.style.backgroundColor="";
		tab3.style.backgroundColor="";
		
		raceDiv1.style.display="none";
		raceDiv2.style.display="none";
		raceDiv3.style.display="none";
		raceDiv4.style.display="block";
	}
	else{}
}

</script>

<style type="text/css">
.team-state-submit {
	color:#4F7F90;
	float:right;
	cursor:pointer;
	margin-left:30px;
}
.team-state-submit:hover
{
	text-decoration:underline;
	color:#7A5555;
}
.team-state-wait {
	color:#7A5555;
	float:right;
}
.team-operate {
	cursor:pointer;
}
.stage-pass {
	color:#4F7F90;
	cursor:pointer;
	margin-top:-15px;
	float:right;
}
.stage-pass:hover
{
	text-decoration:underline;
	color:#7A5555;
}
.stage-wait {
	color:#7A5555;
	margin-top:-15px;
	float:right;
}
.stage-wait:hover
{
	color:#7A5555;
}
</style>

<title>比赛管理</title>
</head>
<body>

     <div class="header-top">
	   <div class="wrap"> 
			  <div class="header-top-left">
			  	  <div class="box">
                     <div class="logo" style="margin-top:8px;">
					   <a href="index.html"><img src="<%=request.getContextPath() %>/public/images/logo1.png" alt=""/></a>
				     </div>
                  </div>
                   <div class="clear"></div> 
   			  </div>
           
            <!--用户头像-->
			 <div class="cssmenu" role="navigation">
				<ul>
                    <li><image src="<%=request.getContextPath() %>/public/images/message.png"></image></li> 
					<li><a href="##">消息</a></li>|                   
					<li><image src="<%=request.getContextPath() %>/public/images/userican.png"></image></li>
                    
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
                  刘嵩 
                </a>
                <ul class="dropdown-menu" role="menu">
					<div class="dropdown-header">dropdown header
					</div>
					<li><a class="dropdown-btn" href="##">个人中心</a>
					<a class="dropdown-btn" href="##">退出登录</a></li>
					
                </ul>
                    
                    </li>
				</ul>
			</div>
			<div class="clear"></div>
 		</div>
	</div>
    
    
    <!--导航栏-->
	<div class="header-bottom" style="margin-top:-10px;">
	    <div class="wrap" style="margin-top:-10px;">
            
		<h1 style="margin-top:-0px;float:adjusty;font-family:微软雅黑;">北京交通大学创新大赛</h1>
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">      
                 
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav" style="font-family:微软雅黑;">
                    <li><a href="racemanage_detail.html">基本信息管理<span class="sr-only">(current)</span></a></li> 
                    <li><a href="racemanage_stage.html" style="color:#FFF;background-color:#4cb1ca;">比赛审核</a></li>    
                    <li><a href="racemanage_notice.html">发布公告</a></li>    
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
              
			<div class="top-box" name="my_race">
                <ul class="nav nav-tabs"  style="font-family:微软雅黑;">
                  <li role="presentation" class="active"><a href="##" id="tab1" onclick="detailTab(1);"  style="background-color:#DFF0D8;"><h4>报名审核</h4></a></li>
                  <li role="presentation" class="active"><a href="##" id="tab2" onclick="detailTab(2);" ><h4>阶段审核</h4></a></li> 
                  <li role="presentation" class="active"><a href="##" id="tab3" onclick="detailTab(3);" ><h4>奖项颁发</h4></a></li> 
                  <li role="presentation" class="active"><a href="##" id="tab4" onclick="detailTab(4);" ><h4>发送消息</h4></a></li> 
					<li style="position:relative;float:right;margin-top:10px;margin-left:0px;"><button style="font-family:微软雅黑;border:0px;padding:10px;color:#FFF;background-color:#4cb1ca;margin-right:17px;margin-top:-10px"><a style="color:#FFF">结束比赛</a></button></li> 
				</ul>  
<!--                报名审核-->
<div id="applyCheck" style="display:block">
			    <div class="panel panel-default">
                    <a name="race_default"></a>
                      <div class="panel-body">
					  <!--一个比赛-->
					  
			<h4 class="title" style="font-weight:bold;">
			 <select class="" name="" id="applyGroupSelect">
								<option value="0">选择审核组别 </option>
		                            <option value="1">A组</option>
                                    <option value="2">B组</option>
		                            <option value="3">C组</option>
									<option value="4">D组</option>

					  </select>
			  <div style="float:right;">
				<img style="width:14px; height:14px;" src="images/finish.jpg"></img>
				<a onclick="" style="font-size:0.7em;cursor:pointer;">完成所有报名审核</a>
			  </div>
			  </h4>
			 
	<!--每个组的队伍列表-->
	<div id='groupTeam'>
			<!--GDS软件工程实践课小组-->
                      <div class="panel-body">
						<div class="list-group">
							<!--upDown()函数里的参数是小组的id，动态加载时需要将小组id写入布局-->
                              <a class="list-group-item list-group-item-success" href="##"  onclick="upDown('zyxzContent');">
                                  <h3 style="display:inline;">GDS软件工程实践课小组</h3></a>
                              <a class="list-group-item">
							<!--开始展示小组成员-->
							  <div id="zyxzContent" style="display:none">
								<div class="panel panel-default">
							  <!-- Default panel contents -->
							<!--div class="panel-heading">Panel heading</div-->

								  <!-- Table -->
								  <table class="table" style="word-break:break-all; word-wrap:break-all;">
									<thead style="font-weight:bold;">
									  <tr>
										<th>#</th>
										<th>姓名</th>
										<th>邮箱</th>
										<th>电话</th>
										<th>学历</th>
										<th>年龄</th>
									  </tr>
									</thead>
									<tbody>
									  <tr>
										<th scope="row">1</th>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
										<td>大学</td>
										<td>20</td>
										</td>
									  </tr>
									  <tr>
										<th scope="row">2</th>
										<td>Jacob</td>
										<td>Thornton</td>
										<td>18811442504</td>
										<td>大学</td>
										<td>20</td>
									  </tr>
									  <tr>
										<th scope="row">3</th>
										<td>Larry</td>
										<td>the aaaa</td>
										<td>18811442504</td>
										<td>大学</td>
										<td>20</td>
									  </tr>
									</tbody>
								  </table>
								</div>
							  </div>
                                <span class="label label-primary">组长</span>
                                <span class="label label-success">口号</span>
								<h3 class="team-state-submit">通过</h3>
								<h3 class="team-state-submit">拒绝</h3>
                              </a>
                              
                        </div>
					</div>
			<!--QQQ软件工程实践课小组-->
                      <div class="panel-body">
						<div class="list-group">
							<!--upDown()函数里的参数是小组的id，动态加载时需要将小组id写入布局-->
                              <a class="list-group-item list-group-item-success" href="##"  onclick="upDown('QQQ');">
                                  <h3 style="display:inline;">GDS软件工程实践课小组</h3></a>
                              <a class="list-group-item">
							<!--开始展示小组成员-->
							  <div id="QQQ" style="display:none">
								<div class="panel panel-default">
							  <!-- Default panel contents -->
							<!--div class="panel-heading">Panel heading</div-->

								  <!-- Table -->
								  <table class="table" style="word-break:break-all; word-wrap:break-all;">
									<thead style="font-weight:bold;">
									  <tr>
										<th>#</th>
										<th>姓名</th>
										<th>邮箱</th>
										<th>电话</th>
										<th>学历</th>
										<th>年龄</th>
									  </tr>
									</thead>
									<tbody>
									  <tr>
										<th scope="row">1</th>
										<td>Mark</td>
										<td>Otto</td>
										<td>@mdo</td>
										<td>大学</td>
										<td>20</td>
										</td>
									  </tr>
									  <tr>
										<th scope="row">2</th>
										<td>Jacob</td>
										<td>Thornton</td>
										<td>18811442504</td>
										<td>大学</td>
										<td>20</td>
									  </tr>
									  <tr>
										<th scope="row">3</th>
										<td>Larry</td>
										<td>the aaaa</td>
										<td>18811442504</td>
										<td>大学</td>
										<td>20</td>
									  </tr>
									</tbody>
								  </table>
								</div>
							  </div>
                                <span class="label label-primary">组长</span>
                                <span class="label label-success">口号</span>
								<h3 class="team-state-submit">取消拒绝</h3>
                              </a>
                              
                        </div>
					</div>
	</div>
	
			 
                </div>
                </div>    
                
   </div>             
<!--                阶段审核-->
<div id="stageCheck" style="display:none">
                <div class="panel panel-default">
                    <a name="race_default"></a>
                      <div class="panel-body">
					  <!--一个比赛-->
					  
			<h4 class="title" style="font-weight:bold;">
			 <select class="" name="" id="stageGroupSelect">
								<option value="0">选择审核组别 </option>
		                            <option value="1">A组</option>
                                    <option value="2">B组</option>
		                            <option value="3">C组</option>
									<option value="4">D组</option>

					  </select>
			<select class="" name="" id="stageStageSelect">
								<option value="0">选择阶段 </option>
		                            <option value="1">初赛</option>
                                    <option value="2">复赛</option>
		                            <option value="3">半决赛</option>
									<option value="4">决赛</option>

					  </select>
					  （未完成审核）
			  <div style="float:right;">
				<img style="width:14px; height:14px;" src="images/finish.jpg"></img>
				<a onclick="" style="font-size:0.7em;cursor:pointer;">完成所有阶段审核</a>
			  </div>
			  </h4>
			 
	<!--每个组的队伍列表-->
	<div id='groupTeam'>
			<!--GDS软件工程实践课小组-->
                      <div class="panel-body">
						<div class="list-group">
							<!--upDown()函数里的参数是小组的id，动态加载时需要将小组id写入布局-->
                              <a class="list-group-item list-group-item-success" href="##">
                                  <h3 style="display:inline;">A组初赛阶段提交物</h3>
								  <h3 class="team-state-wait">阶段时间：2015/01/04-2015/10/04</h3>
								  </a>
                              <a class="list-group-item">
							<!--开始展示小组成员-->
							  <div id="" style="display:block">
								<div class="panel panel-default">
							  <!-- Default panel contents -->
							<!--div class="panel-heading">Panel heading</div-->

								  <!-- Table -->
								  <table class="table" style="word-break:break-all; word-wrap:break-all;">
									<thead style="font-weight:bold;">
									  <tr>
										<th>#</th>
										<th>队伍名</th>
										<th>提交物</th>
										<th>提交时间</th>
										<th>文件</th>
										<th>队伍</th>
									  </tr>
									</thead>
									<tbody>
									  <tr>
										<th scope="row">1</th>
										<td>GDS软件工程实践课小组</td>
										<td>初赛作品</td>
										<td>2015/01/04 15h:30m:20s</td>
										<td><a class="team-operate">下载</a></td>
										<td><a class="team-operate">淘汰</a></td>
										</td>
									  </tr>
									  <tr style="background-color:#F6F9FA;">
										<th scope="row">2</th>
										<td>WWW软件工程实践课小组</td>
										<td>初赛作品</td>
										<td>2015/01/04 15h:30m:20s</td>
										<td><a class="team-operate">下载</a></td>
										<td>
										<a class="team-operate">取消淘汰</a></td>
										</td>
									  </tr>
									  <tr>
										<th scope="row">3</th>
										<td>HTR软件工程实践课小组</td>
										<td>初赛作品</td>
										<td>2015/01/04 15h:30m:20s</td>
										<td><a class="team-operate">下载</a></td>
										<td><a class="team-operate">淘汰</a></td>
										</td>
									  </tr>
									</tbody>
								  </table>
								</div>
								<h3 class="stage-pass">完成此阶段审核</h3>
							  </div>
                              </a>
                              
                        </div>
					</div>
			<!--GDS软件工程实践课小组-->
                      <div class="panel-body">
						<div class="list-group">
							<!--upDown()函数里的参数是小组的id，动态加载时需要将小组id写入布局-->
                              <a class="list-group-item list-group-item-success" href="##">
                                  <h3 style="display:inline;">A组初赛阶段提交物</h3>
								  <h3 class="team-state-wait">阶段时间：2015/01/04-2015/10/04</h3>
								  </a>
                              <a class="list-group-item">
							<!--开始展示小组成员-->
							  <div id="" style="display:block">
								<div class="panel panel-default">
							  <!-- Default panel contents -->
							<!--div class="panel-heading">Panel heading</div-->

								  <!-- Table -->
								  <table class="table" style="word-break:break-all; word-wrap:break-all;">
									<thead style="font-weight:bold;">
									  <tr>
										<th>#</th>
										<th>队伍名</th>
										<th>提交物</th>
										<th>提交时间</th>
										<th>文件</th>
										<th>队伍</th>
									  </tr>
									</thead>
									<tbody>
									  <tr>
										<th scope="row">1</th>
										<td>GDS软件工程实践课小组</td>
										<td>初赛作品</td>
										<td>2015/01/04 15h:30m:20s</td>
										<td><a class="team-operate">下载</a></td>
										<td><h3 class="team-state-wait">已晋级</h3></td>
										</td>
									  </tr>
									  <tr style="background-color:#F6F9FA;">
										<th scope="row">2</th>
										<td>WWW软件工程实践课小组</td>
										<td>初赛作品</td>
										<td>2015/01/04 15h:30m:20s</td>
										<td><a class="team-operate">下载</a></td>
										<td>
										<h3 class="team-state-wait">已淘汰</h3></td>
										</td>
									  </tr>
									  <tr>
										<th scope="row">3</th>
										<td>HTR软件工程实践课小组</td>
										<td>初赛作品</td>
										<td>2015/01/04 15h:30m:20s</td>
										<td><a class="team-operate">下载</a></td>
										<td><h3 class="team-state-wait">已晋级</h3></td>
										</td>
									  </tr>
									</tbody>
								  </table>
								</div>
								<h3 class="stage-wait">审核已结束</h3>
							  </div>
                              </a>
                              
                        </div>
					</div>
	</div>
	
			 
                </div>
                </div>  
    </div>            
 <!--                奖项颁发-->
<div id="priceAward" style="display:none">
                <div class="panel panel-default">
                    <a name="race_default"></a>
                      <div class="panel-body">
					  <!--一个比赛-->
					  
			<h4 class="title" style="font-weight:bold;">
			 <select class="" name="" id="priceGroupSelect">
								<option value="0">选择颁奖组别 </option>
		                            <option value="1">A组</option>
                                    <option value="2">B组</option>
		                            <option value="3">C组</option>
									<option value="4">D组</option>

					  </select>
					  （未完成颁奖）
			  <div style="float:right;">
				<img style="width:14px; height:14px;" src="images/finish.jpg"></img>
				<a onclick="" style="font-size:0.7em;cursor:pointer;">完成所有组别颁奖</a>
			  </div>
			  </h4>
			 
	<!--每个组的队伍列表-->
	<div id='groupTeam'>
			<!--GDS软件工程实践课小组-->
                      <div class="panel-body">
						<div class="list-group">
							<!--upDown()函数里的参数是小组的id，动态加载时需要将小组id写入布局-->
                              <a class="list-group-item list-group-item-success" href="##">
                                  <h3 style="display:inline;">A组颁奖情况</h3>
								  </a>
                              <a class="list-group-item">
							<!--开始展示小组成员-->
							  <div id="" style="display:block">
								<div class="panel panel-default">
							  <!-- Default panel contents -->
							<!--div class="panel-heading">Panel heading</div-->

								  <!-- Table -->
								  <table class="table" style="word-break:break-all; word-wrap:break-all;">
									<thead style="font-weight:bold;">
									  <tr>
										<th>#</th>
										<th>队伍名</th>
										<th>现状态</th>
										<th>选择奖项</th>
										<th>操作</th>
									  </tr>
									</thead>
									<tbody>
									  <tr>
										<th scope="row">1</th>
										<td>GDS软件工程实践课小组</td>
										<td>一等奖</td>
										<td>
										<select class="" name="" id="pricePriceSelect">
											<option value="0">选择颁奖奖项</option>
											<option value="1">一等奖</option>
											<option value="2">二等奖</option>
											<option value="3">三等奖</option>
											<option value="4">鼓励奖</option>

										</select>
										</td>
										<td><a class="team-operate">颁奖</a></td>
										</td>
									  </tr>
									  <tr style="background-color:#F6F9FA;">
										<th scope="row">2</th>
										<td>WWW软件工程实践课小组</td>
										<td>未颁奖</td>
										<td>
										<select class="" name="" id="pricePriceSelect">
											<option value="0">选择颁奖奖项</option>
											<option value="1">一等奖</option>
											<option value="2">二等奖</option>
											<option value="3">三等奖</option>
											<option value="4">鼓励奖</option>
										</select>
										</td>
										<td><a class="team-operate">颁奖</a></td>
										</td>
									  </tr>
									  <tr>
										<th scope="row">3</th>
										<td>HTR软件工程实践课小组</td>
										<td>未颁奖</td>
										<td>
										<select class="" name="" id="pricePriceSelect">
											<option value="0">选择颁奖奖项</option>
											<option value="1">一等奖</option>
											<option value="2">二等奖</option>
											<option value="3">三等奖</option>
											<option value="4">鼓励奖</option>

										</select>
										</td>
										<td><a class="team-operate">颁奖</a></td>
										</td>
									  </tr>
									</tbody>
								  </table>
								</div>
								<h3 class="stage-pass">完成此组颁奖</h3>
							  </div>
                              </a>
                              
                        </div>
					</div>
			<!--GDS软件工程实践课小组-->
                      <div class="panel-body">
						<div class="list-group">
							<!--upDown()函数里的参数是小组的id，动态加载时需要将小组id写入布局-->
                              <a class="list-group-item list-group-item-success" href="##">
                                  <h3 style="display:inline;">A组颁奖情况</h3>
								  </a>
                              <a class="list-group-item">
							<!--开始展示小组成员-->
							  <div id="" style="display:block">
								<div class="panel panel-default">
							  <!-- Default panel contents -->
							<!--div class="panel-heading">Panel heading</div-->

								  <!-- Table -->
								  <table class="table" style="word-break:break-all; word-wrap:break-all;">
									<thead style="font-weight:bold;">
									  <tr>
										<th>#</th>
										<th>队伍名</th>
										<th>获奖情况</th>
									  </tr>
									</thead>
									<tbody>
									  <tr>
										<th scope="row">1</th>
										<td>GDS软件工程实践课小组</td>
										<td>一等奖</td>
										</td>
									  </tr>
									  <tr style="background-color:#F6F9FA;">
										<th scope="row">2</th>
										<td>WWW软件工程实践课小组</td>
										<td>未颁奖</td>
									  </tr>
									  <tr>
										<th scope="row">3</th>
										<td>HTR软件工程实践课小组</td>
										<td>未颁奖</td>
									  </tr>
									</tbody>
								  </table>
								</div>
								<h3 class="stage-wait">此组颁奖已结束</h3>
							  </div>
                              </a>
                              
                        </div>
					</div>
	</div>
	
			 
                </div>
                </div>   
    </div>    
	
 <!--               发送消息-->	
<div id="msgSend" style="display:none">
                <div class="panel panel-default">
                    <a name="race_done"></a>
                      <div class="panel-body">
					  <!--自定义组别设置-->
					  <div class="panel-body">
						<div class="list-group">
                              <a class="list-group-item list-group-item-success" href="##">
                                  <select class="" name="" id="pricePriceSelect">
											<option value="0">选择发送方式</option>
											<option value="1">发送给小组</option>
											<option value="2">发送给个人</option>
										</select>
								  <select class="" name="" id="pricePriceSelect">
											<option value="0">选择发送对象</option>
											<option value="1">GDS软件工程实践课小组</option>
											<option value="2">QQQ软件工程实践课小组</option>
										</select>
								  <h3 class="team-state-submit" onclick="addGroup();">发送消息</h3> 
								  </a>
                              <a class="list-group-item">
					 <div class="panel panel-default">
                         <textarea style="width:100%;height:300px;"></textarea>
								</div>
							</a>
							</div> 
                              
                        </div>                    
                        
                      </div>
                </div>  
    </div>  	
				<div class="clear"></div>
                
                <!--分页>
                <nav style="text-align:center">
                  <ul class="pagination">
                    <li>
                      <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                      <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                  </ul>
                </nav>  
				<-->
                
			</div>	
				
				<div class="clear" style="height:37px;"></div>
			</div>	            		 						 			    
		  </div>
            
            
            
            <!--侧边-->
			<div class="rsidebar span_1_of_left">
				
           <div class="top-border"> </div>
			<div class="sidebar-bottom">
			    <h2 class="m_1">新的比赛<br> 创建</h2>
			    <p class="m_text">您可以通过我们网站定制并发布自己的比赛</p>
			    <div class="subscribe">
					 <form>
					    <input name="userName" type="text" class="textbox">
					    <input type="submit" value="定制">
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
			        <p>GDS软件工程实践课小组版权所有<a target="_blank" href="http://www.js-css.cn/a/css/template/">IRACE</a></p>
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

</body>
</html>