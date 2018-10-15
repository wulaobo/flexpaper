<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/10 0010
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,user-scalable=0,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>数字电视</title>
    <link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/base.css"/>
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/mian.css" />

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <%--<![endif]-->--%>
    <script src="${ pageContext.request.contextPath }/js/main.js" type="text/javascript" charset="utf-8"></script>
    <script src="${ pageContext.request.contextPath }/js/jquery-1.8.3.js" type="text/javascript"></script>
    <style type="text/css">
        body,
        html {
            position: relative;
            height: 100%;
            width: 100%;
            overflow: hidden;
            /*background: #fff;*/
        }
        .loginBg {
            width: 400px;
            height: 360px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin-left: -200px;
            margin-top:-180px ;
            z-index: 1000;
            border: 1px solid #1455AD;
            border-radius: 10px;
            box-shadow: 1px 1px 5px #0d5994;
        }
        .login {
            padding: 30px;
        }
        .login h3 {
            text-align: center;
            padding: 20px;
        }
        .login div {
            margin: 20px;
            line-height: 30px;
        }
        .login label {
            display: inline-block;
            width: 80px;
            text-align: right;
        }
        .login input {
            width: 70%;
            height: 30px;
            max-width: 200px;
            overflow: hidden;
            line-height: 30px
        }
        input.input-login {
            text-align: center;
            font-size: 16px;
            line-height: 30px;
            background-color: #2475b4;
            color: #FFFFFF;
            font-weight: 600;
            letter-spacing: 5px;
            border: none;
            border-radius: 10px;
        }
        .login .btn-login {
            text-align: center;
        }
        .login .btn-login  button {
            line-height: 30px;
            background-color: #2475b4;
            color: #FFFFFF;
            font-weight: 400;
            letter-spacing: 5px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            width:70%;
            display: inline-block;
            padding: 6px 12px;
            margin-bottom: 0;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
         }
        img.yanzhnegimg {
            display: inline-block;
            width:85px;
            height:34px;
            overflow: hidden;
        }
        input.yanzhenginput {
            width:50%;
            max-width:110px;
        }
        .errortip a ul li  span {
            color: red;
            font-weight: 700;
        }
        .bth-login {
            font-size: 14px;
            color: #808080;
        }
        .bth-login:hover{
            color: #000;
            text-decoration: dashed;
        }
    </style>
</head>
<body>

<div class="wp-inner clearfix">
    <!--logo-->
    <div class="logo-panel panel-1" frag="面板1">
        <a class="site-url" >
            <img class="site-logo" src="${ pageContext.request.contextPath }/img/logo.png">
        </a>
    </div>
    <!--headline-->
    <div class="headline-panel panel-2" frag="面板1">
        <img style="height: auto;" src="${ pageContext.request.contextPath }/img/headlogin.png">
    </div>
</div>

<div class="loginBg">
    <div class="login">
        <form id="findPasswordForm" action="" method="post">
            <h3>找回密码</h3>
            <div class="name">
                <label for="">用户名:</label>
                <input type="text" id="username" />
            </div>
            <div class="yanzheng">
                <label for="">验证码:</label>
                <input class="yanzhenginput" type="text" id="validate"/>
                <img class="yanzhnegimg" id="loginform:vCode" src="${pageContext.request.contextPath }/Admin/validatecode.jsp"
                     onclick="javascript:document.getElementById('loginform:vCode').src='${pageContext.request.contextPath }/Admin/validatecode.jsp?'+Math.random();" />
            </div>
            <div class="btn-login">

                <button class="input-login" id="zhaoHuiButton" type="button" value="">找回</button>


            </div>

            <div>
                <span class="right"><a class="bth-login" href="${pageContext.request.contextPath }/Admin/login.jsp">返回登录页面</a></span>
            </div>
        </form>
        <div class="errortip">
            <a  align="center" ><s:actionerror /></a>
        </div>
    </div>

    <script type="text/javascript">
//        $('#zhaoHuiButton').on('click',function () {
//            alert('水电费');
//        });
        $("#zhaoHuiButton").click(function () {
//            alert("aaa");
            var user = $("#username").val();
            var vali = $("#validate").val();
//            alert(username);
//            alert(validate);
             $.post("${ pageContext.request.contextPath }/userAction_findPassword",{username:user,validate:vali},function (data) {
                 alert(data);
             });
        });
    </script>
</div>

</body>
</html>

