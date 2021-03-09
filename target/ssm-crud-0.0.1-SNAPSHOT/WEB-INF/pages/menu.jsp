<%--
  Created by IntelliJ IDEA.
  User: 松鼠松鼠快快跑
  Date: 2020/8/20
  Time: 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap HelloWorld</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">


    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        .title{
            text-align: center;
            height: 30px;
            background-color: #F2F2F2;
        }
        .tit{
            height: 20px;
        }
        .paddtop{
            padding-top: 10px;
        }
        .search-btn{
            float: left;
            border:1px solid #ffc900;
            width: 95px;
            height: 35px;
            background-color:#ffc900 ;
            text-align: center;
            line-height: 35px;
            margin-top: 35px;
        }

        .search-input{
            float: left;
            border:2px solid #ffc900;
            width: 400px;
            height: 35px;
            padding-left: 5px;
            margin-left: 50px;
            margin-top: 35px;
        }
        .jx{
            border-bottom: 2px solid #ffc900;
            padding: 5px;
        }
        .company{
            height: 40px;
            background-color: #ffc900;
            text-align: center;
            line-height:40px ;
            font-size: 8px;
        }
        /*投资*/
        .investment{
            text-align: center;
        }
        .btn{
            background-color: orange;
            margin: auto;
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
        <div class="col-md-8">
            <input class="search-input" placeholder="请输入关键字">
            <a class="search-btn" href="#">搜索</a>
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

                        <li><a href="/Bank/query">查询余额</a></li>
                        <li><a href="deposit.jsp">存入现金</a></li>
                        <li><a href="withdrawals.jsp">取出现金</a></li>
                        <li><a href="transfer.jsp">同行转账</a></li>
                        <li><a href="/Bank/find">流水明细</a></li>


                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

    </div>

    <!--轮播图-->
    <div class="row">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="${pageContext.request.contextPath}/img/lb1.jpg" alt="...">
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/img/lb2.jpg" alt="...">
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/img/lb3.jpg" alt="...">
                </div>

            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

</header>
<!-- 2.主体部分-->
<div class="container">
    <div class="row jx">
        <img src="${pageContext.request.contextPath}/img/icon_5.jpg">
        <span>投资理财</span>
    </div>

    <div class="row paddtop">
        <div class="col-md-3">
            <div class="investment thumbnail">
                <h3>基金</h3>
                <p>  工银智远配置(FOF)（008144）
                <h5>近1个月涨幅</h5>
                <h1 style="color: red">0.8071%</h1>
                <h6>数据日期（2020-08-14）</h6>
                <h4>推荐理由：智慧选基，远见未来</h4>
                </p>
                <input type="button" value="立即抢购" class="btn">
            </div>
        </div>
        <div class="col-md-3">
            <div class=" investment thumbnail">
                <h3>外汇</h3>
                <p>
                <h4>个人购汇额度每年等值</h4>
                <h1 style="color: red">50,000$</h1>
                <h6>购汇汇率当日实时牌价</h6>
                <h4 style="color: red">523.3$</h4>
                <h6>数据日期（2020-08-14）</h6></p>
                <input type="button" value="立即抢购" class="btn">
            </div>

        </div>
        <div class="col-md-3">

            <div class=" investment thumbnail">
                <h3>贵金属</h3>
                <p>
                <h5>交易成本低，资金实时清算</h5>
                <h4>2020熊猫金币</h4>
                <h6>整套收藏只需</h6>
                <h1 style="color: red">6,958,00¥</h1>
                <h5>联动金价，收藏精品</h5>
                </p>
                <input type="button" value="立即抢购" class="btn">
            </div>
        </div>
        <div class="col-md-3">

            <div class="investment thumbnail">
                <h3>理财</h3>
                <p> 个人增享180天
                    业绩比较基准
                <h1 style="color: red">3.40%</h1>
                <h6>数据日期（2020-08-14）</h6>
                <h5>投资期限最短 180 天</h5>
                <h5>起购金额 5 万</h5></p>
                <input type="button" value="立即抢购" class="btn">
            </div>
        </div>


    </div>
    <div class="row jx">
        <img src="${pageContext.request.contextPath}/img/icon_6.jpg">
        <span>外汇业务</span>

    </div>
    <!--    广告-->
    <div class="row paddtop">
        <div class="col-md-4">
            <img src="${pageContext.request.contextPath}/img/guanggao.png">
        </div>
        <div class="col-md-8">
            <div class="row">
                <!--外汇业务-->
                <div class="col-md-2">
                    <div><img src="${pageContext.request.contextPath}/img/timg1.jpg" alt=""></div>
                </div>
                <div class="col-md-2">
                    <div>
                        <p>个人结汇</p>
                        <input type="button" value="立即交易">
                    </div>
                </div>



                <div class="col-md-2">
                    <div><img src="${pageContext.request.contextPath}/img/timg2.jpg" alt=""></div>
                </div>
                <div class="col-md-2">
                    <div>
                        <p>个人购汇</p>
                        <input type="button" value="立即交易">
                    </div>
                </div>


                <div class="col-md-2">
                    <div><img src="${pageContext.request.contextPath}/img/timg3.jpg" alt=""></div>
                </div>
                <div class="col-md-2">
                    <div>
                        <p>银行速汇</p>
                        <input type="button" value="立即交易">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-2">
                    <div><img src="${pageContext.request.contextPath}/img/timg4.jpg" alt=""></div>
                </div>
                <div class="col-md-2">
                    <div>
                        <p>汇款直通车</p>
                        <input type="button" value="立即交易">
                    </div>
                </div>


                <div class="col-md-2">
                    <div><img src="${pageContext.request.contextPath}/img/timg5.jpg" alt=""></div>
                </div>
                <div class="col-md-2">
                    <div>
                        <p>"汇财通"外汇理财</p>
                        <input type="button" value="立即交易">
                    </div>
                </div>


                <div class="col-md-2">
                    <div><img src="${pageContext.request.contextPath}/img/timg6.jpg" alt=""></div>
                </div>
                <div class="col-md-2">
                    <div>
                        <p>"汇市通"外汇买卖</p>
                        <input type="button" value="立即交易">
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- 3.页脚部分-->
<footer class="container-fluid">
    <div class="row">
        <img src="${pageContext.request.contextPath}/img/footer_service.png" class="img-responsive">
    </div>
    <div class="row company">
        中国阿伟银行有限公司 版权所有Copyright 2006-2018, All Rights Reserved 苏ICP备8888888
    </div>

</footer>


</body>
</html>
