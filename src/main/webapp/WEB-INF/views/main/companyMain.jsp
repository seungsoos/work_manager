<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태관리 프로그램</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.js" 
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
	crossorigin="anonymous"></script>
        <link href="${cPath}/resources/css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
</head>
<body class="sb-nav-fixed">
	<jsp:include page="../includes/header.jsp"></jsp:include>
	<div id="layoutSidenav">
		<jsp:include page="../includes/sidebar.jsp"></jsp:include>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">${todayMain}</h1>
					<div class="row">
						<div class="col-xl-3 col-md-6">
							<input type="hidden" id="emp_id" name="emp_id"
								value="${employeeLogin.emp_id}"> <input type="hidden"
								id="emp_name" name="emp_name" value="${employeeLogin.emp_name}">
							<div class="mt-3 mb-4">
								<c:choose>
									<c:when test="${employeeLogin.emp_id eq 'admin' }">
									</c:when>
									<c:when test="${employeeLogin.emp_id eq null }">
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${not empty timeList}">
												<c:if test="${workMap.work_date == false}">
													<div id="work_div" class="text-center">
														<input type="button" class="btn btn-primary w-100"
															id="startTime" value="근무시작">
													</div>
												</c:if>
												<c:if test="${workMap.work_date == true }">
													<c:choose>
														<c:when test="${workMap.end_time == false}">
															<div id="end_div" class="text-center">
																<input type="button" class="btn btn-primary w-100"
																	id="endTime" value="근무종료" onclick="endTime(this.form)">
															</div>
														</c:when>
														<c:when test="${workMap.night_start_time == false}">
															<div id="night_start_time_div" class="text-center">
																<input type="button" class="btn btn-primary w-100"
																	id="night_start_time" value="야간근무시작"
																	onclick="night_start_time(this.form)">
															</div>
														</c:when>
														<c:when test="${workMap.night_end_time == false}">
															<div id="night_end_time_div" class="text-center">
																<input type="button" class="btn btn-primary w-100"
																	id="night_end_time" value="야간근무종료"
																	onclick="night_end_time(this.form)">
															</div>
														</c:when>
													</c:choose>
												</c:if>
											</c:when>
											<c:otherwise>
												<div id="work_div" class="text-center">
													<input type="button" class="btn btn-primary w-100"
														id="startTime" value="근무시작">
												</div>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
								<div id="end_div" class="text-center" style="display: none">
									<input type="button" class="btn btn-primary w-100" id="endTime"
										value="근무종료" onclick="endTime(this.form)">
								</div>
								<div id="night_start_time_div" class="text-center"
									style="display: none">
									<input type="button" class="btn btn-primary w-100"
										id="night_start_time" value="야간근무시작"
										onclick="night_start_time(this.form)">
								</div>
								<div id="night_end_time_div" class="text-center"
									style="display: none">
									<input type="button" class="btn btn-primary w-100"
										id="night_end_time" value="야간근무종료"
										onclick="night_end_time(this.form)">
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-6">
							<div class="card mb-4">
								<h4 class="text-center mt-2">주간 근무시간 확인</h4>
								<table class="table">
									<tr class="fs-6">
										<th scope="col">월</th>
										<th scope="col">화</th>
										<th scope="col">수</th>
										<th scope="col">목</th>
										<th scope="col">금</th>
										<th scope="col">합계</th>
									</tr>
									<tbody class="fs-6">
										<c:choose>
											<c:when test="${empty day_of_week}">
												<tr>
													<td colspan="7">근태 기록이 없습니다.</td>
												</tr>
											</c:when>
											<c:when test="${not empty day_of_week}">
												<tr>
													<c:choose>
														<c:when test="${not empty map.get('월요일')}">
															<td>${map.get('월요일')}</td>
														</c:when>
														<c:otherwise>
															<td>-</td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${not empty map.get('화요일')}">
															<td>${map.get('화요일')}</td>
														</c:when>
														<c:otherwise>
															<td>-</td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${not empty map.get('수요일')}">
															<td>${map.get('수요일')}</td>
														</c:when>
														<c:otherwise>
															<td>-</td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${not empty map.get('목요일')}">
															<td>${map.get('목요일')}</td>
														</c:when>
														<c:otherwise>
															<td>-</td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${not empty map.get('금요일')}">
															<td>${map.get('금요일')}</td>
														</c:when>
														<c:otherwise>
															<td>-</td>
														</c:otherwise>
													</c:choose>
													<td>${total_day_of_week}</td>
												</tr>
											</c:when>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
						<div class="col-xl-6">
							<div class="card mb-4">
								<h4 class="text-center mt-2">야간 근무시간 확인</h4>
								<table class="table">
									<tr class="fs-6">
										<th scope="col">월</th>
										<th scope="col">화</th>
										<th scope="col">수</th>
										<th scope="col">목</th>
										<th scope="col">금</th>
										<th scope="col">합계</th>
									</tr>
									<tbody class="fs-6">
										<c:choose>
											<c:when test="${empty day_of_week}">
												<tr>
													<td colspan="7">근태 기록이 없습니다.</td>
												</tr>
											</c:when>
											<c:when test="${not empty day_of_week}">
												<tr>
													<c:choose>
														<c:when test="${not empty map.get('월요일야간')}">
															<td>${map.get('월요일야간')}</td>
														</c:when>
														<c:otherwise>
															<td>-</td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${not empty map.get('화요일야간')}">
															<td>${map.get('화요일야간')}</td>
														</c:when>
														<c:otherwise>
															<td>-</td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${not empty map.get('수요일야간')}">
															<td>${map.get('수요일야간')}</td>
														</c:when>
														<c:otherwise>
															<td>-</td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${not empty map.get('목요일야간')}">
															<td>${map.get('목요일야간')}</td>
														</c:when>
														<c:otherwise>
															<td>-</td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${not empty map.get('금요일야간')}">
															<td>${map.get('금요일야간')}</td>
														</c:when>
														<c:otherwise>
															<td>-</td>
														</c:otherwise>
													</c:choose>
													<td>${total_night_of_week}</td>
												</tr>
											</c:when>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="col-xl-12">
						<div class="card mb-4">
							<div class="card-body">
								<jsp:include page="../workCalendar/includeCalendar.jsp"></jsp:include>
							</div>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="../includes/footer.jsp"></jsp:include>
		</div>
	</div>
	<script type="text/javascript">
 $(function() {
 	$('#startTime').click(function(obj) {
 		console.log('근무시작')
 		let emp_id = $('#emp_id').val();
 		let emp_name = $('#emp_name').val();
 		
 		console.log(emp_id);
 		console.log(emp_name);
 		
 		var emp = {emp_id : emp_id, emp_name : emp_name}
 		console.log(emp);
 		
 		$.ajax({
 			type : 'post',
 	    	url : 'startTime.do',
 	    	contentType : "application/json",
 	    	data :  JSON.stringify(emp),
 			success : function(result) {
 				
                console.log(result);
            	alert('근무가 시작되었습니다.');
 				document.getElementById('work_div').style.display = 'none';
 				document.getElementById('end_div').style.display = 'block';
 			
 			},//success
           	error: function(a,b,c) {
           			console.log(a,b,c);
            		alert('서버요청실패');
           	}//error
 			
 		})//ajax
 	
 	})//근무시작
 	
 		$('#endTime').click(function(obj) {
 			console.log('근무종료')
 		let emp_id = $('#emp_id').val();
 		let emp_name = $('#emp_name').val();
 		
 		console.log(emp_id);
 		console.log(emp_name);
 		
 		var emp = {emp_id : emp_id, emp_name : emp_name}
 		console.log(emp);
 		
 		$.ajax({
 			type : 'post',
 	    	url : 'endTime.do',
 	    	contentType : "application/json",
 	    	data :  JSON.stringify(emp),
 			success : function(result) {
 				
                console.log(result);
            	alert('근무가 종료되었습니다.');
            	document.getElementById('end_div').style.display = "none";
 				document.getElementById('night_start_time_div').style.display = "block";
 			
 			},//success
           	error: function(a,b,c) {
           			console.log(a,b,c);
            		alert('서버요청실패');
           	}//error
 			
 			
 		})//ajax
 	
 	})//근무종료
 	
 		$('#night_start_time').click(function(obj) {
 			console.log('야간근무시작')
 		let emp_id = $('#emp_id').val();
 		let emp_name = $('#emp_name').val();
 		
 		console.log(emp_id);
 		console.log(emp_name);
 		
 		var emp = {emp_id : emp_id, emp_name : emp_name}
 		console.log(emp);
 		
 		$.ajax({
 			type : 'post',
 	    	url : 'night_start_time.do',
 	    	contentType : "application/json",
 	    	data :  JSON.stringify(emp),
 			success : function(result) {
 				
                console.log(result);
            	alert('야간근무가 시작되었습니다.');
            	document.getElementById('night_start_time_div').style.display = "none";
            	document.getElementById('night_end_time_div').style.display = "block";
 			
 			},//success
           	error: function(a,b,c) {
           			console.log(a,b,c);
            		alert('서버요청실패');
           	}//error
 			
 			
 		})//ajax
 	
 	})//야간근무시작


 		$('#night_end_time').click(function(obj) {
 		console.log('야간근무종료')
 		let emp_id = $('#emp_id').val();
 		let emp_name = $('#emp_name').val();
 		
 		console.log(emp_id);
 		console.log(emp_name);
 		
 		var emp = {emp_id : emp_id, emp_name : emp_name}
 		console.log(emp);
 		
 		$.ajax({
 			type : 'post',
 	    	url : 'night_end_time.do',
 	    	contentType : "application/json",
 	    	data :  JSON.stringify(emp),
 			success : function(result) {
 				
                console.log(result);
            	alert('야간근무가 종료되었습니다.');
            	document.getElementById('night_end_time_div').style.display = "none";
 			
 			},//success
           	error: function(a,b,c) {
           			console.log(a,b,c);
            		alert('서버요청실패');
           	}//error
 			
 			
 		})//ajax
 	
 	})//야간근무종료
 })
</script>
</body>
</html>