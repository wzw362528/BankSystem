<%--
  Created by IntelliJ IDEA.
  User: 松鼠松鼠快快跑
  Date: 2020/8/27
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: 松鼠松鼠快快跑
  Date: 2020/8/26
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>查询余额</title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        *{
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
        }
        div{
        }
        /*顶层标题*/
        .title{
            text-align: center;
            height: 20px;
            background-color: #F2F2F2;
        }
        /*第二行，带logo的div*/
        .paddtop{
            padding-top: 10px;

        }
        /*欢迎标语*/
        .welcome{
            text-align: center;
        }
        .company{
            height: 40px;
            background-color: #ffc900;
            text-align: center;
            line-height:40px ;
            font-size: 8px;
        }
        #wel_title{
            margin-top: 30px;
        }
        .footer{
            position:fixed;

            bottom:0;

            left:0;
        }
        .msg{
            position: absolute;
            width: 350px;
            height: 40px;
            text-align: center;
            line-height: 40px;
            font-size: 25px;
            left: 600px;
            top: 200px;
            color:yellowgreen;
        }
        .msg h1{
            color:yellowgreen;

        }
    </style>
</head>
<body>

<!-- 1.页眉部分-->
<header class="container-fluid">
    <!--    定时广告-->
    <div class="title row">
        <div class="tit">
            <span>本网站站支持IPv6</span>
        </div>
    </div>
    <!--    第二行logo图片-->
    <div class="row paddtop">

        <div class="col-md-2">
            <img src="${pageContext.request.contextPath}/img/logo.jpg" class="img-responsive">
        </div>

        <div class="col-md-8 welcome">
            <h1 style="color: #67b168" id="wel_title">欢迎光临阿伟银行</h1>
        </div>

        <div class="col-md-2">
            <a href="https://www.baidu.com" class="help">常见问题</a>
            <a href="https://www.baidu.com" class="help">联系我们</a>
        </div>

    </div>

</header>
<!-- 3.页脚部分-->
<footer class="footer">
    <div class="row">
        <img src="${pageContext.request.contextPath}/img/footer_service.png" class="img-responsive">
    </div>
    <div class="row company">
        中国阿伟银行有限公司 版权所有Copyright 2006-2018, All Rights Reserved 苏ICP备8888888
    </div>

</footer>
<%--页面提交后重定向后显示的提示信息--%>
<div class="msg">
    <h1>${res}</h1>
</div>

</body>
</html>

