<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재자 지정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
	<div class="container text-center ">
		<h1 class="mt-4">결재자 지정</h1>
		<div class="d-flex justify-content-center">
			<label for="id" class="form-label">이름</label>
			<input type="text" class="form-contro emp_name ms-2" name="emp_name">
			<input type="button" class="btn btn-dark approver ms-2"
				value="검색">
		</div>
		
		<table class="table mt-4 table-bordered" id="searchResult" style="display: none">
		  	<thead>
				<tr>
					<th scope="col">순번</th>
					<th scope="col">팀</th>
					<th scope="col">직책</th>
					<th scope="col">이름</th>
					<th scope="col">비고</th>
				</tr>
			<thead>
			<tbody class="searchResult">
			</tbody>
		</table>
	</div>
<script src="https://code.jquery.com/jquery-3.6.3.js" 
integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
crossorigin="anonymous"></script>
<script type="text/javascript">

$(function() {

	$('.approver').click(function() {
		
		if($('.emp_name').val() != ''){
			
			let nameVal = $('.emp_name').val();
			console.log(nameVal)
				var emp_name = {emp_name : nameVal}
			
				$.ajax({
					type : 'post',
			    	url : '${cPath}/worktypectr/workTypeApprover.do',
			    	contentType : "application/json",
			    	data :  JSON.stringify(emp_name),
					success : function(result) {
						
						if(result == null || result.length == 0){
							alert('잘못입력하였습니다.')
							
						}else{
							console.log(result)
							
							document.getElementById('searchResult').style.display = "block";
							document.getElementById('searchResult').style = "margin-left:auto;, margin-right:auto;";
							$.each(result, function(index, item) { 
								$(".searchResult").empty();
								$(".searchResult").append("<tr><th scope='row'>" + (index+1) + "</th>" +
										"<td>" + item.emp_department + "</td>" +
										"<td>" + item.emp_rank  + "</td>" +
										"<td>" + item.emp_name  + "</td>" +
										"<td><a class='link-primary' id='searchA' onclick=select() data-value="+item.emp_department+"/"+item.emp_rank+"/"+item.emp_name+"/"+item.emp_id+">" + "선택" + "</a></td>" +
										"</tr>")
							});
							
						}
					},//success
		           	error: function(a,b,c) {
		           			console.log(a,b,c);
		            		alert('서버요청실패');
		           	}//error
					
				})//ajax
			
			}else{
				 alert('결재자의 이름을 입력하세요.');
			}
	
	})
	
})

function select() {

	opener.document.getElementById("approver_emp_id").value = document.getElementById("searchA").getAttribute('data-value');
	window.close(); 

}



</script>

</body>
</html>