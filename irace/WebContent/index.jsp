<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/public/section/header.jsp"%>
	
<link href="<%=request.getContextPath() %>/public/css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath() %>/public/css/nivo-slider.css" rel="stylesheet" type="text/css" media="all" />

<!--start slider -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/public/css/fwslider.css" media="all">
    <script src="<%=request.getContextPath() %>/public/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath() %>/public/js/jQuery-self.js"></script>
    <script src="<%=request.getContextPath() %>/public/js/css3-mediaqueries.js"></script>
    <script src="<%=request.getContextPath() %>/public/js/fwslider.js"></script>

<title>${ title }</title>
</head>
<body >

<div class="header-top">
	   <div class="wrap"> 
<!--           登录注册菜单模块-->
			 <div class="cssmenu">
				<ul>
					<li><a href="<%=request.getContextPath() %>/user/login">登录</a></li> |
					<li><a href="<%=request.getContextPath() %>/user/register">注册</a></li>
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
					<a href="index.html"><img src="<%=request.getContextPath() %>/public/images/logo1.png" alt=""/></a>
				</div>
<!--                菜单栏， 内容分类-->
				<div class="menu">
	          <ul class="megamenu skyblue" id="addMenu">
    
	            <li class="active grid"><a href="index.html">主页</a></li>
				<li><a class="color4" href="#">理学类</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">							
									<ul>
										<li><a href="womens.html"><h4>金</h4></a></li>									
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">							
									<ul>
										<li><a href="womens.html"><h4>金牌竞赛</h4></a></li>									
									</ul>	
								</div>							
							</div>					
						  </div>
						  <div class="row">
							<div class="col1">
								<div class="h_nav">							
									<ul>
										<li><a href="womens.html"><h4>金</h4></a></li>									
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">							
									<ul>
										<li><a href="womens.html"><h4>金牌竞赛</h4></a></li>									
									</ul>	
								</div>							
							</div>					
						  </div>
						</div>
					</li>		
					
					<li><a class="color4" href="#">工学类</a>
					<div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">							
									<ul>
										<li><a href="womens.html"><h4>金</h4></a></li>									
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">							
									<ul>
										<li><a href="womens.html"><h4>金牌竞赛</h4></a></li>									
									</ul>	
								</div>							
							</div>					
						  </div>
						  <div class="row">
							<div class="col1">
								<div class="h_nav">							
									<ul>
										<li><a href="womens.html"><h4>金</h4></a></li>									
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">							
									<ul>
										<li><a href="womens.html"><h4>金牌竞赛</h4></a></li>									
									</ul>	
								</div>							
							</div>					
						  </div>
						</div>
					</li>					
				</ul>
			</div>
		</div>
<!--            搜索框，标签等-->
	   <div class="header-bottom-right">
         <div class="search">	  
				<input type="text" id="searchinput" name="s" class="textbox" value="${keyword }"  onblur="if (this.value == '') {this.value = '搜索';}">
				<input type="submit" value="Subscribe" id="searchbutton" name="submit">
				<div id="response"> </div>
		 </div>
<!--           标签，暂时无用-->

    </div>
     <div class="clear"></div>
     </div>
	</div>
    
  <!-- 开始幻灯片广告 -->
    <div id="fwslider">
        <div class="slider_container">
            <div class="slide"> 
                <!-- Slide image -->
                    <img src="<%=request.getContextPath()%>/public/images/alpk.jpg" alt=""/>
                <!-- /Slide image -->
                <!-- Texts container -->
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <!-- Text title -->
                        <h4 class="title">Aluminium Club</h4>
                        <!-- /Text title -->
                        
                        <!-- Text description -->
                        <p class="description">Experiance ray ban</p>
                        <!-- /Text description -->
                    </div>
                </div>
                 <!-- /Texts container -->
            </div>
            <!-- /Duplicate to create more slides -->
            <div class="slide">
                <img src="<%=request.getContextPath() %>/public/images/fwwb.jpg" alt=""/>
                <div class="slide_content">
                    <div class="slide_content_wrap">
                        <h4 class="title">consectetuer adipiscing </h4>
                        <p class="description">diam nonummy nibh euismod</p>
                    </div>
                </div>
            </div>
            <!--/slide -->
        </div>
        <div class="timers"></div>
        <div class="slidePrev"><span></span></div>
        <div class="slideNext"><span></span></div>
    </div>
    <!--/slider -->
    
