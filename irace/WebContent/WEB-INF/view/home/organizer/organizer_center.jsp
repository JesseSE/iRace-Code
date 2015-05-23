<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<title>${ title }</title>
	<%@ include file="/public/section/header.jsp"%>
	
	<link href="<%=request.getContextPath() %>/public/css/default.css" rel="stylesheet" type="text/css" media="all" />
	<link href="<%=request.getContextPath() %>/public/css/nivo-slider.css" rel="stylesheet" type="text/css" media="all" />

<style type="text/css">
.race-state-submit {
	color:#4F7F90;
	float:right;
	cursor:pointer;
}
.race-state-submit:hover
{
	text-decoration:underline;
	color:#7A5555;
}
.race-state-wait {
	color:#7A5555;
	float:right;
}
</style>
		
<script type="text/javascript">	
function raceTab(pos)
{
	var tab1= document.getElementById("tab1");
	var tab2= document.getElementById("tab2");
	var tab3= document.getElementById("tab3");
	var raceDiv1 = document.getElementById("ongoing");
	var raceDiv2 = document.getElementById("finish");
	var raceDiv3 = document.getElementById("publish");
	
	if(pos==1)
	{
		tab1.style.backgroundColor="#DFF0D8";
		tab2.style.backgroundColor="";
		tab3.style.backgroundColor="";
		
		raceDiv1.style.display="block";
		raceDiv2.style.display="none";
		raceDiv3.style.display="none";
	}
	else if(pos==2)
	{
		tab2.style.backgroundColor="#DFF0D8";
		tab1.style.backgroundColor="";
		tab3.style.backgroundColor="";
		
		raceDiv1.style.display="none";
		raceDiv2.style.display="block";
		raceDiv3.style.display="none";
	}
	else if(pos==3)
	{
		tab3.style.backgroundColor="#DFF0D8";
		tab1.style.backgroundColor="";
		tab2.style.backgroundColor="";
		
		raceDiv1.style.display="none";
		raceDiv2.style.display="none";
		raceDiv3.style.display="block";
	}
	else{}
}

</script>


</head>
<body>
	<!-- 在这里引入登录模块 -->
     <%@ include file="/public/section/user-div.jsp" %>
    
    
    <!--机构整体导航栏导航栏-->
	<div class="header-bottom" style="margin-top:-10px;">
	    <div class="wrap" style="margin-top:-10px;">
            
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header"></div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav" style="font-family:微软雅黑;">
                    <li><a href="<%=request.getContextPath() %>/organizer/orgcenter" style="color:#FFF;background-color:#4cb1ca;">比赛管理<span class="sr-only">(current)</span></a></li>
                    <li><a href="<%=request.getContextPath() %>/organizer/orgcenter">机构信息管理</a></li>   
                    <li><a href="<%=request.getContextPath() %>/organizer/orgcenter">机构账号管理</a></li>                    
                  </ul>           
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
            </nav>           
            
         </div> 
        
	</div>  
    <!--机构整体导航栏导航栏结束-->
    
    
