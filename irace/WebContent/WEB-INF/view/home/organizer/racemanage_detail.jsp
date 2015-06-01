<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.irace.util.TimeUtil" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title>iRace</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=request.getContextPath() %>/public/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath() %>/public/css/form.css" rel="stylesheet" type="text/css" media="all" />
<link href='<%=request.getContextPath() %>/public/css/family.css' rel='stylesheet' type='text/css'>
<!-- start menu -->

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/public/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/public/css/bootstrap-datetimepicker.min.css">
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/locales/bootstrap-datetimepicker.fr.js"></script>

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

    
<link href="<%=request.getContextPath() %>/public/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="<%=request.getContextPath() %>/public/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>

<!--start slider -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/public/css/fwslider.css" media="all">
    <script src="<%=request.getContextPath() %>/public/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath() %>/public/js/jQuery-self.js"></script>
    <script src="<%=request.getContextPath() %>/public/js/css3-mediaqueries.js"></script>
    <script src="<%=request.getContextPath() %>/public/js/fwslider.js"></script>
<!--end slider -->
<script src="<%=request.getContextPath() %>/public/js/jquery.easydropdown.js"></script>
<link href="<%=request.getContextPath() %>/public/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="<%=request.getContextPath() %>/public/css/form.css" rel="stylesheet" type="text/css" media="all" />
<!--testlink-->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/public/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/public/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/public/css/myButton.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/public/css/component.css" />

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
.operate {
	cursor:pointer;
}
</style>

<!--字段js-->
<script type="text/javascript">	

function completehandle(e,status) {
	if(status == 'success') {
		return ;
	}
	if(status == 'timeout') {
		alert("请求超时，请检查网络是否正常！");
	} else if(status == 'error') {
		alert(e.statusText);
	}
	console.log(e);
}

function addProperty()
{
	var propertyAdd= document.getElementById("propertyAdd");
	location.href='#addProperty';
	propertyAdd.focus();
}

function addPropIn()
{
	var name = $("#propertyAdd").val();
	var desc= $("#describeAdd").val();
	if(name==''||desc=='') {
		alert('字段名和描述不能为空！');
	} else {
		$.ajax({
			url: $("#appName").val()+"/organizer/addProperty",
			type: "POST",
			data: {
				raceId: $("#raceId").val(),
				name: name,
				desc: desc
			},
			dataType: "JSON",
			success: function(res) {
				if(res.code==200) {
					var html = "<tr class='item"+res.msg+"'>";
					html += "<th scope='row'>*</th>";
					html += "<td class='name'>"+name+"</td>";
					html += "<td>"+desc+"</td>";
					html += "<td><a class='operate' href='javascript:delProperty("+res.msg+")'>删除</a>";
					html += "</tr>";
					
					$("#property-data").append(html);
					
					$("#propertyAdd").val("");
					$("#describeAdd").val("");
				} else {
					alert(res.msg);
				}
			},
			complete: completehandle 
		});
	}
}

function delProperty(id) {
	if(confirm("你真的要删除属性"+$("#property-data tr.item"+id+" td.name").html()+"吗?")) {
		$.ajax({
			url: $("#appName").val()+"/organizer/delProperty",
			type: "POST",
			data: {
				id: id
			},
			dataType: "JSON",
			success: function(res) {
				if(res.code==200) {
					$("#property-data tr.item"+id).remove();
				} else {
					alert(res.msg);
				}
			},
			complete: completehandle 
		});
	}
}
</script>	

<!--奖项js-->
<script type="text/javascript">	

function addPrice()
{
	var priceGroupAdd= document.getElementById("priceGroupAdd");
	location.href='#addPrice';
	priceGroupAdd.focus();
}

