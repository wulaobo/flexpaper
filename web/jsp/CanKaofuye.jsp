<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,user-scalable=0,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>参考文献</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/base.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mian.css" />
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
		<script src="${pageContext.request.contextPath }/js/main.js" type="text/javascript" charset="utf-8"></script>

		<script>
//            window.opener.document.location.reload();
            <%--function del(id) {--%>
                <%--location.href="${pageContext.request.contextPath}/keChengFileAction_deleteKeChengFileById?id="+id;--%>
            <%--}--%>
            function preview(swfpath,id1) {
                var path="upload/"+swfpath;
                window.open("${pageContext.request.contextPath}/canKaoFileAction_preview?path="+path+"id1="+id1);
            }
		</script>
	</head>
	<body>
		<!--top-->
		<div class="header wp-wrapper">
			<div class="wp-inner clearfix">
				<!--logo-->
				 <div class="logo-panel panel-1" frag="面板1">
					<a class="site-url" href="${pageContext.request.contextPath }/index.jsp">
						<img class="site-logo" src="${pageContext.request.contextPath }/img/logo.png">
					</a>
    			</div>
    			<!--headline-->
    			<div class="headline-panel panel-2" frag="面板1">
    				<img src="${pageContext.request.contextPath }/img/headlogin.png"/>
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
						<li class=" border-last"><a class="menu-link" href="">参考文献</a></li>
					</ul>
				</div>
			</div>
		</div>

		<!--主体内容-->
		<div class="wp-wrapper wp-container">
			<div class="wp-inner clearfix">
				<div class="container clearfix">
					<div class="fuye-container">
						<!--副业内容-->
						<div class="top-index">
							<p>
								<span>当前位置 ：</span>
								<span>参考文献</span>
							</p>
						</div>
						<div class="contents">
							<div class="content-right">
								<ul>

									<s:iterator value="#session.list" id="File">
										<li>
											<a href="" > <img class="indexpic" src="${pageContext.request.contextPath}/img/shiyan.png"/>
												<span class="title" onclick=" preview('<s:property value="#File.uploadFileName"></s:property>','<s:property value="#File.id"/>')"><s:property value="#File.title"></s:property></span></a>
											<%--<span class="user">(<i>${loginUser.username}</i>)</span>--%>
											<%--<button value="" onclick=" del('<s:property value="#File.id"></s:property>')">删除</button>--%>
												<%--<button value="" onclick=" preview('<s:property value="#File.uploadFileName"></s:property>')">预览</button>--%>
											<span class="time">
											(<a href=""><s:property value="#File.author"/></a>&nbsp;&nbsp;
											<a href=""><s:property value="#File.date"/></a>)
										</span>
										</li>
									</s:iterator>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--底部-->
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
