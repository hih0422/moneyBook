<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- Meta, title, CSS, favicons, etc. -->

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>MoneyBook :)</title>

<script src="js/jquery.js"></script>
<script language="JavaScript">
	
	$(document).on('click','#create-btn',function() {
		var accName = $('#bankName').val();
		var accNumber = $('#bankNumber').val();
		var sessionId = $('#sessionId').val();
		alert(sessionId);
		$.ajax({
			url : "./account_Add.do",
			type : 'post',
			data : {"accName" : accName , "accNumber" : accNumber, "sessionID": sessionId},
			dataType : 'json',
			success : function(data) {
				alert("계좌등록에 성공하셨습니다.");
				window.close();
			},
			error : function(xhr, error, code) {
				console.log("error : "+xhr+" / code : "+code);
			}
			
		});
	});
</script>



<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- bootstrap-progressbar -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- bootstrap-daterangepicker -->
<link href="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/build/css/custom.min.css" rel="stylesheet">
</head>




<body class="nav-md" onunload="opener.document.location.reload();">

	<div class="container body">
		<div class="main_container">
			
			<!-- page content -->
			<div class="right_col" role="main">
				<div class="col-md-12">
				<div class="x_panel">
                  <div class="x_title">
					<h3>계좌등록</h3>
					<!-- <form name="frm" method="post" action="./account_Add.do"> -->
					
						<table class='table'>
							<tr>
								<th>은행명</th>
								<td><input type="text" id="bankName" class="col-md-12" name="accNam"></td>
							</tr>
							<tr>
								<th>계좌번호</th>
								<td><input type="text" id="bankNumber" class="col-md-12" name="accNumbe"></td>
							</tr>
						</table>

						<div class='bottom'>
							<input type="button" id="create-btn" class="btn btn-default" value='등록'>
							<input type='button' class="btn btn-default" value='취소' onclick="window.close();">
						</div>
						<%String headid = (String)session.getAttribute("id"); %>
						<input type="hidden" value=<%=headid%> id="sessionId">
					<!-- </form> -->
					</div>
					</div>
				</div>
			</div>
			<!-- /page content -->
		</div>
	</div>




		
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



