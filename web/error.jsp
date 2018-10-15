<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/11 0011
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2><s:actionerror/></h2>
<h2><s:fielderror/></h2>
<h3>操作失败,请重新操作(上传文件时doc文档的标题例如 张三.doc 尽量改成英文 zhangsan.doc ,上传的文档中尽量不要带图片,带图片也可能导致文件上传失败.)</h3>
</body>
</html>
