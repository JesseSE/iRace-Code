<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!--    网站标题、选择菜单、搜索框模块-->
	<div class="header-bottom">
	    <div class="wrap">
			<div class="header-bottom-left">
<!--                网站标题logo-->
				<div class="logo">
					<a href="<%=request.getContextPath() %>"><img src="<%=request.getContextPath() %>/public/images/logo1.png" alt=""/></a>
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
	
	
	