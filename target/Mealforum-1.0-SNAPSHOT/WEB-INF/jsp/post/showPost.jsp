<%--
  Created by IntelliJ IDEA.
  User: 刘云达
  Date: 2019/12/8
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<script src="/static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="/static/css/lydStyle.css">
	<script src="../../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="/editor.md-master/examples/css/style.css"/>
	<script src="/editor.md-master/examples/js/jquery.min.js"></script>
	<script src="/editor.md-master/editormd.min.js"></script>
	<script src="/editor.md-master/lib/flowchart.min.js"></script>
	<script src="/editor.md-master/lib/jquery.flowchart.min.js"></script>
	<script src="/editor.md-master/lib/marked.min.js"></script>
	<script src="/editor.md-master/lib/prettify.min.js"></script>
	<script src="/editor.md-master/lib/raphael.min.js"></script>
	<script src="/editor.md-master/lib/sequence-diagram.min.js"></script>
	<script src="/editor.md-master/lib/underscore.min.js"></script>
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
						<li><a href="${pageContext.request.contextPath}/user/toMyCollectPage?userId=${userInfo.id}">我的收藏</a></li>
						<li><a href="/user/queryPostInfo?userId=${userInfo.id}">我的帖子</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">退出登录</a></li>
					</ul>
				</li>
			</ul>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>

<div class="panel panel-default" style="width: 90%;margin: 0 auto;">
	<div class="panel-heading">
		<div class="panel-title">
			<h3 class="" >标题：${postInfo.title}</h3>
		</div>
	</div>
	<div class="panel-body">
		<!-- 用于显示md编辑器的md格式 -->
		<div id="doc-content" style="text-align: left">
			<h3>正文： </h3>
			<textarea style="display: none;">${postInfo.markdownContent}</textarea>
		</div>
	</div>
</div>
</body>


<script type="text/javascript">
    var testEditor;
    $(function() {
        testEditor = editormd.markdownToHTML("doc-content", {//注意：这里是上面DIV的id
            htmlDecode : "style,script,iframe",
            emoji : true,
            taskList : true,
            tex : true, // 默认不解析
            flowChart : true, // 默认不解析
            sequenceDiagram : true, // 默认不解析
            codeFold : true
        });
    });
</script>
</html>
