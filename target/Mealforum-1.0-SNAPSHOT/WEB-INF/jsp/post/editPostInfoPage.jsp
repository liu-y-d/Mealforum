<%--
  Created by IntelliJ IDEA.
  User: 刘云达
  Date: 2019/12/3
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>修改帖子</title>
	<link rel="stylesheet" href="/editor.md-master/css/editormd.css"/>
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
					<a id="userId" href="#">${userInfo.userName}</a>
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
<div style="margin: 0 auto; text-align: center;">
	<label id="L1"><input  type="text" placeholder="请输入标题" id="title" name="title" autocomplete="off" value="${postInfo.title}"/></label>
	<div class="btn-group" role="group" aria-label="...">
		<button type="button" id="postButton" class="button" style="background-color: #00d95a">发布</button>
		<button type="button" class="button" style="background-color: #2aabd2">存草稿</button>
	</div>

</div>
<div id="test-editormd">
	<textarea id="editor-md-doc" name="editor-md-doc" style="display:none;">${postInfo.markdownContent}</textarea>
	<textarea id="editor-md-html" name="editor-md-html">${postInfo.htmlContent}</textarea>
</div>

</body>
<script>
    $("#postButton").click(function () {
        submit_atricle();//提交发布信息
    });

    function submit_atricle() {
        var title = $("#title").val();
        var userId = ${userInfo.id};
        var id = ${postInfo.id}
        var htmlContent = $("#editor-md-html").val();
        var markdownContent = $("#editor-md-doc").val();
        $.ajax({
            url: "/user/editPostInfo",
            data: JSON.stringify({id: id,title: title, htmlContent: htmlContent, markdownContent: markdownContent}),
            type: "POST",
            contentType: 'application/json',
            success: function (data) {
                alert("修改成功");
            },
            error: function () {
                alert("发布失败");
            }
        });
    }
</script>
<script>
    var testEditor;

    $(function () {
        $("#title").focus(function() {
            $(this).parent("label").addClass("active");
        });
        $("#title").blur(function() {
            if ($(this).val() == "") {
                $(this).parent("label").removeClass("active");
            }
        })
        testEditor = editormd("test-editormd", {
            placeholder: "欢迎您使用 “膳食·家” 论坛",
            /*上面div的值*/
            width: "100%",//编辑器大小官方默认90%
            height: 640,
            syncScrolling: "single",
            path: "/editor.md-master/lib/",
            saveHTMLToTextarea: true,//注意3：这个配置，textarea可以提交

            emoji: true,//emoji表情，默认关闭
            tocm: true, // Using [TOCM]
            tex: true, // 开启科学公式TeX语言支持，默认关闭
            flowChart: true, // 开启流程图支持，默认关闭
            /**上传图片相关配置如下*/
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL: "/fileUpload/editorMDUpload",//注意你后端的上传图片服务地址
            onload: function () { //上传成功之后的回调

            },

            //editorTheme: "pastel-on-dark",//编辑器的主题颜色
            theme: "gray",//顶部的主题
            //previewTheme: "dark"//显示的主题


        });

    });


</script>

<!--引入markdown js   要放在body最下面-->
<script src="/editor.md-master/editormd.js"></script>
<script src="../../static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
<script src="../../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</html>
