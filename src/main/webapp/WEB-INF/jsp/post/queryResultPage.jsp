<%--
  Created by IntelliJ IDEA.
  User: 刘云达
  Date: 2019/12/8
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的帖子</title>
    <script src="/static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="/static/css/lydStyle.css">
    <link rel="stylesheet" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>
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

            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#">${userInfo.userName}</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">个人中心 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/user/toHomePage?id=${userInfo.id}">个人信息</a></li>
                        <li>
                            <a href="${pageContext.request.contextPath}/user/toMyCollectPage?userId=${userInfo.id}">我的收藏</a>
                        </li>
                        <li><a href="/user/queryPostInfo?createUserId=${userInfo.id}">我的帖子</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="row">
    <c:forEach var="postInfo" items="${postInfos}">
        <div style="text-align: center;">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="thumbnail">
                    <img src="图片的url地址" alt="图片XX"
                         onerror="this.src='/static/img/backgrounds/meal.jpg;this.οnerrοr=null'"/>
                    <div class="caption">
                        <h3><a id="postid" href="/user/PostDetailPage?id=${postInfo.id}">${postInfo.title}</a></h3>
                        <p style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">${postInfo.markdownContent}</p>
                        <p>
                            <button id="collect" type="button" class="btn btn-default btn-lg"
                                    onclick="collectFunction(${postInfo.id},${userInfo.id})">
                                <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 收藏
                            </button>
                            <button id="like" type="button" class="btn btn-default btn-lg" onclick="likeFunction(${postInfo.id},${userInfo.id})">
                                <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 点赞
                            </button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

</div>
<script>
    function collectFunction(postId, userId) {
        $.ajax({
            url: '/user/collectPost',
            data: {
                userId: userId,
                postId: postId,
                collectStatus: true
            },
            dataType: "JSON",
            type: "POST",
            success: function (data) {
                console.log(data);
                alert(data);
                //获取收藏按钮对象并设置背景颜色变色
                //$(".glyphicon").css('background','red');
            }
        });

    }

    function likeFunction(postId,userId) {
        //将postId和userId通过Ajax传输到后台判断collectInfo表里的likeStatus状态
        //如果状态为0则说明为点赞，继续实现点赞功能即可，如果为1则实现取消点赞功能
        $.ajax({
            url:'/user/loadLikeStatus',
            data:{
                userId : userId,
                postId:postId,
                likeStatus:true
            },
            dataType:"JSON",
            type: "POST",
            success:function (data) {
                alert(data);
            }
        });
    }
</script>
<script src="../../static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
<script src="../../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</body>
</html>