function addPriceIn()
{
	var name = $("#priceNameAdd").val();
	var desc= $("#priceDescAdd").val();
	var groupId = $('#priceGroupAdd').val();
	if(name==''||desc=='') {
		alert('奖项名和描述不能为空！');
	} else {
		$.ajax({
			url: $("#appName").val()+"/organizer/addReward",
			type: "POST",
			data: {
				groupId: groupId,
				name: name,
				content: desc
			},
			dataType: "JSON",
			success: function(res) {
				if(res.code==200) {
					var html = "<tr class='item"+res.msg+"'>";
					html += "<th scope='row'>*</th>";
					html += "<td>"+$("#priceGroupAdd option[value="+groupId+"]").html()+"</td>";
					html += "<td class='name'>"+name+"</td>";
					html += "<td>"+desc+"</td>";
					html += "<td><a class='operate' href='javascript:delReward("+res.msg+")'>删除</a>";
					html += "</tr>";
					
					$("#reward-data").append(html);
					
					$("#priceNameAdd").val("");
					$("#priceDescAdd").val("");
				} else {
					alert(res.msg);
				}
			},
			complete: completehandle 
		});
	}
}

function delReward(id)
{
	if(confirm("你真的要删除“"+$("#reward-data tr.item"+id+" td:nth-child(2)").html()+"”的“"+$("#reward-data tr.item"+id+" td:nth-child(3)").html()+"”吗?")) {
		$.ajax({
			url: $("#appName").val()+"/organizer/delReward",
			type: "POST",
			data: {
				id: id
			},
			dataType: "JSON",
			success: function(res) {
				if(res.code==200) {
					$("#reward-data tr.item"+id).remove();
				} else {
					alert(res.msg);
				}
			},
			complete: completehandle 
		});
	}
}

</script>	
	
<!--阶段js-->
<script type="text/javascript">	
function addStage()
{
	var stageGroupName= document.getElementById("stageGroupName");
	location.href='#addStage';
	stageGroupName.focus();
}

function addStageIn()
{
	var groupId = $('#stageGroupName').val();
	var name = $("#stageName").val();
	var startTime = $("#stageStartTime").val();
	var endTime = $('#stageEndTime').val();
	var desc = $('#stageDescribe').val();
	if(stageName==''||desc==''||startTime==''||endTime=='') {
		alert('增加项均为必填！');
	} else {
		$.ajax({
			url: $("#appName").val()+"/organizer/addStage",
			type: "POST",
			data: {
				groupId: groupId,
				name: name,
				startTime: startTime,
				endTime: endTime,
				content: desc
			},
			dataType: "JSON",
			success: function(res) {
				if(res.code==200) {
					var html = "<tr class='item"+res.msg+"'>";
					html += "<th scope='row'>*</th>";
					html += "<td>"+$("#stageGroupName option[value="+groupId+"]").html()+"</td>";
					html += "<td class='name'>"+name+"</td>";
					html += "<td>"+startTime+"</td>";
					html += "<td>"+endTime+"</td>";
					html += "<td>"+desc+"</td>";
					html += "<td><a class='operate' href='javascript:delStage("+res.msg+")'>删除</a>";
					html += "</tr>";
					
					$("#stage-data").append(html);
					
					$("#stageName").val("");
					$("#stageStartTime").val("");
					$("#stageEndTime").val("");
					$("#stageDescribe").val("");
				} else {
					alert(res.msg);
				}
			},
			complete: completehandle 
		});
	}
}

function delStage(id)
{
	if(confirm("你真的要删除“"+$("#stage-data tr.item"+id+" td:nth-child(2)").html()+"”的“"+$("#stage-data tr.item"+id+" td:nth-child(3)").html()+"”吗?")) {
		$.ajax({
			url: $("#appName").val()+"/organizer/delStage",
			type: "POST",
			data: {
				id: id
			},
			dataType: "JSON",
			success: function(res) {
				if(res.code==200) {
					$("#stage-data tr.item"+id).remove();
				} else {
					alert(res.msg);
				}
			},
			complete: completehandle 
		});
	}
}


</script>

