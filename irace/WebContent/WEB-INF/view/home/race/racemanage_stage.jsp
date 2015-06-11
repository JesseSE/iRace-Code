<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${ title }</title>
<%@ include file="/public/section/header.jsp"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="<%=request.getContextPath() %>/public/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath() %>/public/css/nivo-slider.css" rel="stylesheet" type="text/css" media="all" />
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
	    <div id = "raceTitle">       
		</div>
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
                  <li role="presentation" class="active"><a href="##" id="tab1"   style="background-color:#DFF0D8;"><h4>报名审核</h4></a></li>
                  <li role="presentation" class="active"><a href="##" id="tab2"  ><h4>阶段审核</h4></a></li> 
                  <li role="presentation" class="active"><a href="##" id="tab3"  ><h4>奖项颁发</h4></a></li> 
                  <li role="presentation" class="active"><a href="##" id="tab4"  ><h4>发送消息</h4></a></li> 
				  <li style="position:relative;float:right;margin-top:10px;margin-left:0px;"><div id = "beginOrfinishRace"></div></li> 
				</ul>  
                <!--  报名审核-->
                <div id="applyCheck" style="display:block">
			    <div class="panel panel-default">
                    <a name="race_default"></a>
                      <div class="panel-body">
					  <!--一个比赛-->
					  
			<h4 class="title" style="font-weight:bold;">
			 <select class="" name="" id="applyGroupSelect">

			 </select>
			    <div style="float:right;">
				<img style="width:14px; height:14px;" src="images/finish.jpg"></img>
				<a onclick="" style="font-size:0.7em;cursor:pointer;">完成所有报名审核</a>
			  </div>
			  </h4>
			 
	<!--每个组的队伍列表-->
	<div id="groupTeam">

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

			</select>
			<select class="" name="" id="stageStageSelect">
			</select>
			  <div style="float:right;">
				<img style="width:14px; height:14px;" src="images/finish.jpg"></img>
				<a onclick="" style="font-size:0.7em;cursor:pointer;">完成所有阶段审核</a>
			  </div>
			  </h4>
			 
	<!--每个组的队伍列表-->
	<div id="stageGroupTeam">
			<!--GDS软件工程实践课小组-->
                      <div class="panel-body" >
						<div class="list-group">
							<!--upDown()函数里的参数是小组的id，动态加载时需要将小组id写入布局-->
							<div id = "phaseTitle">
                   
							</div>	  
                              <a class="list-group-item">
							<!--开始展示小组成员-->
							  <div id="phaseSubmit" style="display:block">

							  </div>
                              </a>
                              
                        </div>
					</div>
	           </div>
	
			 
                </div>
                </div>  
    </div>            
 <!--            奖项颁发-->
                <div id="priceAward" style="display:none">
                <div class="panel panel-default">
                    <a name="race_default"></a>
                      <div class="panel-body">
					  
			<h4 class="title" style="font-weight:bold;">
			 <select class="" name="" id="priceGroupSelect">

			  </select>
			  <div style="float:right;">
				<img style="width:14px; height:14px;" src="images/finish.jpg"></img>
				<a onclick="" style="font-size:0.7em;cursor:pointer;">完成所有组别颁奖</a>
			  </div>
			  </h4>
			 
	<!--每个组的队伍列表-->
	<div id="groupTeam">
			<!--GDS软件工程实践课小组-->
                      <div class="panel-body">
						<div class="list-group">
							<!--upDown()函数里的参数是小组的id，动态加载时需要将小组id写入布局-->
							<div id = "praiseTitle">
							</div>
                              <a class="list-group-item">
							<!--开始展示小组成员-->
							  <div id="praiseShow" style="display:block">
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
                                  <select class="" name = "" id = "messageGroup">
                                  </select>
                                  
                                  <select class="" name="" id="messageTeam">
								</select>
								  <h3 class="team-state-submit" onclick="sendMessageToLeader();">发送消息</h3> 
								  </a>
                              <a class="list-group-item">
					 <div class="panel panel-default">
                         <textarea style="width:100%;height:300px;" id = "message"></textarea>
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

