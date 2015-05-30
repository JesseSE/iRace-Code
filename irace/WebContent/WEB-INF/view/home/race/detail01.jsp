<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>iRace</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=request.getContextPath() %>/public/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath() %>/public/css/form.css" rel="stylesheet" type="text/css" media="all" />
<script src="<%=request.getContextPath() %>/public/js/jquery1.min.js"></script>
<!-- start menu -->

    <!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/public/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/<%=request.getContextPath() %>/public/js/bootstrap.min.js"></script>
    
    
<link href="<%=request.getContextPath() %>/public/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/megamenu.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/jquery.jscrollpane.min.js"></script>
<!-- start details -->
	<!-- start zoom -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/public/css/zoome-min.css" />
	<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/zoome-e.js"></script>
	
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
       <div class="header-top">
	   <div class="wrap"> 
<!--           登录注册菜单模块-->
			 <div class="cssmenu">
				<ul>
<!--
					<li class="active"><a href="login.html">Account</a></li> |
					<li><a href="checkout.html">Wishlist</a></li> |
					<li><a href="checkout.html">Checkout</a></li> |
-->
					<li><a href="login.html">登录</a></li> |
					<li><a href="register.html">注册</a></li>
				</ul>
			</div>
			<div class="clear"></div>
 		</div>
	</div>
    
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
<!--
	  <div class="tag-list">
	    <ul class="icon1 sub-icon1 profile_img">
			<li><a class="active-icon c1" href="#"> </a>
				<ul class="sub-icon1 list">
					<li><h3>sed diam nonummy</h3><a href=""></a></li>
					<li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
				</ul>
			</li>
		</ul>
		<ul class="icon1 sub-icon1 profile_img">
			<li><a class="active-icon c2" href="#"> </a>
				<ul class="sub-icon1 list">
					<li><h3>No Products</h3><a href=""></a></li>
					<li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
				</ul>
			</li>
		</ul>
	    <ul class="last"><li><a href="#">Cart(0)</a></li></ul>
	  </div>
-->
    </div>
     <div class="clear"></div>
     </div>
	</div>
	
<div class="mens">    
  <div class="main">
     <div class="wrap">
     	<ul class="breadcrumb breadcrumb__t"><a class="home" href="index.html">主页</a> （/ <a href="#">（搜索关键字））</a> / 第十届大学生创新创业大赛</ul>
		<div class="cont span_2_of_3">
		  	<div class="grid images_3_of_2">
						<div id="container">
							<div id="products_example">
								<div id="products">
									<!--div class="slides_container"-->
									<div>
									        <a href="#"><img class="a" id="img1" src="images/dsjzgcxcyds_slide1.jpg" /></a>
									</div>
								</div>
							</div>
						</div>
	            </div>
		         <div class="desc1 span_3_of_2">
		         	<h3 class="m_3">第十届大学生创新创业大赛</h3>
		             <div id="radiolist" style="padding:10px; font-size:15px; font-family:'微软雅黑'">
					 <label>选择参赛组别</label>
					<input name='r' type="radio" value='11' style="margin-left:20px;margin-right:20px;"/><label>A组</label>
					<input name='r' type="radio" value='21' style="margin-left:20px;margin-right:20px;"/><label>B组</label>
					<input name='r' type="radio" value='31' style="margin-left:20px;margin-right:20px;"/><label>C组</label>
					</div>
					
				     <p class="m_text2">大学生创新创业大赛是一个国家级的创新大赛，主办方为国家教育部，具有国家认真的权威性，从2002年创办开始，已经有了13年历史，深受各大学的师生认可，比赛一共分为以下组别：</p>
					<p class="m_text2">A组，自主命题组，该组学生需要自主命题。</p>
					<p class="m_text2">B组，自主命题组，该组学生需要自主命题。</p>
					<p class="m_text2">C组，自主命题组，该组学生需要自主命题。</p>
					
		         	 <div class="btn_form">
						<form>
							<input type="submit" value="报名" title="">
							<input type="submit" style="margin-left:20px;" id="watch" onclick="toWatch();" value="添加关注" title="">
						</form>
					 </div>
				 </div>
			   <div class="clear"></div>
			   
			   <div class="top-border"></div>
<!--DetailTab-->
<div style="margin-top:30px;"></div>
			<div class="top-box" name="my_race">
                <ul class="nav nav-tabs">
                  <li role="presentation" class="active"><a href="##" id="tab1" onclick="detailTab(1);"  style="background-color:#DFF0D8;padding:0px 10px"><h3>比赛详情</h3></a></li>
                  <li role="presentation" class="active"><a href="##" id="tab2" onclick="detailTab(2);" style="padding:0px 10px"><h3>大赛资讯</h3></a></li> 
                </ul>  
