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
            
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">      
                
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav">
                    <li><a href="user_center.html">我参加的比赛 <span class="sr-only">(current)</span></a></li>
                    <li><a href="user_team.html">参加的队伍</a></li>   
                    <li><a href="#">通知中心</a></li>  
                    <li><a href="#">个人信息</a></li>  
                    <li><a href="#">账号管理</a></li>                      
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
		  
		  <div id = "teamShow">
		  </div>
        			
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
	
	
	<script src="<%=request.getContextPath() %>/public/js/jquery.nivo.slider.js"></script>
	<script type="text/javascript"> 

	
	//Ajax函数
	$(document).ready(function(){	
		$(".inner_content").hover(function() {
	        $(".inner_content#"+this.id+" .product_image .float-Bar").slideToggle();
	    });		
		$('#slider').nivoSlider();
	    getReconmmendation();	
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
	
	function showReconmmendation(res){		
		var race = eval(res);   
		console.log(res);        	
		
		var htmlText = "";
		var cursor = 0;	
		
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
					 "<span class='actual'>分类："+race[cursor].typeRaceEntity.name+"</span>"+
					 "<div class='price1'>"+
					 "<span class='actual' font='0.5em'>"+ race[cursor].startTime.year +"/" + race[cursor].startTime.month +"-"+ race[cursor].endTime.year +"/" + race[cursor].endTime.month +"</span>"+
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
	
	function load(){
		$.ajax({
			url:$("#appName").val()+"/user/getTeam.act",
			type:"post",
			data: {
   				session:session
   			  },
   			success: function(res) {           		
       			showTeam(res);        			
       		},
       		error: function(res) {        			
       			console.log(res);
       			alert('输入错误！请返回重新输入！');
       		}   
		});
	}
	
	function showTeam(res){
		var teamList = eval(res);   
		console.log(res);
		var htmlText = null;
	}
	
	function load(){
		
	}
		
</script> 
</body>
</html>