<!--组别js-->
<script type="text/javascript">	
function addGroup()
{
	var groupNameAdd= document.getElementById("groupNameAdd");
	location.href='#addGroup';
	groupNameAdd.focus();
}
function addGroupIn()
{
	var name = $("#groupNameAdd").val();
	var desc= $("#groupDescAdd").val();
	if(name==''||desc=='') {
		alert('组名和描述不能为空！');
	} else {
		$.ajax({
			url: $("#appName").val()+"/organizer/addGroup",
			type: "POST",
			data: {
				raceId: $("#raceId").val(),
				name: name,
				desc: desc
			},
			dataType: "JSON",
			success: function(res) {
				if(res.code==200) {
					var html = "<tr class='item"+res.msg+"'>";
					html += "<th scope='row'>*</th>";
					html += "<td class='name'>"+name+"</td>";
					html += "<td>"+desc+"</td>";
					html += "<td><a class='operate' href='javascript:delGroup("+res.msg+")'>删除</a></td>";
					html += "</tr>";
					$("#group-data").append(html);
					
					$("#groupNameAdd").val("");
					$("#groupDescAdd").val("");
				} else {
					alert(res.msg);
				}
			},
			complete: completehandle 
		});
	}
}

function delGroup(id) {
	if(confirm("你真的要删除组别"+$("#group-data tr.item"+id+" td.name").html()+"吗?")) {
		$.ajax({
			url: $("#appName").val()+"/organizer/delGroup",
			type: "POST",
			data: {
				id: id
			},
			dataType: "JSON",
			success: function(res) {
				if(res.code==200) {
					$("#group-data tr.item"+id).remove();
				} else {
					alert(res.msg);
				}
			},
			complete: completehandle 
		});
	}
}

</script>	
<!--二级菜单栏Tabjs-->
<script type="text/javascript">	
function detailTab(pos)
{
	var tab1= document.getElementById("tab1");
	var tab2= document.getElementById("tab2");
	var tab3= document.getElementById("tab3");
	var tab4= document.getElementById("tab4");
	var tab5= document.getElementById("tab5");
	
	var raceDiv1 = document.getElementById("raceDescribe");
	var raceDiv2 = document.getElementById("raceProperty");
	var raceDiv3 = document.getElementById("raceGroup");
	var raceDiv4 = document.getElementById("raceStage");
	var raceDiv5 = document.getElementById("racePrice");
	
	if(pos==1)
	{
		tab1.style.backgroundColor="#DFF0D8";
		tab2.style.backgroundColor="";
		tab3.style.backgroundColor="";
		tab4.style.backgroundColor="";
		tab5.style.backgroundColor="";
		
		raceDiv1.style.display="block";
		raceDiv2.style.display="none";
		raceDiv3.style.display="none";
		raceDiv4.style.display="none";
		raceDiv5.style.display="none";
	}
	else if(pos==2)
	{
		tab2.style.backgroundColor="#DFF0D8";
		tab1.style.backgroundColor="";
		tab3.style.backgroundColor="";
		tab4.style.backgroundColor="";
		tab5.style.backgroundColor="";
		
		raceDiv1.style.display="none";
		raceDiv2.style.display="block";
		raceDiv3.style.display="none";
		raceDiv4.style.display="none";
		raceDiv5.style.display="none";
	}
	else if(pos==3)
	{
		tab3.style.backgroundColor="#DFF0D8";
		tab1.style.backgroundColor="";
		tab2.style.backgroundColor="";
		tab4.style.backgroundColor="";
		tab5.style.backgroundColor="";
		
		raceDiv1.style.display="none";
		raceDiv2.style.display="none";
		raceDiv3.style.display="block";
		raceDiv4.style.display="none";
		raceDiv5.style.display="none";
	}
	else if(pos==4)
	{
		tab4.style.backgroundColor="#DFF0D8";
		tab1.style.backgroundColor="";
		tab2.style.backgroundColor="";
		tab3.style.backgroundColor="";
		tab5.style.backgroundColor="";
		
		raceDiv1.style.display="none";
		raceDiv2.style.display="none";
		raceDiv3.style.display="none";
		raceDiv4.style.display="block";
		raceDiv5.style.display="none";
	}
	else if(pos==5)
	{
		tab4.style.backgroundColor="";
		tab1.style.backgroundColor="";
		tab2.style.backgroundColor="";
		tab3.style.backgroundColor="";
		tab5.style.backgroundColor="#DFF0D8";
		
		raceDiv1.style.display="none";
		raceDiv2.style.display="none";
		raceDiv3.style.display="none";
		raceDiv4.style.display="none";
		raceDiv5.style.display="block";
	}
}

