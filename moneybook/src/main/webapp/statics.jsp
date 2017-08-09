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
    $(document).ready(function(){
    	show_statics();
    });
    
    function show_statics(){
		var account = $('#account option:checked').text();//선택 계좌 
    	
    	$.ajax({
    		url : "./getStaticsData.do",
    		type : "post",
    		data : {"account":account},
    		dataType : "json",
    		success : function(data){
    			console.log(data);
    			$('#sum_input').html(data[0]);
    			$('#sum_output').html(data[1]);
    			$('#this_input').html(data[2]);
    			$('#this_output').html(data[3]);
    			$('#av_input').html(data[4]);
    			$('#av_output').html(data[5]); 
    			$('#input_rate_num').html(data[6]);
    			var seven = data[7];
    			console.log("일곱번째" + seven);
    			if(seven=="up"){
    				$('#iColor').removeClass("red");
    				$('#iShape').removeClass("fa fa-sort-desc");
    				$('#iColor').addClass("green");
    				$('#iShape').addClass("fa fa-sort-asc");
    			}else if(seven=="down"){
    				$('#iColor').removeClass("green");
    				$('#iShape').removeClass("fa fa-sort-asc");
    				$('#iColor').addClass("red");
    				$('#iShape').addClass("fa fa-sort-desc");
    			}			
    			if(data[9]=="up"){
    				$('#i2Color').removeClass("red");
    				$('#i2Shape').removeClass("fa fa-sort-desc");
    				$('#i2Color').addClass("green");
    				$('#i2Shape').addClass("fa fa-sort-asc");
    			}else if(data[9]=="down"){
    				$('#i2Color').removeClass("green");
    				$('#i2Shape').removeClass("fa fa-sort-asc");
    				$('#i2Color').addClass("red");
    				$('#i2Shape').addClass("fa fa-sort-desc");
    			}
    			$('#output_rate_num').html(data[8]);
    			if(data[11]=="up"){
    				$('#i3Color').removeClass("red");
    				$('#3iShape').removeClass("fa fa-sort-desc");
    				$('#i3Color').addClass("green");
    				$('#i3Shape').addClass("fa fa-sort-asc");
    			}else if(data[11]=="down"){
    				$('#i3Color').removeClass("green");
    				$('#i3Shape').removeClass("fa fa-sort-asc");
    				$('#i3Color').addClass("red");
    				$('#i3Shape').addClass("fa fa-sort-desc");
    			}
    			if(data[13]=="up"){
    				$('#i4Color').removeClass("red");
    				$('#i4Shape').removeClass("fa fa-sort-desc");
    				$('#i4Color').addClass("green");
    				$('#i4Shape').addClass("fa fa-sort-asc");
    			}else if(data[13]=="down"){
    				$('#i4Color').removeClass("green");
    				$('#i4Shape').removeClass("fa fa-sort-asc");
    				$('#i4Color').addClass("red");
    				$('#i4Shape').addClass("fa fa-sort-desc");
    			}
    			$('#input_av_num').html(data[10]);
    			$('#output_av_num').html(data[12]);
    		}
    	});
		
		$.ajax({
			url : "./getTable",
			type : "post",
			data : {"account":account},
			dataType : "json",
			success : function(data){
				console.log(data);
				$('#max_deposit_1').html(data[0].MONEY);
				$('#category_1').html(data[0].CATEGORY);
				$('#month_1').html(data[0].MONTH);
				
				$('#max_deposit_2').html(data[1].MONEY);
				$('#category_2').html(data[1].CATEGORY);
				$('#month_2').html(data[1].MONTH);
				
				$('#max_deposit_3').html(data[2].MONEY);
				$('#category_3').html(data[2].CATEGORY);
				$('#month_3').html(data[2].MONTH);
				
				$('#max_Withdraw_1').html(data[3].MONEY);
				$('#w_category_1').html(data[3].CATEGORY);
				$('#w_month_1').html(data[3].MONTH);
				
				$('#max_Withdraw_2').html(data[4].MONEY);
				$('#w_category_2').html(data[4].CATEGORY);
				$('#w_month_2').html(data[4].MONTH);
				
				$('#max_Withdraw_3').html(data[5].MONEY);
				$('#w_category_3').html(data[5].CATEGORY);
				$('#w_month_3').html(data[5].MONTH);	
				
				
				Morris.Donut({
					  element: 'donut-example',
					  data: [
					    {label: data[0].CATEGORY, value: data[0].MONEY},
					    {label: data[1].CATEGORY, value: data[1].MONEY},
					    {label: data[2].CATEGORY, value: data[2].MONEY},
					    {label: data[3].CATEGORY, value: data[3].MONEY},
					    {label: data[4].CATEGORY, value: data[4].MONEY},
					    {label: data[5].CATEGORY, value: data[5].MONEY}
					  ],
					  colors : [
						 '#0B62A4',
						 '#3980B5',
						 '#679DC6',
						 '#EE340B',
						 '#F25D3B',
						 '#F08168'
					  ]
				
						
					});
				
				
			}
		});
		
		
    	
    }
    
    function changeStatics(){
    	show_statics();
    }
    
    </script>
    
    
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
 				  <li><a href="${pageContext.request.contextPath}/graphs.do"><i class="fa fa-bar-chart-o"></i> Graphs </a> </li>
 				  <li><a herf="${pageContext.request.contextPath}/statics.do"><i class="fa fa-table"></i>Statics</a></li>
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
			<div class="right_col" role="main">
			
			 <div class="page-title">
              <h3> Statics <small>Statics for moneyBook</small></h3>
             </div>
			 <br><br>
			 <div>
             <select name ="account" id="account" class="col-sm-7" onchange="changeStatics();" >
                  	<c:forEach var="dto" items="${list}"> 
                  	<option value="${dto.accNo}" class="form-control"> ${dto.accName } - ${dto.accNumber} </option>
                  	</c:forEach>
             </select>
             </div> 
			<br>
			
			
			<!-- title_count -->
			<div class="row tile_count">
			<!-- 전체 입금 카운트-->
			<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				<span class="count_top">
				<i class="fa fa-user"></i>
				" Total Deposit"
				</span>
				<div class="count" id="sum_input"></div>
			</div>
			<!-- 전체 출금 카운트-->
			<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				<span class="count_top">
				<i class="fa fa-user"></i>
				" Total Withdrawal"
				</span>
				<div class="count" id="sum_output"></div>
			</div>
			<!-- 이번달 입금 -->
			<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				<span class="count_top">
				<i class="fa fa-user"></i>
				" Deposit This Month"
				</span>
				<div class="count" id="this_input"></div>
				<span class="count_botton">
				<i id="iColor">
				<i id="iShape"></i>
				<text id="input_rate_num"></text>
				</i>
				% From last Month
				</span>			
			</div>
			<!-- 이번달 출금 -->
			<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				<span class="count_top">
				<i class="fa fa-user"></i>
				" Withdrawal This Month"
				</span>
				<div class="count" id="this_output"></div>
				<span class="count_botton">
				<i id="i2Color">
				<i id="i2Shape"></i>
				<text id="output_rate_num"></text>
				</i>
				% From last Month
				</span>		
			</div>			
			<!-- 월 평균 입금 -->
			<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				<span class="count_top">
				<i class="fa fa-user"></i>
				" Monthly Average Deposit"
				</span>			
				<div class="count" id="av_input"></div>
				<span class="count_botton">
				<i id="i3Color">
				<i id="i3Shape"></i>
				<text id="input_av_num"></text>
				</i>
				% From last Month
				</span>		
			</div>
			<!-- 월 평균 출금 -->
			<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
				<span class="count_top">
				<i class="fa fa-user"></i>
				" Monthly Average Withdrawal"
				</span>
				<div class="count" id="av_output"></div>
				<span class="count_botton">
				<i id="i4Color">
				<i id="i4Shape"></i>
				<text id="output_av_num"></text>
				</i>
				% From last Month
				</span>		
			</div>
		</div> 
		<!-- title count end -->
		
		<div class="row">
		<table>
		<tr>
			<td width="1000px">
				<div class="x_panel">
					<div class="x_title">
						<h2> 입금 내역 순위</h2>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<table class="table">
						<thead>
							<tr>
								<th> # </th>
								<th> MAX Deposit </th>
								<th> Category </th>
								<th> Date </th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td> <text id="max_deposit_1"></text> </td>
								<td> <text id="category_1"></text> </td>
								<td> <text id="month_1"></text></td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td> <text id="max_deposit_2"></text></td>
								<td> <text id="category_2"></text></td>
								<td>  <text id="month_2"></text></td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td> <text id="max_deposit_3"></text></td>
								<td> <text id="category_3"></text> </td>
								<td> <text id="month_3"></text></td>
							</tr>
						</tbody>
						</table>
					</div>
				</div>
			</td>
				<td rowspan="2">
					<div id="donut-example" style="height: 400px;"></div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="x_panel">
						<div class="x_title">
							<h2> 출금 내역 순위</h2>
							<div class="clearfix"></div>
						</div>
					<div class="x_content">
						<table class="table">
						<thead>
							<tr>
								<th> # </th>
								<th> MAX Withdraw </th>
								<th> Category </th>
								<th> Date </th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td> <text id="max_Withdraw_1"></text></td>
								<td> <text id="w_category_1"> </text></td>
								<td> <text id="w_month_1"> </td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td> <text id="max_Withdraw_2"/> </td>
								<td> <text id="w_category_2"/> </td>
								<td> <text id="w_month_2"/> </td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td> <text id="max_Withdraw_3"/> </td>
								<td> <text id="w_category_3"/> </td>
								<td> <text id="w_month_3"/> </td>
							</tr>
						</tbody>
						</table>
					</div>
				</div>
			</td>
			</tr>
		</table>
		</div>	
		</div>
	</div>
			

 


</body>
</html>