<!--    赛事整体显示页面-->
<div class="main">
	<div class="wrap">
		<div class="section group">
		  <div class="cont span_2_of_3">
		  	<div class="sort">			
               	<div class="sort-by">
				    <h2 class="head" style = "display:inline;">热门比赛</h2>
		            <label class="" style="margin-left:100px; font-size:1.3em;"> 按属性排序：</label>
		            <select id="orderBy" style="margin-left:10px;">
		                            <option value="3"> 热度</option>
                                    <option value="1"> 开始时间 </option>
		                            <option value="2">结束时间 </option>
									<option value="4">级别 </option>

		            </select>
		            <label class="" style="margin-left:100px; font-size:1.3em;"> 排序方式：</label>
		            <select id="orderByAD" style="margin-left:10px;">
		                            <option value="1"> 正序</option>
                                    <option value="0"> 倒序 </option>
		            </select>
               </div>
    		</div>

			<!--第一排-->
			<!-- 	<div class="top-box" id="raceContent"> -->
		<div id="raceContent">
			
		</div>
			
			<div class="clear"></div>
		  </div>
		  
		  
			<div class="rsidebar span_1_of_left">
				<div class="top-border"> </div>
				 <div class="border">
	             
				  
				<div class="slider-wrapper theme-default">
					<div id="slider" class="nivoSlider">
					<img src="<%=request.getContextPath() %>/public/images/bsgg1.jpg"  alt="" />
					<img src="<%=request.getContextPath() %>/public/images/bsgg1.jpg"  alt="" />
					<img src="<%=request.getContextPath() %>/public/images/t-img3.jpg"  alt="" />
					</div>
				</div>
              <div class="btn"><a href="single.html">查看公告详情</a></div>
             </div>
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
	<!--分页-->
				<div align = "center" >
				<a href="#" class="myButton" id="prePage">上一页</a>
				<select class="" name="" id="jumppage">
		                            <option value="1">1</option>
                                    <option value="2">2</option>
		                            <option value="3">3</option>
									<option value="4">4</option>

		        </select>
				<a href="#" class="myButton" id="nextPage">下一页</a>
				</div>
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
	     
	   
	     
	   
	<%@ include file="/public/section/footer.jsp" %>
	
	
	<script src="<%=request.getContextPath() %>/public/js/jquery.nivo.slider.js"></script>
	<script type="text/javascript"> 
	var totalPageNum;  //文件列表长度
	var currentPage; //当前页面
	var eachPageNum; //每页显示个数
	var isFirstESearch; //是否为第一次查询
	var searchKeyWord;
	
	//初始化值
	function initValue(){
		totalPageNum = 1000;
		currentPage = 1;
		eachPageNum = 9;
		isFirstESearch = true;
		//searchKeyWord = null;
	}
	
	//前一页
	function prePage(){
		if(currentPage > 1){
			currentPage = currentPage -1;
			document.getElementById("jumppage").value = currentPage;
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
			document.getElementById("jumppage").value = currentPage;
			return true;
		}else{
			alert("已经是最后一页了哦！");
			return false;
		}
			
	}
	
	//跳转到XXX页
	function goToPage(){
		var selectPage = document.getElementById("jumppage").value;
		if(selectPage < totalPageNum){
			currentPage = selectPage;
			return true;
		}else{
			return false;
		}
	}
	
	
	//Ajax函数
	$(document).ready(function(){			
		$('#slider').nivoSlider();	
	    initValue();
	    load();
	    
		testMenu();
		//getMenu();
	    initValue();
		searchRace();
	    		
	    //点击查询按钮开始新的搜索
		$("#searchbutton").click(function(){
			initValue();
			if(checkKeyWord()){
				window.location.href=$("#appName").val()+"/user/sort?sortKeyWords="+ $("#searchinput").val();
			}else
				alert("请输入关键字！");
		});
	    
	    
	    //点击前一页
	    $("#prePage").click(function(){
	    	if(prePage())
	    		load();
	    });
	  //点击后一页
	    $("#nextPage").click(function(){
	    	if(nextPage())	    	
	    		load();
	    });
	  //选择页面
	    $("#jumppage").change(function(){
	    	if(goToPage())	    	
	    		load();
	    });
	  //点击排序方式方式
	    $("#orderBy").change(function(){	    	
	    	initValue();
				load();
	    });
	  
	    //点击升序降序排序搜索结果
	    $("#orderByAD").change(function(){	    	
	    	initValue();
				load();
	    });
	    
	 });  

	    	
	function checkKeyWord(){
		if($("#searchinput").val() == ""){
			alert("请输入关键字！")
			$("#searchinput").focus();
			return false;
		}else 
			return true;
	}
	
	function load(){
			$.ajax({
        		url: $("#appName").val()+"/user/homepageShow.act",
        		type: "POST",
        		data: {currentpagenum:currentPage},
        		dataType: "JSON",
        		success: function(res) {   
        			showResult(res);
        	
        			
        		},
        		error: function(res) {        			
        			console.log(res);
        			alert('你访问的页面出错了！');
        		}   
			});		
	}
	
	function jump(){
		var orderByType = document.getElementById("orderBy").value;			
		var orderByAD = document.getElementById("orderByAD").value;	
		$.ajax({
    		url: $("#appName").val()+"/user/homepageJump.act",
    		type: "POST",
    		data: {currentpagenum:currentPage,
    			   orderByType:orderByType,
    			   orderByAD:orderByAD},
    		dataType: "JSON",
    		success: function(res) {   
    			showResult(res);
    	
    			
    		},
    		error: function(res) {        			
    			console.log(res);
    			alert('你访问的页面出错了！');
    		}   
		});		
}
	
	function showResult(res){		
		var race = eval(res);  
		console.log(res);        	
		
		var htmlText = "";
		var cursor = 0;
		for(var i=0;i<2;i++){
			 htmlText = htmlText + "<div class='top-box'>";
			for(var j=0;j<3;j++){
				if(cursor<race.length){
				   htmlText = htmlText + 
       				 "<div class='col_1_of_3 span_1_of_3'>"+
   					 "<a href='single.html'>"+
   					 "<div id='race1' class='inner_content clearfix'>"+
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
   					 "<span class='actual'>"+race[cursor].organizer+"</span>"+
   					 "</div> </div>"+
   					 "<span class='actual'>分类："+race[cursor].type+"</span>"+
   					 "<div class='price1'>"+
   					 "<span class='actual' font='0.5em'>"+race[cursor].startTime.date+"</span>"+
   					 "</div>"+
   					 "<div class='clear'></div>"+
   					 "</div></div></a></div>";
   					 
				   cursor++;
				}
				
				htmlText = htmlText + "</div>";
					
			}
			
		}
		if(htmlText =="")
			$("#raceContent").html(	"没有内容哦");
		else
			$("#raceContent").html(htmlText);
	}
	
	function getMenu(){	
		$.ajax({
       		url: $("#appName").val()+"/user/getMenu.act",
       		type: "POST",
       		data: {},
       		dataType: "JSON",
       		success: function(res) {           		
       			showMenu(res);        			
       		},
       		error: function(res) {        			
       			console.log(res);
       			alert('菜单栏加载失败');
       		}   
		});
	}
	
	
	function showMenu(res){		
		console.log(res);   
		var menuList = eval(res);  	
		var menuText = "<li class='active grid'><a href='index.html'>主页</a></li>";
		var consor = 0;
		
		for(var i=0; i< menuList.length;i++){
			consor = 0;
			menuText = menuText +
				"<li><a class='color4' href='index.html'>"+ menuList[i].name +"</a>" +
				"<div class='megapanel'>";
			for(var j=0; j<((menuList[i].length/2)+1);j++){
				menuText = menuText + "<div class='row'>";
					
				if(consor < menuList[i].length){
					menuText = menuText +
						"<div class='col1'>" +
						"<div class='h_nav'>" +
						"<ul>" +
						"<li><a href='womens.html'><h4>"+ menuList[i].organizerEntity.name  +"</h4></a></li>" +
						"</ul>" +
						"</div>" +
						"</div>";
					consor ++;
				}
				if(consor < menuList[i].length){
					menuText = menuText +
						"<div class='col1'>" +
						"<div class='h_nav'>" +
						"<ul>" +
						"<li><a href='womens.html'><h4>"+  menuList[i].organizerEntity.name +"</h4></a></li>" +
						"</ul>" +
						"</div>" +
						"</div>";
					consor ++;
				}				
				menuText = menuText + "</div>";
			}
			menuText = menuText + "</div>";			
			menuText = menuText + "</li>" ;
		}
		
		
		if(menuText =="")
			$("#addMenu").html("没有内容哦");
		else
			$("#addMenu").html(menuText);
	} 
	
	function testMenu(){		
		//console.log(res);   
		//var menuList = eval(res);  	
		var menuText = "";
		
		menuText = menuText +
			"<li class='active grid'><a href='index.html'>主页</a></li>" +
			"<li><a class='color4' href='index.html'>理学类</a>" +
			"<div class='megapanel'>" +
			"<div class='row'>" +
			"<div class='col1'>" +
			"<div class='h_nav'>" +
			"<ul>" +
			"<li><a href='womens.html'><h4>金</h4></a></li>" +
			"</ul>" +
			"</div>" +
			"</div>" +
			"<div class='col1'>" +
			"<div class='h_nav'>" +
			"<ul>" +
			"<li><a href='womens.html'><h4>金牌竞赛</h4></a></li>" +
			"</ul>" +
			"</div>"
			"</div>" +
			"</div>" +
			"</div>" +
			"</li>" ;
		
			
		if(menuText =="")
			$("#addMenu").html("没有内容哦");
		else
			$("#addMenu").html(menuText);
	}
			
</script> 	     
</body>
</html>