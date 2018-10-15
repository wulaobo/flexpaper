<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title>文件上传</title>
		<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/base.css" />
		<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/page.css"/>
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
		<script src="${ pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
		<script src="${ pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<script>
			function uploadFile() {
				var myselect = document.getElementById("fileaction");
				var index = myselect.selectedIndex;
				var value = myselect.options[index].value;
				document.getElementById("loginform").setAttribute('action',value);
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
							<h1>文件 <small>上传</small></h1>
							<h3 class="updatatip">上传视频时,文件过大,请勿重复提交!</h3>
						</div>
						<!--发布项目到index.html列表-->
						<div class="sendObject center-block text-center">
							<form id="loginform" class="form-horizontal" method="post" enctype="multipart/form-data">
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">标题</label>
							    <div class="col-sm-10">
							      <input type="text" name="title" class="form-control" id="inputEmail3" placeholder="标题">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">作者</label>
							    <div class="col-sm-10">
							      <input type="text" name="author" class="form-control" id="inputPassword3" placeholder="作者">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">上传至</label>
							    <div class="col-sm-10">
							    	<select id="fileaction" onclick="uploadFile()" class="form-control" >
							    		<option value="${pageContext.request.contextPath}/keChengFileAction_upload.action">课程简介</option>
							    		<option value="${pageContext.request.contextPath}/jiaoXueFileAction_upload">教学大纲</option>
							    		<option value="${pageContext.request.contextPath}/shouKeFileAction_upload">授课教案</option>
							    		<option value="${pageContext.request.contextPath}/shiYanFileAction_upload">实验指导</option>
							    		<option value="${pageContext.request.contextPath}/xiTiFileAction_upload">习题</option>
										<option value="${pageContext.request.contextPath}/fileUpLoadAction_upload">教学视频</option>
							    		<option value="${pageContext.request.contextPath}/shiJuanFileAction_upload">试卷与答案</option>
							    		<option value="${pageContext.request.contextPath}/xiaoGuoFileAction_upload">教学效果</option>
							    		<option value="${pageContext.request.contextPath}/canKaoFileAction_upload">参考文献</option>
							    	</select>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">文件</label>
							    <div class="col-sm-10">
							      <!--<input type="file"  id="inputPassword3" placeholder="图片">-->
							      	 <input type="file" id="chooseImage" name="upload">
							    </div>
							  </div>
							  <div class="form-group">
							    <div class="col-sm-offset-2 col-sm-10">
							      <button type="submit" class="btn btn-default updatabtn" alt="">上传</button>
									<%--<button id="inputtip" type="button" class="inputtip"></button>--%>

							    </div>
							  </div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
<!--<script type="text/javascript">
	 $('#chooseImage').on('change',function(){  
        var filePath = $(this).val(),         //获取到input的value，里面是文件的路径  
            fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase(),  
            src = window.URL.createObjectURL(this.files[0]); //转成可以在本地预览的格式  
              
        // 检查是否是图片  
        if( !fileFormat.match(/.png|.jpg|.jpeg/) ) {  
            error_prompt_alert('上传错误,文件格式必须为：png/jpg/jpeg');  
            return;    
        }  
    
        $('#cropedBigImg').attr('src',src);  
	});  
</script>-->