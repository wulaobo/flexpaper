<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println(basePath);
	String newfile= (String) request.getAttribute("path");
	System.out.println(newfile);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,user-scalable=0,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/base.css"/>
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/mian.css" />
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
	<script src="${ pageContext.request.contextPath }/js/main.js" type="text/javascript" charset="utf-8"></script>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery.js"></script>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/flexpaper_flash.js"></script>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/js/flexpaper_flash_debug.js"></script>
	<style type="text/css" media="screen">
		html,body {
			height: 100%;
		}

		body {
			margin: 0;
			padding: 0;
			overflow: auto;
		}
		.contents {
			text-align: center;
		}
		.videotoggle {
			margin-top:20px;

		}
		#flashContent {
			display: none;
		}
	</style>
	<title>教学视频</title>
	<script language="javascript">
        window.opener.document.location.reload();
	</script>
</head>
<body>
<!--top-->
<div class="header wp-wrapper">
	<div class="wp-inner clearfix">
		<!--logo-->
		<div class="logo-panel panel-1" frag="面板1">
			<a class="site-url" href="index.jsp">
				<img class="site-logo" src="${ pageContext.request.contextPath }/img/logo.png">
			</a>
		</div>
		<!--headline-->
		<div class="headline-panel panel-2" frag="面板1">
			<img src="${ pageContext.request.contextPath }/img/headlogin.png"/>
		</div>
	</div>
</div>
<!--导航-->
<div class="wp-wrapper wp-nav">
	<div class="wp-inner clearfix">
		<!--导航-->
		<div class="main-nav-panel">
			<ul class="clearfix">
				<li class="border-first"><a class="menu-link" href="${ pageContext.request.contextPath }/index.jsp">网站首页</a></li>
				<li><a class="menu-link" href="${ pageContext.request.contextPath }/keChengFileAction_findAllKeChengFile">课程简介</a></li>
				<li><a class="menu-link" href="${ pageContext.request.contextPath }/jiaoXueFileAction_findAll">教学大纲</a></li>
				<li><a class="menu-link" href="${ pageContext.request.contextPath }/shouKeFileAction_findAll">授课教案</a></li>
				<li><a class="menu-link" href="${ pageContext.request.contextPath }/shiYanFileAction_findAll">实验指导</a></li>
				<li><a class="menu-link" href="${ pageContext.request.contextPath }/xiTiFileAction_findAll">习题</a></li>
				<li><a class="menu-link" href="${ pageContext.request.contextPath }/fileUpLoadAction_findAll">教学视频</a></li>
				<li><a class="menu-link" href="${ pageContext.request.contextPath }/shiJuanFileAction_findAll">试卷及答案</a></li>
				<li><a class="menu-link" href="${ pageContext.request.contextPath }/xiaoGuoFileAction_findAll">教学效果</a></li>
				<li class=" border-last"><a class="menu-link" href="${ pageContext.request.contextPath }/canKaoFileAction_findAllCanKaoFile">参考文献</a></li>
			</ul>
		</div>
	</div>
</div>


<div class="wp-wrapper wp-nav">
	<div class="wp-inner clearfix">
		<div class="container clearfix">
			<div class="fuye-container">
				<!--副业内容-->
				<div class="top-index">
					<p>
						<span>当前位置 ：</span>
						<span>教学视频</span>
					</p>
				</div>
				<div class="contents">
					<object type="application/x-shockwave-flash" data="tools/vcastr3.swf"
						width="600px" height="500px" id="vcastr3" class="videotoggle">
						<param name="movie" value="tools/vcastr3.swf" />
						<param name="allowFullScreen" value="true" />
						<param name="FlashVars"
							value="xml=
				<vcastr>
				<channel>
				<item>
				<source><%=basePath+"upload/"+newfile+".flv" %></source>
				</item>
				</channel>
				</vcastr>" />
					</object>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="wp-wrapper wp-footer">
	<div class="wp-inner">
		<div class="footer">
			<div class="footer-name">
				<h3>	 巢湖学院<span>www.chu.edu.cn</span></h3>
			</div>
			<div class="footer-info">
				<p>
							<span>2011-2018</sapn>
								<span>皖ICP备案020533号</span></span>
					<span>地址 ：安徽省合肥市巢湖半汤度假区</span>
					<span>邮编 ：238000 </span>
				</p>
			</div>
		</div>
	</div>
</div>

</body>
</html>