<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>MoneyBook :) </title>
    
	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
    
     <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>    
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.js"></script>
    <!-- morris.js.chart -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    <script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
	
	
	
	

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- FullCalendar -->
    <link href="${pageContext.request.contextPath}/vendors/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">

    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/build/css/custom.min.css" rel="stylesheet">

	
	<script>
	
	var morrisBar;
	var morrisLine;
	
	$(document).ready(function(){		
		morris();
		
	});
	
	function changeAccount(){
			$("#bar-example").html("");
			$("#line-example").html("");
			morris(); 
	}
	
	function morris(){
		 var account = $('#account option:checked').text();//선택 계좌
		 var input;
		 var output;
		$.ajax({
			url : "./getGraphsData.do",
			type : "post",
			data : {"account":account},
			dataType : "json",
			success : function(data){
					console.log(data);
					 morrisBar = Morris.Bar({
						  element: 'bar-example',
						  data: data,
						  xkey: 'BANKDATE',
						  ykeys: ['INPUT', 'OUTPUT'],
						  labels: ['입금', '출금 '],
						  barColors : ['#3D82AD','red']
						});
					 morrisLine = Morris.Line({
						  element: 'line-example',
						  data: data,
						  xkey: 'BANKDATE',
						  ykeys: ['INPUT', 'OUTPUT'],
						  labels: ['입금', '출금'],
						  lineColors : ['#3D82AD','red']
						});
				}
			});
	}
	
	
	</script>




</head>
<body>
<body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>MoneyBook :)</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_info">
                <span>Welcome,</span>
                <h2><%String id = (String)session.getAttribute("id"); %> <%=id+"님"%></h2>
              </div> 
            </div>
            <!-- /menu profile quick info -->

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a href="${pageContext.request.contextPath}/home.do"><i class="fa fa-home"></i> Home </a> </li>
				  <li><a href="${pageContext.request.contextPath}/account_list.do"><i class="fa fa-credit-card-alt" aria-hidden="true"></i> Credit Card </a> </li>
 				  <li><a href="${pageContext.request.contextPath}/graphs.do"><i class="fa fa-bar-chart-o"></i> Graphs </a> </li>
 				  <li><a href="${pageContext.request.contextPath}/statics.do"><i class="fa fa-table"></i>Statics</a></li>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<nav>
						<div class="nav toggle">
							<a id="menu_toggle"><i class="fa fa-bars"></i></a>
						</div>

						<ul class="nav navbar-nav navbar-right">
							<li class="">
							<a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> 
							 <%String headid = (String)session.getAttribute("id"); %> <%=headid+"님"%> 
								<span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="javascript:;"> Profile</a></li>
									<li><a href="login.html"><i	class="fa fa-sign-out pull-right"></i> Log Out</a></li>
								</ul>
								</li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
              <h3> Graphs <small>graphs for MoneyBook</small></h3>
              </div>
              
                <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for${pageContext.request.contextPath}.">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
             </div> 
              
             <div>
             <select name ="account" id="account" class="col-sm-7" onchange="changeAccount();" >
                  	<c:forEach var="dto" items="${list}"> 
                  	<option value="${dto.accNo}" class="form-control"> ${dto.accName } - ${dto.accNumber} </option>
                  	</c:forEach>
             </select>
             </div> 
              <br><br><br><br><br>
             <div id="line-example" style="height: 230px;"></div>
             <br><br><br><br><br>
             <div id="bar-example" style="height: 230px;"></div>
            </div>
         </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>
</body>
</html>