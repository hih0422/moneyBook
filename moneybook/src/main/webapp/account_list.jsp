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
  </head>

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
 				  <li><a href="${pageContext.request.contextPath}/graphs.do"><i class="fa fa-home"></i> Graphs </a> </li>
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
			<div class="right_col" >
				<div class="col-md-12">
				 <div class="x_panel">
                  <div class="x_title">
					<h3>계좌목록</h3>
					<FORM name="frm" method="POST" action="/account_Add.do">
						<input type="hidden" name="(이름값)" value="(이름값)">
						<TABLE class='table'>
							<thead>
							<tr>
								<th>번호</th>
								<th>은행명</th>
								<th>계좌번호</th>
								<th width="10%">삭제</th>
							</tr>
							</thead>
							<c:forEach var="dto" items="${list}">

								<tr id ="trr">
									<td>${dto.accNo}</td>
									<td>${dto.accName}</td>
									<td>${dto.accNumber}</td>
									<td><input type='button' class="btn btn-default" value='삭제' 
								onclick="location.href='${pageContext.request.contextPath}/account_Delete.do?accNo=${dto.accNo}'"></td>
									
								</tr>
							</c:forEach>
							</tbody>
						</TABLE>

						<DIV class='bottom'>
							<input type='button' class="btn btn-default" value='계좌등록' 
								onclick="accountCreate();">
						</DIV>
					</FORM>
					</div>
					</div>
				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<div class="pull-right">
					Gentelella - Bootstrap Admin Template by <a
						href="https://colorlib.com">Colorlib</a>
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->

	
<script>
function accountCreate() {
	var sx = parseInt(screen.width);
	var sy = parseInt(screen.height);
	var x = (sx / 2) + 50;
	var y = (sy / 2) - 25;
  
	var win = window.open(
					"${pageContext.request.contextPath}/account_create.jsp",
					"accountCreate", "width=380, height=380");
	win.moveTo(x, y); //화면이동
}

</script>



	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
	<!-- Chart.js -->
	<script src="${pageContext.request.contextPath}/vendors/Chart.js/dist/Chart.min.js"></script>
	<!-- jQuery Sparklines -->
	<script src="${pageContext.request.contextPath}/vendors/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	<!-- morris.js -->
	<script src="${pageContext.request.contextPath}/vendors/raphael/raphael.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendors/morris.js/morris.min.js"></script>
	<!-- gauge.js -->
	<script src="${pageContext.request.contextPath}/vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- Skycons -->
	<script src="${pageContext.request.contextPath}/vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.time.js"></script>
	<script src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.stack.js"></script>
	<script src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script src="${pageContext.request.contextPath}/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script src="${pageContext.request.contextPath}/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script src="${pageContext.request.contextPath}/vendors/DateJS/build/date.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>


</body>
</html>