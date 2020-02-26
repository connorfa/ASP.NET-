<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="infor.aspx.cs" Inherits="WebApplication1.infor" %>

<!DOCTYPE html>

<html lang="zh-cmn-Hans" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>信息发布系统</title>
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
  <body>
  	<div class="header">
	     <div class="container">
	        <div class="row">
	           <div class="col-md-5">
	              <!-- Logo -->
	              <div class="logo">
	                 <h1><a >彩虹新闻网 / 管理员</a></h1>
	              </div>
	           </div>



	           <div class="col-md-5">
	             
	           </div>
	           <div class="col-md-2">
	              <div class="navbar navbar-inverse" role="banner">
	                  <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
	                    <ul class="nav navbar-nav">
	                      <li class="dropdown">
	                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">账号 <b class="caret"></b></a>
	                        <ul class="dropdown-menu animated fadeInUp">
	                          <li><a href="profile.html">修改密码</a></li>
	                          <li><a href="login.aspx">注销</a></li>
	                        </ul>
	                      </li>
	                    </ul>
	                  </nav>
	              </div>
	           </div>
	        </div>
	     </div>
	</div>

    <div class="page-content">
    	<div class="row">
		  <div class="col-md-2">
		  	<div class="sidebar content-box" style="display: block;">
                <ul class="nav">
                    <!-- Main menu -->
                    <li class="current"><a href="AdminMenu.aspx"><i class="glyphicon glyphicon-home"></i> 主页</a></li>
                      
                    <!--  <li><a href="tables.html"><i class="glyphicon glyphicon-list"></i> 账号管理</a></li>   -->
                    <!-- 账号管理 -->
                    <li class="submenu">
                        <a href="#">
                            <i class="glyphicon glyphicon-list"></i> 账号管理
                            <span class="caret pull-right"></span>
                            
                        </a>
                    <ul>
                            <li><a href="#">删除账号</a></li>
                            <li><a href="#">添加账号</a></li>
                        </ul>
                    </li>

                    <!-- 信息管理 -->
                    <li class="submenu">
                        <a href="#">
                            <i class="glyphicon glyphicon-record"></i> 信息管理
                            <span class="caret pull-right"></span>
                            
                        </a>
                    <ul>
                            <li><a href="article.aspx">发布信息</a></li>
                            <li><a href="#">删除信息</a></li>
                            <li><a href="#">修改信息</a></li>
                        
                        </ul>
                    </li>
                    
                    <!-- 评论管理 -->
                    <li class="submenu">
                        <a href="#">

                            <ul><i class="glyphicon glyphicon-pencil"></i></ul> 评论管理
                            <span class="caret pull-right"></span>
                            
                        </a>
                    <ul>
                            <li><a href="#">审核评论</a></li>
                            <li><a href="#">删除评论</a></li>                          
                        </ul>
                    </li>

                   
                    <!-- 栏目管理 -->
                    <li class="submenu" >
                         <a href="#">
                            <i class="glyphicon glyphicon-tasks" ></i> 栏目管理
                            <span class="caret pull-right"></span>
                         </a>
                         <!-- 下拉菜单 -->
                         <ul id="lanmu">
                            <!--<li><a href="login.html">Login</a></li>
                            <li><a href="signup.html">Signup</a></li> -->
                             <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
                             <script type="text/javascript">
                                var arr = [];    //定义数据数组变量
                                
                                $.ajax({
                                 type: "POST",
                                  url: "AdminMenu.aspx/GetColumn",
                                 contentType: "application/json;charset=utf-8",
                                 dataType: "json",
                                   async: false,
                                  success: function (data) {
                                        qq = data.d;
                                          var response = qq.split("&&&");
                                        for (var i = 0; i < response.length; i++) {
                                         arr[i] = response[i];
                                          // alert(arr[i]);
                                         }
                                  //alert(arr);
                                   var html = '';
                                    for (var i = 0; i < arr.length - 1; i++)
                                         
                                          html += '<li id="' + arr[i] + '"><a href="javascript:;" onclick="lanmudianji('+arr[i]+')" >' + arr[i]+'</a></li>';
                                        
                                         $("#lanmu").html(html);
                                      },
                               error: function (err) {
                                     alert(err);
                                    }

                                 });
                                 function lanmudianji(str) {
                                     var str1 = str.innerText;
                                     sessionStorage.setItem('obj',str1);
                                    window.location.href = "infor.aspx";
                                }

                    </script>

                        </ul>
                    </li>
                </ul>
             </div>
		  </div>
            

           
	 <div class="col-md-10">	 
        <div class="col-sm-12">
        <div class="panel panel-default">
            <a href="#widget2container" class="panel-heading" data-toggle="collapse">栏目 <span class="label label-warning" id="shuliang"></span></a>
            <div id="widget2container" class="panel-body collapse in">
  					<!--<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">-->
                          <table class="table table-bordered table-striped"  style="table-layout:fixed;" width="100%" cellspacing="0" cellpadding="2" id="pinglun1">
						<thead>
							<tr>
								<th>ID</th>
                                  <th>标题</th>
                                    <th>内容</th>
                                       <th>发布日期</th>
                                           <th>发布人</th>
                                             <th>栏目</th>
                                                <th>操作</th>
							</tr>
						</thead>
						
             <tbody id="tbody1">
    <script>
                var user = sessionStorage.getItem('obj');//user是所点击的栏目
                //localStorage.removeItem('obj');
                alert("this is " + user);
               
                $.ajax({
                    type: "POST",
                    url: "infor.aspx/xinxichaxun",
                    data:"{'user':'娱乐'}",//user的值传不进来
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        //alert("data" + "data.d");

                        qq = data.d;
                            //alert(qq);
                            var num = "";
                            var response = qq.split("&&&");
                            alert(response);
                            alert(response.length);
                            var html = '';
                            for (var i = 0; i <(response.length-1)/6; i++)
                                html += '<tr><td>'+(i)+'</td><td class="turn">'+response[6*i+0]+'</td><td class="turn">'+response[6*i+1]+'</td><td class="turn">'+response[6*i+2]+'</td><td class="turn">'+response[6*i+3]+'</td><td class="turn">'+response[6*i+4]+'</td><td class="turn">'+response[6*i+5]+'</td><td><a href="javascript:;" onclick="tong('+response[6*i]+')" ><i class="glyphicon glyphicon-ok"></i></a>&nbsp; <a href="javascript:;" onclick="bu('+response[6*i]+')"><i class="glyphicon glyphicon-remove"></i></a></td></tr>';
                            $("#example").prepend(html);  
                            num = $("#pinglun").text();
                            num=num.split("+");
                            $("#shuliang").text(num[1]);
                        },
                        error: function (err) {
                            alert(err);
                        }
                });
                function xinxibianji(str) {
                    localStorage.setItem('obj', JSON.stringify(str));
                    window.location.href = "article.aspx";
                }
                function shanchu(str){
                     $.ajax({
                    type: "POST",
                         url: "infor.aspx/xinxishanchu",
                         data: "{ 'user':'" + str + "'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    async: true,
                         success: function (data) {
                             var d = data.d;
                             if (d = "1"){
                                 alert("删除成功");
                                 window.location.href = "infor.aspx";
                             }
                             else if (d = "2") {
                                 alert("删除失败");
                             }
                             else if (d = "0") {
                                 alert("出现异常");
                             }
                         },
                    error: function (err) {
                           alert(err);
                    }
                });
                }
            </script>
             </tbody>
              </table>
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