<%--
  Created by IntelliJ IDEA.
  User: 刘云达
  Date: 2019/8/9
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>个人主页</title>
    <link rel="stylesheet" type="text/css" href="../../static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="/static/css/lydStyle.css">
</head>
<body style="background-color: #99CCFF">
<nav class="navbar navbar-default" style="border:1px solid transparent;">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/user/toMain">膳食·家论坛</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <%--<ol class="breadcrumb">--%>
            <%--<li><a href="#">主页</a></li>--%>
            <%--<li><a href="#">个人主页</a></li>--%>
            <%--</ol>--%>
            <form class="navbar-form navbar-right">
            </form>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="row">
    <div class="col-md-12">
        <div class="thumbnail" style="text-align: center;">
            <form:form modelAttribute="userInfo" action="updateUserInfo" method="post" enctype="multipart/form-data">
                <form:hidden path="id"/>
                <img src="${userInfo.img}" class="imgStyle"/>
                <div class="caption">
                    <h4>用户姓名:<form:input path="userName"/></h4>
                    <h4>用户密码:<form:input path="userPwd"/></h4>
                    <h4>上传头像：<form:input type="file" path="file"/></h4>
                </div>
                <button type="submit" class="btn btn-default">确定</button>
            </form:form>
        </div>
    </div>
</div>
</body>
<script src="/static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
<script src="/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</html>
