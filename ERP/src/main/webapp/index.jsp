<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>AAA Company</title>
    <script src="resources/vendor/chart.js/Chart.min.js"></script>
</head>
<body>

	<%
	response.setCharacterEncoding("UTF-8");
	String logout = request.getParameter("logout");
	if(logout!=null){
		//id값에 null 값을 넣음
		session.setAttribute("id", null);
		//세션시간 0. 로그아웃 처리
		session.setMaxInactiveInterval(0);
	}
	%>

    <!-- 메뉴 부분을 menu.jsp로 부터 포함시킵니다. -->
    <%@ include file="menu.jsp" %>
    <%@ include file="connection.jsp" %>
    
    

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    
    <div style="text-align: center;"> <!-- 이미지를 가운데 정렬 -->
        <img src="resources/img/AAAlogo.png" alt="AAA Company Logo">
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
