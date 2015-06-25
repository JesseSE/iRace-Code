<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
<head>
<title>${ title }</title>
<%@ include file="/public/section/header.jsp"%>
	
	<link href="<%=request.getContextPath() %>/public/css/default.css" rel="stylesheet" type="text/css" media="all" />
	<link href="<%=request.getContextPath() %>/public/css/nivo-slider.css" rel="stylesheet" type="text/css" media="all" />
	<link href="<%=request.getContextPath() %>/public/css/default.css" rel="stylesheet" type="text/css" media="all" />
	<link href="<%=request.getContextPath() %>/public/css/nivo-slider.css" rel="stylesheet" type="text/css" media="all" />
	<script src="<%=request.getContextPath() %>/public/js/jquery.easydropdown.js"></script>
	<style type="text/css">
	.toogle {
		border: solid #ffd 1px;
		border-radius: 5px;
		padding: 10px;
		background: #F0F0F0;
	}
	
	hr {
		border: 1px solid #D0D0D0;
	}
	
	.avatar {
		width: 100%;
	}
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
	
	.tag-head {
		padding: 0px 10px;
		line-height: 2em;
		font-size: 1.3em;
	}
	
	.content-box {
		padding: 20px;
	}
	
	.bottom-line {
		margin-bottom: 10px;
		border-bottom: solid 1px;
	}
	
	.span-tag {
		padding: 5px;
		background: rgb(128, 228, 216);
		border-radius: 5px;
	}
	
	.stage-name {
		font-size: 1.2em;
		font-weight: bold;
		margin-right: 10px;
	}
	
	.reward-name {
		color: rgb(255, 91, 91);
		font-size: 1.2em;
		font-weight: bold;
		margin-right: 10px;
	}
	
	.break-line {
		word-break: break-all;
	}
</style>
<script type="text/javascript">
function toWatch()
{
	var watchButton= document.getElementById("watch");
	if(watchButton.value=="添加关注"){
		alert("关注成功");
		watchButton.value="取消关注";
		watchButton.style.backgroundColor="#DFF0D8";
		watchButton.style.color="#777";
	}
	else if(watchButton.value=="取消关注"){
		alert("成功取消关注");
		watchButton.value="添加关注";
		watchButton.style.backgroundColor="#4CB1CA";
		watchButton.style.color="#FFF";
	}
	else{}
}