<!--显示-->
<div class="main" style="margin-top:-25px;">
	<div class="wrap">
		<div class="section group">            
		  <div class="cont span_2_of_3">
            <!-- 我的比赛开始 --> 
			<div class="top-box" name="my_race">
				<!-- 我的比赛导航栏 -->
                <ul class="nav nav-tabs">
                  <li role="presentation" class="active"><a href="##" id="tab1" onclick="raceTab(1);"  style="background-color:#DFF0D8;"><h4>正在进行</h4></a></li>
                  <li role="presentation" class="active"><a href="##" id="tab2" onclick="raceTab(2);" ><h4>已经结束</h4></a></li> 
                  <li role="presentation" class="active"><a href="##" id="tab3" onclick="raceTab(3);" ><h4>未发布</h4></a></li> 
                </ul>  
                <!-- 我的比赛导航栏结束 -->
                
				<!--正在进行的比赛开始 -->
				<div id="ongoing" style="display:block">
			    <div class="panel panel-default">
                    <a name="race_default"></a>
                      <div class="panel-body" id="race1">
					  		<!-- 在这里注入正在进行的比赛 -->
                      </div>
                </div>
			   </div> 
			   <!--正在进行的比赛结束 -->  
			             
				<!--已经结束的比赛开始-->
				<div id="finish" style="display:none">
                <div class="panel panel-default">
                    <a name="race_done"></a>
                      <div class="panel-body" id="race2">
					  		<!-- 在这里诸如已经结束的比赛 -->
                      </div>
                	</div>  
			    </div> 
			    <!--已经结束的比赛结束-->  
			             
				<!--未发布的比赛-->
				<div id="publish" style="display:none">
                <div class="panel panel-default">
                    <a name="race_done"></a>
                      <div class="panel-body" id="race3">
                      		<!-- 在这里诸如还未发布的比赛 -->
                      </div>
                	</div>  
			    </div>
			    <!--未发布的比赛结束-->
			                    
				<div class="clear"></div>
                
                <!--分页开始-->
                <nav style="text-align:center">
					<ul class="pagination">
						<li><a href="#" aria-label="Previous" id="prePage"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						<li><a href="#" id=curPage>1</a></li>										
						<li><a href="#" aria-label="Next" id="nextPage"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav> 
                <!-- 分页结束  -->               
                
			</div>
			<!-- 我的比赛结束 -->	
				
				<div class="clear" style="height:37px;"></div>
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
	    
	<div class="clear"></div>
	</div>
	</div>
	</div>
    
    <!-- 页底开始  -->
    <%@ include file="/public/section/footer.jsp" %>
	<!-- 页底结束  -->
	
	<!-- 取得用户id -->
	<input id="orIDHtml" type="hidden" value="<%=session.getAttribute("uid") %>">
	
	<!-- Jquery函数开始 -->
	<script type="text/javascript">		
		var currentPage; //当前页面
		var organizerId; //举办方id
		var pageStatus;
		var totalPage;
		
		//初始化值
		function initValue(){
			totalPage = 1;
			pageStatus = 1;	//1正在进行，2已经结束，3还未发布
			currentPage = 1;			
			organizerId = $("#orIDHtml").val();
			//organizerId = 1;
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
			if(currentPage < totalPage){				
				currentPage = currentPage + 1;
				return true;
			}else{
				alert("已经是最后一页了哦！");
				return false;
			}				
		}
		
		//当页面加载完成后自动获取正在进行的比赛
		$(document).ready(function() {
			initValue();
			getRaceInfo();
		});
		//点击选择比赛的状态
		$("#tab1").click(function(){
			initValue();			
			getRaceInfo();
		});
		$("#tab2").click(function(){
			initValue();		
			pageStatus = 2;	
			getRaceInfo();
		});
		$("#tab3").click(function(){
			initValue();		
			pageStatus = 3;	
			getRaceInfo();
		});
		//点击翻页
		$("#prePage").click(function(){
			 prePage();			 
			getRaceInfo();
		});
		$("#nextPage").click(function(){
			nextPage();
			getRaceInfo();
		});
		//点击新建比赛
		$("#addNewRace").click(function(){
			window.location.href= $("#appName").val()+ "/organizer/racemanage_detail/"+ 1;
		});
		
		//获取比赛
		function getRaceInfo(){			
			
			$.ajax({
	       		url: $("#appName").val()+"/organizer/manageRaceInOC.act",
	       		type: "POST",
	       		data: {
       				currentPageNum: currentPage,
       				pageStatus: pageStatus,
       				organizerId: organizerId
       			  },
	       		dataType: "JSON",
	       		success: function(res) {           		
	       			showRaceInfo(res);        			
	       		},
	       		error: function(res) {        			
	       			console.log(res);	       			
	       		}   
			});
		}	
		
		//显示比赛
		function showRaceInfo(res){
			var raceList = eval(res);//将json转化为list
			//计算最大页数
			$("#curPage").text(currentPage);
			if(raceList<6)
				totalPage = currentPage;
			else
				totalPage = currentPage + 1;
			
			var html = "";
			
			for(var i=0; i<raceList.length; i++){				
				html = html +
				"<div class='list-group'>";
				
				//判断是正在进行的比赛、结束的比赛、未发布的比赛
				if(pageStatus == 1){
					html = html +					
					"<a class='list-group-item list-group-item-success' href='" +$("#appName").val()+ "/organizer/racemanage_detail/"+ raceList[i].id +"'>"+ 
					"<h3 style='display:inline;'>" + raceList[i].name + "</h3>" +
					"<h3 class='race-state-submit'>点击进行阶段管理</h3>";
				}else if(pageStatus == 2){
					html = html +					
					"<a class='list-group-item list-group-item-success' href='" +$("#appName").val()+ "/organizer/racemanage_detail/"+ raceList[i].id +"'>"+ 
					"<h3 style='display:inline;'>" + raceList[i].name + "</h3>" +
					"<h3 class='race-state-submit'>查看比赛结果</h3>";
				}else if(pageStatus == 3){
					html = html +					
					"<a class='list-group-item list-group-item-success' href='" +$("#appName").val()+ "/organizer/racemanage_detail/"+ raceList[i].id +"'>"+ 
					"<h3 style='display:inline;'>" + raceList[i].name + "</h3>" +
					"<h3 class='race-state-submit' style='margin-left:10px;'>点击发布</h3>" +
					"<h3 class='race-state-submit'>修改</h3>";
				}else{
					html = "没有任何比赛存在";
					break;
				}
				//加在比赛的内容	
				html = html +
				"</a>" +
				"<a class='list-group-item'>"+ raceList[i].content +"</a>" +
				"<span class='label label-primary'>" + raceList[i].grade + "</span>" +
				"<span class='label label-success'>" + raceList[i].typeRaceEntity.name + "</span>" +
				"<span class='label label-info'>"+ raceList[i].startTime.year +"/" + raceList[i].startTime.month +"至"+ raceList[i].endTime.year +"/" + raceList[i].endTime.month +"</span>" +
				"</div><br>";
			}
			
			//判断比赛状态将其注入到对应控件中
			//判断是正在进行的比赛、结束的比赛、未发布的比赛
			if(pageStatus == 1){
				$("#race1").html(html);
			}else if(pageStatus == 2){
				$("#race2").html(html);
			}else if(pageStatus == 3){
				$("#race3").html(html);
			}else{
				$("#race1").html(html);
			}
		}
			
	</script>
	
</body>
</html>