<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,user-scalable=0,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>数字电视原理与应用</title>
		<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/base.css"/>
		<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/mian.css" />
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
		<script src="${ pageContext.request.contextPath }/js/main.js" type="text/javascript" charset="utf-8"></script>
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

		<!--主体内容-->
		<div class="wp-wrapper wp-container">
			<div class="wp-inner clearfix">
				<div class="container clearfix">
					<!--主体左侧-->
					<div class="mod_l left">
						<!--左侧上-->
						<div class="mod_l_top">
							<img src="${pageContext.request.contextPath}/img/left-top.jpg" alt="" />
						</div>
						<!--左侧下-->
						<div class="mod_l_bottom">
							<img src="${pageContext.request.contextPath}/img/left-to.jpg" alt="" />
						</div>
					</div>
					<!--主体中间-->
					<div class="mod_c left">
						<!--rtop-->
						<div class="mod_c_top">
							<p class="introduce">
								《数字电视原理与应用》是电子信息、电子科学与技术、广播电视工程、通讯技术等电子类专业的必修课。本课程涵盖数字电视信号的摄取，压缩编码技术及其标准，输入流复用技术，信道编码与调至传输，条件接收与显示技术等内容。对此，课程中做了清晰的描述。各章节均以应用为主的理论结合实际，数据详实，典例实力充分，对最新科技成果如三四融合、视频格式、移动电视等也适当的理论或实验补充。其理论课的主要内容适合电子类本科学生在72个学时左右学习，实验课适合在20个学时的教学。此外，本课程的授课教案等相关内容也合适对数字电视感兴趣的广大读者自学
							</p>
						</div>
						<div class="mod_c_bottom">
							<div class="books">
								<ul>
									<li><a href=""><img src="${ pageContext.request.contextPath }/img/book1.jpg" alt="" /></a></li>
									<li><a href=""><img src="${ pageContext.request.contextPath }/img/book2.jpg" alt="" /></a></li>
									<li><a href=""><img src="${ pageContext.request.contextPath }/img/book3.jpg" alt="" /></a></li>
									<li><a href=""><img src="${ pageContext.request.contextPath }/img/book4.jpg" alt="" /></a></li>
								</ul>
							</div>
							<div class="book_title clearfix">
								<h3>数字电视原理相关书籍</h3>
							</div>
						</div>
					</div>
					<!--主体右侧-->
					<div class="mod-r right">
						<div class="mod_r_panel panel_r_01">
							<div class="title">
								<h3>网络课堂</h3>
								<p class="titleSite">
									<span><a href="">课堂录像</a></span>
									<span><a href="">专题讲座</a></span>
								</p>
								<a class="titlePic" href="">
									<img src="${ pageContext.request.contextPath }/img/couse.png" alt="" />
								</a>
							</div>
						</div>
						<div class="mod_r_panel panel_r_02">
							<div class="title">
								<h3>师生交流</h3>
								<p class="titleSite">
									<span><a href="">作业习题</a></span>
									<span><a href="">疑难解答</a></span>
								</p>
								<a class="titlePic" href="">
									<img src="${ pageContext.request.contextPath }/img/communtion.png" alt="" />
								</a>
							</div>
						</div>
						<div class="mod_r_panel panel_r_03">
							<div class="title">
								<h3>网络资源</h3>
								<p class="titleSite">
									<span><a href="">电子教案</a></span>
									<span><a href="">视频动画</a></span>
								</p>
								<a class="titlePic" href="">
									<img src="${ pageContext.request.contextPath }/img/souce.png" alt="" />
								</a>
							</div>
						</div>
						<div class="mod_r_panel panel_r_04">
							<div class="title">
								<h3>综合实验</h3>
								<p class="titleSite">
									<span><a href="">实验教案</a></span>
									<span><a href="">精彩范例</a></span>
								</p>
								<a class="titlePic" href="">
									<img src="${ pageContext.request.contextPath }/img/souce.png" alt="" />
								</a>
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
