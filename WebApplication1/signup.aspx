<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="WebApplication1.signup" %>

<!DOCTYPE html>
<html lang="zh-cmn-Hans" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>彩虹新闻</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- styles -->
    <link href="css/styles.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
     
  </head>

   
    

    <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btn").on("click", function () {
                var uid = $("#uid").val();
                var uname = $("#uname").val();
                var password = $("#password").val();
                $("#warm").text("");
                if (uid.length == 0 || uname.length == 0 || password.length == 0) {
                    $("#warm").text("请输入账号、姓名和密码！");
                    alert("请输入账号、姓名和密码");
                    return;
                }
                else if (password.length < 6) {
                    $("#warm").text("密码不能少于6位！");
                    alert("密码不能少于6位！");
                    return;
                }

                alert(uid);
            $.ajax({
                type: "POST",
                url: "signup.aspx/Zhuce",
                //data: "{ 'uid':'" + uid + "','uname':'" + uname + "','password':'" + password + "'}",
                data: "{ 'uid':'" + uid+"','uname':'"+uname+"','password':'"+password+"'}",

                contentType: "application/json;charset=utf-8",
                dataType: "json",
                async: true,
                success: function (data) {
                    var data1 = eval('(' + data.d + ')');
                    alert("ewrwr");
                    if (data1 == "1") {
                        alert("注册成功，请返回登录");
                    }
                    else if (data1 == "0") {
                        $("#warm").text("该账号已存在!请重新输入");

                    }
                                  
                },
                error: function (err) {
                    alert(err);
                }
            });
                
            });
        });
    
    </script>

  <body class="login-bg">

  	<div class="header">
	     <div class="container">
	        <div class="row">
	           <div class="col-md-12">
	              <!-- Logo -->
	              <div class="logo">
	                 <h1><a href="index.aspx">彩虹新闻</a></h1>
	              </div>
	           </div>
	        </div>
	     </div>
	</div>

	<div class="page-content container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-wrapper" >
			        <div class="box"  >
			            <div class="content-wrap">
			                <h6>注册</h6>
			                <input class="form-control" type="text" placeholder="账号" id="uid">
			                <input class="form-control" type="text" placeholder="姓名" id="uname">
			                <input class="form-control" type="password" placeholder="密码" id="password">
                           
			                <div class="action">
			                    <a class="btn btn-primary signup" id="btn" style="width:50px">注册</a>
			                </div>  
                            
			            </div>
			        </div>

			        <div class="already">
			            <p>若已有账号，返回登录</p>
			            <a href="login.aspx">登录</a>
			        </div>
			    </div>
			</div>
		</div>
	</div>



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>
  </body>
</html>