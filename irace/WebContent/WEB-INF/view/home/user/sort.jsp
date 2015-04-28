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
					<a href="<%=request.getContextPath() %>/index.jsp"><img src="<%=request.getContextPath() %>/public/images/logo1.png" alt=""/></a>
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
    </div>
     <div class="clear"></div>
     </div>
	</div>

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
		                            <option value="1"> 热度</option>
                                    <option value="2"> 开始时间 </option>
		                            <option value="3">结束时间 </option>
									<option value="4">级别 </option>

		            </select>
		            <label class="" style="margin-left:100px; font-size:1.3em;"> 排序方式：</label>
		            <select id="orderByAD" style="margin-left:10px;">
		                            <option value="1"> 正序</option>
                                    <option value="2"> 倒序 </option>
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
			        <p>GDS软件工程实践课小组版权所有<a target="_blank" href="">IRACE</a></p>
		         </div>
				<div class="f-list2">
				 <ul>
					<li class="active"><a href="">团队介绍</a></li> |
					<li><a href="">网站加盟</a></li> |
					<li><a href="">工程介绍</a></li> |
					<li><a href="">联系我们</a></li> 
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
		$(".inner_content").hover(function() {
	        $(".inner_content#"+this.id+" .product_image .float-Bar").slideToggle();
	    });
		
		$('#slider').nivoSlider();
		//testMenu();
		getMenu();
	    initValue();
		searchRace();
		
	    //点击查询按钮开始新的搜索
		$("#searchbutton").click(function(){
			initValue();
			if(checkKeyWord()){
				searchRace();
			}else
				alert("请输入关键字！");
		});
	    
	    //点击前一页
	    $("#prePage").click(function(){
	    	if(prePage())
	    		searchRace();
	    });
	  //点击后一页
	    $("#nextPage").click(function(){
	    	if(nextPage())	    	
	    		searchRace();
	    });
	  //选择页面
	    $("#jumppage").change(function(){
	    	if(goToPage())	    	
	    		searchRace();
	    });
	  //点击排序方式方式
	    $("#orderBy").change(function(){	    	
	    	initValue();
			if(checkKeyWord()){
				searchRace();
			}else
				alert("请输入关键字！");
	    });
	  
	    //点击升序降序排序搜索结果
	    $("#orderByAD").change(function(){	    	
	    	initValue();
			if(checkKeyWord()){
				searchRace();
			}else
				alert("请输入关键字！");
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
	
	
	function searchRace(){
		//排序选项
		var orderByXX = document.getElementById("orderBy").value;			
		//升序降序
		var orderByAD = document.getElementById("orderByAD").value;		
		
		
		if(checkKeyWord()){
			$.ajax({
        		url: $("#appName").val()+"/user/sortRace.act",
        		type: "POST",
        		data: { sortKeyWords: $("#searchinput").val(),
        				currentpagenum: currentPage,
        				orderByXX: orderByXX,
        				orderByAD: orderByAD
        			  },
        		dataType: "JSON",
        		success: function(res) {           		
        			showResult(res);        			
        		},
        		error: function(res) {        			
        			console.log(res);
        			alert('输入错误！请返回重新输入！');
        		}   
			});
		}
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