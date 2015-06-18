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
	</style>
	
</head>
<body>

    <%@ include file="/public/section/user-div.jsp" %>
<!--    网站标题、选择菜单、搜索框模块-->
	<!-- 盗汗菜单div -->
	<%@ include file="/public/section/menu-div.jsp"%>
	
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
						<form><button id="apply_submit" type="button" style="background:#4CB1CA;  color: #fff;line-height: 2em;width: 100px; border: none;">报名</button></form>
					 </div>
				 </div>
			   <div class="clear"></div>
	     <div class="toogle">
	     	<h3 class="m_3">详情介绍</h3><hr>
			<div class="clear"></div>
			<p class="m_text2">>>比赛说明</p>
	     	<p class="m_text" style="text-indent: 25px;">${race.getContent() }</p>
			<p class="m_text2">>>阶段安排</p>
			<c:forEach var="stage" items="${stageList }">
				<ul class="m_text" data="${stage.gid }">${stage.gname }
					<c:forEach var="s" items="${stage.slist }">
					<li>${s.getStrTime(s.getStartTime()) } ~ ${s.getStrTime(s.getEndTime()) } ${s.getName() } ----- ${s.getContent() }</li>
					</c:forEach>
				</ul>
			</c:forEach>
			
			<p class="m_text2">>>奖项设置</p>
			<c:forEach var="reward" items="${rewardList }">
				<ul class="m_text" data="${reward.gid }">${reward.gname }
					<c:forEach var="r" items="${reward.rlist }">
					<li>${r.getName() } ===== ${r.getContent() }</li>
					</c:forEach>
				</ul>
			</c:forEach>
		 </div>
	 
	 
	    <div class="clients">
		    <h3 class="m_3">历年赛事风采展示</h3>
			 <ul id="flexiselDemo3">
				<li><img src="images/s5.jpg" /><a href="#">Category</a><p>Rs 600</p></li>
				<li><img src="images/s6.jpg" /><a href="#">Category</a><p>Rs 850</p></li>
				<li><img src="images/s7.jpg" /><a href="#">Category</a><p>Rs 900</p></li>
				<li><img src="images/s8.jpg" /><a href="#">Category</a><p>Rs 550</p></li>
				<li><img src="images/s9.jpg" /><a href="#">Category</a><p>Rs 750</p></li>
			 </ul>
	     </div>
      </div>
	  <div class="rsingle span_1_of_single">
		<div class="toogle">
	     	<h3 class="m_3" style="font-size: 1.3em;margin-bottom: -10px;">大赛资讯</h3><hr>
	     	<p class="m_text" style="margin-left:5px;"><a href="#">大学生创业大</a><span style="float: right;">【2015-03-30】</span></p>
			<p class="m_text" style="margin-left:5px;"><a href="#">《报名者须知》</a><span style="float: right;">【2015-03-30】</span></p>
			<p class="m_text" style="margin-left:5px;"><a href="#">报名截止公告</a><span style="float: right;">【2015-03-30】</span></p>
			<p class="m_text" style="margin-left:5px;"><a href="#">大学生创业大</a><span style="float: right;">【2015-03-30】</span></p>
			<p class="m_text" style="margin-left:5px;"><a href="#">《报名者须知》</a><span style="float: right;">【2015-03-30】</span></p>
			<p class="m_text" style="margin-left:5px;"><a href="#">报名截止公告</a><span style="float: right;">【2015-03-30】</span></p>
	     </div>
		    
	  </div>
	</div>
	<div class="clear"></div>
   </div>
</div>
<%@ include file="/public/section/footer.jsp" %>

<script type="text/javascript">
	$(window).load(function() {
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