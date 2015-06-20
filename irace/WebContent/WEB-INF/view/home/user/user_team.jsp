<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${ title }</title>
<%@ include file="/public/section/header.jsp"%>
<link href="<%=request.getContextPath() %>/public/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath() %>/public/css/nivo-slider.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
.team-state-submit {
	color:#4F7F90;
	float:right;
	cursor:pointer;
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
</style>
		
<script type="text/javascript">	

</script>	
</head>
<body>
<!-- 在这里引入登录模块 -->
<%@ include file="/public/section/user-div.jsp" %>
    
    
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
                  <ul class="nav navbar-nav" style="font-family:微软雅黑">
                    <li><a href="<%=request.getContextPath() %>/user/userCenter">我参加的比赛 <span class="sr-only">(current)</span></a></li>
                    <li><a href="<%=request.getContextPath() %>/user/userTeam" style="color: #FFF; background-color: #4cb1ca;">参加的队伍</a></li>   
                    <li><a href="<%=request.getContextPath() %>/user/usermsg">通知中心</a></li>  
                    <li><a href="<%=request.getContextPath() %>/user/userInfo">个人信息</a></li>  
                    <li><a href="<%=request.getContextPath() %>/user/userAccount">账号管理</a></li>                      
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
		  
		 <ul class="nav nav-tabs">
                  <li role="presentation" class="active"><a href="#" id="tab1"  style="background-color:#DFF0D8;"><h4>我创建的</h4></a></li>
                  <li role="presentation" class="active"><a href="#" id="tab2" ><h4>我加入的</h4></a></li> 
                  <li role="presentation" class="active"><a href="#" id="tab3" ><h4>正在申请的</h4></a></li> 
                </ul>  
				
			    <div class="panel panel-default" style="font-family:微软雅黑;">
				
				
                <!--我创建的小组-->
				<div id="create" style="display:block">
				</div>	
				
				
				
				<!--我加入的小组-->
				<div id="join" style="display:none">   				
                </div>
					
					
					
				<!--待审核的小组-->
				<div id="wait" style="display:none">
				</div>			
                
                </div>
        <div class="clear" style = "height : 50px;"></div>
		<h2 class="head">猜你喜欢</h2>
		<div class="top-box" id="recommendation"> 
		  
		</div>
              
				
		<div class="clear"></div>
		</div>	            		 						 			    
		</div>
        

            
            
            
            <!--侧边-->
			<div class="rsidebar span_1_of_left">
				<div class="top-border"> </div>
				 <div class="border">
	             <link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
	             <link href="css/nivo-slider.css" rel="stylesheet" type="text/css" media="all" />
				  <script src="js/jquery.nivo.slider.js"></script>
				    <script type="text/javascript">
				    $(window).load(function() {
				        $('#slider').nivoSlider();
				    });
				    </script>
		    <div class="slider-wrapper theme-default">
              <div id="slider" class="nivoSlider">
                <img src="<%=request.getContextPath() %>/public/images/t-img1.jpg"  alt="" />
               	<img src="<%=request.getContextPath() %>/public/images/t-img2.jpg"  alt="" />
                <img src="<%=request.getContextPath() %>/public/images/t-img3.jpg"  alt="" />
              </div>
             </div>
              <div class="btn"><a href="single.html">Check it Out</a></div>
             </div>
           <div class="top-border"> </div>
	    </div>
	   <div class="clear"></div>
	</div>
	</div>
	</div>
    
  
	<%@ include file="/public/section/footer.jsp" %>	

	<!-- 引入文件上传弹窗 -->
	<!-- <h3 class='team-state-submit' data-toggle='modal' data-target='#myModal' onclick="setApplyIdForSubmit(1)">比赛正在进行，点击提交阶段产物</h3> -->

	<%@ include file="/public/section/upload-file.jsp" %>
	<!-- 取得用户id -->
	<input id="userIDHtml" type="hidden" value="<%=session.getAttribute("uid") %>">	
	
	<script src="<%=request.getContextPath() %>/public/js/jquery.nivo.slider.js"></script>
	<script type="text/javascript"> 
	var userID = $("#userIDHtml").val();
	var tab1= document.getElementById("tab1");
	var tab2= document.getElementById("tab2");
	var tab3= document.getElementById("tab3");
	var teamDiv1 = document.getElementById("create");
	var teamDiv2 = document.getElementById("join");
	var teamDiv3 = document.getElementById("wait");
	//Ajax函数
	
	$(document).ready(function(){	
		$(".inner_content").hover(function() {
	        $(".inner_content#"+this.id+" .product_image .float-Bar").slideToggle();
	    });		
		$('#slider').nivoSlider();
	    getReconmmendation();
	    loadCreate();
	    
	    
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
	
	$("#tab1").click(function(){
    	tab1.style.backgroundColor="#DFF0D8";
		tab2.style.backgroundColor="";
		tab3.style.backgroundColor="";
		teamDiv1.style.display="block";
		teamDiv2.style.display="none";
		teamDiv3.style.display="none";
		loadCreate();
    } );
    
    $("#tab2").click(function(){
    	tab2.style.backgroundColor="#DFF0D8";
		tab1.style.backgroundColor="";
		tab3.style.backgroundColor="";
		teamDiv1.style.display="none";
		teamDiv2.style.display="block";
		teamDiv3.style.display="none";
		loadJoin();
    } );
    
    $("#tab3").click(function(){
    	tab3.style.backgroundColor="#DFF0D8";
		tab2.style.backgroundColor="";
		tab1.style.backgroundColor="";
		teamDiv1.style.display="none";
		teamDiv2.style.display="none";
		teamDiv3.style.display="block";
		loadWait();
    } );
	
	function showReconmmendation(res){		
		var race = eval(res);   
		console.log(res);        	
		
		var htmlText = "";
		var cursor = 0;	
		
		for(var j=0;j<3;j++){
			if(cursor<race.length){
			   htmlText = htmlText + 
    				 "<div class='col_1_of_3 span_1_of_3'>"+
    				 "<a href='  " +$("#appName").val()+ "/race/detail/"+ race[cursor].id +"'>"+ 
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
					 "<span class='actual' font='0.5em'>"+ (race[cursor].startTime.year+1900) +"/" + race[cursor].startTime.month +"-"+ (race[cursor].endTime.year+1900) +"/" + race[cursor].endTime.month +"</span>"+
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
	
	function loadCreate(){
		$.ajax({
			url:$("#appName").val()+"/user/getTeamCreate.act",
			type:"post",
			data: {
   				userID:userID
   			  },
   			success: function(res) {
       			showTeamCreate(res);        			
       		},
       		error: function(res) {        			
       			console.log(res);
       			alert('输入错误！请返回重新输入！');
       		}   
		});
	}
	
	function showTeamCreate(res){
		var apply = eval(res);   
		console.log(res);
		var htmlCreate = "";
		for(var number = 0;number < apply.length;number++){
			htmlCreate = htmlCreate + "<a name = 'i_create'></a>"+
			"<div class = 'panel-body'>"+
			"<div class ='list-group'>" +
		    "<a class='list-group-item list-group-item-success' onclick='upDown("+apply[number].teamId + "," + true +");'  href='##' >" +
			"<h3 style='display:inline;'>"+apply[number].teamName+"</h3></a>"+
			"<a class='list-group-item'>"+
			"<div id ='"+apply[number].teamId +"' style='display:none'>"+"</div>"+
			"<span class = 'label label-default'>"+apply[number].raceName+"</span>"+
			"<span class = 'label label-primary'>"+apply[number].leaderName+"</span>"+
			"<span class = 'label label-default'>"+apply[number].teamSlogan+"</span>";
			if(apply[number].raceStatus == 3)
				htmlCreate = htmlCreate + "<span class = 'label label-info'>"+apply[number].reward+"</span>";
			switch(apply[number].raceStatus){
			//比赛报名阶段
			case 1:
				//队伍未发送申请
				if(apply[number].teamStatus == 0){
					htmlCreate = htmlCreate + "<h3 class='team-state-submit' onclick = 'applyTeam("+apply[number].teamID+");'>未提交审核，点击提交审核</h3>";
				}
				//队伍等待审核通过
				else if(apply[number].teamStatus == 1){
					htmlCreate = htmlCreate+"<h3 class='team-state-wait'>正在等待审核通过</h3>";
				}
				//队伍通过审核
				else if(apply[number].teamStatus == 2){
					htmlCreate = htmlCreate+"<h3 class='team-state-wait'>小组审核通过</h3>";
				}
				//队伍未通过审核
				else{
					htmlCreate = htmlCreate+"<h3 class='team-state-wait'>小组被拒绝</h3>";
				}			
				break;
			//比赛阶段
			case 2:
				htmlCreate = htmlCreate+"<h3 class='team-state-submit' data-toggle='modal' data-target='#myModal' onclick='setApplyIdForSubmit( "+apply[number].id +")'>比赛正在进行，点击提交阶段产物</h3>";
				break;
			//比赛结束
			case 3:
				htmlCreate = htmlCreate+"<h3 class='team-state-wait'>比赛结束</h3>";
				break;
			default :
				break;
			}
			htmlCreate = htmlCreate +"</a></div></div>";
		}
		$("#create").html(htmlCreate);
	}
	
	function loadJoin(){
		$.ajax({
			url:$("#appName").val()+"/user/getTeamJoin.act",
			type:"post",
			data: {
   				userID:userID
   			  },
   			success: function(res) {           		
       			showTeamJoin(res);        			
       		},
       		error: function(res) {        			
       			console.log(res);
       			alert('输入错误！请返回重新输入！');
       		}   
		});
	}
	
	function showTeamJoin(res){
		var apply = eval(res);   
		console.log("load"+res);
		var htmlJoin = "";
		for(var number = 0;number < apply.length;number++){
			htmlJoin = htmlJoin + "<a name = 'i_join'></a>"+
			"<div class = 'panel-body'>"+
			"<div class ='list-group'>"+
			"<a class='list-group-item list-group-item-success' href='##' onclick='upDown("+apply[number].teamId+ ","+ false +");'>"+
			"<h3>"+apply[number].teamName+"</h3></a>"+
			"<a class='list-group-item'>"+
			"<div id ='"+apply[number].teamId+"' style='display:none'>"+"</div>"+
			"<span class = 'label label-default'>"+apply[number].raceName+"</span>"+
			"<span class = 'label label-primary'>"+apply[number].leaderName+"</span>"+
			"<span class = 'label label-default'>"+apply[number].teamSlogan+"</span>" ;
			if(apply[number].raceStatus == 3)
				htmlJoin = htmlJoin + "<span class = 'label label-info'>"+apply[number].reward+"</span>";
			switch(apply[number].raceStatus){
			//比赛报名阶段
			case 1:
				//队伍未发送申请
				if(apply[number].teamStatus == 0){
					htmlJoin = htmlJoin + "<h3 class='team-state-wait' >未提交审核</h3>";
				}
				//队伍等待审核通过
				else if(apply[number].teamStatus == 1){
					htmlJoin = htmlJoin+"<h3 class='team-state-wait'>正在等待审核通过</h3>";
				}
				//队伍通过审核
				else if(apply[number].teamStatus == 2){
					htmlJoin = htmlJoin+"<h3 class='team-state-wait'>小组审核通过</h3>";
				}
				//队伍未通过审核
				else{
					htmlJoin = htmlJoin+"<h3 class='team-state-wait'>小组被拒绝</h3>";
				}			
				break;
			//比赛阶段
			case 2:
				htmlJoin = htmlJoin+"<h3 class='team-state-submit'>比赛正在进行，点击提交阶段产物</h3>";
				break;
			//比赛结束
			case 3:
				htmlJoin = htmlJoin+"<h3 class='team-state-wait'>比赛结束</h3>";
				break;
			default :
				break;
			}
			htmlJoin = htmlJoin +"</a></div></div>";
		}
		$("#join").html(htmlJoin);		
	}
	
	function loadWait(){
		$.ajax({
			url:$("#appName").val()+"/user/getTeamWait.act",
			type:"post",
			data: {
   				userID:userID
   			  },
   			success: function(res) {           		
       			showTeamWait(res);        			
       		},
       		error: function(res) {        			
       			console.log(res);
       			alert('输入错误！请返回重新输入！');
       		}   
		});
	}
	
	function showTeamWait(res){
		var apply = eval(res);   
		console.log("wait"+res);
		var htmlWait = "";
		for(var number = 0;number < apply.length;number++){
			htmlWait = htmlWait + "<a name = 'wait_pass'></a>"+
			"<div class = 'panel-body'>"+
			"<div class ='list-group'>"+
			"<a class='list-group-item list-group-item-success' href='##' onclick='upDown("+apply[number].teamId+");'>"+
			"<h3>"+apply[number].teamName+"</h3></a>"+
			"<a class='list-group-item'>"+
			"<div id ='"+apply[number].teamId+"' style='display:none'>"+"</div>"+
			"<span class = 'label label-default'>"+apply[number].raceName+"</span>"+
			"<span class = 'label label-primary'>"+apply[number].leaderName+"</span>"+
			"<span class = 'label label-default'>"+apply[number].teamSlogan+"</span>"+
			"<h3 class='team-state-wait'>正在组队</h3>"+"</a></div></div>";
		}
		$("#wait").html(htmlWait);
	}
					
	function upDown(id, judge)
	{
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
   				if(judge)
       			    showTeamMember(res); 
   				else
   					showTeamMemberJoin(res);
       		},
       		error: function(res) {        			
       			console.log(res);
       			alert('输入错误！请返回重新输入！');
       		}   
		});	
	}
	
	function showTeamMember(res){
		var apply = eval(res); 
		var htmlMember = "";
		htmlMember = htmlMember +"<div class='panel panel-default'>"+
		"<table class='table' style='word-break:break-all; word-wrap:break-all;'>"+
		"<thead style='font-weight:bold;'>"+
		"<tr><th>#</th><th>姓名</th><th>邮箱</th><th>电话</th><th>状态</th><th></th><th></th></tr></thead>"+
		"<tbody>";
		for(var number = 0;number < apply.length;number++){
			htmlMember = htmlMember + "<tr>"+
			"<th scope = 'row'>"+ (number+1)+"</th>"+
			"<td>"+apply[number].userName+"</td>"+
			"<td>"+apply[number].email+"</td>"+
			"<td>"+apply[number].tel+"</td>";
			//比赛报名
			if(apply[number].raceStatus == 1){
				if(apply[number].status == 1){
					htmlMember = htmlMember + "<td>待审核</td>"+
					"<td><a class='team-operate' onclick = 'chooseAgree("+apply[number].id+","+apply[number].teamId+");'>同意</a></td><td><a class='team-operate' onclick = 'chooseRefuse("+apply[number].ID+","+apply[number].teamID+")'>拒绝</a></td></tr>";
				}
				else{
					htmlMember = htmlMember + "<td>已加入</td>"+
					"<td><a class='team-operate' onclick = 'chooseDelete("+apply[number].id+","+apply[number].teamId+");'>删除</a></td></tr>";
				}
			}
			//
			else{
				htmlMember = htmlMember + "<td>已加入</td></tr>";
			}
		}
		htmlMember = htmlMember +"</tbody></table></div>";
		var name = "#"+apply[0].teamId;
		$(name).html(htmlMember);
	}
	
	function showTeamMemberJoin(res){
		var apply = eval(res); 
		var htmlMember = "";
		htmlMember = htmlMember +"<div class='panel panel-default'>"+
		"<table class='table' style='word-break:break-all; word-wrap:break-all;'>"+
		"<thead style='font-weight:bold;'>"+
		"<tr><th>#</th><th>姓名</th><th>邮箱</th><th>电话</th><th>状态</th></tr></thead>"+
		"<tbody>";
		for(var number = 0;number < apply.length;number++){
			htmlMember = htmlMember + "<tr>"+
			"<th scope = 'row'>"+ (number+1)+"</th>"+
			"<td>"+apply[number].userName+"</td>"+
			"<td>"+apply[number].email+"</td>"+
			"<td>"+apply[number].tel+"</td>" +
			"<td>已加入</td></tr>";
		}
		htmlMember = htmlMember +"</tbody></table></div>";
		var name = "#"+apply[0].teamId;
		$(name).html(htmlMember);	
	}
	
	
	function chooseAgree(id,teamid){
		$.ajax({
			url:$("#appName").val()+"/user/getTeamChooseAgree.act",
			type:"post",
			data: {
   				applyID:id,
   				teamID:teamid
   			  },
   			success: function(res) {  
   				var apply = eval(res);
   				showTeamMember(res);  			       			
       		},
       		error: function(res) {        			
       			console.log(res);
       			alert('输入错误！请返回重新输入！');
       		}   
		});	
	}
	
	function chooseRefuse(id,teamid){
		$.ajax({
			url:$("#appName").val()+"/user/getTeamchooseRefuse.act",
			type:"post",
			data: {
				applyID:id,
				teamID:teamid
   			  },
   			success: function(res) {           		
   				var apply = eval(res);
   				showTeamMember(res);    			
       		},
       		error: function(res) {        			
       			console.log(res);
       			alert('输入错误！请返回重新输入！');
       		}   
		});	
	}
	
	function chooseDelete(id,teamid){
		$.ajax({
			url:$("#appName").val()+"/user/getTeamchooseDelete.act",
			type:"post",
			data: {
				applyID:id,
				teamID:teamid
   			  },
   			success: function(res) {           		
   				var apply = eval(res);
   				showTeamMember(res);  		
       		},
       		error: function(res) {        			
       			console.log(res);
       			alert('输入错误！请返回重新输入！');
       		}   
		});	
	}
	
	function applyTeam(id){
		//发送申请
		$.ajax({
			url : $("#appName").val() + "/user/userTeamSendTeamApply.act",
			type : "POST",
			data : {
				teamId : id
			},
			dataType : "JSON",
			success : function(res){
				alert("申请已发送");
			},
			error : function(res){
				alert("请重新发送");
			}
			
		})
		
	}
	
</script> 
</body>
</html>