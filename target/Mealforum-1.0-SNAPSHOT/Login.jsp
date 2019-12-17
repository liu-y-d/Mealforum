<%--
  Created by IntelliJ IDEA.
  User: 刘云达
  Date: 2019/8/7
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <%--CSS--%>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="static/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/css/form-elements.css">
    <link rel="stylesheet" href="static/css/style.css">

</head>
<body style="background-color: #99CCFF">

<!-- 顶端标题 -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>膳食·家论坛</strong> Meal·home Forum</h1>
                    <div class="description">
                        <p>
                            还在为不知道吃什么而发愁么？登录论坛看大家都在吃什么！
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>登录论坛</h3>
                            <p>输入你的账户名和密码：</p>
                        </div>

                    </div>
                    <div class="form-bottom">
                        <form role="form" action="user/Login" method="post" class="login-form">
                            <div class="form-group">
                                <label class="sr-only" for="form-username">账户名</label>
                                <input type="text" name="userName" placeholder="Username..."
                                       class="form-username form-control" id="form-username">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="form-password">密码</label>
                                <input type="password" name="userPwd" placeholder="Password..."
                                       class="form-password form-control" id="form-password">
                            </div>
                            <button type="submit" class="btn">登录</button>
                        </form>
                        <form role="form" action="/user/toRegistUserInfo" method="post" class="login-form">
                            <button type="submit" class="btn" style="background-color: #2aabd2">注册</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
<%--JavaScript--%>
<script src="static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="static/js/scripts.js"></script>
<script src="static/js/jquery.backstretch.min.js"></script>
<!--[if lt IE 10]>
<script src="static/js/placeholder.js"></script>
<![endif]-->
</html>
