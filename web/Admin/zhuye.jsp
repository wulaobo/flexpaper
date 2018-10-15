<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title>管理员页面</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/base.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/admin.css" />
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
		<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/admin.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<!--admin-->
		<div class="adminWrap">
			<!--右侧上面的个人信息-->
			<nav class="navbar navbar-default navbar-cls-top" role="navigation" style="margin-bottom: 0">
	            <div class="navbar-header">
	                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
	                    <span class="sr-only">Toggle navigation</span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                    <span class="icon-bar"></span>
	                </button>
                    <script>
						function logout() {
							location.href="${ pageContext.request.contextPath }/userAction_logout";
                        }
					</script>
	                <a onclick="logout()" class="navbar-brand pull-left">退出后台</a>
	            </div>
	
	            <div class="header-right">
	            	<ul>
	            		<li>
	            			<span class="m-r-sm text-muted welcome-message">您好，<strong>${loginUser.username}</strong></span>
	            		</li>
	            		<li>
	            			<a  href="${ pageContext.request.contextPath }/Admin/exit.jsp" class="btn btn-danger adminExit" target="myFrameName" title="Logout"><i class="fa fa-exclamation-circle fa-2x"></i></a>
	            		</li>
	            	</ul>
	            </div>
	        </nav>
			<!--左侧的导航栏-->
			<div class="navbar-default navbar-side">
				<div class="sidebar-collapse in">
					<ul class="nav">
						<li>
							<!--个人信息-->
							<div class="user-img-div">
	                            <img src="${pageContext.request.contextPath }/img/admin/xiaoxi.png" class="img-thumbnail">
	
	                            <div class="inner-text">
	                            	欢迎登陆
	                            </div>
	                        </div>
						</li>
						<!--欢迎页-->
						<li>
							<a href="${pageContext.request.contextPath }/Admin/welcome.jsp" target="myFrameName">
								欢迎页
							</a>
						</li>
						<!--文件上传-->
						<li>
							<a href="${pageContext.request.contextPath }/Admin/sendObject.jsp" target="myFrameName">
								文件上传
							</a>
						</li>
						<!--删除文件-->
						<li>

							<a href="javascript:;" class="" target="">
								删除文件
								<span class="caret pull-right"></span>
							</a>
							<ul class="nav-sec-toggle">
								<li>
									<a href="${pageContext.request.contextPath}/keChengFileAction_findAllHou" target="myFrameName">
										课程简介
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/jiaoXueFileAction_findAllHou" target="myFrameName">
										教学大纲
									</a>
								</li>
								<li><a href="${pageContext.request.contextPath}/shouKeFileAction_findAllHou" target="myFrameName">授课教案</a></li>
								<li><a href="${pageContext.request.contextPath}/shiYanFileAction_findAllHou" target="myFrameName">实验指导</a></li>
								<li><a href="${pageContext.request.contextPath}/xiTiFileAction_findAllHou" target="myFrameName">习题</a></li>
								<li><a href="${pageContext.request.contextPath}/fileUpLoadAction_findAllHou" target="myFrameName">教学视频</a></li>
								<li><a href="${pageContext.request.contextPath}/shiJuanFileAction_findAllHou" target="myFrameName">试卷与答案</a></li>
								<li><a href="${pageContext.request.contextPath}/xiaoGuoFileAction_findAllHou" target="myFrameName">教学效果</a></li>
								<li><a href="${pageContext.request.contextPath}/canKaoFileAction_findAllHou" target="myFrameName">参考文献</a></li>

							</ul>
						</li>
						<!--修改信息-->
						<li>
							<a href="${pageContext.request.contextPath }/Admin/revise.jsp" target="myFrameName">
								修改信息
							</a>
						</li>
					</ul>
				</div>
			</div>
			
			<!--右侧相对应的内容-->
			<div class="page-wrapper gray-bg clear">
				<div class="page-inner">
			        <!--其他页面框架-->
			        <iframe id="pageWellcome" name="myFrameName" src="${pageContext.request.contextPath }/Admin/welcome.jsp" width="100%" height="100%" frameborder="0" scrolling="yes" marginheight="0"	></iframe>
				</div>
			</div>
		</div>
	</body>
</html>
