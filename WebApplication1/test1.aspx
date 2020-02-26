<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test1.aspx.cs" Inherits="WebApplication1.test1" %>

<!DOCTYPE html>
<html lang="zh-cmn-Hans" xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Bootstrap Admin Theme v3</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- jQuery UI -->
    <link href="https://code.jquery.com/ui/1.10.3/themes/redmond/jquery-ui.css" rel="stylesheet" media="screen">

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
	                 <h1><a href="index.html">Bootstrap Admin Theme</a></h1>
	              </div>
	           </div>
	           <div class="col-md-5">
	              <div class="row">
	                <div class="col-lg-12">
	                  <div class="input-group form">
	                       <input type="text" class="form-control" placeholder="Search...">
	                       <span class="input-group-btn">
	                         <button class="btn btn-primary" type="button">Search</button>
	                       </span>
	                  </div>
	                </div>
	              </div>
	           </div>
	           <div class="col-md-2">
	              <div class="navbar navbar-inverse" role="banner">
	                  <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
	                    <ul class="nav navbar-nav">
	                      <li class="dropdown">
	                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Account <b class="caret"></b></a>
	                        <ul class="dropdown-menu animated fadeInUp">
	                          <li><a href="profile.html">Profile</a></li>
	                          <li><a href="login.html">Logout</a></li>
	                        </ul>
	                      </li>
	                    </ul>
	                  </nav>
	              </div>
	           </div>
	        </div>
	     </div>
	</div>



      <!--这一部分-->
    <div class="container">
        <h1 class="page-header">每日推荐</h1>
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-warning ">
                <div class="panel-heading">
                    <h2>娱乐新闻</h2>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <ul>
                            <li>
                        <a href="article.aspx" class="list-group-item">
                            <h3>bootstrap</h3>
                            <p>fidobngdo nv c oivuc on jvifrvufovdfjvodf</p>
                        </a>
                                </li>
                            </ul>
                        <a href="" class="list-group-item">
                            
                            <h3>bootstrap</h3>
                            <p >fidobngdo nv c oivuc on jvifrvufovdfjvodf</p>
                        </a>
                        <a href="" class="list-group-item">
                            <h3>bootstrap</h3>
                            <p>fidobngdo nv c oivuc on jvifrvufovdfjvodf</p>
                        </a>
                    </div>
                </div>
            </div>
            </div>

            <div class="col-md-6">
                <div class="panel panel-danger ">
                <div class="panel-heading">
                    <h2>163.net NEWS</h2>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <a href="" class="list-group-item">
                            <h3>bootstrap</h3>
                            <p>fidobngdo nv c oivuc on jvifrvufovdfjvodf</p>
                        </a>
                        <a href="" class="list-group-item">
                            <h3>bootstrap</h3>
                            <p>fidobngdo nv c oivuc on jvifrvufovdfjvodf</p>
                        </a>
                        <a href="" class="list-group-item">
                            <h3>bootstrap</h3>
                            <p>fidobngdo nv c oivuc on jvifrvufovdfjvodf</p>
                        </a>
                    </div>
                </div>
            </div>
            </div>
        </div>
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

                    </script>
                            </ul>
             
            </div>
        </div>
        </div>
        </div>
       </div>
  </div>



    </div>


     
</body>

</html>