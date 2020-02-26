<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>

<!DOCTYPE html>
<html lang="zh-cmn-Hans" xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>彩虹新闻网</title>
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
       <style>
	body {background-image:url('images/2.jpg');background-size:cover;}
    
    </style>
  </head>
    
    <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btn").on("click", function () {
                var uid = $("#uid").val();
                var password = $("#password").val();
                $("#warm").text("");
                if (uid.length == 0  || password.length == 0) {
                    $("#warm").text("账号、密码不能为空！");
                    alert("账号或者密码不能为空");
                    return;
                }
                
                
               
            $.ajax({
                type: "POST",
                url: "login.aspx/Login",
                data: "{ 'uid':'" + uid+"','password':'"+password+"'}",

                contentType: "application/json;charset=utf-8",
                dataType: "json",
                async: true,
                success: function (data) {
                    
                    var data1 = eval('(' + data.d + ')');
                    
                    if (data1 == "1") {
                        sessionStorage.setItem('uid',uid);//将uid传到main.aspx
                        window.location.href = "main.aspx";
                        
                    }
                    else if (data1 == "2") {
                        sessionStorage.setItem('uid',uid);//将uid传到main.aspx
                        window.location.href = "AdminMenu.aspx";
                    }
                    else if (data1 == "0") {
                        alert("该账号不存在，请重新输入");
                       // sessionStorage.setItem('uid',uid);//将uid传到main.aspx
                        //window.location.href = "AdminMenu.aspx";
                    }
                                  
                },
                error: function (err) {
                    alert(err);
                }
            });
                
            });
        });

    
    </script>


  <body>

  	<div class="header">
	     <div class="container">
	        <div class="row">
	           <div class="col-md-12">
	              <!-- Logo -->
	              <div class="logo">
	                 <h1><a>彩虹新闻</a></h1>
	              </div>
	           </div>
	        </div>
	     </div>
	</div>
 <div class="page-content" >
        
    	<div class="row">
		  <div class="col-md-2">
	<div class="page-content container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-wrapper">
			        <div class="box">
			            <div class="content-wrap">
			                <h6>登录</h6>
			                <div class="social">
	                            <a class="face_login" href="#">
	                                <span class="face_icon">
	                                    <img src="images/1.jpg">
                                        
	                                </span>
	                               
	                            </a>
	                            <div class="division">
	                                <hr class="left">
	                                
	                                <hr class="right">
	                            </div>
	                        </div>
			                <input class="form-control" type="text" id="uid" placeholder="请输入账号">
			                <input class="form-control" type="password" id="password" placeholder="请输入密码">
			                <div class="action">

			                    <a class="btn btn-primary signup" id="btn" style="width:50px">登录</a>
                                 <div class="already">
			            <p>若没有账号，请点击这里进行注册</p>
			            <a href="signup.aspx">注册</a>
			        </div>
			                </div>                
			            </div>
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