<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${ title }</title>
<%@ include file="/public/section/header.jsp"%>
	
	<link href="<%=request.getContextPath() %>/public/css/default.css" rel="stylesheet" type="text/css" media="all" />
	<link href="<%=request.getContextPath() %>/public/css/nivo-slider.css" rel="stylesheet" type="text/css" media="all" />

<!-- <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
<link href='css/family.css' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery1.min.js"></script> -->
<!-- start menu -->

    <!-- 新 Bootstrap 核心 CSS 文件 -->
<!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<!-- <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
 -->
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<!-- <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script> -->

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<!-- <script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> -->

<!-- <script type="text/javascript" src="js/formConfirm.js"></script> -->
    
    
    
<!-- <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script> -->
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>


<!-- <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script> -->
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>

<!-- <script type="text/javascript" src="js/jquery1.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script> -->
<!-- start menu -->
<!-- <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script> -->
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<!--start slider -->
   <!--  <link rel="stylesheet" href="css/fwslider.css" media="all">
    <script src="js/jquery-ui.min.js"></script>
	<script src="js/jQuery-self.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <script src="js/fwslider.js"></script> -->
<!--end slider -->
<!-- <script src="js/jquery.easydropdown.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/form.css" rel="stylesheet" type="text/css" media="all" /> -->
<!--testlink-->
		<!-- <link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/myButton.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" /> -->
		
<script text="text/javascript">
function changePwd()
{
	var userInfo = document.getElementById("userInfo");
	var changePwd = document.getElementById("changePwd");
	userInfo.style.display="none";
	changePwd.style.display="block";
}

function submitPwd()
{
	alert("修改成功！");
	var userInfo = document.getElementById("userInfo");
	var changePwd = document.getElementById("changePwd");
	userInfo.style.display="block";
	changePwd.style.display="none";
}
function showimg() {
            var img = document.getElementById("upimg").value;
			alert(img);
            document.getElementById("innerImg").src ="images/"+img;
        }

</script>

<style type="text/css">
.headImg {
	box-shadow: 0 0 5px #AAA;
	-webkit-box-shadow: 0 0 5px #AAA;
	-moz-box-shadow: 0 0 5px #AAA;
	-o-box-shadow: 0 0 5px #AAA;
	padding: 22px;
	
	height:240px;
}
.innerImg {
	height:160px;
	width:200px;
}

.headBtn{
	position: absolute;
	margin-left:50px;
	margin-top:7px;
	text-align:center;
	z-index: 9999;
}
.headBtn a {
	border: none;
	color: #FFF;
	cursor: pointer;
	padding: 8px 20px;
	display: inline-block;
	font-size: 1em;
	outline: none;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
	background: #4CB1CA;
	top:-60px;
	left: 52px;
}
.headBtn a:hover{
	background:#39a0b9;
}
</style>




<script type="text/javascript">


		function changeHead()
		{
			document.getElementById('upimg').click();
		}
      //图片上传预览    IE是用了滤镜。
        function previewImage(file)
        {
          var MAXWIDTH  = 260; 
          var MAXHEIGHT = 180;
          var div = document.getElementById('preview');
          if (file.files && file.files[0])
          {
              div.innerHTML ='<img id=imghead>';
              var img = document.getElementById('imghead');
              img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top+'px';
              }
              var reader = new FileReader();
              reader.onload = function(evt){img.src = evt.target.result;}
              reader.readAsDataURL(file.files[0]);
          }
          else //兼容IE
          {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
          }
		  
			alert("头像修改成功！")
        }
        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
            var param = {top:0, left:0, width:width, height:height};
            if( width>maxWidth || height>maxHeight )
            {
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                
                if( rateWidth > rateHeight )
                {
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);
                }else
                {
                    param.width = Math.round(width / rateHeight);
                    param.height = maxHeight;
                }
            }
            
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
        }
		
</script>     


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
                  <ul class="nav navbar-nav" style="font-family:微软雅黑">
                    <li><a href="user_center.html">我参加的比赛 <span class="sr-only">(current)</span></a></li>
                    <li><a href="user_team.html">参加的队伍</a></li>   
                    <li><a href="user_msg.html">通知中心</a></li>  
                    <li><a href="user_info.html">个人信息</a></li>  
                    <li><a href="user_account.html">账号管理</a></li>                           
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
              
			<div class="register_account">
          	<div class="wrap">
    	      <h4 class="title" style="font-weight:bold;">账号管理 
			  <div style="float:right;">
				<img style="width:14px; height:14px;" src="images/edit-icon.jpg"></img>
				<a onclick="changePwd();" style="font-size:0.7em;">修改密码</a>
			  </div>
			  </h4>
			  
			 
			 <!--div class="top-border"> </div>
				 <div class="border">
				<img src="images/t-img1.jpg" style="float:left; width:30%; height:254px;"></img>
			 <div class="btn"><a href="single.html">Check it Out</a></div>
			 </div-->
			 
			<div style="float:left; width:30%; height:254px;margin-left:20px;margin-top:45px;">
			<div class="top-border"> </div>
			<div class="headImg">
                <div id="preview">
					<img id="imghead" class="innerImg" border=0 src="images/headExmp.jpg"/>
				</div>
				<div class="headBtn" id="headBtn"><a onclick="changeHead();">更换头像</a><input style="display:none" id="upimg" type="file" onchange="previewImage(this);" value="更换头像" name="uploadFile" /></div>
             </div>
			 </div>
			 
		    	<form class="form-horizontal" action="" method="post" id="joinus" name="joinus" style="float:right; width:64%; margin-left:0px;margin-top:45px;">
				<div id="userInfo" style="margin-top:60px;margin-left:100px;">
				<table class="formTable" style="width:300px;text-align:justify;">
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						账号
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo">Jesse</font>
					</td>
				</tr>
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						绑定邮箱
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo">12301094@bjtu.edu.cn</font>
					</td>
				</tr>
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						绑定手机
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo">18811442504</font>
					</td>
				</tr>
				</table>
				 </div>
				  
				  <div id="changePwd" style="display:none;margin-top:50px;margin-left:100px;">
				  <div class="form-group" >
				    <label for="password" class="col-sm-2 control-label">旧密码</label>
				    <div class="col-sm-4">
				      <input type="password" class="form-control" id="password" name="password" placeholder="Password" onblur="confirm_password()">
				    </div>
				    <font id="warnPassword" color="red"></font>
				  </div>
				  
				  <div class="form-group">
				    <label for="password" class="col-sm-2 control-label">新密码</label>
				    <div class="col-sm-4">
				      <input type="password" class="form-control" id="password" name="password" placeholder="Password" onblur="check_password()">
				    </div>
				    <font id="warnPassword" color="red"></font>
				  </div>
				  <div class="form-group">
				    <label for="repassword" class="col-sm-2 control-label">请确认</label>
				    <div class="col-sm-4">
				      <input type="password" class="form-control" id="repassword" name="repassword" placeholder="rePassword" onblur="check_repassword()">
				    </div>
				    <font id="warnrePassword" color="red"></font>
				  </div>
				 <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10" style="margin-left:200px;">
				      <button type="button" class="grey" onclick="submitPwd()">提交修改</button>
				      <!--button style="display:none" type="reset" class="grey" style="margin-left: 20px;">重置</button-->
				      <!-- <button type="submit" class="btn btn-default">Sign in</button> -->
				    </div>
				  </div>
				  </div>
				</form>
				
				<div style="width:20%">
				</div>

			  </div>
			
    	</div>	
		<div class="clear" style="height:100px;"></div>
			
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