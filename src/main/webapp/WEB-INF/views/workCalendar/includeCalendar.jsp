<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@	page import="com.project.portfolio.dto.CompanyWorkCalendarDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무일정</title>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script> -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<link href="${cPath}/resources/fullcalendar/lib/main.css" rel="stylesheet" />
<script src="${cPath}/resources/fullcalendar/lib/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
<div id='calendar'></div>
<script type="text/javascript">
	
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		 googleCalendarApiKey : "AIzaSyC-hiiNQqjz_R7ulglsNVHnlyOg5YMJsiE",
		    eventSources :[ 
		        {
		            googleCalendarId : 'b21d42b8ddde94d6aa9f93258ef69420578d0730e77ddcab62e6692ac799c3bc@group.calendar.google.com'
		            ,className: '포트폴리오'
		            ,color: '#be5683'   // an option!
		            ,textColor: 'red' // an option!
		        } 
		    ],
		initialView : 'dayGridMonth',
		locale : 'ko', // 한국어 설정
		headerToolbar : {
        	start : "prev next today",
            center : "title",
            end : 'dayGridMonth,dayGridWeek,dayGridDay'
            },
	selectable : true,
	droppable : true,
	editable : true,
	events : [ 
    	    <%List<CompanyWorkCalendarDTO> calendarList = (List<CompanyWorkCalendarDTO>) request.getAttribute("calendarList");%>
            <%if (calendarList != null) {%>
            <%for (CompanyWorkCalendarDTO vo : calendarList) {%>
            {
            	title : '<%=vo.getCalendarTitle()+"/"+vo.getCalendar_emp_rank()+"/"+vo.getCalendar_emp_name()%>',
                start : '<%=vo.getCalendarStart()%>',
                end : '<%=vo.getCalendarEnd()%>',
                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
             },
	<%}
}%>
				],
			});
			calendar.render();
		});
	
</script>
</body>
</html>