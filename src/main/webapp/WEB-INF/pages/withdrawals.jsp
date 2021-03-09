<%--
  Created by IntelliJ IDEA.
  User: 松鼠松鼠快快跑
  Date: 2020/8/27
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>取款首页</title>
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

        .Menu{
            width: 900px;
            height: 450px;
            margin: auto;
            /*background-image: url("image/rg_layout.jpg") ;*/
        }
        #btn{
            border:1px solid #ffc900;
            width: 80px;
            height: 40px;
            text-align: center;
            line-height: 35px;
            margin-top: 35px;
            border-radius:5px;
        }
        .company{
            height: 40px;
            background-color: #ffc900;
            text-align: center;
            line-height:40px ;
            font-size: 8px;
        }
        .withdrawMenu{
            text-align: center;
            margin-top: 150px;
        }

        #wel_title{
            margin-top: 30px;
        }
        /*输入框属性*/
        #balance{
            width: 250px;
            height: 42px;
            border: 1px solid #A6A6A6;
            /*边框圆角*/
            border-radius:5px;
            /*边框内部提示文字与边框距离*/
            padding-left: 10px;
        }
        #floater{
            margin-top: 30px;
        }
        .footer{
            position:fixed;

            bottom:0;

            left:0;
        }
        .msg{
            position: absolute;
            width: 400px;
            height: 40px;
            text-align: center;
            line-height: 40px;
            font-size: 20px;
            left: 550px;
            top: 430px;
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
<!--存款操作-->
<div class="Menu" id="floater">
    <div class="withdrawMenu" id="content">
        <form method="post" action="${pageContext.request.contextPath}/bank/withdrawals">
            <input type="text" id="balance" name="balance" placeholder="请输入您要取出的金额" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">
            <input type="submit" id="btn" value="确定">
        </form>
    </div>
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
<%--提示信息--%>
<div class="msg">
    ${res}
</div>

</body>
</html>