<!--                比赛详情-->
<div id="detail" style="display:block">
			    <div class="panel panel-default">
                    <a name="race_default"></a>
                      <div class="panel-body">
                          <div class="list-group">
                              <a class="list-group-item list-group-item-success" href="##">
                                  <h4 style="display:inline;">比赛简介</h4>
							  </a>
                              <a class="list-group-item">ootstrap，来自 Twitter，是目前最受欢迎的前端框架。Bootstrap 是基于 HTML、CSS、JAVASCRIPT 的，它简洁灵活，使得 Web 开发更加快捷。[1] 它由Twitter的设计师Mark Otto和Jacob Thornton合作开发，是一个<%=request.getContextPath() %>/public/css/HTML框架。Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。Bootstrap一经推出后颇受欢迎，一直是GitHub上的热门开源项目，包括NASA的MSNBC（微软全国广播公司）的Breaking News都使用了该项目。
                              </a>
                        </div>
                          
                          
                        <div class="list-group">
                              <a class="list-group-item list-group-item-success" href="##">
                                  <h4 style="display:inline;">阶段安排</h4>
							  </a>
                              <a class="list-group-item">ootstrap，来自 Twitter，是目前最受欢迎的前端框架。Bootstrap 是基于 HTML、CSS、JAVASCRIPT 的，它简洁灵活，使得 Web 开发更加快捷。[1] 它由Twitter的设计师Mark Otto和Jacob Thornton合作开发，是一个<%=request.getContextPath() %>/public/css/HTML框架。Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。Bootstrap一经推出后颇受欢迎，一直是GitHub上的热门开源项目，包括NASA的MSNBC（微软全国广播公司）的Breaking News都使用了该项目。</a>
                        </div>
						
						<div class="list-group">
                              <a class="list-group-item list-group-item-success" href="##">
                                  <h4 style="display:inline;">奖项设置</h4>
							  </a>
                              <a class="list-group-item">ootstrap，来自 Twitter，是目前最受欢迎的前端框架。Bootstrap 是基于 HTML、CSS、JAVASCRIPT 的，它简洁灵活，使得 Web 开发更加快捷。[1] 它由Twitter的设计师Mark Otto和Jacob Thornton合作开发，是一个<%=request.getContextPath() %>/public/css/HTML框架。Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。Bootstrap一经推出后颇受欢迎，一直是GitHub上的热门开源项目，包括NASA的MSNBC（微软全国广播公司）的Breaking News都使用了该项目。</a>

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


<!-- DetailTab-->
			   
<!--旧版比赛详情>			   
			   
     <div class="toogle">
     	<h3 class="m_3">比赛详情介绍</h3>
		<div class="clear"></div>
		<p class="m_text2">>>比赛说明</p>
     	<p class="m_text">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</p>
		<p class="m_text2">>>阶段安排</p>
		<p class="m_text">A组：</p>
		<p class="m_text">B组：</p>
		<p class="m_text">C组：</p>
		<p class="m_text2">>>奖项设置</p>
		<p class="m_text">A组：</p>
		<p class="m_text">B组：</p>
		<p class="m_text">C组：</p>
	 </div>
<-->
	 
	    <div class="clients">
	    <h3 class="m_3">历年赛事风采展示</h3>
		 <ul id="flexiselDemo3">
			<li><img src="images/s5.jpg" /><a href="#">Category</a><p>Rs 600</p></li>
			<li><img src="images/s6.jpg" /><a href="#">Category</a><p>Rs 850</p></li>
			<li><img src="images/s7.jpg" /><a href="#">Category</a><p>Rs 900</p></li>
			<li><img src="images/s8.jpg" /><a href="#">Category</a><p>Rs 550</p></li>
			<li><img src="images/s9.jpg" /><a href="#">Category</a><p>Rs 750</p></li>
		 </ul>
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
	<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/jquery.flexisel.js"></script>
     </div>
	 
<!--旧版大赛资讯> 
     <div class="toogle">
     	<h3 class="m_3">大赛资讯（就是各种比赛公告）</h3>
     	<p class="m_text" ><a href="#">大学生创业大赛正式开办</a>【2015-03-30 09:13:23】</p><br>
		<p class="m_text" ><a href="#">《报名者须知》</a>【2015-03-30 09:13:23】</p><br>
		<p class="m_text" ><a href="#">报名截止公告</a>【2015-03-30 09:13:23】</p><br>
     </div>
