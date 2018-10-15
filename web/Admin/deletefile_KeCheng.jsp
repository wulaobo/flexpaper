<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title>删除文件</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/base.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/page.css" />
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
		<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/admin.js" type="text/javascript" charset="utf-8"></script>

		<script>
            function del(id) {
            location.href="${pageContext.request.contextPath}/keChengFileAction_deleteKeChengFileById?id="+id;
            }
		</script>
	</head>

	<body>
		<!--欢迎页面-->
		<div class="welcomewrap">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 text-center">
						<!--右侧下面部分-->
						<!--页头-->
						<div class="page-header">
							<h1>删除 <small>文件</small></h1>
						</div>
						<div class="bs-example" data-example-id="bordered-table">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">序列号</th>

										<th class="col-lg-7 col-md-7 col-sm-7 col-xs-8">文件名称</th>
											<th class="col-lg-1">作者</th>
										<th class="col-lg-2">时间</th>
										<th class="col-lg-1">删除</th>
									</tr>
								</thead>
								<tbody>
								<s:iterator value="#session.listhou" id="File" status="status">
									<tr>
										<%--<input type="hidden" value="<s:property value="#File.id"></s:property>">--%>
										<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1" scope="row"><s:property value='#status.index+1'/> </th>
										<td class="col-lg-7 col-md-7 col-sm-7 col-xs-8"><s:property value="#File.title"></s:property></td>
											<td class="col-lg-1  col-md-1 col-sm-1 col-xs-1"><s:property value="#File.author"></s:property></td>
										<td class="col-lg-2"><s:property value="#File.date"></s:property></td>
										<td class="col-lg-1"><button type="button" onclick=" del('<s:property value="#File.id"></s:property>')" class="btn btn-danger">删除</button></td>
									</tr>
								</s:iterator>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>