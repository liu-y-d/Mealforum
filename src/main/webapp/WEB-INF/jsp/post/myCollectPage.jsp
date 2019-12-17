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
	<title>我的收藏</title>
	<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/lydStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
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
						<li><a href="${pageContext.request.contextPath}/user/toHomePage?id=${userInfo.id}">个人信息</a></li>
						<li><a href="${pageContext.request.contextPath}/user/toMyCollectPage?userId=${userInfo.id}">我的收藏</a></li>
						<li><a href="${pageContext.request.contextPath}/user/queryPostInfo?createUserId=${userInfo.id}">我的帖子</a></li>
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
				<img src="图片的url地址" alt="图片XX" onerror="this.src='/static/img/backgrounds/meal.jpg;this.οnerrοr=null'"/>
				<div class="caption">
					<h3><a id="postid" href="/user/PostDetailPage?id=${postInfo.id}">${postInfo.title}</a></h3>
<%--					<p>${postInfo.htmlContent}</p>--%>
					<p style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">${postInfo.markdownContent}</p>
					<p>
						<input type="button" class="btn btn-default" onclick="delCollectInfo(${postInfo.id},${userInfo.id})" value="移除"/>
					</p>
				</div>
			</div>
		</div>
	</div>
	</c:forEach>

</div>
<script>
    function delCollectInfo(postId,userId) {
        $.ajax({
            url:"/user/delCollectInfo",
	        data:{
		        postId:postId,
		        userId:userId
	        },
            type: "POST",
            success: function () {
                alert("移除成功");
                location.reload();
            }
        });
    }
</script>
<script src="../../static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
<script src="../../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</body>
</html>