<-->
      </div>
			<div class="rsingle span_1_of_single">
			
			
			<div class="top-border"> </div>
				 <div class="border">
	             <link href="<%=request.getContextPath() %>/public/css/default.css" rel="stylesheet" type="text/css" media="all" />
	             <link href="<%=request.getContextPath() %>/public/css/nivo-slider.css" rel="stylesheet" type="text/css" media="all" />
				  <script src="<%=request.getContextPath() %>/public/js/jquery.nivo.slider.js"></script>
				    <script type="text/javascript">
				    $(window).load(function() {
				        $('#slider').nivoSlider();
				    });
				    </script>
				<div class="slider-wrapper theme-default">
					<div id="slider" class="nivoSlider">
					<img src="images/bsgg1.jpg"  alt="" />
					<img src="images/bsgg2.jpg"  alt="" />
					<img src="images/t-img3.jpg"  alt="" />
					</div>
				</div>
              <div class="btn"><a href="single.html">查看公告详情</a></div>
             </div>
			
<!--
				<h5 class="m_1">Categories</h5>
					<select class="dropdown" tabindex="8" data-settings='{"wrapperClass":"metro"}'>
						<option value="1">Mens</option>
						<option value="2">Sub Category1</option>
						<option value="3">Sub Category2</option>
						<option value="4">Sub Category3</option>
					</select>
					<select class="dropdown" tabindex="8" data-settings='{"wrapperClass":"metro"}'>
						<option value="1">Womens</option>
						<option value="2">Sub Category1</option>
						<option value="3">Sub Category2</option>
						<option value="4">Sub Category3</option>
					</select>
					<ul class="kids">
						<li><a href="#">Kids</a></li>
						<li class="last"><a href="#">Glasses Shop</a></li>
					</ul>
                   <section  class="sky-form">
					<h4>Price</h4>
						<div class="row row1 scroll-pane">
							<div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Rs 500 - Rs 700</label>
							</div>
							<div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 700 - Rs 1000</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 1000 - Rs 1500</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 1500 - Rs 2000</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 2000 - Rs 2500</label>
								<label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>Rs 2500 - Rs 3000</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 3500 - Rs 4000</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 4000 - Rs 4500</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 4500 - Rs 5000</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 5000 - Rs 5500</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 5500 - Rs 6000</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 6000 - Rs 6500</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 6500 - Rs 7000</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 7000 - Rs 7500</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 7500 - Rs 8000</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rs 8000 - Rs 8500</label>	
							</div>
						</div>
		        </section>
		       <section  class="sky-form">
					<h4>Brand Name</h4>
						<div class="row row1 scroll-pane">
							<div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>John Jacobs</label>
							</div>
							<div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Tag Heuer</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Lee Cooper</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Mikli</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>S Oliver</label>
								<label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>Hackett</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Killer</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>IDEE</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Vogue</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Gunnar</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Accu Reader</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>CAT</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Excellent</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Feelgood</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Odysey</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Animal</label>	
							</div>
						</div>
		       </section>
		       <section  class="sky-form">
					<h4>Frame Shape</h4>
						<div class="row row1 scroll-pane">
							<div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Pilot</label>
							</div>
							<div class="col col-4">
							    <label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rectangle</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Square</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Round</label>
								<label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>Others</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Cat Eyes</label>
								<label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>Wrap Around</label>
						    </div>
						</div>
		       </section>
		       <section  class="sky-form">
					<h4>Frame Size</h4>
						<div class="row row1 scroll-pane">
							<div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Small</label>
							</div>
							<div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Medium</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Large</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Medium</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Large</label>
							</div>
						</div>
		       </section>
		       <section  class="sky-form">
					<h4>Frame Type</h4>
						<div class="row row1 scroll-pane">
							<div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Full Rim</label>
							</div>
							<div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rim Less</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Half Rim</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Rim Less</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Half Rim</label>
							</div>
						</div>
		       </section>
		       <section  class="sky-form">
					<h4>Colors</h4>
						<ul class="color-list">
							<li><a href="#"> <span class="color1"> </span><p class="red">Red</p></a></li>
							<li><a href="#"> <span class="color2"> </span><p class="red">Green</p></a></li>
							<li><a href="#"> <span class="color3"> </span><p class="red">Blue</p></a></li>
							<li><a href="#"> <span class="color4"> </span><p class="red">Yellow</p></a></li>
							<li><a href="#"> <span class="color5"> </span><p class="red">Violet</p></a></li>
							<li><a href="#"> <span class="color6"> </span><p class="red">Orange</p></a></li>
							<li><a href="#"> <span class="color7"> </span><p class="red">Gray</p></a></li>
					   </ul>
		       </section>
-->
		       <script src="<%=request.getContextPath() %>/public/js/jquery.easydropdown.js"></script>
		      </div>
		      <div class="clear"></div>
			</div>
			 <div class="clear"></div>
		   </div>
		</div>
	<div class="footer-middle">
			<div class="wrap">
	             <div class="copy">
			        <p>GDS软件工程实践课小组版权所有<a target="_blank" href="http://www.js-css.cn/a/<%=request.getContextPath() %>/public/css/template/">IRACE</a></p>
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
</body>
</html>