</script>
<!--user_account来的js和css-->
		
<script text="text/javascript">
function changePwd()
{
	var userInfo = document.getElementById("userInfo");
	var changePwd = document.getElementById("changePwd");
	userInfo.style.display="none";
	changePwd.style.display="block";
}

function changePic()
{
	var chooseBtn = document.getElementById("chooseBtn");
	var picSubmit = document.getElementById("picSubmit");
	var imgContent = document.getElementById("headImg");
	chooseBtn.style.display="block";
	picSubmit.style.display="block";
}


//开始上传图片
function changePicDone()
{
	var chooseBtn = document.getElementById("chooseBtn");
	var picSubmit = document.getElementById("picSubmit");
	var imgContent = document.getElementById("headImg");
	
	chooseBtn.style.display="none";
	picSubmit.style.display="none";
}


function updateRaceAvatar(id,name) {
	$.ajax({
		url: $("#appName").val()+"/organizer/updateRaceAvatar",
		type: "POST",
		data: {
			id: id,
			imgName: name
		},
		dataType: "JSON",
		success: function(res) {
			if(res.code==200) {
				alert("更新图片成功!");
				changePicDone();
			} else {
				alert(res.msg);
			}
		},
		complete: completehandle 
	});
}

function submitPwd()
{
	alert("修改成功！");
	var userInfo = document.getElementById("userInfo");
	var changePwd = document.getElementById("changePwd");
	userInfo.style.display="block";
	changePwd.style.display="none";
}

</script>

<style type="text/css">
.headImg {
	box-shadow: 0 0 5px #AAA;
	-webkit-box-shadow: 0 0 5px #AAA;
	-moz-box-shadow: 0 0 5px #AAA;
	-o-box-shadow: 0 0 5px #AAA;
	padding: 0px 0px;
	
	height:300px;
	width:407px;
}
.innerImg {
	height:300px;
	width:407px;
}