function detailTab(pos)
{
	var tab1= document.getElementById("tab1");
	var tab2= document.getElementById("tab2");
	var raceDiv1 = document.getElementById("detail");
	var raceDiv2 = document.getElementById("notice");
	
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

    <%@ include file="/public/section/user-div.jsp" %>
	<div class="avatar">
		<img src="${race.getOrganizerEntity().getPicUrl() }">
	</div>
<div class="mens">
  <div class="main">
     <div class="wrap">
     	<ul class="breadcrumb breadcrumb__t">
     		<a class="home" href="<%=request.getContextPath() %>">主页</a> / 
     		<a href="<%=request.getContextPath() %>/">${race.getTypeRaceEntity().getName() }</a> / ${race.getName() }
     	</ul>
		<div class="cont span_2_of_3">
		  	<div class="grid images_3_of_2">
						<div id="container">
							<div id="products_example">
								<div id="products">
									<!--div class="slides_container"-->
									<div>
									     <img class="a" id="img1" src="${race.getPicUrl() }" />
									</div>
								</div>
							</div>
						</div>
	            </div>
           <input id="raceId" type="hidden" value="${race.getId() }">
         <div class="desc1 span_3_of_2">
         	<h3 id="raceName" class="m_3">${race.getName() }</h3>
            
		    <p class="m_text2" style="text-indent: 25px;">${race.getContent() }</p>
		    
			<c:forEach var="g" items="${groupList }">
			<p class="m_text2">
				<input id="group${g.getId() }" name='group' type="radio" value='${g.getId() }'/>
				<label for="group${g.getId() }" style="margin-right:20px;">${g.getName() }</label>${g.getRequires() }
			</p>
			</c:forEach>
			
         	<div class="btn_form">
         	<form><button id="apply_submit" data-status="${race.getStatus() }" type="button" style="background:#4CB1CA;  color: #fff;line-height: 2em;width: 100px; border: none;">
         	<c:choose>
         	<c:when test="${race.getStatus() == 1 }">报名</c:when>
         	<c:when test="${race.getStatus() == 0 }">未开始</c:when>
         	<c:when test="${race.getStatus() == 2 }">比赛中</c:when>
         	<c:when test="${race.getStatus() == 3 }">已结束</c:when>
         	<c:otherwise>
         	
         	</c:otherwise>
         	</c:choose>
         	</button></form>
			</div>
		 </div>
		<div class="clear"></div>
	     
		<!--DetailTab-->
		<div style="margin-top:30px;"></div>
		<div class="top-box" name="my_race">
            <ul class="nav nav-tabs">
              <li role="presentation" class="active">
              	<a href="##" id="tab1" class="tag-head" onclick="detailTab(1);"  style="background-color:#DFF0D8;"><h3>比赛详情</h3></a>
              </li>
              <li role="presentation" class="active">
              	<a href="##" id="tab2" class="tag-head" onclick="detailTab(2);"><h3>大赛资讯</h3></a>
              </li> 
            </ul>
			<!-- 比赛详情 -->
			<div id="detail" style="display:block;">
			    <div class="panel panel-default">
                    <a name="race_default"></a>
                    <div class="panel-body">
                      <div class="list-group">
                        <a class="list-group-item list-group-item-success" href="##">
                            <h4 style="display:inline;">比赛简介</h4>
						</a>
						<p class="m_text" style="text-indent: 25px;margin-right: 30px; margin-top: 10px;">${race.getContent() }</p>
                      </div>
                      
                      <div class="list-group">
                          <a class="list-group-item list-group-item-success" href="##">
                              <h4 style="display:inline;">阶段安排</h4>
						  </a>
						  <div class="content-box">
						  	<c:forEach var="stage" items="${stageList }">
								<ul class="m_text" data="${stage.gid }" style="margin-bottom: 20px;">
									<p class="bottom-line"><label style="font-size: 1.5em;margin-right: 10px;">${stage.gname }</label><span style="color: #A3A3A3;font-style: italic;">${stage.grequire }</span></p>
									<c:forEach var="s" items="${stage.slist }">
									<li style="margin-top: 10px; line-height: 1.7em;">
										<span class="span-tag">${s.getStrTime(s.getStartTime()) }</span> ~ <span class="span-tag">${s.getStrTime(s.getEndTime()) }</span>
										<p><label class="stage-name">${s.getName() }</label><span>${s.getContent() }</span></p>
									</li>
									</c:forEach>
								</ul>
							</c:forEach>
						  </div>
                      </div>
                      
					  <div class="list-group">
                          <a class="list-group-item list-group-item-success" href="##">
                              <h4 style="display:inline;">奖项设置</h4>
						  </a>
						  <div class="content-box">
						  	<c:forEach var="reward" items="${rewardList }">
								<ul class="m_text" data="${reward.gid }" style="margin-bottom: 20px;">
									<p class="bottom-line"><label style="font-size: 1.5em;margin-right: 10px;">${reward.gname }</label><span style="color: #A3A3A3;font-style: italic;">${reward.grequire }</span></p>
									<c:forEach var="r" items="${reward.rlist }">
									<li><label class="reward-name">${r.getName() }</label> <span>${r.getContent() }</span></li>
									</c:forEach>
								</ul>
							</c:forEach>
						  </div>
						  
                       </div>
                      </div>
                </div>
			</div>             
			<!--                大赛公告-->
			<div id="notice" style="display:none">
                <div class="panel panel-default">
                    <a name="race_done"></a>
                      <div class="panel-body">
                          <div class="list-group">
                              <a class="list-group-item disabled" href="##">
                                  <h4 style="display:inline;">关于比赛开始的通告</h4>
                                <span class="label label-info" style="float:right;padding:5px;5px;">发布时间：2015-03-30 09:13:23</span>
								  </a>
                              <a class="list-group-item">ootstrap，来自 Twitter，是目前最受欢迎的前端框架。Bootstrap 是基于 HTML、CSS、JAVASCRIPT 的，它简洁灵活，使得 Web 开发更加快捷。[1] 它由Twitter的设计师Mark Otto和Jacob Thornton合作开发，是一个<%=request.getContextPath() %>/public/css/HTML框架。Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。Bootstrap一经推出后颇受欢迎，一直是GitHub上的热门开源项目，包括NASA的MSNBC（微软全国广播公司）的Breaking News都使用了该项目。</a>
                    
                        </div>                      
                        
                          
                          
                         <div class="list-group">
                              <a class="list-group-item disabled" href="##">
                                  <h4 style="display:inline;">比赛修改通知</h4>
								  
                                <span class="label label-info" style="float:right;padding:5px;5px;">发布时间：2015-03-30 09:13:23</span>
								  </a>
                              <a class="list-group-item">ootstrap，来自 Twitter，是目前最受欢迎的前端框架。Bootstrap 是基于 HTML、CSS、JAVASCRIPT 的，它简洁灵活，使得 Web 开发更加快捷。[1] 它由Twitter的设计师Mark Otto和Jacob Thornton合作开发，是一个<%=request.getContextPath() %>/public/css/HTML框架。Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。Bootstrap一经推出后颇受欢迎，一直是GitHub上的热门开源项目，包括NASA的MSNBC（微软全国广播公司）的Breaking News都使用了该项目。</a>
                              
                        </div>   
                          
                      </div>
                </div>
    			</div>
		</div>
	    <div class="clients" style="display:none;">
		    <h3 class="m_3">历年赛事风采展示</h3>
			 <ul id="flexiselDemo3">
				<li><img src="<%=request.getContextPath() %>/public/images/s5.jpg" /><a href="#">Category</a><p>Rs 600</p></li>
				<li><img src="<%=request.getContextPath() %>/public/images/s6.jpg" /><a href="#">Category</a><p>Rs 850</p></li>
				<li><img src="<%=request.getContextPath() %>/public/images/s7.jpg" /><a href="#">Category</a><p>Rs 900</p></li>
				<li><img src="<%=request.getContextPath() %>/public/images/s8.jpg" /><a href="#">Category</a><p>Rs 550</p></li>
				<li><img src="<%=request.getContextPath() %>/public/images/s9.jpg" /><a href="#">Category</a><p>Rs 750</p></li>
			 </ul>
	     </div>
      </div>
	  <div class="rsingle span_1_of_single">
		<div class="toogle">
	     	<h3 class="m_3" style="font-size: 1.3em;margin-bottom: -10px;">${race.getOrganizerEntity().getName() }</h3><hr>
	     	<div class="o-item">
	     		<label style="color:#B5B5B5; margin-right: 10px;">城市：</label>
	     		<span>${race.getOrganizerEntity().getCity() }</span>
	     	</div>
	     	<div class="o-item">
	     		<label style="color:#B5B5B5; margin-right: 10px;">电话：</label>
	     		<span>${race.getOrganizerEntity().getTel() }</span>
	     	</div>
	     	<div class="o-item">
	     		<label style="color:#B5B5B5; margin-right: 10px;">邮箱：</label>
	     		<span class="break-line">${race.getOrganizerEntity().getEmail() }</span>
	     	</div>
	     	<div class="o-item">
	     		<label style="color:#B5B5B5; margin-right: 10px;">简介：</label>
	     		<span class="break-line">${race.getOrganizerEntity().getComment() }</span>
	     	</div>
	     </div>
		 
	  </div>
	</div>
	<div class="clear"></div>
   </div>
</div>
<%@ include file="/public/section/footer.jsp" %>

<script type="text/javascript">
	$(window).load(function() {
		//默认选中报名时第一个小组
		
		if($("input[id*='group'").lenght > 0) {
			$("input[id*='group'").get(0).checked = true;
		}
		
		
		if($("#apply_submit").attr("data-status") != "1") {
			$("#apply_submit").attr("disabled", "disabled");
			$("#apply_submit").css("background-color","#bbb");
		}
		
		$("#flexiselDemo1").flexisel();
		$("#flexiselDemo2").flexisel({
			enableResponsiveBreakpoints: true,
	    	responsiveBreakpoints: { 
	    		portrait: { 
	    			changePoint:480,
	    			visibleItems: 1
	    		}, 
	    		landscape: { 
	    			changePoint:640,
	    			visibleItems: 2
	    		},
	    		tablet: { 
	    			changePoint:768,
	    			visibleItems: 3
	    		}
	    	}
	    });
	
		$("#flexiselDemo3").flexisel({
			visibleItems: 5,
			animationSpeed: 1000,
			autoPlay: true,
			autoPlaySpeed: 3000,    		
			pauseOnHover: true,
			enableResponsiveBreakpoints: true,
	    	responsiveBreakpoints: { 
	    		portrait: { 
	    			changePoint:480,
	    			visibleItems: 1
	    		}, 
	    		landscape: { 
	    			changePoint:640,
	    			visibleItems: 2
	    		},
	    		tablet: { 
	    			changePoint:768,
	    			visibleItems: 3
	    		}
	    	}
	    });
	    
		$("#apply_submit").click(function(){
			var groupId=0;
			var groupName='';
			$("[name='group']").each(function(index, ele) {
				if(ele.checked) {
					groupId = ele.value;
					groupName = $("label[for='"+ele.id+"']").html();
				}
			});
			if(groupId!=0) {
				location.href = $("#appName").val() + "/race/apply_race/"+$("#raceId").val()+"?raceName="+$("#raceName").html()+"&groupId="+groupId+"&groupName="+groupName;
			} else {
				alert("请选择组别!");
			}
		});
		
	});
</script>
<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/jquery.flexisel.js"></script>
</body>
</html>