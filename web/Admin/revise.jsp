<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title>文件上传</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/base.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/page.css"/>
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
		<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<%--<script type="text/javascript">--%>
			<%--$("#updateUsersubmit").click(function () {--%>
				<%--alert('修改密码');--%>
            <%--});--%>
		<%--</script>--%>
	</head>

	<body>
		<!--基本信息-->
		<div class="welcomewrap revisewrap">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 text-center">
						<!--右侧下面部分-->
						<!--页头-->
						<div class="page-header">
							<h1>修改 <small>基本信息</small></h1>
						</div>
						<!--发布项目到index.html列表-->
						<div class="sendObject text-center center-block">
							<form id="updateUserform" class="form-horizontal" action="" method="post">
							  <div class="form-group">
							    <label for="username" class="col-sm-2 control-label">用户名</label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control"  id="username" placeholder="用户名">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
							    <div class="col-sm-10">
							      <input type="password" class="form-control"  id="password" placeholder="密码">
							    </div>
							  </div>
							   <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
							    <div class="col-sm-10">
							      <input type="password" class="form-control" name="repassword" id="inputPassword3" placeholder="确认密码">
									<button id="inputtip" type="button" class="inputtip"></button>
									<script type="text/javascript">
										$("#inputtip").click(function () {
											parent.location.href="${pageContext.request.contextPath}/Admin/login.jsp";
                                        });
									</script>
							    </div>
							  </div>
							  <div class="form-group">
							    <div class="col-sm-offset-2 col-sm-10">
							      <button id="updateUsersubmit" type="button" class="btn btn-default">确定</button>
							    </div>
							  </div>
							</form>
							<script type="text/javascript">
								$('#updateUsersubmit').on('click',function () {
									if( $('#password').val() == $('#inputPassword3').val() ){
									    var name = $('#username').val();
									    var pwd = $('#password').val();
                                        $.post(  "${ pageContext.request.contextPath }/userAction_updateUser" ,{username:name,password:pwd}, function (data) {
											if(data == "1"){
											    $('.inputtip').html("修改成功,请重新登录");
											}else {
                                                $('.inputtip').html("修改失败");
											}
										})
									}else {
									    alert('两次密码不一致,请重新输入')
									}
                                });

							</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>
