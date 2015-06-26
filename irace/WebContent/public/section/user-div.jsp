<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
    .dropdown-btn
    {
    	width:100%;
    	height:100%;
    	background-color:rgba(0,0,0,0);
    	font-family:微软雅黑;
    }
    .dropdown-menu
    {
    	background-color:#99BBFF;
    }
</style>
    <div class="header-top">
    
    
<!--                网站标题logo-->
<%if(!request.getServletPath().equals("/index.jsp")){ %>
				<div class="logo">
					<a href="<%=request.getContextPath() %>"><img  style="height:30px;margin-top:5px;margin-left:60px;" src="<%=request.getContextPath() %>/public/images/logo_2.png" alt=""/></a>
				</div>
    <%} %>
    
	   <div class="wrap"> 
<!--           登录注册菜单模块-->
			<div class="cssmenu">
			<% if(session.getAttribute("uid") == null && session.getAttribute("oid") == null) { %>
				<ul>
					<li><a href="<%=request.getContextPath() %>/user/login">登录</a></li> |
					<li><a href="<%=request.getContextPath() %>/user/register">注册</a></li>
				</ul>
			<%} else {%>
			<% if(session.getAttribute("uid") != null) { %>	
				<ul>
                    <li><image src="<%=request.getContextPath() %>/public/images/message.png"></image></li> 
					<li><a href="<%=request.getContextPath() %>/user/usermsg">消息</a></li>
					<li><image src="<%=request.getContextPath() %>/public/images/userican.png"></image></li>
                    
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false"><%=session.getAttribute("nickname") %></a>
		                <ul class="dropdown-menu" role="menu">
							<div class="dropdown-header">dropdown header</div>
							<li>
								<a class="dropdown-btn" href="<%=request.getContextPath() %>/user/userCenter">个人中心</a>
								<a class="dropdown-btn" href="<%=request.getContextPath() %>/user/logout.act">退出登录</a>
							</li>
		                </ul>
                    </li>
				</ul>
				<%} else if(session.getAttribute("oid") != null){%>
				<ul>
                    <li><image src="<%=request.getContextPath() %>/public/images/message.png"></image></li> 
					<li><a href="#">消息</a></li>
					<li><image src="<%=request.getContextPath() %>/public/images/userican.png"></image></li>
                    
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false"><%=session.getAttribute("oname") %></a>
		                <ul class="dropdown-menu" role="menu">
							<div class="dropdown-header">dropdown header</div>
							<li>
								<a class="dropdown-btn" href="<%=request.getContextPath() %>/organizer/orgcenter">机构中心</a>
								<a class="dropdown-btn" href="<%=request.getContextPath() %>/user/logout.act">退出登录</a>
							</li>
		                </ul>
                    </li>
				</ul>
				<%} %>
			<%} %>
			</div>
			<div class="clear"></div>
 		</div>
	</div>