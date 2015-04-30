<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			  <div class="header-top-left">
			  	  <div class="box">
                     <div class="logo" style="margin-top:8px;">
					   <a href="index.html"><img src="images/logo1.png" alt=""/></a>
				     </div>
                  </div>
                   <div class="clear"></div> 
   			  </div>
           
            <!--用户头像-->
			 <div class="cssmenu" role="navigation">
				<ul>
                    <li><image src="images/message.png"></image></li> 
					<li><a href="##">消息</a></li>|                   
					<li><image src="images/userican.png"></image></li>
                    
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
              
			<div class="top-box" name="my_race">
                <ul class="nav nav-tabs">
                  <li role="presentation" class="active"><a href="#race_default"><h4>正在进行</h4></a></li>
                  <li role="presentation" class="active"><a href="#race_done"><h4>已经结束</h4></a></li> 
                </ul>  
<!--                正在进行-->
			    <div class="panel panel-default">
                    <a name="race_default"></a>
                      <div class="panel-body">
                          <div class="list-group">
                              <a class="list-group-item list-group-item-success" href="##">
                                  <h3>中共中央软件杯</h3></a>
                              <a class="list-group-item">ootstrap，来自 Twitter，是目前最受欢迎的前端框架。Bootstrap 是基于 HTML、CSS、JAVASCRIPT 的，它简洁灵活，使得 Web 开发更加快捷。[1] 它由Twitter的设计师Mark Otto和Jacob Thornton合作开发，是一个CSS/HTML框架。Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。Bootstrap一经推出后颇受欢迎，一直是GitHub上的热门开源项目，包括NASA的MSNBC（微软全国广播公司）的Breaking News都使用了该项目。
                              </a>
                              
                                <span class="label label-default">北京市教育委员会主办</span>
                                <span class="label label-primary">国家级赛事</span>
                                <span class="label label-success">计算机</span>
                                <span class="label label-info">时间：2016-3至2017-8</span>
                        </div>
                          
                          
                        <div class="list-group">
                              <a class="list-group-item list-group-item-success" href="##">
                                  <h3>中共中央软件杯</h3></a>
                              <a class="list-group-item">ootstrap，来自 Twitter，是目前最受欢迎的前端框架。Bootstrap 是基于 HTML、CSS、JAVASCRIPT 的，它简洁灵活，使得 Web 开发更加快捷。[1] 它由Twitter的设计师Mark Otto和Jacob Thornton合作开发，是一个CSS/HTML框架。Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。Bootstrap一经推出后颇受欢迎，一直是GitHub上的热门开源项目，包括NASA的MSNBC（微软全国广播公司）的Breaking News都使用了该项目。</a>
                              
                                <span class="label label-default">北京市教育委员会主办</span>
                                <span class="label label-primary">国家级赛事</span>
                                <span class="label label-success">计算机</span>
                                <span class="label label-info">时间：2016-3至2017-8</span>
                        </div>
                      </div>
                </div>    
                
                
