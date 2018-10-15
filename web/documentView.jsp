<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String swfFilePath = session.getAttribute("swfpath").toString();
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

        #flashContent {
            display: none;
        }
    </style>
    <title>文档在线预览</title>
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
         <s:iterator value="#session.listPreview" id="File">
        <div class="top-index">
            <p>
                <span>当前位置 ：</span>
                <span><strong><s:property value="#File.title"></s:property></strong></span>
            </p>
        </div>
        <div class="contents">
            <%--title--%>
            <div class="file-title text-center">
                <h3><s:property value="#File.title"></s:property></h3>
                <p>
                    <span>作者: <strong><s:property value="#File.author"></s:property></strong></span>
                    <span> | </span>
                    <span>时间: <strong><s:property value="#File.date"></s:property></strong></span>
                </p>
            </div>
                </s:iterator>


            <div class="filedis">
                <a id="viewerPlaceHolder" style="width: 100%; height:560px;max-height: 600px; display: block"></a>
                <script type="text/javascript">
                    var fp = new FlexPaperViewer(
                        'FlexPaperViewer',
                        'viewerPlaceHolder', { config : {
                            SwfFile : escape('<%=swfFilePath%>'),//编码设置
                            Scale : 0.6,
                            ZoomTransition : 'easeOut',//变焦过渡
                            ZoomTime : 0.5,
                            ZoomInterval : 0.2,//缩放滑块-移动的缩放基础[工具栏]
                            FitPageOnLoad : true,//自适应页面
                            FitWidthOnLoad : true,//自适应宽度
                            FullScreenAsMaxWindow : false,//全屏按钮-新页面全屏[工具栏]
                            ProgressiveLoading : false,//分割加载
                            MinZoomSize : 0.2,//最小缩放
                            MaxZoomSize : 3,//最大缩放
                            SearchMatchAll : true,
                            InitViewMode : 'Portrait',//初始显示模式(SinglePage,TwoPage,Portrait)

                            ViewModeToolsVisible : true,//显示模式工具栏是否显示
                            ZoomToolsVisible : true,//缩放工具栏是否显示
                            NavToolsVisible : true,//跳页工具栏
                            CursorToolsVisible : false,
                            SearchToolsVisible : true,
                            PrintPaperAsBitmap:false,
                            localeChain: 'en_US'
                        }});
                </script>
            </div>
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
