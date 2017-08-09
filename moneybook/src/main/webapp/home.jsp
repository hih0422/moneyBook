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
    
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
     <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script> 
    <!-- FullCalendar -->
    <script src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
    
    <script src="${pageContext.request.contextPath}/vendors/fullcalendar/dist/fullcalendar.min.js"></script>
    <!-- Custom Theme Scripts -->
    <%-- <script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script> --%>
    

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
	var start;

    $(document).ready(function(){
			var d;
			var m;
			var y;
			$.ajax({
	 			url : './getData.do',
	 			type : 'post',
	 			dataType : 'json',
	 			success : function(data){
	 			 	$('#calendar').fullCalendar({
	 	    	 		header: {
	 						left: 'prev,next today',
	 						center: 'title',
	 						right: 'month,basicWeek,basicDay'
	 					},
	 					dayNames : ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
	 					dayNamesShort : ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
	 					monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	 					events : data,
	 					dayClick: function(date, allDay, jsEvent, view) {
	 						 var callDate = date.format();
	 						 var a =callDate.split('-');
	 						 y = a[0];
	 						 m = a[1];
	 						 d = a[2];
	 						 start = y+'-'+m+'-'+d;
	 						//모달 생성
	 						$('#CalenderModalNew').modal();
	 					 }
	 				});
	 			},
	 			error : function(error){
	 				console.log(error);
	 			}
	 			
	 		});
			
			//모달 내 saveChange 클릭
			$('#saveChanges').click(function(){
			   detail();
			});

   });//도큐먼트 끝
   
   function detail(){
	   var ad = $('#selectOption option:selected').val();
	   if(ad == 1){
		   $('#detailModal').modal();
	   }
	   else if(ad == 2){
		   $('#detailModal2').modal();
	   }
   }
   
   function detailCategory(value){
	   
	   var moneyValue = $('#selectOption option:selected').val(); //셀렉트 입금 or 출금 판별
	   var account = $('#account option:checked').text();//선택 계좌
	   var getMoney = $('#getMoney').val();	
	   alert("카테고리" + value);
	  
	   //ajax controller 통해서 디비에 넣는다 
	    $.ajax({
	    	url : "./inoutputMoney.do",
	    	type : 'post',
	    	data : {"moneyValue":moneyValue, "getMoney":getMoney, "start":start, "account":account,"category" : value},
	    	dataType : 'json',
	    	success : function(data){
	    		$('#detailModal').modal('hide');
	    		$('#detailModal2').modal('hide');
	    		$ ('#CalenderModalNew').modal('hide');
	    		$('#calendar').fullCalendar('addEventSource',data);
	    		var callbackEvents = $('#calendar').fullCalendar('getEventSources');
	    	}
	   });
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
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Calendar <small>Click to add/edit Money</small></h3>
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

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Calendar <small>입/출금</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <div id='calendar'></div>
                  </div>
                </div>
              </div>
            </div>
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

    <!-- calendar modal -->
    <div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="myModalLabel">입출금</h4>
          </div>
          <div class="modal-body">
            <div id="testmodal" style="padding: 5px 20px;">
              <form id="antoform" class="form-horizontal calender" role="form" action="">
                
                <div class="form-group">
                  <label class="col-sm-3 control-label">계좌</label>
                  <div class="col-sm-9">
                  <select name ="account" id="account" class="col-sm-7" >
                  	<option value="" selected="selected">계좌를 선택하세요</option>
                  	<c:forEach var="dto" items="${list}"> 
                  	<option value="${dto.accNo}" class="form-control"> ${dto.accName } - ${dto.accNumber} </option>
                  	</c:forEach>
                  </select>
                  </div>
                </div>
                
                <div class="form-group">
                  <select name ="selectOption" id="selectOption" class="col-sm-2">
                  <option value="1"> 입금 </option>
               	  <option value="2"> 출금 </option>
                  </select>
                	<div class="col-sm-9">
                  		<input type="text" class="form-control" id="getMoney" name="getMoney">
                	</div>
                </div>               
              </form>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default antoclose" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary antosubmit" id="saveChanges">Save changes</button>
          </div>
        </div>
      </div>
    </div>
    <!-- calendar modal end-->
    
    <!-- detail modal-->
    <div id="detailModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
    		
    		<div class="modal-header">
            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            	<h4 class="modal-title" id="myModalLabel">내역</h4>
           
            <div class="modal-body">
            <div id="testmodal" style="padding: 5px 20px;">
            	<form id="antoform" class="form-horizontal calender" role="form" action="">
           
            <div>
            <table>
            <tr>
            <td>
            <img id="salary" src="https://image.flaticon.com/icons/svg/410/410886.svg" width="50" height="50" hspace=30 style="display:block" onclick="detailCategory('salary');"> 월급
            </td> &nbsp;&nbsp;&nbsp; 
            <td>
            <img id="allowance" src="https://image.flaticon.com/icons/svg/489/489097.svg" width="50" height="50" hspace=30 style="display:block" onclick="detailCategory('allowance');"> 용돈
            </td>&nbsp;&nbsp;&nbsp;
            <td>
            <img id="etc" src="https://image.flaticon.com/icons/svg/148/148781.svg" width="50" height="50" hspace=30 style="display:block" onclick="detailCategory('etc');"> 기타
            </td>
            </table>
            </div>             
            </div>
          </div>
            
          </div>    
     	 </div>
      </div>
    </div>
     <!-- detail modal end-->
     
     
     <!-- detail2 modal-->
    <div id="detailModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
    		
    		<div class="modal-header">
            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            	<h4 class="modal-title" id="myModalLabel">내역</h4>
           
            <div class="modal-body">
            <div id="testmodal" style="padding: 5px 20px;">
            	<form id="antoform" class="form-horizontal calender" role="form" action="">
           
            <div>
            <table>
            <tr>
            <td>
            <img id="food" src="https://image.flaticon.com/icons/svg/431/431467.svg" width="50" height="50" hspace=30 style="display:block" onclick="detailCategory('food');"> 식비
            </td>
            <td>
            <img id="transport" src="https://image.flaticon.com/icons/svg/234/234705.svg" width="50" height="50" hspace=30 style="display:block" onclick="detailCategory('transport');"> 교통비
            </td>
            <td>
            <img id="phone" src="https://image.flaticon.com/icons/svg/254/254080.svg" width="50" height="50" hspace=30 style="display:block" onclick="detailCategory('phone');"> 통신비
            </td>
            <td>
            <img id="music" src="https://image.flaticon.com/icons/svg/148/148728.svg" width="50" height="50" hspace=30 style="display:block" onclick="detailCategory('music');"> 문화생활
            </td>
            <td>
            <img id="electronic" src="https://image.flaticon.com/icons/svg/45/45928.svg" width="50" height="50" hspace=30 style="display:block" onclick="detailCategory('electronic');"> 공과금
            </td>
            </tr>
            <tr>
            <td>
            <img id="clothes" src="https://image.flaticon.com/icons/svg/502/502138.svg" width="50" height="50" hspace=30 style="display:block" onclick="detailCategory('clothes');"> 의류
            </td>
            <td>
             <img id="save" src="http://www.flaticon.com/premium-icon/icons/svg/297/297487.svg" width="50" height="50" hspace=30 style="display:block" onclick="detailCategory('save');">저축
            </td>
            <td>
             <img id="credit" src="http://www.flaticon.com/premium-icon/icons/svg/125/125288.svg" width="50" height="50" hspace=30 style="display:block" onclick="detailCategory('credit');">카드대금
            </td>
            <td>
             <img id="date" src="https://image.flaticon.com/icons/svg/189/189671.svg" width="50" height="50" hspace=30 style="display:block" onclick="detailCategory('date');"> 데이트
            </td>
            <td>
            <img id="etc" src="https://image.flaticon.com/icons/svg/148/148781.svg" width="50" height="50" hspace=30 style="display:block" onclick="detailCategory('etc');"> 기타
            </td>
            </tr>
            </table>
            </div>             
            </div>
          </div>
            
          </div>    
     	 </div>
      </div>
    </div>
     <!-- detail2 modal end-->
     
     
     
    
    
    <div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="myModalLabel2">Edit Calendar Entry</h4>
          </div>
          <div class="modal-body">

            <div id="testmodal2" style="padding: 5px 20px;">
              <form id="antoform2" class="form-horizontal calender" role="form">
                <div class="form-group">
                  <label class="col-sm-3 control-label">계좌2</label>
                  <div class="col-sm-9">
                    <select name ="account2" id="account2">
                  	<option value="" selected="selected">계좌2를 선택하세요</option>
                  	<c:forEach var="dto" items="${list}"> 
                  	<option value="${dto.accNo}" class="form-control"> ${dto.accName } - ${dto.accNumber} </option>
                  	</c:forEach>
                  </select>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-sm-3 control-label">입금2</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="input2" name="input2">
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="col-sm-3 control-label">출금2</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="output2" name="output2">
                  </div>
                </div>

              </form>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default antoclose2" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary antosubmit2">Save changes</button>
          </div>
        </div>
      </div>
    </div>

    <div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
    <div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>
    <!-- /calendar modal -->
  </body>
</html>