.picBtn{
	position: absolute;
	margin-left:-1px;
	margin-top:-4px;
	width:215px;
	height:50px;
	text-align:center;
	z-index: 9999;
	border:4px #FFF;
}
.picBtn a {
	font-family:微软雅黑;
	border: none;
	color: #FFF;
	cursor: pointer;
	padding: 16px 75px;
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
.picBtn a:hover{
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
          var MAXWIDTH  = 430; 
          var MAXHEIGHT = 300;
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
            param.width=maxWidth;
			param.height=maxHeight;
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
        }
		
</script> 

</head>
<body>
    
    <!-- 用户登录信息div -->
	<%@ include file="/public/section/user-div.jsp"%>
    
    <!--导航栏-->
	<div class="header-bottom" style="margin-top:-10px;">
	    <div class="wrap" style="margin-top:-10px;">
        
        <input id="raceId" type="hidden" value="${race.getId() }" />
		<h1 style="margin-top:-0px;float:adjusty;font-family:微软雅黑;">${race.getName() }</h1>
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">      
                 
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav" style="font-family:微软雅黑;">
                    <li><a href="racemanage_detail.html" style="color:#FFF;background-color:#4cb1ca;">基本信息管理<span class="sr-only">(current)</span></a></li>
                    <li><a href="racemanage_stage.html">比赛审核</a></li>    
                    <li><a href="racemanage_notice.html">发布公告</a></li>    
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
		  <div class="cont span_2_of_3" style="width:100%">
              
			<div class="top-box" name="my_race">
                <ul class="nav nav-tabs"  style="font-family:微软雅黑;">
                  <li role="presentation" class="active"><a href="##" id="tab1" onclick="detailTab(1);"  style="background-color:#DFF0D8;"><h4>比赛描述</h4></a></li>
                  <li role="presentation" class="active"><a href="##" id="tab2" onclick="detailTab(2);" ><h4>报名要求</h4></a></li> 
                  <li role="presentation" class="active"><a href="##" id="tab3" onclick="detailTab(3);" ><h4>组别设置</h4></a></li> 
                  <li role="presentation" class="active"><a href="##" id="tab4" onclick="detailTab(4);" ><h4>阶段设置</h4></a></li> 
                  <li role="presentation" class="active"><a href="##" id="tab5" onclick="detailTab(5);" ><h4>奖项设置</h4></a></li> 
					<li style="position:relative;float:right;margin-top:10px;margin-left:0px;"><button style="font-family:微软雅黑;border:0px;padding:10px;color:#FFF;background-color:#4cb1ca;margin-right:17px;margin-top:-10px"><a style="color:#FFF">点击发布比赛</a></button></li> 
				</ul>
<!--                比赛描述-->
<div id="raceDescribe" style="display:block">
			    <div class="panel panel-default">
                    <a name="race_default"></a>
                      <div class="panel-body">
					  <!--一个比赛-->
					  
			<h4 class="title" style="font-weight:bold;">图片描述管理 
			  <div style="float:right;">
				<img style="width:14px; height:14px;" src="<%=request.getContextPath() %>/public/images/edit-icon.jpg"></img>
				<a onclick="changePic();" style="font-size:0.7em;">修改图片</a>
			  </div>
			  </h4>
            <div style="float:left; width:407px;; height:400px;margin-left:25%;margin-top:20px;">
			<div class="top-border"> </div>
			<div class="headImg" id="headImg">
                <div id="preview">
					<img id="imghead" class="innerImg" border=0 src="${race.getPicUrl() }"/>
				</div>
				<div class="picBtn" id="chooseBtn" style="display:none;">
					<a onclick="changeHead();">选择图片</a>
					<form id="avatar-form" action="<%=request.getContextPath() %>/upload/img" method="POST" enctype="multipart/form-data">
						<input  name="uploadFile" id="upimg" type="file" onchange="previewImage(this);" value="更换头像" style="display:none;" />
					</form>
				</div>
				<div class="picBtn" id="picSubmit" style="display:none;margin-left:192px;">
					<a onclick="javascript:$('#avatar-form').submit();">完成更换</a>
				</div>
             </div>
			 </div>
			 
			 <h4 class="title" style="font-weight:bold;margin-top:450px;">文字描述管理 
			  <div style="float:right;">
				<img style="width:14px; height:14px;" src="<%=request.getContextPath() %>/public/images/edit-icon.jpg"></img>
				<a onclick="changePwd();" style="font-size:0.7em;">修改描述</a>
			  </div>
			  </h4>
		    	<form class="form-horizontal" action="" method="post" id="joinus" name="joinus" style=" width:100%;margin-top:0px;margin-left:10%;">
				<div id="userInfo" style="margin-top:20px;margin-left:0px;">
				<table class="formTable" style="width:80%;text-align:justify;">
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;width:90px;">
						比赛名称
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo" id="preName">${race.getName() }</font>
					</td>
				</tr>
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
					比赛级别
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo" id="preGrade">${race.getGrade() }</font>
					</td>
				</tr>
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						开始时间
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo" id="preStartTime">${race.getStrTime(race.getStartTime()) }</font>
					</td>
				</tr>
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						结束时间
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo" id="preEndTime">${race.getStrTime(race.getEndTime()) }</font>
					</td>
				</tr>
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						限制人数
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo" id="preNumRest">${race.getNumRest() }</font>
					</td>
				</tr>
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						描述
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo" id="preContent">${race.getContent() }</font>
					</td>
				</tr>
				<tr style="margin-bottom:10px;color:#000;font-family:微软雅黑;border:solid 2px #4cb1ca">
					<td style="padding:10px 10px;">
						类型
					</td>
					<td style="padding:10px 10px;">
					  <font name="showInfo" id="preBigType">${race.getTypeRaceEntity().getBigTypeEntity().getName() }</font> -> 
					  <font name="showInfo" id="preSmallType">${race.getTypeRaceEntity().getName() }</font>
					</td>
				</tr>
				</table>
				 </div>
				  
				  <div id="changePwd" style="display:none;margin-top:50px;margin-left:-100px;font-family:微软雅黑;">
				  <div class="form-group" >
				    <label for="name" class="col-sm-2 control-label">比赛名称</label>
				    <div class="col-sm-4">
				      <input type="text" class="form-control" id="name" name="name" placeholder="Name" onblur="" value="${race.getName() }">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label for="grade" class="col-sm-2 control-label">比赛级别</label>
				    <div class="col-sm-4">
				      <input type="text" class="form-control" id="grade" name="grade" placeholder="Grade" onblur="" value="${race.getGrade() }">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="startTime" class="col-sm-2 control-label">开始时间</label>
				    <div class="col-sm-4">
						<input type="text" class="form-control" value="${race.getStrTime(race.getStartTime()) }" id="raceStartTime">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="endTime" class="col-sm-2 control-label">结束时间</label>
				    <div class="col-sm-4">
				     	<input type="text" class="form-control" value="${race.getStrTime(race.getEndTime()) }" id="raceEndTime">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="limitNum" class="col-sm-2 control-label">限制人数</label>
				    <div class="col-sm-4">
				      <input type="number" class="form-control" id="limitNum" min="1" max="50" step="1" name="limitNum" placeholder="Limit Number" value="${race.getNumRest() }">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="type" class="col-sm-2 control-label" style="margin-top:-5px;">类型</label>
				    <div class="col-sm-4">
				      <select class="" name="" id="bigType">
				      <c:forEach var="bt" items="${bigTypeList }">
				      	<option value="${bt.getId() }">${bt.getName() }</option>
				      </c:forEach>
					  </select> -> 
					  <select class="" name="" id="smallType">
						
					  </select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="describe" class="col-sm-2 control-label">描述</label>
				    <div class="col-sm-4">
				      <textarea  type="text" class="form-control" id="describe" style="width:100%;height:200px; name="describe" placeholder="Describe" onblur="">${race.getContent() }</textarea>
				    </div>
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
                </div>
                </div>
                
   </div>             
<!--                奖项设置-->
<div id="racePrice" style="display:none">
                <div class="panel panel-default">
                    <a name="race_done"></a>
                      <div class="panel-body">
					  <!--自定义奖项设置-->
					  <div class="panel-body">
						<div class="list-group">
                              <a class="list-group-item list-group-item-success" href="##">
                                  <h3 style="display:inline;">自定义奖项设置</h3>
								  <h3 class="race-state-submit" onclick="addPrice();">增设奖项</h3> 
								  </a>
                              <a class="list-group-item">
					 <div class="panel panel-default">
                         <table class="table" style="word-break:break-all; word-wrap:break-all;">
									<thead style="font-weight:bold;">
									  <tr>
										<th>#</th>
										<th>组别名称</th>
										<th>奖项名称</th>
										<th>描述</th>
										<th>操作</th>
									  </tr>
									</thead>
									<tbody id="reward-data">
									<c:set var="index" value="0" scope="page"></c:set>
									<c:forEach var="reward" items="${rewardList }">
										
										<c:forEach var="r" items="${reward.get('rlist') }">
										  <tr class="item${r.getId() }">
											<td scope="row">${index=index+1 }</td>
											<td>${reward.get("gname") }</td>
											<td>${r.getName() }</td>
											<td>${r.getContent() }</td>
											<td><a class="operate" href="javascript:delReward(${r.getId() })">删除</a></td>
										  </tr>
										</c:forEach>
										
									</c:forEach>
									  
									  <!--/table-->
									</tbody>
									<div name="addPrice">
										<tr id="addPrice">
										<th id="priceid" scope="row">*</th>
										<td>
											<select id="priceGroupAdd">
												<c:forEach var="g" items="${groupList }">
												<option value="${g.getId() }">${g.getName() }</option>
												</c:forEach>
											</select>
										</td>
										<td><input id="priceNameAdd"></input></td>
										<td><input id="priceDescAdd"></input></td>
										<td><a class="operate" href="javascript:addPriceIn();" style="margin-right:0%;">添加</a>
									    </tr>
									  </div>
								  </table>
								</div>
							</a>
							</div> 
                              
                        </div>  
                          
                      </div>
                </div>  
    </div> 
<!--                阶段设置-->
<div id="raceStage" style="display:none">
                <div class="panel panel-default">
                    <a name="race_done"></a>
                      <div class="panel-body">
					  <!--自定义奖项设置-->
					  <div class="panel-body">
						<div class="list-group">
                              <a class="list-group-item list-group-item-success" href="##">
                                  <h3 style="display:inline;">自定义阶段设置</h3>
								  <h3 class="race-state-submit" onclick="addStage();">增设阶段</h3> 
								  </a>
                              <a class="list-group-item">
					 <div class="panel panel-default">
                         <table class="table" style="word-break:break-all; word-wrap:break-all;">
									<thead style="font-weight:bold;">
									  <tr>
										<th>#</th>
										<th>组别名称</th>
										<th>阶段名称</th>
										<th>开始时间</th>
										<th>结束时间</th>
										<th>描述</th>
										<th>操作</th>
									  </tr>
									</thead>
									<tbody id="stage-data">
									<c:set var="stageIndex" value="0" scope="page"></c:set>
									<c:forEach var="exStage" items="${stageList }">
										<c:forEach var="s" items="${exStage.get('slist') }">
											 <tr class="item${s.getId() }">
												<th scope="row">${stageIndex = stageIndex + 1 }</th>
												<td>${exStage.get('gname') }</td>
												<td>${s.getName() }</td>
												<td>${s.getStartTime() }</td>
												<td>${s.getEndTime() }</td>
												<td>${s.getContent() }</td>
												<td><a class="operate" href="javascript:delStage(${s.getId() })">删除</a></td>
											  </tr>
										</c:forEach>
									</c:forEach>
									  <!--/table-->
									</tbody>
									<div name="addStage">
										<tr id="addStage">
										<th id="stageId" scope="row">*</th>
										<td>
											<select id="stageGroupName">
												<c:forEach var="g" items="${groupList }">
												<option value="${g.getId() }">${g.getName() }</option>
												</c:forEach>
											</select>
										</td>
										<td><input id="stageName"></input></td>
										<td><input id="stageStartTime"></input></td>
										<td><input id="stageEndTime"></input></td>
										<td><input id="stageDescribe"></input></td>
										<td><a class="operate" onclick="javascript:addStageIn();" style="margin-right:0%;">添加</a>
									    </tr>
									 </div>
								  </table>
								</div>
							</a>
							</div> 
                              
                        </div>  
                          
                      </div>
                </div>  
    </div>            
 <!--                报名要求-->
<div id="raceProperty" style="display:none">
                <div class="panel panel-default">
                    <a name="race_property"></a>
                      <div class="panel-body">
					  <!--自定义报名资料要求字段-->
					  <div class="panel-body">
						<div class="list-group">
                              <a class="list-group-item list-group-item-success" href="##">
                                  <h3 style="display:inline;">自定义报名资料要求字段</h3>
								  <h3 class="race-state-submit" onclick="addProperty();">增加字段</h3> 
								  </a>
                              <a class="list-group-item">
					 <div class="panel panel-default">
                         <table class="table" style="word-break:break-all; word-wrap:break-all;">
									<thead style="font-weight:bold;">
									  <tr>
										<th>#</th>
										<th>属性</th>
										<th>描述</th>
										<th>操作</th>
									  </tr>
									</thead>
									<tbody id="property-data">
									<c:forEach var="p" items="${propertyList }" varStatus="i">
									  <tr class="item${p.getId() }">
										<th scope="row">${i.count }</th>
										<td class='name'>${p.getName() }</td>
										<td>${p.getRequires() }</td>
										<td><a class="operate" href="javascript:delProperty(${p.getId() })">删除</a>
									  </tr>
									</c:forEach>
									  
									</tbody>
									<div name="addProperty">
										<tr id="addProperty">
										<th id="propertyId" scope="row">*</th>
										<td><input id="propertyAdd"></input></td>
										<td><input id="describeAdd"></input></td>
										<td><a class="operate" onclick="addPropIn();" style="margin-right:0%;">添加</a>
									    </tr>
										</div>
								  </table>
								</div>
							</a>
							</div> 
                              
                        </div>
                      </div>
                </div>  
    </div>    
	
 <!--                组别设置-->	
<div id="raceGroup" style="display:none">
                <div class="panel panel-default">
                    <a name="race_done"></a>
                      <div class="panel-body">
					  <!--自定义组别设置-->
					  <div class="panel-body">
						<div class="list-group">
                              <a class="list-group-item list-group-item-success" href="##">
                                  <h3 style="display:inline;">自定义组别设置</h3>
								  <h3 class="race-state-submit" onclick="addGroup();">增设组别</h3> 
								  </a>
                              <a class="list-group-item">
					 <div class="panel panel-default">
                         <table class="table" style="word-break:break-all; word-wrap:break-all;">
									<thead style="font-weight:bold;">
									  <tr>
										<th>#</th>
										<th>组别名称</th>
										<th>描述</th>
										<th>操作</th>
									  </tr>
									</thead>
									<tbody id="group-data">
									<c:forEach var="g" items="${groupList }" varStatus="i">
									  <tr class="item${g.getId() }">
										<th scope="row">${i.count }</th>
										<td class="name">${g.getName() }</td>
										<td>${g.getRequires() }</td>
										<td><a class="operate" href="javascript:delGroup(${g.getId() })">删除</a></td>
									  </tr>
									</c:forEach>
									  
									</tbody>
									<div name="addGroup">
										<tr id="addGroup">
										<th id="groupId" scope="row">*</th>
										<td><input id="groupNameAdd"></input></td>
										<td><input id="groupDescAdd"></input></td>
										<td><a class="operate" onclick="addGroupIn();" style="margin-right:0%;">添加</a>
									    </tr>
									  </div>
								  </table><!--/table-->
								</div>
							</a>
							</div> 
                              
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
				
				<div class="clear" style="height:37px;"></div>
			</div>	            		 						 			    
		  </div>
            
            <!--侧边-->
			<div class="rsidebar span_1_of_left" style="display:none">
				
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
    
    <%@ include file="/public/section/footer.jsp" %>
   <script src="<%=request.getContextPath() %>/public/js/jquery.form.min.js" type="text/javascript"></script>
   <script type="text/javascript">
   /**
    * 上传文件设置
    */
   var uploadOptions = {
  			beforeSubmit: function() {
  	        	if($("#upimg").val() == "") {
  	        		alert("没有选择文件！");
  	        		return false;
  	        	} else {
  	        		//$("#loading").fadeIn();
  	        		return true;
  	        	}
  	        },  //提交前处理 
  	        success: function(res) {
  	        	//$("#loading").fadeOut();
  	        	if(res.code == 200) {
  	        		updateRaceAvatar($("#raceId").val(),res.msg);
  	        	} else {
  	        		alert(res.msg);
  	        	}
  	        	
  	        },
  	        error: completehandle,  //处理完成 
  	        resetForm: true,
  	        dataType:  'json'
  };
   
   /**
    * 上传文件是触发事件
    */
   $("#avatar-form").submit(function(){
   	$(this).ajaxSubmit(uploadOptions);
   	return false;
   });
   
   </script>
<script type="text/javascript">	
$(document).ready(function() {
	
	$('#raceStartTime').datetimepicker({
	    format: 'yyyy-mm-dd hh:ii'
	});
	$('#raceEndTime').datetimepicker({
	    format: 'yyyy-mm-dd hh:ii'
	});
	$('#stageStartTime').datetimepicker({
	    format: 'yyyy-mm-dd hh:ii'
	});
	$('#stageEndTime').datetimepicker({
	    format: 'yyyy-mm-dd hh:ii'
	});
});
</script>
</body>
</html>