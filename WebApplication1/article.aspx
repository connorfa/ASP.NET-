<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="article.aspx.cs" Inherits="WebApplication1.article" %>

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

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        #Text1 {
            height: 451px;
            width: 888px;
            margin-left: 94px;
            margin-top: 0px;
        }
        #Select1 {
            width: 170px;
            height: 30px;
            margin-left: 158px;
        }
        #name {
            width: 170px;
            height: 30px;
            margin-left: 78px;
        }
        #Text2 {
            width: 508px;
            margin-left: 112px;
        }
        #Radio1 {
            width: 50px;
        }
    </style>

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
	                        <a href="AdminMenu.aspx" class="dropdown-toggle" data-toggle="dropdown">主页面 <b class="caret"></b></a>
	                       
	                      </li>
	                    </ul>
	                  </nav>
	              </div>
	           </div>

	        </div>
	     </div>
	</div>
<!--test-->
    
    <form class="form-inline" role="form">
	<div class="form-group">
        <div class="col-sm-2">
		
		<input type="text"  id="name"   placeholder="请输入标题">
           
	</div>
        <!--将栏目的值放入select中-->
	<select class="form-control"  id="Select1" name="D1">
                <option>
                    <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
                    <script type="text/javascript">
                        var a = [];    //定义数据数组变量
                        var condition;
                        var kk = sessionStorage.getItem('obj')//从main那边获得点击的标题
                        alert(kk);
                        var zz = sessionStorage.getItem('yule')
                        alert(zz);
                        //select1 的change事件用了获取下拉列表的值
                       
                         $("#state").text("");
                        //alert("conditon" + conditon);
                   $.ajax({
                    type: "POST",
                    url: "article.aspx/GetColumn",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    async: false,
                       success: function (data) {
                          // alert("this is "+data.d);
                        qq = data.d;
                        //alert(qq);
                        var response = qq.split("&&&");
                        for (var i = 0; i < response.length; i++) {
                            a[i] = response[i];
                            //alert(a[i]);
                        }
                        //alert(arr);
                        //var html = '';
                        for (var i = 0; i < a.length - 1; i++)
                            $("#Select1").append("<option>" + a[i] + "</option>");
                        
                       
                    },
                    error: function (err) {
                        alertLayer("获取数据失败","error");
                    }
                        });
                        //alert(a);
                        function lanmudianji(str) {
                                     var str1 = str.innerText;
                                     sessionStorage.setItem('obj',str1);
                                    window.location.href = "article.aspx";
                                }
             
	//$(document).on("change","#Select1",function(){
　　　　//获取选择的值
        //condition = $(this).val();
       // alert("fe" + condition);
        //其他操作
       // return condition;
  //  });
                                         
  
                        
                   </script>
                    </option>
                </select>

	<div class="form-group">
        <label class="sr-only" for="inputfile">选择图片</label>
        <input type="file" id="test-image-file" name="test" accept="image/jpg,image/jpeg,image/png">
        </div>
	<button type="submit" class="btn btn-default" id ="btn" onclick="fabuclick1()">发表</button>
</div>
</form>


    <script type="text/javascript" src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
    <script type="text/javascript">
                    
                        
        
        function fabuclick1() {


            //var id = localStorage.getItem('obj');
            //localStorage.removeItem('obj');
            var title = document.getElementById("name").value;

            var content = document.getElementById("Text1").value;
            
            var columns = document.getElementById("Select1").value;
            
            var produceman = sessionStorage.getItem('uid');
            
    
            
            $.ajax({

                type: "POST",

                url: "article.aspx/fabuxinxi",

                data: "{ 'title':'" + title + "','content':'" + content + "','columns':'" + columns + "','produceman':'" + produceman + "'}",
                
                contentType: "application/json;charset=utf-8",

                dataType: "json",

                async: true,

                success: function (data) {
                    alert("data" + "data.d");

                    var str = data.d;

                    //alert("str " + str);

                    if (str == "1") {

                        alert("发布成功");

                        document.getElementById("name").value = "";

                        document.getElementById("Text1").value = "";

                    }

                    else if (str == "2") {

                        alert("发布失败");

                    }

                    else if (str == "0") {

                        alert("出现异常");

                    }

                },

                error: function (err) {

                    alert("cuowu");

                }

            });

        }
    </script>
            <textarea  id="Text1" cols="2"   style="OVERFLOW:   hidden"></textarea>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
