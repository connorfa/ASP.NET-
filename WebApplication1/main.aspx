<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="WebApplication1.main" %>

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
  </head>
  <body>
  	<div class="header">
	     <div class="container">
	        <div class="row">

	           <div class="col-md-5" >	
                   
	              <nav class="navbar navbar-default" role="navigation" >
	              <div class="container" style="background:#000; color:#FFF">
	
	              <div  >
		            <ul class="nav navbar-nav" id ="lanmu" >
                        <li class="navbar-brand" ></li>
                        
			        <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
                    <script type="text/javascript">
                        var a = [];    //定义数据数组变量
                        var user = sessionStorage.getItem('uid');//从login输入的id传到这里来
                        //alert("user" + user);
                        //a = user;
                        //$("#a").val("11");
                       //document.getElementById("a").value = "11";
                   $.ajax({
                    type: "POST",
                    url: "main.aspx/GetColumn",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        qq = data.d;
                        var response = qq.split("&&&");
                        for (var i = 0; i < response.length; i++) {
                            a[i] = response[i];
                           
                        }
                        //alert(arr);
                        var html = '';
                        for (var i = 0; i < a.length-1; i++)
                            html += '<li id="' + a[i] + '"><a href="#" >' + a[i]+'</a></li>';
                           // html += '<li id="'+arr[i]+'"><span class="fa fa-caret-right"></span>' + arr[i] +';

                        //alert(html);
                        $("#lanmu").html(html);
                    },
                    error: function (err) {
                        alert(err);
                    }
                });

    
                   </script>

		      </ul>
	        </div>
	     </div>
        </nav>
	</div>

	           <div class="col-md-5">
	              <div class="row">
	                <div class="col-lg-12">
	                 
	                </div>
	              </div>
	           </div>

	           <div class="col-md-2">
	              <div class="navbar navbar-inverse" role="banner">
	                  <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
	                    <ul class="nav navbar-nav">
	                      <li class="dropdown">
	                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="a">欢迎<b class="caret"></b></a>
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
		   <div class="container">
               <div class="panel panel-warning ">
                <div class="panel-heading">
        <h1 class="page-header">每日推荐</h1>
                    </div>
                     <div class="container">


         <div class="col-md-6">
          <div class="panel panel-warning ">
              <div class="panel-body">
                  <div class="list-group">

             <div class="media">
              <a  class="media-left" href="article.aspx">
                <img src="images/1.jpg" alt="">
              </a>
            <div class="media-body" >
                <div class="media-heading" id="bianhao">
                
                    <a href="article.aspx"></a>
               </div>
                 <ul id="neirong" >
                             <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
                             <script type="text/javascript">
                                // alert("test");
                                var arr = [];    //定义数据数组变量
                                
                                $.ajax({
                                 type: "POST",
                                  url: "test1.aspx/GetColumn",
                                 contentType: "application/json;charset=utf-8",
                                 dataType: "json",
                                   async: false,
                                    success: function (data) {
                                        //alert("ewfsf");
                                        qq = data.d;
                                          var response = qq.split("&&&");
                                        for (var i = 0; i < response.length; i++) {
                                         arr[i] = response[i];
                                          // alert(arr[i]);
                                         }
                                  //alert(arr);
                                   var html = '';
                                    for (var i = 0; i < arr.length - 1; i++)
                                         
                                          html += '<li id="' + arr[i] + '"><a href="article.aspx" style="font-size:1em"   href="javascript:;" onclick="lanmudianji('+arr[i]+')" >' + arr[i]+'</a></li>';
                                        
                                         $("#neirong").html(html);
                                      },
                               error: function (err) {
                                     alert(err);
                                    }

                                 });
                                 function lanmudianji(str) {
                                     var str1 = str.innerText;
                                     sessionStorage.setItem('obj',str1);
                                    window.location.href = "article.aspx";
                                }

                    </script>
                            </ul>
             
            </div>
        </div>
        </div>
        </div>
       </div>
  </div>
