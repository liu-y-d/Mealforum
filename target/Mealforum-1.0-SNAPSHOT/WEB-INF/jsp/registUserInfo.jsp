<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>注册用户</title>
    <link rel="stylesheet" type="text/css" href="../../static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
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
            <a class="navbar-brand" href="#">膳食·家论坛</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->

    </div><!-- /.container-fluid -->
</nav>
<div class="row">
    <div class="col-md-12">
        <div class="thumbnail" style="text-align: center;">
            <form action="/user/registUserInfo" method="post" enctype="multipart/form-data" onsubmit="return CheckNull()">
                <div class="caption">
                    <h4>姓名：<input type="text" name="userName" id="userName" onblur="checkName()"/></h4>
                    <h4>密码：<input type="password" name="userPwd" id="userPwd"/></h4>
                    <h4><input type="file" value="头像" name="file" style="width:100%;height: 50px;padding-left: 40px;text-align: center"></h4>
                </div>
                <button type="submit"  class="btn btn-default" id="checkNull" >确定</button>
            </form>
        </div>
    </div>
</div>
</body>
<script src="../../static/bootstrap-3.3.7-dist/js/jquery-3.4.1.min.js"></script>
<script src="../../static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function CheckNull() {
        //判断添加房型信息时输入是否为空
        $("#checkNull").click(function () {
            if (!$("#userName").val() && $("#userPwd").val()) {
                alert("输入信息不能为空");
                return false;
            } else {
                return true;
            }
        });

    }
</script>
<script type="text/javascript">
    //重名判断
    function checkName() {
        $('#submit').show();
        //获取姓名输入框的姓名
        var userName = $("#userName").val();
        if (!userName){
            alert('姓名不得空');
        }else {

            var url = "/user/checkName/" + userName;
            $.ajax({
                type: "POST",
                url: url,
                success: function (data) {
                    alert(data);
                    if (data=="用户名已存在"){
                        $('#submit').hide();
                    }
                }
            });
        }
    }
</script>

</html>
