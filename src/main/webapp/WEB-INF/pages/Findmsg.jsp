<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>流水明细</title>
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
    </style>
</head>
<body style="overflow: scroll;">

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
    <!--导航栏-->
    <div class="row">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <!-- 定义汉堡按钮 -->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">首页</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">

                        <li><a href="/bank/query">查询余额</a></li>
                        <li><a href="/pages/gotoDeposit">存入现金</a></li>
                        <li><a href="/pages/gotoWithdrawals">取出现金</a></li>
                        <li><a href="/pages/gotoTransfer">同行转账</a></li>
                        <li><a href="/bank/findMsg">流水明细</a></li>


                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

    </div>
</header>
<!--查询明细-->
<div class="container" style="height: 1200px;">
    <h3 style="text-align: center">操作明细</h3>
    <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th>交易操作</th>
            <th>交易金额</th>
            <th>交易时间</th>
        </tr>
        <c:forEach items="${logs}" var="item">
            <tr >
                <td>${item.operated}</td>
                <td>${item.balance}</td>
                <td>${item.times}</td>
            </tr>
        </c:forEach>


    </table>
</div>
<!-- 3.页脚部分-->
<footer class="footer">
    <div class="row">
        <img src="${pageContext.request.contextPath}/img/footer_service.png" class="img-responsive">
    </div>
    <div class="row company">
        中国阿伟银行有限公司 版权所有Copyright 2006-2018, All Rights Reserved 苏ICP备8888888
    </div>
</footer>

</body>
</html>