</div>
                   </div>

		</div>

        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-warning ">
                <div class="panel-heading">
                    <h2>娱乐新闻</h2>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <ul id="yule" class="list-group-item">
                            <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
                             <script type="text/javascript">
                                // alert("test");
                                var arr = [];    //定义数据数组变量
                                
                                $.ajax({
                                 type: "POST",
                                 url: "test1.aspx/Getyule",
                                 data: "{ 'user':'娱乐'}",
                                 contentType: "application/json;charset=utf-8",
                                 dataType: "json",
                                   async: false,
                                    success: function (data) {
                                        //alert("ewfsf");
                                        qq = data.d;
                                          var response = qq.split("&&&");
                                        for (var i = 0; i < response.length; i++) {
                                         arr[i] = response[i];
                                          // alert(arr[i]);
                                         }
                                  //alert(arr);
                                   var html = '';
                                    for (var i = 0; i < arr.length - 1; i++)
                                         
                                          html += '<li id="' + arr[i] + '"><a href="article.aspx" style="font-size:3em"   href="javascript:;" onclick="yule('+arr[i]+')" >' + arr[i]+'</a></li>';
                                        
                                         $("#yule").html(html);
                                      },
                               error: function (err) {
                                     alert(err);
                                    }

                                 });
                                 function yule(str) {
                                     var str1 = str.innerText;
                                     sessionStorage.setItem('yule',str1);
                                    window.location.href = "article.aspx";
                                }

                    </script>
                            </ul>


                        <!--second
                        <ul>
                            <li>
                        <a href="" class="list-group-item">
                            
                            <h3>bootstrap</h3>
                            <p >fidobngdo nv c oivuc on jvifrvufovdfjvodf</p>
                        </a>
                                </li>
                            </ul>


                        <a href="" class="list-group-item">
                            <h3>bootstrap</h3>
                            <p>fidobngdo nv c oivuc on jvifrvufovdfjvodf</p>
                        </a>-->
                    </div>
                </div>
            </div>
            </div>

            <div class="col-md-6">
                <div class="panel panel-danger ">
                <div class="panel-heading">
                    <h2>体育新闻</h2>
                </div>
                 <div class="panel-body">
                    <div class="list-group">
                        <ul id="tiyu" class="list-group-item">
                            <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
                             <script type="text/javascript">
                                // alert("test");
                                var arr = [];    //定义数据数组变量
                                
                                $.ajax({
                                 type: "POST",
                                 url: "test1.aspx/Gettiyu",
                                 data: "{ 'user':'体育'}",
                                 contentType: "application/json;charset=utf-8",
                                 dataType: "json",
                                   async: false,
                                    success: function (data) {
                                        //alert("ewfsf");
                                        qq = data.d;
                                          var response = qq.split("&&&");
                                        for (var i = 0; i < response.length; i++) {
                                         arr[i] = response[i];
                                          // alert(arr[i]);
                                         }
                                  //alert(arr);
                                   var html = '';
                                    for (var i = 0; i < arr.length - 1; i++)
                                         
                                          html += '<li id="' + arr[i] + '"><a href="article.aspx" style="font-size:3em"   href="javascript:;" onclick="tiyu('+arr[i]+')" >' + arr[i]+'</a></li>';
                                        
                                         $("#tiyu").html(html);
                                      },
                               error: function (err) {
                                     alert(err);
                                    }

                                 });
                                 function tiyu(str) {
                                     var str1 = str.innerText;
                                     sessionStorage.setItem('tiyu',str1);
                                    window.location.href = "article.aspx";
                                }

                    </script>
                            </ul>
            </div>
            </div>
       
   

      <!--<div class="container">


         <div class="col-md-6">
          <div class="panel panel-warning ">
              <div class="panel-body">
                  <div class="list-group">

             <div class="media">
              <a  class="media-left" href="article.aspx">
                <img src="images/1.jpg" alt="">
              </a>
            <div class="media-body" >
                <div class="media-heading" id="bianhao">
                
                    <a href="article.aspx"></a>
               </div>
                 <ul id="neirong" >
                             <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
                             <script type="text/javascript">
                                // alert("test");
                             /*   var arr = [];    //定义数据数组变量
                                
                                $.ajax({
                                 type: "POST",
                                  url: "test1.aspx/GetColumn",
                                 contentType: "application/json;charset=utf-8",
                                 dataType: "json",
                                   async: false,
                                    success: function (data) {
                                        //alert("ewfsf");
                                        qq = data.d;
                                          var response = qq.split("&&&");
                                        for (var i = 0; i < response.length; i++) {
                                         arr[i] = response[i];
                                          // alert(arr[i]);
                                         }
                                  //alert(arr);
                                   var html = '';
                                    for (var i = 0; i < arr.length - 1; i++)
                                         
                                          html += '<li id="' + arr[i] + '"><a style="font-size:1em" href="javascript:;" onclick="lanmudianji('+arr[i]+')" >' + arr[i]+'</a></li>';
                                        
                                         $("#neirong").html(html);
                                      },
                               error: function (err) {
                                     alert(err);
                                    }

                                 });
                                 function lanmudianji(str) {
                                     var str1 = str.innerText;
                                     sessionStorage.setItem('obj',str1);
                                    window.location.href = "article.aspx";
                                }
                                */
                    </script>
                            </ul>
             
            </div>
        </div>
        </div>
        </div>
       </div>
  </div>-->


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