<!--                已结束-->
                <div class="panel panel-default">
                    <a name="race_done"></a>
                      <div class="panel-body">
                          <div class="list-group">
                              <a class="list-group-item disabled" href="##">
                                  <h3>中共中央软件杯</h3></a>
                              <a class="list-group-item">ootstrap，来自 Twitter，是目前最受欢迎的前端框架。Bootstrap 是基于 HTML、CSS、JAVASCRIPT 的，它简洁灵活，使得 Web 开发更加快捷。[1] 它由Twitter的设计师Mark Otto和Jacob Thornton合作开发，是一个CSS/HTML框架。Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。Bootstrap一经推出后颇受欢迎，一直是GitHub上的热门开源项目，包括NASA的MSNBC（微软全国广播公司）的Breaking News都使用了该项目。</a>
                              
                               <span class="label label-default">北京市教育委员会主办</span>
                                <span class="label label-primary">国家级赛事</span>
                                <span class="label label-success">计算机</span>
                                <span class="label label-info">时间：2016-3至2017-8</span>
                        </div>                      
                        
                          
                          
                         <div class="list-group">
                              <a class="list-group-item disabled" href="##">
                                  <h3>中共中央软件杯</h3></a>
                              <a class="list-group-item">ootstrap，来自 Twitter，是目前最受欢迎的前端框架。Bootstrap 是基于 HTML、CSS、JAVASCRIPT 的，它简洁灵活，使得 Web 开发更加快捷。[1] 它由Twitter的设计师Mark Otto和Jacob Thornton合作开发，是一个CSS/HTML框架。Bootstrap提供了优雅的HTML和CSS规范，它即是由动态CSS语言Less写成。Bootstrap一经推出后颇受欢迎，一直是GitHub上的热门开源项目，包括NASA的MSNBC（微软全国广播公司）的Breaking News都使用了该项目。</a>
                              
                               <span class="label label-default">北京市教育委员会主办</span>
                                <span class="label label-primary">国家级赛事</span>
                                <span class="label label-success">计算机</span>
                                <span class="label label-info">时间：2016-3至2017-8</span>
                        </div>   
                          
                      </div>
                </div>  
                
                
				<div class="clear"></div>
                
                <!--分页-->
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
                
			</div>	
				
              
			
		  <h2 class="head">猜你喜欢</h2>
			  <div class="col_1_of_3 span_1_of_3"> 
			    <a href="single.html">
				<div id="race1" class="inner_content clearfix">
					<div class="product_image">
						<img src="images/fwwb_cover.jpg" alt=""/>
						<div class="float-Bar">
						<div class="float-Bar_left">国家级比赛</div>
						<div class="float-Bar_right">关注人数：233</div>
						</div>
					</div>
                    <div class="sale-box"><span class="on_sale title_shop">New</span></div>
                    <div class="price">
					   <div class="cart-left">
							<span class="actual">软件杯创新大赛</span>
							
							<div class="price1">
							  <span class="actual">北京交通大学</span>
							</div>
						</div>
							  <span class="actual">分类：计算机</span>
							<div class="price1">
							  <span class="actual" font="0.5em">2015/4-2015/9</span>
							</div>
						<div class="clear"></div>
					 </div>	
				</div>	
                </a>
				</div>
              
				<div class="col_1_of_3 span_1_of_3"> 
			    <a href="single.html">
				<div id="race2" class="inner_content clearfix">
					<div class="product_image">
						<img src="images/fwwb_cover.jpg" alt=""/>
						<div class="float-Bar">
						<div class="float-Bar_left">国家级比赛</div>
						<div class="float-Bar_right">关注人数：233</div>
						</div>
					</div>
                    <div class="sale-box"><span class="on_sale title_shop">New</span></div>
                    <div class="price">
					   <div class="cart-left">
							<span class="actual">软件杯创新大赛</span>
							
							<div class="price1">
							  <span class="actual">北京交通大学</span>
							</div>
						</div>
							  <span class="actual">分类：计算机</span>
							<div class="price1">
							  <span class="actual" font="0.5em">2015/4-2015/9</span>
							</div>
						<div class="clear"></div>
					 </div>	
				</div>	
                </a>
				</div>
              
				<div class="col_1_of_3 span_1_of_3"> 
			    <a href="single.html">
				<div id="race3" class="inner_content clearfix">
					<div class="product_image">
						<img src="images/fwwb_cover.jpg" alt=""/>
						<div class="float-Bar">
						<div class="float-Bar_left">国家级比赛</div>
						<div class="float-Bar_right">关注人数：233</div>
						</div>
					</div>
                    <div class="sale-box"><span class="on_sale title_shop">New</span></div>
                    <div class="price">
					   <div class="cart-left">
							<span class="actual">软件杯创新大赛</span>
							
							<div class="price1">
							  <span class="actual">北京交通大学</span>
							</div>
						</div>
							  <span class="actual">分类：计算机</span>
							<div class="price1">
							  <span class="actual" font="0.5em">2015/4-2015/9</span>
							</div>
						<div class="clear"></div>
					 </div>	
				</div>	
                </a>
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
                <img src="images/t-img1.jpg"  alt="" />
               	<img src="images/t-img2.jpg"  alt="" />
                <img src="images/t-img3.jpg"  alt="" />
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
</body>
</html>