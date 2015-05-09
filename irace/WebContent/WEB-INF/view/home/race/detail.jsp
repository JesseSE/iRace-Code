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
	<div class="header-bottom">
	    <div class="wrap">
			<div class="header-bottom-left">
<!--                网站标题logo-->
				<div class="logo">
					<a href="index.html"><img src="images/logo1.png" alt=""/></a>
				</div>
<!--                菜单栏， 内容分类-->
				<div class="menu">
	            <ul class="megamenu skyblue">
			<li class="active grid"><a href="index.html">主页</a></li>
			<li><a class="color4" href="#">理学类</a>
				<div class="megapanel">
					<div class="row">
						<div class="col1">
							<div class="h_nav">
								<h4>数学</h4>
								<ul>
									<li><a href="womens.html">金牌杯数学竞赛</a></li>
									<li><a href="womens.html">中国奥林匹克大赛</a></li>
									<li><a href="womens.html">全国高中数学联赛</a></li>
									<li><a href="womens.html">全国研究生数学竞赛</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>物理</h4>
								<ul>
									<li><a href="womens.html">全国中学生物理大赛</a></li>
									<li><a href="womens.html">全国物理实验大赛</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>生物</h4>
								<ul>
									<li><a href="womens.html">全国生物竞赛</a></li>
									<li><a href="womens.html">生物研究大赛</a></li>
									<li><a href="womens.html">亚洲生物医学未来领袖大赛</a></li>
								</ul>
							</div>												
						</div>
					  </div>
					</div>
				</li>				
				<li><a class="color5" href="#">工学类</a>
				<div class="megapanel">
					<div class="col1">
							<div class="h_nav">
								<h4>电子信息</h4>
								<ul>
									<li><a href="mens.html">电子信息科技大赛</a></li>
									<li><a href="mens.html">光电科学大赛</a></li>
									<li><a href="mens.html">电子知识大赛</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>土木建筑</h4>
								<ul>
									<li><a href="mens.html">土木创新大赛</a></li>
									<li><a href="mens.html">建筑创新设计大赛</a></li>
									<li><a href="mens.html">Round-Shaped</a></li>
									<li><a href="mens.html">Oval-Shaped</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col1">
							<div class="h_nav">
								<h4>计算机</h4>
								<ul>
									<li><a href="mens.html">软件杯创新大赛</a></li>
									<li><a href="mens.html">服务外包大赛</a></li>
									<li><a href="mens.html">新软攀峰大赛</a></li>
									<li><a href="mens.html">Hi-index</a></li>
									<li><a href="mens.html">Progressive</a></li>
								</ul>	
							</div>												
						</div>
					</div>
				</li>
				<li><a class="color6" href="other.html">综合类</a>
				<div class="megapanel">
						<div class="col1">
							<div class="h_nav">
								<h4>国家级</h4>
								<ul>
									<li><a href="mens.html">大学生创业大赛</a></li>
									<li><a href="mens.html">国家知识竞赛</a></li>
									<li><a href="mens.html">电子商务大赛</a></li>
									<li><a href="mens.html">Hi-index</a></li>
									<li><a href="mens.html">Progressive</a></li>
								</ul>	
							</div>												
						</div>
				</div>
				</li>
				<li><a class="color7" href="other.html">关注</a></li>
			</ul>
			</div>
		</div>
<!--            搜索框，标签等-->
	   <div class="header-bottom-right">
         <div class="search">	  
				<input type="text" name="s" class="textbox" value="搜索" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '搜索';}">
				<input type="submit" value="Subscribe" id="submit" name="submit">
				<div id="response"> </div>
		 </div>
<!--           标签，暂时无用-->

    </div>
     <div class="clear"></div>
     </div>
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
		         <div class="desc1 span_3_of_2">
		         	<h3 class="m_3">${race.getName() }</h3>
		            
				    <p class="m_text2" style="text-indent: 25px;">${race.getContent() }</p>
				    
					
					<c:forEach var="g" items="${groupList }">
					<p class="m_text2">
						<input name='r' type="radio" value='11'/>
						<label  style="margin-right:20px;">${g.getName() }</label>${g.getRequire() }
					</p>
					</c:forEach>
		         	 <div class="btn_form">
						<form><input type="submit" value="报名"></form>
					 </div>
				 </div>
			   <div class="clear"></div>
	     <div class="toogle">
	     	<h3 class="m_3">详情介绍</h3><hr>
			<div class="clear"></div>
			<p class="m_text2">>>比赛说明</p>
	     	<p class="m_text" style="text-indent: 25px;">${race.getContent() }</p>
			<p class="m_text2">>>阶段安排</p>
			<p class="m_text">A组：</p>
			<p class="m_text">B组：</p>
			<p class="m_text">C组：</p>
			<p class="m_text2">>>奖项设置</p>
			<p class="m_text">A组：</p>
			<p class="m_text">B组：</p>
			<p class="m_text">C组：</p>
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
		      <div class="clear"></div>
			</div>
			 <div class="clear"></div>
		   </div>
		</div>
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
		    
		});
	</script>
	<script type="text/javascript" src="js/jquery.flexisel.js"></script>
</body>
</html>