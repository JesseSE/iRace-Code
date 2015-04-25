<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>- 
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<title>${ title }</title>
	<%@ include file="/public/section/header.jsp"%>
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
				<input type="text" id="searchinput" name="s" class="textbox" value="${keyword }" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '搜索';}">
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
		            <select style="margin-left:10px;">
		                            <option value=""> 热度</option>
                                    <option value=""> 开始时间 </option>
		                            <option value="">结束时间 </option>
									<option value="">级别 </option>

		            </select>
		            <label class="" style="margin-left:100px; font-size:1.3em;"> 排序方式：</label>
		            <select style="margin-left:10px;">
		                            <option value=""> 正序</option>
                                    <option value=""> 倒序 </option>
		            </select>
               </div>
    		</div>

			<!--第一排-->
			<div class="top-box">
			
			 <div class="col_1_of_3 span_1_of_3"> 
			   <a href="single.html">
				<div id="race1" class="inner_content clearfix">
					<div class="product_image">
						<img src="<%=raceEntity.getPicUrl()%>" alt=""/>
						<div class="float-Bar">
						<div class="float-Bar_left"><%=raceEntity.getGrade() %></div>
						<div class="float-Bar_right">关注人数：233</div>
						</div>
					</div>
                    <div class="sale-box"><span class="on_sale title_shop">New</span></div>
                    <div class="price">
					   <div class="cart-left">
							<span class="actual"><%=raceEntity.getName()%></span>
							
							<div class="price1">
							  <span class="actual"><%=raceEntity.getOrganizerEntity().getName() %>></span>
							</div>
						</div>
							  <span class="actual">分类：<%=raceEntity.getTypeEntity().getName() %></span>
							<div class="price1">
							  <span class="actual" font="0.5em"><%=raceEntity.getStartTime() %>-<%=raceEntity.getEndTime() %></span>
							</div>
						<div class="clear"></div>
					 </div>				
                   </div>
                 </a>
				</div>	
			</div>
			
			<div class="clear"></div>
		  </div>
		  
		  
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
					<img src="images/bsgg1.jpg"  alt="" />
					<img src="images/bsgg2.jpg"  alt="" />
					<img src="images/t-img3.jpg"  alt="" />
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
				<a href="#" class="myButton">上一页</a>
				<select class="" name="" id="page">
				<option id="jumppage" value="0">请选择页码</option>
		                            <option value="1">1</option>
                                    <option value="2">2</option>
		                            <option value="3">3</option>
									<option value="4">4</option>

		        </select>
				<a href="#" class="myButton">下一页</a>
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
		if(currentPage > 1)
			currentPage = currentPage -1;
		else
			Alert("已经是第一页了哦！");
	}
	
	//下一页
	function nextPage(){
		if(currentPage < totalPageNum)
			currentPage++;
		else
			Alert("已经是最后一页了哦！")
	}
	
	//跳转到XXX页
	function goToPage(){
		currentPage = document.getElementById("jumppage").value;
	}
	
	
	
	//Ajax函数
	$(document).ready(function(){
		//获取主页传递过来的查询关键字
		//searchKeyWord = seesion.get("searchkeywordfromindex");
		//$("#searchkeyword").html(searchKeyWord);
	    //document.getElementById("searchinput").value = searchKeyWord;
		//load();
	    searchRace();
	    //点击查询按钮开始新的搜索
		$("#searchbutton").clik(function(){
			initValue();
			
			if(checkKeyWord()){
				searchRace();
			}			
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
		 $.ajax({
        		url: $("#appName").val()+"/user/sort",
        		type: "POST",
        		data: { searchword: $("#searchinput").val(),
        				currentpagenum: currentPage
        			  },
        		dataType: "JSON",
        		success: function(res) {
        			
        			console.log(res); 
        		},
        		error: function(res) {        			
        			console.log(res);
        			alert('输入错误！请返回重新输入！');
        		}   
		});
		
	}
		
</script> 
	
     
	     
</body>
</html>