<%@ include file="/public/section/footer.jsp" %>
<script type="text/javascript">
    //date 传值
    var raceID = 1;
    
	var tab1= document.getElementById("tab1");
	var tab2= document.getElementById("tab2");
	var tab3= document.getElementById("tab3");
	var tab4= document.getElementById("tab4");
	
	var raceDiv1 = document.getElementById("applyCheck");
	var raceDiv2 = document.getElementById("stageCheck");
	var raceDiv3 = document.getElementById("priceAward");
	var raceDiv4 = document.getElementById("msgSend");
	
	$("#tab1").click(function(){
		 tab1.style.backgroundColor="#DFF0D8";
		 tab2.style.backgroundColor="";
		 tab3.style.backgroundColor="";
		 tab4.style.backgroundColor="";
			
		 raceDiv1.style.display="block";
		 raceDiv2.style.display="none";
		 raceDiv3.style.display="none";
		 raceDiv4.style.display="none";
		 
		 selectGroupTeam();	
	    } );
	 
	 $("#tab2").click(function(){	 
		 tab2.style.backgroundColor="#DFF0D8";
		 tab1.style.backgroundColor="";
		 tab3.style.backgroundColor="";
		 tab4.style.backgroundColor="";
			
		 raceDiv1.style.display="none";
		 raceDiv2.style.display="block";
		 raceDiv3.style.display="none";
		 raceDiv4.style.display="none";
		 
		 selectGroupPhase();
	    } );
	 
	 $("#tab3").click(function(){
		 tab3.style.backgroundColor="#DFF0D8";
		 tab1.style.backgroundColor="";
		 tab2.style.backgroundColor="";
		 tab4.style.backgroundColor="";
			
		 raceDiv1.style.display="none";
		 raceDiv2.style.display="none";
		 raceDiv3.style.display="block";
		 raceDiv4.style.display="none";
		 
		 selectPraiseTeam();
	    } );
	 
	 $("#tab4").click(function(){
		 tab4.style.backgroundColor="#DFF0D8";
		 tab1.style.backgroundColor="";
		 tab2.style.backgroundColor="";
		 tab3.style.backgroundColor="";
			
		 raceDiv1.style.display="none";
		 raceDiv2.style.display="none";
		 raceDiv3.style.display="none";
		 raceDiv4.style.display="block";
		 
		 sendMessage();
	    } );

	$(document).ready(function(){
		loadRaceName();
		loadGroup();
	});
	
	//载入比赛的名字
	function loadRaceName(){
		$.ajax({
			url: $("#appName").val()+ "/race/manageStageLoadRaceName.act",
			type:"POST",
			data:{raceID:raceID},
			dataType:"JSON",
			success:function(res){
				showRaceName(res);
			},
			error:function(res){
				console.log(res);
			}		
		});
	}
	
	function showRaceName(res){
		var htmlName = "";
		var name = eval(res);
		var htmlStatus = "";
		htmlName = "<h1 style = 'margin-top:-0px;float:adjusty;font-family:微软雅黑;'>"+name[0].name+"</h1>";
		$("#raceTitle").html(htmlName);
		if(name.status == 0){
			htmlStatus = "<button style='font-family:微软雅黑;border:0px;padding:10px;color:#FFF;background-color:#4cb1ca;margin-right:17px;margin-top:-10px' onclick = 'finishRace();'><a style='color:#FFF'>开启比赛</a></button>";
		}
		else if(name.status == 1){
			htmlStatus = "<button style='font-family:微软雅黑;border:0px;padding:10px;color:#FFF;background-color:#4cb1ca;margin-right:17px;margin-top:-10px' onclick = 'finishRace();'><a style='color:#FFF'>结束比赛</a></button>";
		}else{
			
		}
		$("#beginOrfinishRace").html(htmlStatus);	
	}
	
	//结束比赛
	function finishRace(){
		$.ajax({
			url : $("#appName").val() + "/race/managerStageFinishRace.act",
			type : "POST",
			data : {
				raceId : raceId
			},
			data : "JSON",
			success : function(res){
				alert("成功");
			},
			error : function(res){
			}
		});
	}
	
	//审查小组部分
	//载入比赛的组别选项框
	function loadGroup(){
		$.ajax({
			url:$("#appName").val()+"/race/manageStageLoadGroup.act",
			type:"POST",
			data:{raceID:raceID},
			dataType:"JSON",
			success:function(res){
				showGroup(res);
			},
			error:function(res){
				console.log(res);
			}
		});
	}
	
	function showGroup(res){
		var select = eval(res);
		var htmlSelect = "";
		for(var number = 0;number < select.length; number++){
			htmlSelect = htmlSelect + "<option value = " + select[number].id +">" +
			select[number].name + "</option>";
		}
		$("#applyGroupSelect").html(htmlSelect);
		$("#stageGroupSelect").html(htmlSelect);
		$("#priceGroupSelect").html(htmlSelect);
		$("#messageGroup").html(htmlSelect);
		
		selectGroupTeam();
	}
	
	//载入报名审核里的小组
	 function selectGroupTeam() {
	      var singleValues = $("#applyGroupSelect").val();
	      loadGroupTeam(singleValues);
	    }
	 
	 $("#applyGroupSelect").change(selectGroupTeam);   
	
	
	function loadGroupTeam(id){
		$.ajax({
			url:$("#appName").val()+"/race/manageStageLoadGroupTeam.act",
			type:"POST",
			data:{
				groupID:id
			},
			dataType:"JSON",
			success:function(res){
				showGroupTeam(res);
			},
			error:function(res){
				console.log(res);
			}
		});
	}
	
	function showGroupTeam(res){
		var team = eval(res);
		var htmlTeam = "";
		for(var number = 0; number < team.length; number++){
			htmlTeam = htmlTeam + " <div class='panel-body'><div class='list-group'>" +
			"<a class = 'list-group-item list-group-item-success' href = '##' onclick = 'loadGroupTeamMember("+team[number].id+");'>" +
			"<h3 style = 'display:inline;'>"+team[number].name+"</h3></a>"+
			"<a class='list-group-item'>"+
			"<div id ="+team[number].id+" style = 'display:none'>"+"</div>"+
			"<span class='label label-primary'>"+ team[number].leader+"</span>"+
			"<span class='label label-success'>"+team[number].slogan+"</span>"+
			"<h3 class='team-state-submit' onclick = 'agreed("+team[number].id+");'>通过</h3>"+
			"<h3 class='team-state-submit' onclick = 'refused("+team[number].id+");'>拒绝</h3>"+
			"</a></div></div>";	
		}
		$("#groupTeam").html(htmlTeam);
	}
	
	//同意队伍
	function agreed(id){
		var msg = "您确定同意吗？";
		if(confirm(msg) == true){
			sendTeamStatus(id,true);
		}
	}
	
	//不同意队伍
	function refused(id){
		var msg = "您确定取消队伍吗";
		if(confirm(msg)){
			sendTeamStatus(id,false);
		}
	}
	
	function sendTeamStatus(id,status){
		$.ajax({
			url:$("#appName").val()+"/race/sendTeamStatus.act",
			type:"POST",
			data:{
				teamId:id,
				status:status
			},
			dataType:"JSON",
			success:function(res){
				showGroupTeam(res);			
			},
			error:function(res){
			
			}
		});
	}
	
	//载入报名审核小组里的成员
	function loadGroupTeamMember(id){
		var content = document.getElementById(id);
		if(content.style.display=="none")
		{
			content.style.display="block";
		}
		else
		{content.style.display="none";}
		
		$.ajax({
			url:$("#appName").val()+"/user/getTeamMember.act",
			type:"post",
			data: {
   				teamID:id
   			  },
   			success: function(res) {           		
       			showTeamMember(res); 
       			console.log(res);
       		},
       		error: function(res) {        			
       			console.log(res);
       		}   
		});	
	}
	
	function showTeamMember(res){
		var teamMember = eval(res);
		var htmlTeamMember = "<div class='panel panel-default'>"+
		"<table class='table' style='word-break:break-all; word-wrap:break-all;'>"+
		"<thead style='font-weight:bold;'>"+
		"<tr><th>#</th><th>姓名</th><th>邮箱</th><th>电话</th><th>详细信息</th></tr></thead><tbody>";
		for(var number = 0; number < teamMember.length; number++){
			htmlTeamMember = htmlTeamMember + "<tr><th scope='row'>"+ ( number + 1 ) + "</th>"+
			"<td>"+teamMember[number].userName+"</td>"+
			"<td>"+teamMember[number].email+"</td>"+
			"<td>"+teamMember[number].tel+"</td>"+
			"<td><a onclick = 'showSpecific(" + teamMember[number].id +","+ teamMember[number].raceId + ");'>查看</a></td>"+	
			"</tr>";
		}
		htmlTeamMember = htmlTeamMember + "</tbody></table></div>";
		var name = "#"+teamMember[0].teamId;
		$(name).html(htmlTeamMember);
	}
	
	function showSpecific(applyId,raceId){
		console.log(applyId,raceId);
		$.ajax({
			url : $("#appName").val() + "/race/managerStageShowSpecific.act",
			type : "POST",
			data : {
				applyId : applyId,
				raceId : raceId
 			},
			dataType : "JSON",
			success : function(res){	
				var context = eval(res);
				var htmlContext = "";
				for (var number = 0; number < context.length; number++){
					htmlContext =  htmlContext + context[number].name + " : " + 
					context[number].value + "\r\n";
				}
				alert(htmlContext);
			},
			error : function(res){
				console.log(res);
			}
		});
		
	}
	
	// 提交物部分
	//载入阶段选项框
	function selectGroupPhase() {
	      var singleValues = $("#stageGroupSelect").val();
	      loadPhase(singleValues);
	    }
	 
	 $("#stageGroupSelect").change(selectGroupPhase); 
	
	function loadPhase(groupID){
		$.ajax({
			url:$("#appName").val()+"/race/manageStageLoadPhase.act",
			type:"POST",
			data:{
				groupID:groupID
			},
			dataType:"JSON",
			success:function(res){
				showLoadPhase(res);
			},
			error:function(res){
				console.log(res);
			}
		});
	}
	
	function showLoadPhase(res){
		var htmlPhase = "";
		var phase = eval(res);
		for(var number = 0; number < phase.length; number++){
			htmlPhase = htmlPhase + "<option value = "+phase[number].id+">"+phase[number].name+"</option>";
		}
		$("#stageStageSelect").html(htmlPhase);
		selectPhaseTeam();
	}
	 
	 function selectPhaseTeam() {
	      var singleValues = $("#stageStageSelect").val();
	      getPhaseTitle(singleValues);
	    }
	 
	 $("#stageStageSelect").change(selectPhaseTeam);
	 
	 function getPhaseTitle(phaseId){
		 $.ajax({
			 url : $("#appName").val() + "/race/manageStageGetPhaseTitle.act",
			 type: "POST",
			 data:{
				 phaseId : phaseId
			 },
			 dataType : "JSON",
			 success : function(res){
				 showPhaseTitle(res);
			 },
			 error : function(res){
				 console.log(res);
			 }
		 });
	 }
	
	
	//显示阶段审核下的标题 status 0 为阶段审查未结束 1 为未开始 2 为已结束
	function showPhaseTitle(res){
        var phase = eval(res);	
		var htmlPhaseTitle = "<a class='list-group-item list-group-item-success' href='##'>" +
		"<h3 style='display:inline;'>" +
		phase[0].name+"</h3>"+
		"<h3 class='team-state-wait'>阶段时间："+
		phase[0].startTime + "-" + phase[0].endTime + "</h3></a>";
		$("#phaseTitle").html(htmlPhaseTitle);
		getPhase(phase[0].id,phase[0].status);
	}
	
	//阶段审查的队伍
	function getPhase(phaseID,status){
		$.ajax({
			url:$("#appName").val() + "/race/manageGetStagePhase.act",
			type:"POST",
			data:{
				phaseID:phaseID
			},
			dataType:"JSON",
			success:function(res){
				if(status == 1){
					showPhaseDoing(res);
					console.log("Y1"+res);
				}
				else if(status == 2){
					showPhaseDone(res);
					console.log("Y2"+res);
				}
				else{
					beginPhase();
				}
			},
			error:function(res){
				console.log(res);
			}
		});
	}
	
	function beginPhase(){
		var msg = "确定开启阶段吗？";
		if(confirm(msg) == true){
			finishPhase(1);
		}
	}
	
	function showPhaseDoing(res){
		var phase = eval(res);
		
		var htmlPhase = "";		
		htmlPhase = "<div class = 'pannel panel-default'>"+
		"<table class = 'table' style = 'word-break:break-all; word-wrap:break-all'>"+ 
		"<thead style = 'font-weight:bold;'>" + 
		" <tr><th>#</th><th>队伍名</th><th>提交物</th><th>提交物说明</th><th>文件</th></tr></thead><tbody>";
		
		for(var number = 0; number < phase.length; number++){
			htmlPhase = htmlPhase + "<tr><th scope = 'row'>" + (number + 1) + "</th>" + 
			"<td>" + phase[number].teamName + "</td>" +
			"<td>" + phase[number].name  + "</td>" + 
			"<td>" + phase[number].content + "</td>" + 
			"<td><a class = 'team-operate' href = '"+ phase[number].fileUrl +"'>下载</a></td>" ;
			//队伍淘汰
			if(phase[number].teamStatus == 2){
				htmlPhase = htmlPhase + 
				"<td><a class = 'team-operate' onclick = 'teamStatusGoOrOut("+phase[number].teamId+");'>淘汰</a></td></tr>" ;
			}
		}
		
		htmlPhase = htmlPhase + "</tbody></table></div>" + 
		"<h3 class = 'stage-pass' onclick  = 'finishPhase(2)'>完成此阶段审核</h3>";
		$("#phaseSubmit").html(htmlPhase);
	}
	
	function showPhaseDone(res){
		var htmlPhase = "";
		var phase = eval(res);
		
		htmlPhase = "<div class = 'pannel panel-default'>"+
		"<table class = 'table' style = 'word-break:break-all; word-wrap:break-all'>"+ 
		"<thead style = 'font-weight:bold;'>" + 
		" <tr><th>#</th><th>队伍名</th><th>提交物</th><th>提交时间</th><th>文件</th><th>晋级</th></tr></thead><tbody>";
		
		for(var number = 0; number < phase.length; number++){
			htmlPhase = htmlPhase + "<tr><th scope = 'row'>" + (number + 1) + "</th>" + 
			"<td>" + phase[number].teamName + "</td>" +
			"<td>" + phase[number].name +"作品" + "</td>" + 
			"<td>" + phase[number].content + "</td>" + 
			"<td><a class = 'team-operate' href = '"+ phase[number].fileUrl +">下载</a></td>" ;
		}
		
		htmlPhase = htmlPhase + "</tbody></table></div>" + 
		"<h3 class = 'stage-wait'>审核已结束</h3>";
		$("#phaseSubmit").html(htmlPhase);
	}
	
	//淘汰
	function teamStatusGoOrOut(id){
		var msg = "您确定淘汰该队伍吗？";
		if(confirm(msg) == true){
			sendteamStatusGoOrOut(id);
		}
	}
	
	function sendteamStatusGoOrOut(id){
		$.ajax({
			url : $("#appName").val() + "/race/manageStageTeamGoOrOut.act",
			type : "POST",
			data : {
				teamId : id
			},
			dataType : "JSON",
			success : function(res){
				selectPhaseTeam();
			},
			error : function(res){
				
			}
		});
	}
	
	//完成阶段的审查
	function finishPhase(status){
		var phaseId = $("#stageStageSelect").val();
		$.ajax({
			url : $("#appName").val() + "/race/manageStageFinishPhase.act",
			type : "POST",
			data : {
				phaseId : phaseId,
				Status : status
			},
			dataType : "JSON",
			success : function(res){
				selectPhaseTeam();
			},
			error : function(res){
				
			}
			
		});
	}
	// 颁奖部分
	 function selectPraiseTeam() {
	      var singleValues = $("#priceGroupSelect").val();
	      getPraiseTitle(singleValues);
	    }
	 
	 $("#priceGroupSelect").change(selectPraiseTeam);
	
	//得到获奖的标题
	function getPraiseTitle(goupID){
		$.ajax({
			url:$("#appName").val()+"/race/manageStageGetPraiseTitle.act",
			type:"POST",
			data:{
				groupID:goupID
				},
			dataType:"JSON",
			success:function(res){
				showPraiseTitle(res);
			},
			error:function(res){
				console.log(res);
			}
		});
	}
	

	function showPraiseTitle(res){
		var group = eval(res);
		var htmlPraiseTitle = "<a class='list-group-item list-group-item-success' href='##'>" +
		"<h3 style='display:inline;'>" +
		group[0].name +"颁奖情况</h3>"+ "</a>";
		$("#praiseTitle").html(htmlPraiseTitle);
		//group status 0 报名审核 1 开始比赛 2 比赛结束 3 颁奖结束
		if(group[0].status == 0){
			getPraise(group[0].id,false);
		}
		else if(group[0].status == 2){
			getPraise(group[0].id,false);
		}
		else{
			
		}
	}
	
	//得到要颁奖的组别
	function getPraise(groupID,isFinished){
		$.ajax({
			url : $("#appName").val() + "/race/manageStageGetPraise.act",
			type : "POST",
			data : {
				groupID : groupID,
				isFinished : isFinished
			},
			dataTape : "JSON",
			success : function(res){
				console.log(res);
				if(!isFinished){
					showPraiseDoing(res);		
				}
				else{
					showPraiseDone(res);
				}
			},
			error : function(res){
				console.log(res);
			}	
		});
	}
	
	//未颁奖
	function showPraiseDoing(res){
		var praise = eval(res);
		var htmlPraise = "";
		htmlPraise = "<div class = 'pannel panel-default'>" + 
		"<table class = 'table' style = 'word-break:break-all; word-wrap:break-all'>"+ 
		"<thead style = 'font-weight:bold;'>" + 
		" <tr><th>#</th><th>队伍名</th><th>现状态</th><th>选择奖项</th><th>操作</th></tr></thead><tbody>";
		for(var number = 0; number < praise.length; number ++){
			htmlPraise = htmlPraise + "<tr><th scope = 'row'>" + (number + 1) + "</th>" + 
			"<td>" + praise[number].name + "</td>" +
			"<td>" + praise[number].reward  + "</td>" + 
			"<td><select class='' name='' id='pricePriceSelect" + praise[number].id + "'>" + "</select></td>" +
			"<td><a class='team-operate' onclick = 'sendPraise("+ praise[number].id +")'>颁奖</a></td></tr>";	
			getPraiseSelect(praise[0].groupID,praise[number].id);
		}
		htmlPraise = htmlPraise + "</tbody></table></div>" + 
		"<h3 class='stage-pass' onclick = 'finishPraise(" + praise[0].id + ")'>完成此组颁奖</h3></div>";

		$("#praiseShow").html(htmlPraise);
	}
	//颁奖奖项
	function getPraiseSelect(groupID,teamid){
		$.ajax({
			url : $("#appName").val() + "/race/getPraiseSelect.act",
			type : "POST",
			data : {
				groupID : groupID
			},
			dataType : "JSON",
			success : function(res){
				showPraiseSelect(res,teamid);
				console.log(res);
			},
			error : function(res){
				console.log(res);
			}
		});
	}
	
	function showPraiseSelect(res,teamId){
		var praise = eval(res);
		var htmlSelect = "";
		for(var number = 0; number < praise.length; number++){
			htmlSelect = htmlSelect + "<option value = '" + praise[number].id + "'>" + praise[number].name + "</option>";
		}	
		var name = "#"  + "pricePriceSelect" + teamId;
		$(name).html(htmlSelect);
	}
	
	//已颁奖	
	function showPraiseDone(res){
		var praise = eval(res);
		var htmlPraise = "";
		
		htmlPraise = "<div class = 'pannel panel-default'>"+
		"<table class = 'table' style = 'word-break:break-all; word-wrap:break-all'>"+ 
		"<thead style = 'font-weight:bold;'>" + 
		" <tr><th>#</th><th>队伍名</th><th>获奖情况</th></tr></thead><tbody>";
		
		for(var number = 0; number < praise.length; number ++){
			htmlPraise = htmlPraise + "<tr><th scope = 'row'>" + (number + 1) + "</th>" + 
			"<td>" + praise[number].name + "</td>" +
			"<td>" + praise[number].reward  + "</td></tr>"; 		
		}
		htmlPraise = htmlPraise + "</tbody></table></div>" + 
		"<h3 class='stage-wait'>此组颁奖已结束</h3></div>";
		$("#praiseShow").html(htmlPraise);
	}
	
	function sendPraise(teamId){
		var praise = $("#pricePriceSelect" + teamId).val();
		$.ajax({
			url : $("#appName").val() + "/race/mamageStageSendPraise.act",
			type : "POST",
			data : {
				teamId : teamId,
				praiseId : praise
			},
			dataType : "JSON",
			success : function(res){
				selectPraiseTeam();
			},
			error : function(res){		
			}
		});
	}
	
	function finishPraise(groupId){
		$.ajax({
			url : $("#appName").val() + "/race/manageStageFinishPraise.act",
			type : "POST",
			data : {
				groupId : groupId
			},
			dataType : "JSON",
			success : function (res){
				selectPraiseTeam();
			},
			error : function (res){
				
			}
		});
	}
	
	//发送消息部分
	 function sendMessage() {
	      var singleValues = $("#messageGroup").val();
	      selectMessageTeam(singleValues);
	    }
	 
	 $("#messageGroup").change(sendMessage);  
	 
	 function selectMessageTeam(groupID){
		 $.ajax({
				url:$("#appName").val() + "/race/manageStageselectMessageTeam.act",
				type:"POST",
				data:{
					groupID:groupID
				},
				dataType:"JSON",
				success:function(res){
					showTeamSelect(res);
					console.log(res);
				},
				error:function(){
					console.log(res);
				}
			});
	 }
	
	function showTeamSelect(res){
		var team = eval(res);
		var htmlTeam = "";
		for(var number = 0; number < team.length; number ++){
			htmlTeam = htmlTeam + "<option value = "+team[number].leadId+">" + team[number].name + "</option>";
		}
		$("#messageTeam").html(htmlTeam);
	}
	
	 function sendMessageToLeader(){
		var leader = $("#messageTeam").val();
		console.log("leader" + leader);
		var message = $("#message").val();
		console.log("message" + message);
		$.ajax({
			url:$("#appName").val() + "/race/manageStageMessage.act",
			type:"POST",
			data:{
				leader : leader,
				message : message
			},
			dataType:"JSON",
			success:function(res){
				alert("成功");
				$("#message").val("");
			},
			error:function(res){
				console.log(res);
			}
		});	
	}
	
</script>
</body>
</html>