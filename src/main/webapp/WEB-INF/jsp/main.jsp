<%--
  Created by IntelliJ IDEA.
  User: 刘云达
  Date: 2019/8/7
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>膳食·家主页</title>
	<link rel="stylesheet" type="text/css" href="../../static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
	<script src="/static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="/static/css/lydStyle.css">
</head>
<body style="background-color: #99CCFF">
<%--导航条--%>
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
			<a class="navbar-brand" href="#">膳食·家论坛</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<form class="navbar-form navbar-left">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">确定</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li>
					<a href="#">${userInfo.userName}</a>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					   aria-expanded="false">个人中心 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/user/toHomePage?id=${userInfo.id}">个人信息</a></li>
						<li><a href="#">我的收藏</a></li>
						<li><a href="/user/queryPostInfo?createUserId=${userInfo.id}">我的帖子</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">退出登录</a></li>
					</ul>
				</li>
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>
<%--巨幕--%>
<div class="jumbotron">
	<div class="container">
		<div style="text-align: center;">
			<h1>Hello, ${userInfo.userName}!</h1>
			<p>欢迎登陆膳食·家论坛</p>
			<p><a class="btn btn-primary btn-lg" href="/user/toPost" role="button">发帖</a></p>

		</div>
	</div>
</div>
<%--菜谱推荐栅格系统实现--%>
<div class="row">
	<a href="/user/refreshRanking"><button  type="button" class="btn btn-default btn-lg" style="background-color: #99CCFF;border: none;">
		<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
	</button></a>
	<c:forEach var="postInfo" items="${list}">
		<div style="text-align: center;">
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="thumbnail">
					<img src="图片的url地址" alt="图片XX" onerror="this.src='/static/img/backgrounds/meal.jpg;this.οnerrοr=null'"/>
					<div class="caption">
						<h3><a id="postid" href="/user/PostDetailPage?id=${postInfo.id}">${postInfo.title}</a></h3>
							<%--					<p>${postInfo.htmlContent}</p>--%>
						<p style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">${postInfo.markdownContent}</p>
						<p>
							<button id="collect" type="button" class="btn btn-default btn-lg" onclick="collectFunction(${postInfo.id},${userInfo.id})" >
								<span class="glyphicon glyphicon-star" aria-hidden="true"></span> 收藏
							</button>
							<button id="like"type="button" class="btn btn-default btn-lg" onclick="likeFunction(this)">
								<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 点赞
							</button>
<%--							<a href="/user/toEditPostInfo?id=${postInfo.id}" class="btn btn-primary" role="button">修改</a>--%>
<%--							<input type="button" class="btn btn-default" onclick="delPostInfo(${postInfo.id})" value="删除"/>--%>

						</p>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

</div>

</body>
<script src="../../static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
<script src="../../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
	function collectFunction(postId,userId) {
		$.ajax({
			url:'/user/collectPost',
			data:{
			    userId : userId,
				postId:postId,
				collectStatus:true
			},
			dataType:"JSON",
            type: "POST",
			success:function (data) {
			    console.log(data);
			    alert(data);
            }
		});
	    <%--var collectStatus = ${postInfo.collectStatus};//获取--%>
	    // if (collectStatus==0){
	    //
        // }
		//获取收藏按钮对象并设置背景颜色变色
		$("#collect").css('background','red');
    }
    function likeFunction() {

    }
</script>
</html>
